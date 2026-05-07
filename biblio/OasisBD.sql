-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.8.4-MariaDB - MariaDB Server
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for oasis
CREATE DATABASE IF NOT EXISTS `oasis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `oasis`;

-- Dumping structure for table oasis.autor
CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.autor: ~7 rows (approximately)
INSERT INTO `autor` (`id`, `nombre`) VALUES
	(1, 'Robert C. Martin'),
	(2, 'Donald Knuth'),
	(3, 'Ian Sommerville'),
	(4, 'Martin Fowler'),
	(5, 'Andrew Tanenbaum'),
	(6, 'James Clear'),
	(7, 'Stephen Hawking');

-- Dumping structure for table oasis.detalle_ventas
CREATE TABLE IF NOT EXISTS `detalle_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_venta` (`id_venta`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.detalle_ventas: ~0 rows (approximately)

-- Dumping structure for table oasis.editorial
CREATE TABLE IF NOT EXISTS `editorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.editorial: ~6 rows (approximately)
INSERT INTO `editorial` (`id`, `nombre`) VALUES
	(1, 'Pearson'),
	(2, 'McGraw-Hill'),
	(3, 'O\'Reilly Media'),
	(4, 'Addison-Wesley'),
	(5, 'Springer'),
	(6, 'Planeta');

-- Dumping structure for table oasis.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(20) DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.empresa: ~1 rows (approximately)
INSERT INTO `empresa` (`id`, `ruc`, `nombre`, `telefono`, `correo`, `direccion`) VALUES
	(1, '123456789', 'Sistema Biblioteca', '999999999', 'info@biblioteca.com', 'Ciudad');

-- Dumping structure for table oasis.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `carrera` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.estudiantes: ~12 rows (approximately)
INSERT INTO `estudiantes` (`id`, `documento`, `codigo`, `nombre`, `telefono`, `correo`, `carrera`) VALUES
	(1, '12345678', 'EST001', 'Juan Perez', '987654321', 'juan@mail.com', 'Ingeniería'),
	(2, NULL, NULL, 'estudiante', NULL, 'estudiante@correo.com', NULL),
	(3, '45123456', 'U20240001', 'Ana García López', '987111001', 'ana.garcia@utp.edu.pe', 'Ingeniería de Sistemas'),
	(4, '45123457', 'U20240002', 'Carlos Mendoza Ríos', '987111002', 'carlos.mendoza@utp.edu.pe', 'Ingeniería de Sistemas'),
	(5, '45123458', 'U20240003', 'Lucía Torres Vega', '987111003', 'lucia.torres@utp.edu.pe', 'Administración'),
	(6, '45123459', 'U20240004', 'Diego Ramírez Cruz', '987111004', 'diego.ramirez@utp.edu.pe', 'Ingeniería de Sistemas'),
	(7, '45123460', 'U20240005', 'Sofía Quispe Mamani', '987111005', 'sofia.quispe@utp.edu.pe', 'Contabilidad'),
	(8, '45123461', 'U20240006', 'Mario Castillo Huanca', '987111006', 'mario.castillo@utp.edu.pe', 'Ingeniería de Sistemas'),
	(9, '45123462', 'U20240007', 'Valentina Ruiz Paredes', '987111007', 'valentina.ruiz@utp.edu.pe', 'Psicología'),
	(10, '45123463', 'U20240008', 'José Flores Ccapa', '987111008', 'jose.flores@utp.edu.pe', 'Ingeniería de Sistemas'),
	(11, '45123464', 'U20240009', 'Camila Vargas Soto', '987111009', 'camila.vargas@utp.edu.pe', 'Administración'),
	(12, '45123465', 'U20240010', 'Luis Pacheco Condori', '987111010', 'luis.pacheco@utp.edu.pe', 'Ingeniería de Sistemas');

-- Dumping structure for table oasis.libros
CREATE TABLE IF NOT EXISTS `libros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `id_editorial` int(11) DEFAULT NULL,
  `id_autor` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 0,
  `stock_minimo` int(11) DEFAULT 5,
  `num_pag` int(11) DEFAULT NULL,
  `anio_edicion` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_editorial` (`id_editorial`),
  KEY `id_autor` (`id_autor`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id`) ON DELETE SET NULL,
  CONSTRAINT `libros_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id`) ON DELETE SET NULL,
  CONSTRAINT `libros_ibfk_3` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.libros: ~1 rows (approximately)
INSERT INTO `libros` (`id`, `titulo`, `id_editorial`, `id_autor`, `id_materia`, `cantidad`, `stock_minimo`, `num_pag`, `anio_edicion`, `fecha_registro`) VALUES
	(1, 'Prueba de Stock', 3, 1, 4, 22, 22, 400, 2023, '2026-05-06 18:13:25');

-- Dumping structure for table oasis.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.materias: ~6 rows (approximately)
INSERT INTO `materias` (`id`, `nombre`) VALUES
	(1, 'Algoritmos'),
	(2, 'Ingeniería de Software'),
	(3, 'Redes'),
	(4, 'Ciencia de Datos'),
	(5, 'Física'),
	(6, 'Productividad');

-- Dumping structure for table oasis.movimientos
CREATE TABLE IF NOT EXISTS `movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_libro` int(11) DEFAULT NULL,
  `tipo` enum('prestamo','devolucion','venta','ajuste') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_libro` (`id_libro`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`),
  CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.movimientos: ~0 rows (approximately)

-- Dumping structure for table oasis.prestamos
CREATE TABLE IF NOT EXISTS `prestamos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_estudiante` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `estado` enum('activo','devuelto','retrasado') DEFAULT 'activo',
  PRIMARY KEY (`id`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_libro` (`id_libro`),
  CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.prestamos: ~0 rows (approximately)

-- Dumping structure for table oasis.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `rol` enum('admin','bibliotecario','estudiante') DEFAULT 'estudiante',
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.usuarios: ~12 rows (approximately)
INSERT INTO `usuarios` (`id`, `usuario`, `nombre`, `correo`, `clave`, `rol`, `estado`, `fecha_creacion`) VALUES
	(1, 'estudiante', 'estudiante', 'estudiante@correo.com', 'estudiante123', 'estudiante', 1, '2026-05-06 18:13:24'),
	(2, 'admin', 'admin', 'admin@edu.com', 'admin123', 'admin', 1, '2026-05-06 18:13:24'),
	(3, 'ana.garcia', 'Ana García López', 'ana.garcia@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(4, 'carlos.mendoza', 'Carlos Mendoza Ríos', 'carlos.mendoza@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(5, 'lucia.torres', 'Lucía Torres Vega', 'lucia.torres@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(6, 'diego.ramirez', 'Diego Ramírez Cruz', 'diego.ramirez@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(7, 'sofia.quispe', 'Sofía Quispe Mamani', 'sofia.quispe@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(8, 'mario.castillo', 'Mario Castillo Huanca', 'mario.castillo@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(9, 'valentina.ruiz', 'Valentina Ruiz Paredes', 'valentina.ruiz@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(10, 'jose.flores', 'José Flores Ccapa', 'jose.flores@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(11, 'camila.vargas', 'Camila Vargas Soto', 'camila.vargas@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19'),
	(12, 'luis.pacheco', 'Luis Pacheco Condori', 'luis.pacheco@utp.edu.pe', 'estudiante123', 'estudiante', 1, '2026-05-06 22:55:19');

-- Dumping structure for table oasis.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) DEFAULT 0.00,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table oasis.ventas: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
