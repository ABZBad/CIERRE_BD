-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para baseunit002
CREATE DATABASE IF NOT EXISTS `baseunit002` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `baseunit002`;

-- Volcando estructura para tabla baseunit002.arqueo
CREATE TABLE IF NOT EXISTS `arqueo` (
  `id_arqueo` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo_arqueo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_arqueo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.arqueo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `arqueo` DISABLE KEYS */;
/*!40000 ALTER TABLE `arqueo` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.arqueo_detalle
CREATE TABLE IF NOT EXISTS `arqueo_detalle` (
  `folio` bigint(20) NOT NULL AUTO_INCREMENT,
  `estatus` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `monto_final` double NOT NULL,
  `monto_inicial` double NOT NULL,
  `retiros` double NOT NULL,
  `venta_total` double NOT NULL,
  `id_arqueo` bigint(20) DEFAULT NULL,
  `n_boveda` bigint(20) DEFAULT NULL,
  `n_caja` bigint(20) DEFAULT NULL,
  `n_cajero` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`folio`),
  KEY `FKp26yshjksgtgwxeo7vu07sy93` (`id_arqueo`),
  KEY `FKbr3k0opr5jj3sbuf6u8pl6r8p` (`n_boveda`),
  KEY `FKd133g33tdgwp4r4v02410ddeo` (`n_caja`),
  KEY `FK8wbdioi4grdchw7a5pvm2636n` (`n_cajero`),
  CONSTRAINT `FK8wbdioi4grdchw7a5pvm2636n` FOREIGN KEY (`n_cajero`) REFERENCES `cajero_automatico` (`n_cajero`),
  CONSTRAINT `FKbr3k0opr5jj3sbuf6u8pl6r8p` FOREIGN KEY (`n_boveda`) REFERENCES `boveda` (`n_boveda`),
  CONSTRAINT `FKd133g33tdgwp4r4v02410ddeo` FOREIGN KEY (`n_caja`) REFERENCES `caja` (`n_caja`),
  CONSTRAINT `FKp26yshjksgtgwxeo7vu07sy93` FOREIGN KEY (`id_arqueo`) REFERENCES `arqueo` (`id_arqueo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.arqueo_detalle: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `arqueo_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `arqueo_detalle` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.articulo
CREATE TABLE IF NOT EXISTS `articulo` (
  `sku` char(1) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.articulo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.boveda
CREATE TABLE IF NOT EXISTS `boveda` (
  `n_boveda` bigint(20) NOT NULL AUTO_INCREMENT,
  `deposito` double NOT NULL,
  `monto` double NOT NULL,
  `retiro` double NOT NULL,
  `id_billete` bigint(20) DEFAULT NULL,
  `id_moneda` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`n_boveda`),
  KEY `FKb7iyg2ssad6wbmc92omu875b0` (`id_billete`),
  KEY `FKxko0df6udl473vss65e07r5e` (`id_moneda`),
  CONSTRAINT `FKb7iyg2ssad6wbmc92omu875b0` FOREIGN KEY (`id_billete`) REFERENCES `billete` (`id_billete`),
  CONSTRAINT `FKxko0df6udl473vss65e07r5e` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.boveda: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `boveda` DISABLE KEYS */;
INSERT INTO `boveda` (`n_boveda`, `deposito`, `monto`, `retiro`, `id_billete`, `id_moneda`) VALUES
	(1, 1, 2000, 2, 6, 17),
	(2, 200, 5, 9, 7, 10),
	(3, 5, 1000, 9, 7, 10),
	(4, 100, 10, 11, 7, 10),
	(5, 60000, 10, 25, 7, 10);
/*!40000 ALTER TABLE `boveda` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.caja
CREATE TABLE IF NOT EXISTS `caja` (
  `n_caja` bigint(20) NOT NULL AUTO_INCREMENT,
  `apertura` date DEFAULT NULL,
  `cantidad_billete` int(11) DEFAULT NULL,
  `cantidad_moneda` int(11) DEFAULT NULL,
  `cierre` date DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `id_billete` bigint(20) DEFAULT NULL,
  `id_moneda` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`n_caja`),
  KEY `FKp28emfcaks595reemdtgli9we` (`id_billete`),
  KEY `FKd02ua3myn8bgtbuf9vj1983ka` (`id_moneda`),
  CONSTRAINT `FKd02ua3myn8bgtbuf9vj1983ka` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`),
  CONSTRAINT `FKp28emfcaks595reemdtgli9we` FOREIGN KEY (`id_billete`) REFERENCES `billete` (`id_billete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.caja: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` (`n_caja`, `apertura`, `cantidad_billete`, `cantidad_moneda`, `cierre`, `estatus`, `id_billete`, `id_moneda`) VALUES
	(1, '2021-07-28', 200000, 0, '2021-07-28', 'cerrada', 7, 7),
	(2, '2021-07-28', 300000, 0, '2021-07-29', 'abierta', 7, 9),
	(3, '2025-07-30', 100000, 9, '2025-07-30', 'cerrada', 2, 19),
	(4, '2020-07-30', 100000, 9, '2020-07-30', 'cerrada', 2, 19),
	(5, '2021-08-05', 5000, 8, '2021-08-05', 'cerrada', 10, 5),
	(6, '2030-07-30', 500000, 10, '2030-07-30', 'abierta', 2, 19),
	(7, '2050-07-30', 90000, 100, '2050-07-30', 'cerrada', 2, 19),
	(8, '2080-07-30', 90000, 100, '2080-07-30', 'cerrada', 2, 19);
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.cajero_automatico
CREATE TABLE IF NOT EXISTS `cajero_automatico` (
  `n_cajero` bigint(20) NOT NULL AUTO_INCREMENT,
  `edo_cuenta` varchar(255) DEFAULT NULL,
  `monto` double NOT NULL,
  `n_transacciones` int(11) DEFAULT NULL,
  `retiro` double NOT NULL,
  `id_billete` bigint(20) DEFAULT NULL,
  `id_moneda` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`n_cajero`),
  KEY `FKggrcxhug1hhqba2q8rl9o09r7` (`id_billete`),
  KEY `FKkdad5ld1hglj5wnvqemtylott` (`id_moneda`),
  CONSTRAINT `FKggrcxhug1hhqba2q8rl9o09r7` FOREIGN KEY (`id_billete`) REFERENCES `billete` (`id_billete`),
  CONSTRAINT `FKkdad5ld1hglj5wnvqemtylott` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.cajero_automatico: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cajero_automatico` DISABLE KEYS */;
INSERT INTO `cajero_automatico` (`n_cajero`, `edo_cuenta`, `monto`, `n_transacciones`, `retiro`, `id_billete`, `id_moneda`) VALUES
	(1, 'estable', 800, 1, 5, 6, 5),
	(2, 'estable', 1000000, 6, 10, 6, 5),
	(3, 'estable', 0, 0, 0, NULL, NULL),
	(4, 'estable', 0, 0, 0, NULL, NULL);
/*!40000 ALTER TABLE `cajero_automatico` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(255) DEFAULT NULL,
  `credito` double NOT NULL,
  `cuenta` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `matricula` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `id_persona` bigint(20) DEFAULT NULL,
  `id_puesto` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `FK3yo5m2sf91t2spkatlwxagm5x` (`id_persona`),
  KEY `FKf47n9mwo2xijdtctmjuq5rhyf` (`id_puesto`),
  CONSTRAINT `FK3yo5m2sf91t2spkatlwxagm5x` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `FKf47n9mwo2xijdtctmjuq5rhyf` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.empleado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para procedimiento baseunit002.lista_tienda_detalle
DELIMITER //
CREATE PROCEDURE `lista_tienda_detalle`()
    READS SQL DATA
BEGIN
SELECT * FROM tienda_detalle;
END//
DELIMITER ;

-- Volcando estructura para tabla baseunit002.moneda
CREATE TABLE IF NOT EXISTS `moneda` (
  `id_moneda` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor_moneda` double NOT NULL,
  PRIMARY KEY (`id_moneda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.moneda: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` (`id_moneda`, `descripcion`, `valor_moneda`) VALUES
	(4, '5 centavos', 0.05),
	(5, '10 centavos', 0.1),
	(6, '50 centavos', 0.5),
	(7, '1 peso', 1),
	(8, '2 pesos', 2),
	(9, '10 pesos', 10),
	(10, '10 pesos', 10),
	(16, '25 pesos', 25),
	(17, '30 pesos', 30),
	(19, '40 pesos', 40),
	(20, '5 pesos', 5),
	(21, '3 pesos ', 3),
	(22, '6 pesos ', 6),
	(23, ' ', 0);
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.operacion
CREATE TABLE IF NOT EXISTS `operacion` (
  `id_operacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_operacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.operacion: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `operacion` DISABLE KEYS */;
INSERT INTO `operacion` (`id_operacion`, `tipo_operacion`) VALUES
	(1, 'en proceso'),
	(2, 'transaccion'),
	(3, 'rechasada'),
	(4, 'aceptada'),
	(5, 'cancelada');
/*!40000 ALTER TABLE `operacion` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `id_pago` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_pago` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.pago: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` (`id_pago`, `tipo_pago`) VALUES
	(1, 'paypal'),
	(2, 'tarjeta'),
	(3, 'efectivo'),
	(4, 'tarjeta de regalo'),
	(5, 'tarjeta de amazon'),
	(6, 'tarjeta de credito');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellidom` varchar(255) DEFAULT NULL,
  `apellidop` varchar(255) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.puesto
CREATE TABLE IF NOT EXISTS `puesto` (
  `id_puesto` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo_puesto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.puesto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.tienda_detalle
CREATE TABLE IF NOT EXISTS `tienda_detalle` (
  `id_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `token` char(1) NOT NULL,
  `n_boveda` bigint(20) DEFAULT NULL,
  `n_caja` bigint(20) DEFAULT NULL,
  `n_cajero` bigint(20) DEFAULT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `matricula` bigint(20) DEFAULT NULL,
  `id_tienda` bigint(20) DEFAULT NULL,
  `id_ubicacion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `FK7g0arf0he7ackm2jkgj6sek0k` (`n_boveda`),
  KEY `FKrg5dy5lmkd21peiba6p5vue4w` (`n_caja`),
  KEY `FKb9yaq2os2ubswvg25q4maro77` (`n_cajero`),
  KEY `FKmhyqicowmn0h8pe61cu9e2ivv` (`id_cliente`),
  KEY `FKdn6rk13x0mkvb1eej39pvyyk5` (`matricula`),
  KEY `FK77d4b51e6b9rq1rdvsteplr7e` (`id_tienda`),
  KEY `FKgwr1qwifeduobvbdjxset75ot` (`id_ubicacion`),
  CONSTRAINT `FK77d4b51e6b9rq1rdvsteplr7e` FOREIGN KEY (`id_tienda`) REFERENCES `tipo_tienda` (`id_tienda`),
  CONSTRAINT `FK7g0arf0he7ackm2jkgj6sek0k` FOREIGN KEY (`n_boveda`) REFERENCES `boveda` (`n_boveda`),
  CONSTRAINT `FKb9yaq2os2ubswvg25q4maro77` FOREIGN KEY (`n_cajero`) REFERENCES `cajero_automatico` (`n_cajero`),
  CONSTRAINT `FKdn6rk13x0mkvb1eej39pvyyk5` FOREIGN KEY (`matricula`) REFERENCES `empleado` (`matricula`),
  CONSTRAINT `FKgwr1qwifeduobvbdjxset75ot` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubucacion` (`id_ubicacion`),
  CONSTRAINT `FKmhyqicowmn0h8pe61cu9e2ivv` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FKn783l8qxp5aujf6remplkkg8u` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`),
  CONSTRAINT `FKrg5dy5lmkd21peiba6p5vue4w` FOREIGN KEY (`n_caja`) REFERENCES `caja` (`n_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.tienda_detalle: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tienda_detalle` DISABLE KEYS */;
INSERT INTO `tienda_detalle` (`id_detalle`, `descripcion`, `nombre`, `token`, `n_boveda`, `n_caja`, `n_cajero`, `id_cliente`, `matricula`, `id_tienda`, `id_ubicacion`) VALUES
	(1, 'tienda virtual', 'jempeño', 'e', 2, 1, 2, NULL, NULL, 6, NULL),
	(2, 'tienda ficica', 'AVempeno', 'e', 2, 1, 2, NULL, NULL, 6, NULL),
	(3, 'tienda fisica', 'AVempeno', 'a', 1, 2, 1, NULL, NULL, 7, NULL),
	(4, 'tienda fisica', 'empeno cuates', 'a', 1, 2, 1, NULL, NULL, 7, NULL),
	(5, 'tienda fisica', 'hermanos empeno', 'v', 1, 2, 1, NULL, NULL, 7, NULL);
/*!40000 ALTER TABLE `tienda_detalle` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.tipo_tienda
CREATE TABLE IF NOT EXISTS `tipo_tienda` (
  `id_tienda` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo_tienda` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.tipo_tienda: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_tienda` DISABLE KEYS */;
INSERT INTO `tipo_tienda` (`id_tienda`, `descripcion`, `tipo_tienda`) VALUES
	(1, 'ficica', 'fisica'),
	(2, 'victual', 'e-commes'),
	(3, 'victual', 'e-commes'),
	(4, 'victual', 'e-commes'),
	(5, 'victual', 'e-commes'),
	(6, 'fisica', 'monte pio'),
	(7, 'ficica', 'fisica'),
	(8, 'tienda fisica', 'acosta empeno'),
	(9, 'tienda fisica', 'costa empeno'),
	(10, 'tienda fisica', 'presta dienro'),
	(11, 'tienda fisica', 'acosrtafdfd'),
	(12, 'tienda fisica', 'ghghf'),
	(13, 'tienda virtual', 'jhhjolpl'),
	(14, 'tienda virtual', 'empesghghg'),
	(15, 'tienda virtual', 'empe todo');
/*!40000 ALTER TABLE `tipo_tienda` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.transaccion_detalle
CREATE TABLE IF NOT EXISTS `transaccion_detalle` (
  `id_tdetalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `apertura` date DEFAULT NULL,
  `cierre` date DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `referencia` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_tdetalle`),
  KEY `FKphh71brgoomklrmea6xf6yw1u` (`referencia`),
  CONSTRAINT `FKphh71brgoomklrmea6xf6yw1u` FOREIGN KEY (`referencia`) REFERENCES `transaccion_encabezado` (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.transaccion_detalle: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `transaccion_detalle` DISABLE KEYS */;
INSERT INTO `transaccion_detalle` (`id_tdetalle`, `apertura`, `cierre`, `estatus`, `referencia`) VALUES
	(1, '2021-05-21', '2021-05-21', 'abierta', NULL),
	(2, '2020-02-01', '2020-02-01', 'cierre', NULL),
	(3, '2050-02-01', '2050-02-01', 'abierta', NULL),
	(4, '2050-05-21', '2050-05-21', 'abierta', NULL);
/*!40000 ALTER TABLE `transaccion_detalle` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.transaccion_encabezado
CREATE TABLE IF NOT EXISTS `transaccion_encabezado` (
  `referencia` char(1) NOT NULL,
  `fecha` date DEFAULT NULL,
  `monto` double NOT NULL,
  `operacion_destino` varchar(255) DEFAULT NULL,
  `opercion_origen` varchar(255) DEFAULT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_operacion` bigint(20) DEFAULT NULL,
  `id_pago` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`referencia`),
  KEY `FKo77xvr3atxbj4jbm7b7emt59g` (`id_cliente`),
  KEY `FKbjakoaia9m0odsa4oeh6r38q9` (`id_operacion`),
  KEY `FKmneb1xh1krjb6dqe6cejkjk54` (`id_pago`),
  CONSTRAINT `FKbjakoaia9m0odsa4oeh6r38q9` FOREIGN KEY (`id_operacion`) REFERENCES `operacion` (`id_operacion`),
  CONSTRAINT `FKmneb1xh1krjb6dqe6cejkjk54` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`),
  CONSTRAINT `FKo77xvr3atxbj4jbm7b7emt59g` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.transaccion_encabezado: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `transaccion_encabezado` DISABLE KEYS */;
INSERT INTO `transaccion_encabezado` (`referencia`, `fecha`, `monto`, `operacion_destino`, `opercion_origen`, `id_cliente`, `id_operacion`, `id_pago`) VALUES
	('1', '2021-08-06', 2500000, 'boveda', 'caja', NULL, 1, 2),
	('2', '2031-08-06', 1500000000, 'boveda', 'caja', NULL, 1, 3);
/*!40000 ALTER TABLE `transaccion_encabezado` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.ubicacion
CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_ubicacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `estado` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  `pais` varchar(255) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Volcando datos para la tabla baseunit002.ubicacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;

-- Volcando estructura para tabla baseunit002.ubucacion
CREATE TABLE IF NOT EXISTS `ubucacion` (
  `id_ubicacion` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `sku` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_ubicacion`),
  KEY `FKli3ngq0jp6bv6om6cjamt4tie` (`sku`),
  CONSTRAINT `FKli3ngq0jp6bv6om6cjamt4tie` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla baseunit002.ubucacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ubucacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubucacion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
