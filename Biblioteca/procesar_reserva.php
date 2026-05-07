<?php
session_start();
require_once 'consultas.php';

// Validar que exista la sesión y que sea estudiante
if (!isset($_SESSION['user_id']) || $_SESSION['rol'] !== 'estudiante') {
    header("Location: index.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_libro = $_POST['id_libro'] ?? null;
    $fecha_devolucion = $_POST['fecha_devolucion'] ?? null;
    $id_usuario = $_SESSION['user_id'];

    if (empty($id_libro) || empty($fecha_devolucion)) {
        header("Location: estudiante.php?seccion=catalogo&error=" . urlencode("Debes seleccionar una fecha de devolución válida."));
        exit();
    }

    // Validar lógicamente que la fecha de devolución no sea hoy ni en el pasado
    if (strtotime($fecha_devolucion) <= strtotime(date('Y-m-d'))) {
        header("Location: estudiante.php?seccion=catalogo&error=" . urlencode("La fecha de devolución debe ser en el futuro."));
        exit();
    }

    // Regla de Negocio: Topex Máximo 2 libros a la vez.
    $libros_actuales = obtener_libros_reservados_estudiante($con, $id_usuario);
    if (count($libros_actuales) >= 2) {
        header("Location: estudiante.php?seccion=catalogo&error=" . urlencode("Has alcanzado el límite máximo de 2 libros simultáneos. Devuelve uno para poder reservar otro."));
        exit();
    }

    // Regla de Negocio: Bloquear si tiene préstamos vencidos
    $todos_prestamos = obtener_detalle_prestamos_estudiante($con, $id_usuario);
    foreach ($todos_prestamos as $p) {
        if ($p['estado'] === 'activo') {
            $dias = (strtotime($p['fecha_devolucion']) - strtotime(date('Y-m-d'))) / (60 * 60 * 24);
            if ($dias < 0) {
                header("Location: estudiante.php?seccion=catalogo&error=" . urlencode("Tienes préstamos vencidos. No puedes reservar hasta que el administrador registre la devolución."));
                exit();
            }
        }
    }

    try {
        procesar_transaccion_reserva($con, $id_usuario, $id_libro, $fecha_devolucion);
        header("Location: estudiante.php?seccion=catalogo&msg=" . urlencode("¡Reserva Confirmada! Tu libro te espera."));
        exit();
    } catch (Exception $e) {
        $error = urlencode($e->getMessage());
        header("Location: estudiante.php?seccion=catalogo&error=" . $error);
        exit();
    }
} else {
    header("Location: estudiante.php");
    exit();
}
