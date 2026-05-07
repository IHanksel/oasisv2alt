<?php
session_start();
require_once 'consultas.php';

// Solo admin puede registrar devoluciones
if (!isset($_SESSION['user_id']) || !in_array($_SESSION['rol'], ['admin', 'bibliotecario'])) {
    header("Location: index.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_prestamo = $_POST['id_prestamo'] ?? null;

    if (empty($id_prestamo)) {
        header("Location: admin.php?seccion=prestamos&error=" . urlencode("No se identificó el préstamo."));
        exit();
    }

    try {
        // Obtener el libro del préstamo para devolver stock
        $stmt = $con->prepare("SELECT id_libro FROM prestamos WHERE id = ? AND estado = 'activo'");
        $stmt->execute([$id_prestamo]);
        $prestamo = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$prestamo) {
            header("Location: admin.php?seccion=prestamos&error=" . urlencode("Préstamo no encontrado o ya devuelto."));
            exit();
        }

        $con->beginTransaction();

        // 1. Marcar préstamo como devuelto
        $stmt2 = $con->prepare("UPDATE prestamos SET estado = 'devuelto' WHERE id = ?");
        $stmt2->execute([$id_prestamo]);

        // 2. Registrar movimiento
        $stmt3 = $con->prepare("INSERT INTO movimientos (id_libro, tipo, cantidad, id_usuario) VALUES (?, 'devolucion', 1, ?)");
        $stmt3->execute([$prestamo['id_libro'], $_SESSION['user_id']]);

        // 3. Devolver stock
        $stmt4 = $con->prepare("UPDATE libros SET cantidad = cantidad + 1 WHERE id = ?");
        $stmt4->execute([$prestamo['id_libro']]);

        $con->commit();
        header("Location: admin.php?seccion=prestamos&msg=" . urlencode("Devolución registrada exitosamente."));
        exit();

    } catch (Exception $e) {
        $con->rollBack();
        header("Location: admin.php?seccion=prestamos&error=" . urlencode($e->getMessage()));
        exit();
    }
}

header("Location: admin.php?seccion=prestamos");
exit();
?>