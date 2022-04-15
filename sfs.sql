-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.25 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla carsystem.almacenequipos
CREATE TABLE IF NOT EXISTS `almacenequipos` (
  `IDEQUIPO` int NOT NULL,
  `IDTIPOEQ` int DEFAULT NULL,
  `NOMEQUIPO` varchar(65) DEFAULT NULL,
  `MARCAEQ` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`IDEQUIPO`),
  KEY `FK_ORDENA_A` (`IDTIPOEQ`),
  CONSTRAINT `FK_ORDENA_A` FOREIGN KEY (`IDTIPOEQ`) REFERENCES `tipoequipos` (`IDTIPOEQ`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.almacenequipos: ~8 rows (aproximadamente)
DELETE FROM `almacenequipos`;
/*!40000 ALTER TABLE `almacenequipos` DISABLE KEYS */;
INSERT INTO `almacenequipos` (`IDEQUIPO`, `IDTIPOEQ`, `NOMEQUIPO`, `MARCAEQ`) VALUES
	(8500, 450, 'SCANNER	', '	HAMILTON	'),
	(8501, 451, 'VOLTIMETRO	', '	HOSTERR	'),
	(8502, 452, 'BOMBA DE AIRE	', '	WILKINSON	'),
	(8503, 453, 'BOMBA DE AIRE	', '	WILKINSON	'),
	(8504, 454, 'BOMBA NEUMATICA	', '	HERBIGER	'),
	(8505, 455, 'ELEVADOR	', '	GAUSS CO	'),
	(8506, 456, 'HIDRAULICA	', '	MASHIDA	'),
	(8507, 457, 'COMPRESORA AIRE	', '	VOLTERK	');
/*!40000 ALTER TABLE `almacenequipos` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.almacenrepuestos
CREATE TABLE IF NOT EXISTS `almacenrepuestos` (
  `ID_REP` int NOT NULL,
  `tipoRep` int DEFAULT NULL,
  `NOMREP` varchar(97) DEFAULT NULL,
  `MARCAREP` varchar(96) DEFAULT NULL,
  `COSTOREP` float(8,2) DEFAULT NULL,
  `CANTRP` int DEFAULT NULL,
  `OBSREPUESTOS` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_REP`),
  KEY `FK_tieneUntipRep_01` (`tipoRep`),
  CONSTRAINT `FK_tieneUntipRep_01` FOREIGN KEY (`tipoRep`) REFERENCES `tiporepuestos` (`IDTIPREP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.almacenrepuestos: ~26 rows (aproximadamente)
DELETE FROM `almacenrepuestos`;
/*!40000 ALTER TABLE `almacenrepuestos` DISABLE KEYS */;
INSERT INTO `almacenrepuestos` (`ID_REP`, `tipoRep`, `NOMREP`, `MARCAREP`, `COSTOREP`, `CANTRP`, `OBSREPUESTOS`) VALUES
	(300, 60, 'tornillo 3/4', ' Linther', 15.00, 120, 'Ninguna'),
	(301, 60, 'tornillo 1/4', ' Linther', 12.00, 120, 'Ninguna'),
	(302, 60, 'tornillo 1/2', ' Linther', 11.00, 100, 'Ninguna'),
	(303, 61, 'niples 1/2', ' oster', 8.00, 20, 'Ninguna'),
	(304, 61, 'niple de 1"', ' oster', 5.00, 56, 'Ninguna'),
	(305, 61, 'niple goma', ' oster', 20.00, 54, ' Ninguna'),
	(306, 62, 'Aceite S3', 'YPFB', 45.00, 58, ' Ninguna'),
	(307, 62, 'Aceite A2', 'Shell', 56.00, 2, 'Ninguna'),
	(308, 63, 'Goma 124', 'Generico', 12.00, 2, 'Ninguna'),
	(309, 63, 'Caucho 67', 'Generico', 12.00, 21, 'Ninguna'),
	(310, 63, 'metalico', 'Generico', 21.00, 21, 'Ninguna'),
	(311, 64, 'tipo 3', 'nacional', 25.00, 5, 'Ninguna'),
	(312, 64, 'tipo 23', 'forza', 25.00, 5, 'Ninguna'),
	(313, 65, 'primera', 'Kaltor', 36.00, 12, 'Ninguna'),
	(314, 65, 'segunda', 'Kaltor', 36.00, 12, 'Ninguna'),
	(315, 66, 'plastico', 'Generico', 450.00, 1, 'Ninguna'),
	(316, 66, 'mix', 'BMX', 325.00, 2, ' Ninguna'),
	(317, 67, '1554 GRT', 'YPFB', 89.00, 2, ' Ninguna'),
	(318, 67, '345-NM', 'Shell', 87.00, 2, ' Ninguna'),
	(319, 68, 'tipo cubierta', 'nacional', 20.00, 1, ' Ninguna'),
	(320, 68, 'tipo CMN', 'nacional', 25.00, 1, ' Ninguna'),
	(321, 69, 'Cables Luz halog', 'cHN LOp', 23.00, 15, ' Ninguna'),
	(322, 69, 'Termicos', 'cHN LOp', 24.00, 15, ' Ninguna'),
	(323, 70, '70 amp', 'Heliar', 158.00, 1, ' Ninguna'),
	(324, 70, '50 amp', 'Heliar', 115.00, 1, 'Ninguna'),
	(325, 71, 'caucho tacos', 'nacional', 25.00, 10, ' Ninguna');
/*!40000 ALTER TABLE `almacenrepuestos` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.asignaciontrabajos
CREATE TABLE IF NOT EXISTS `asignaciontrabajos` (
  `IDEQTRABA` int NOT NULL,
  `CODPERSONAL` int DEFAULT NULL,
  `IDTURNO` int DEFAULT NULL,
  `IDTRABAJO` int DEFAULT NULL,
  `MESET` int DEFAULT NULL,
  `YEARET` int DEFAULT NULL,
  PRIMARY KEY (`IDEQTRABA`),
  KEY `FK_ASIGNADO` (`IDTURNO`),
  KEY `FK_CUENTA_CON_UN` (`IDTRABAJO`),
  KEY `FK_SE_ASIGNA_UN` (`CODPERSONAL`),
  CONSTRAINT `FK_ASIGNADO` FOREIGN KEY (`IDTURNO`) REFERENCES `turno` (`IDTURNO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CUENTA_CON_UN` FOREIGN KEY (`IDTRABAJO`) REFERENCES `trabajo` (`IDTRABAJO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SE_ASIGNA_UN` FOREIGN KEY (`CODPERSONAL`) REFERENCES `personal` (`CODPERSONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.asignaciontrabajos: ~71 rows (aproximadamente)
DELETE FROM `asignaciontrabajos`;
/*!40000 ALTER TABLE `asignaciontrabajos` DISABLE KEYS */;
INSERT INTO `asignaciontrabajos` (`IDEQTRABA`, `CODPERSONAL`, `IDTURNO`, `IDTRABAJO`, `MESET`, `YEARET`) VALUES
	(200, 1201, 20, 7001, 10, 2020),
	(201, 1202, 20, 7001, 10, 2020),
	(202, 1203, 20, 7001, 10, 2020),
	(203, 1204, 21, 7002, 1, 2021),
	(204, 1205, 21, 7002, 1, 2021),
	(205, 1206, 21, 7002, 1, 2021),
	(206, 1207, 22, 7003, 3, 2020),
	(207, 1208, 22, 7003, 3, 2020),
	(208, 1209, 20, 7004, 8, 2021),
	(209, 1210, 20, 7004, 8, 2021),
	(210, 1211, 20, 7004, 8, 2021),
	(211, 1212, 21, 7005, 9, 2021),
	(212, 1213, 21, 7005, 9, 2021),
	(213, 1214, 21, 7005, 9, 2021),
	(214, 1215, 22, 7006, 5, 2019),
	(215, 1216, 22, 7006, 5, 2019),
	(216, 1217, 22, 7006, 5, 2019),
	(217, 1218, 20, 7007, 10, 2021),
	(218, 1204, 20, 7007, 10, 2021),
	(219, 1205, 20, 7007, 1, 2021),
	(220, 1206, 21, 7008, 2, 2020),
	(221, 1207, 21, 7008, 2, 2020),
	(222, 1208, 21, 7008, 2, 2020),
	(223, 1209, 22, 7009, 2, 2021),
	(224, 1210, 22, 7009, 2, 2021),
	(225, 1211, 22, 7009, 2, 2021),
	(226, 1212, 20, 7010, 6, 2020),
	(227, 1213, 20, 7010, 6, 2020),
	(228, 1201, 20, 7010, 6, 2020),
	(229, 1202, 21, 7011, 12, 2020),
	(230, 1203, 21, 7011, 12, 2020),
	(231, 1204, 21, 7011, 12, 2020),
	(232, 1205, 22, 7012, 12, 2019),
	(233, 1206, 22, 7012, 12, 2019),
	(234, 1207, 22, 7012, 12, 2019),
	(235, 1208, 20, 7013, 5, 2021),
	(236, 1209, 20, 7013, 5, 2021),
	(237, 1210, 20, 7013, 5, 2021),
	(238, 1211, 21, 7014, 1, 2020),
	(239, 1212, 21, 7014, 1, 2020),
	(240, 1213, 21, 7014, 1, 2020),
	(241, 1214, 22, 7015, 7, 2021),
	(242, 1215, 22, 7015, 7, 2021),
	(243, 1216, 22, 7015, 7, 2021),
	(244, 1217, 20, 7016, 6, 2021),
	(245, 1218, 20, 7016, 6, 2021),
	(246, 1204, 20, 7016, 6, 2021),
	(247, 1205, 21, 7017, 7, 2021),
	(248, 1206, 21, 7017, 7, 2021),
	(249, 1207, 21, 7017, 7, 2021),
	(250, 1208, 22, 7018, 5, 2020),
	(251, 1209, 22, 7018, 5, 2020),
	(252, 1210, 22, 7018, 5, 2020),
	(253, 1211, 20, 7019, 7, 2020),
	(254, 1212, 20, 7019, 7, 2020),
	(255, 1213, 20, 7019, 7, 2020),
	(256, 1205, 21, 7020, 7, 2021),
	(257, 1206, 21, 7020, 7, 2021),
	(258, 1207, 21, 7020, 7, 2021),
	(259, 1208, 22, 7021, 8, 2020),
	(260, 1209, 22, 7021, 8, 2020),
	(261, 1210, 22, 7021, 8, 2020),
	(262, 1211, 20, 7022, 1, 2020),
	(263, 1212, 20, 7022, 1, 2020),
	(264, 1213, 20, 7022, 1, 2020),
	(265, 1201, 21, 7023, 12, 2020),
	(266, 1202, 21, 7023, 12, 2020),
	(267, 1203, 21, 7023, 12, 2020),
	(268, 1204, 22, 7024, 4, 2021),
	(269, 1205, 22, 7024, 4, 2021),
	(270, 1201, 22, 7024, 4, 2021);
/*!40000 ALTER TABLE `asignaciontrabajos` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.autos
CREATE TABLE IF NOT EXISTS `autos` (
  `PLACAAUTO` varchar(15) NOT NULL,
  `MODELO` varchar(23) DEFAULT NULL,
  `ANIO` int DEFAULT NULL,
  `COLOR` varchar(65) DEFAULT NULL,
  `TIPO` varchar(76) DEFAULT NULL,
  `PROCEDENCIA` varchar(78) DEFAULT NULL,
  `MARCAAUTOMOV` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`PLACAAUTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.autos: ~11 rows (aproximadamente)
DELETE FROM `autos`;
/*!40000 ALTER TABLE `autos` DISABLE KEYS */;
INSERT INTO `autos` (`PLACAAUTO`, `MODELO`, `ANIO`, `COLOR`, `TIPO`, `PROCEDENCIA`, `MARCAAUTOMOV`) VALUES
	('2211ERT', 'HILUX', 2019, 'BLANCO', 'CAMIONETA', 'TAILANDIA', 'TOYOTA'),
	('2569PPO', 'COROLLA', 2021, 'BLANCO', 'SEDAN', 'JAPON', 'TOYOTA'),
	('2589POL', 'RAV4', 2011, 'GUINDA', 'VAGONETA', 'USA', 'TOYOTA'),
	('3326EER', 'SANTA-FE', 2019, 'GRIS', 'VAGONETA', 'KOREA', 'HYUNDAI'),
	('4578PLO', 'Q15', 2012, 'NEGRO', 'SEDAN', 'USA', 'INFINITY'),
	('5689KLI', 'SENIOR', 2020, 'VERDE', 'VAGONETA', 'JAPON', 'MAZDA'),
	('6598JKU', 'S', 2020, 'VERDE', 'SEDAN', 'ALEMANIA', 'MERCEDES'),
	('6699LPG', 'PETA', 1978, 'GRIS', 'ESCARABAJO', 'ALEMANIA', 'VW'),
	('7785LIX', 'MURANO', 2019, 'GUINDO', 'VAGONETA', 'JAPON', 'NISSAN'),
	('9685OOT', 'BRASILIA', 1980, 'ROJO', 'HATCHBAG', 'BRASIL', 'VW'),
	('9869PPO', 'ALTO', 2021, 'NEGRO', 'HATCHBAG', 'JAPON', 'SUZUKI');
/*!40000 ALTER TABLE `autos` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.categoriacli
CREATE TABLE IF NOT EXISTS `categoriacli` (
  `CODCAT` varchar(8) NOT NULL DEFAULT '',
  `IDCAJA` int DEFAULT NULL,
  `IDCLIENTE` int DEFAULT NULL,
  PRIMARY KEY (`CODCAT`),
  KEY `FK_ASIGNA` (`IDCAJA`),
  KEY `FK_TIENE_UN_BENEFICIO` (`IDCLIENTE`),
  CONSTRAINT `FK_ASIGNA` FOREIGN KEY (`IDCAJA`) REFERENCES `facturacion` (`IDCAJA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_UN_BENEFICIO` FOREIGN KEY (`IDCLIENTE`) REFERENCES `cliente` (`IDCLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.categoriacli: ~0 rows (aproximadamente)
DELETE FROM `categoriacli`;
/*!40000 ALTER TABLE `categoriacli` DISABLE KEYS */;
INSERT INTO `categoriacli` (`CODCAT`, `IDCAJA`, `IDCLIENTE`) VALUES
	('P0001', 10000, 104),
	('P0002', 10001, 108),
	('P0003', 10002, 110),
	('P0004', 10003, 102),
	('P0005', 10004, 114),
	('P0006', 10005, 106),
	('P0007', 10006, 114),
	('P0008', 10007, 111),
	('P0009', 10008, 107),
	('P0010', 10009, 106),
	('P0011', 10010, 110),
	('P0012', 10011, 110),
	('P0013', 10012, 106),
	('P0014', 10013, 111),
	('P0015', 10014, 101),
	('P0016', 10015, 101),
	('P0017', 10016, 112),
	('P0018', 10017, 106),
	('P0019', 10018, 112),
	('P0020', 10019, 109),
	('P0021', 10020, 103),
	('P0022', 10021, 110),
	('P0023', 10022, 109),
	('P0024', 10023, 106);
/*!40000 ALTER TABLE `categoriacli` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `IDCLIENTE` int NOT NULL,
  `CEDULACLIENTE` int DEFAULT NULL,
  `PLACAAUTO` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IDCLIENTE`),
  KEY `FK_ES_UN` (`CEDULACLIENTE`),
  KEY `FK_TIENE_UN` (`PLACAAUTO`),
  CONSTRAINT `FK_ES_UN` FOREIGN KEY (`CEDULACLIENTE`) REFERENCES `titularauto` (`CEDULACLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_UN` FOREIGN KEY (`PLACAAUTO`) REFERENCES `autos` (`PLACAAUTO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.cliente: ~15 rows (aproximadamente)
DELETE FROM `cliente`;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`IDCLIENTE`, `CEDULACLIENTE`, `PLACAAUTO`) VALUES
	(100, 4411467, '2589POL'),
	(101, 4589167, '5689KLI'),
	(102, 55897, '6598JKU'),
	(103, 896658, '2589POL'),
	(104, 777239, '9869PPO'),
	(105, 482869, '2211ERT'),
	(106, 99958, '6699LPG'),
	(107, 98985, '9685OOT'),
	(108, 99965, '3326EER'),
	(109, 9878589, '9869PPO'),
	(110, 55869, '5689KLI'),
	(111, 44487, '6699LPG'),
	(112, 251445, '3326EER'),
	(113, 251445, '2211ERT'),
	(114, 482869, '5689KLI');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.contactosprov
CREATE TABLE IF NOT EXISTS `contactosprov` (
  `IDPROVEEDOR` int DEFAULT NULL,
  `NOMBRECONTACTO` varchar(54) DEFAULT NULL,
  `APELLCONTC` varchar(65) DEFAULT NULL,
  `EMAILCONTC` varchar(87) DEFAULT NULL,
  `TELEFCNTC` int DEFAULT NULL,
  KEY `FK_LLAMAN_A` (`IDPROVEEDOR`),
  CONSTRAINT `FK_LLAMAN_A` FOREIGN KEY (`IDPROVEEDOR`) REFERENCES `proveedores` (`IDPROVEEDOR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.contactosprov: ~6 rows (aproximadamente)
DELETE FROM `contactosprov`;
/*!40000 ALTER TABLE `contactosprov` DISABLE KEYS */;
INSERT INTO `contactosprov` (`IDPROVEEDOR`, `NOMBRECONTACTO`, `APELLCONTC`, `EMAILCONTC`, `TELEFCNTC`) VALUES
	(6900, 'victor', 'guardia', 'vguadia@aol.com', 71769854),
	(6901, 'jose', 'meruvia', 'jmerv@yahoo.es', 78923564),
	(6902, 'mario', 'cronembol', 'marito54@gmail.com', 60532589),
	(6903, 'erick', 'cinanis', 'cv789@gmail.com', 859658974),
	(6904, 'sandra', 'paco', 'spaco@gmail.com', 904875412),
	(6905, 'fabian', 'sola', 'solaFF@gmail.com', 704986541);
/*!40000 ALTER TABLE `contactosprov` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.cotizacion
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `IDCOTIZ` int NOT NULL,
  `IDRECEP` int DEFAULT NULL,
  `CONFIRMACLI` varchar(50) DEFAULT NULL,
  `FECHACOTIZ` date DEFAULT NULL,
  `IMPORTECOTIZADO` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`IDCOTIZ`),
  KEY `FK_SE_VA_A` (`IDRECEP`),
  CONSTRAINT `FK_SE_VA_A` FOREIGN KEY (`IDRECEP`) REFERENCES `recepcion` (`IDRECEP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.cotizacion: ~49 rows (aproximadamente)
DELETE FROM `cotizacion`;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
INSERT INTO `cotizacion` (`IDCOTIZ`, `IDRECEP`, `CONFIRMACLI`, `FECHACOTIZ`, `IMPORTECOTIZADO`) VALUES
	(6000, 5505, '1', '2020-10-13', 838.00),
	(6001, 5512, '0', '2020-05-11', 1683.00),
	(6002, 5509, '0', '2020-05-29', 1346.00),
	(6003, 5509, '1', '2021-01-26', 2253.00),
	(6004, 5510, '0', '2020-10-11', 1486.00),
	(6005, 5511, '0', '2019-12-29', 2251.00),
	(6006, 5511, '1', '2020-03-04', 2105.00),
	(6007, 5503, '1', '2021-08-15', 2401.00),
	(6008, 5502, '1', '2021-09-22', 904.00),
	(6009, 5504, '0', '2021-10-23', 1899.00),
	(6010, 5507, '1', '2019-05-13', 2246.00),
	(6011, 5502, '1', '2021-10-14', 2170.00),
	(6012, 5513, '0', '2021-07-30', 2294.00),
	(6013, 5512, '1', '2020-02-11', 1909.00),
	(6014, 5508, '1', '2021-02-17', 2462.00),
	(6015, 5507, '1', '2020-06-15', 1772.00),
	(6016, 5511, '1', '2020-12-26', 1409.00),
	(6017, 5504, '0', '2019-11-25', 1975.00),
	(6018, 5511, '1', '2019-12-05', 906.00),
	(6019, 5507, '1', '2021-04-30', 1303.00),
	(6020, 5512, '1', '2020-01-18', 2005.00),
	(6021, 5501, '1', '2019-07-05', 1209.00),
	(6022, 5501, '1', '2021-05-25', 781.00),
	(6023, 5505, '0', '2021-12-25', 2265.00),
	(6024, 5509, '0', '2021-03-10', 788.00),
	(6025, 5513, '1', '2021-07-02', 979.00),
	(6026, 5508, '0', '2021-06-24', 1253.00),
	(6027, 5507, '1', '2020-05-25', 2470.00),
	(6028, 5502, '0', '2019-08-27', 2336.00),
	(6029, 5501, '0', '2022-01-04', 983.00),
	(6030, 5513, '1', '2020-06-28', 751.00),
	(6031, 5508, '0', '2021-03-29', 2236.00),
	(6032, 5501, '0', '2020-04-11', 2030.00),
	(6033, 5512, '0', '2020-11-24', 1642.00),
	(6034, 5506, '0', '2020-11-17', 1825.00),
	(6035, 5506, '0', '2019-10-14', 1102.00),
	(6036, 5510, '1', '2021-07-17', 1763.00),
	(6037, 5504, '1', '2020-08-28', 1310.00),
	(6038, 5504, '0', '2020-03-22', 2101.00),
	(6040, 5511, '1', '2019-12-24', 911.00),
	(6041, 5508, '0', '2021-02-21', 1066.00),
	(6042, 5504, '0', '2019-07-04', 2377.00),
	(6043, 5510, '1', '2020-11-01', 2411.00),
	(6044, 5505, '0', '2021-12-28', 1517.00),
	(6045, 5507, '1', '2021-03-13', 762.00),
	(6046, 5510, '0', '2021-06-01', 1550.00),
	(6047, 5509, '0', '2020-03-18', 2288.00),
	(6048, 5505, '0', '2020-09-13', 1974.00),
	(6049, 5514, '0', '2021-07-06', 1883.00);
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.facturacion
CREATE TABLE IF NOT EXISTS `facturacion` (
  `IDCAJA` int NOT NULL,
  `IDTRABAJO` int DEFAULT NULL,
  `CODPERSONAL` int DEFAULT NULL,
  `FECHAREG` date DEFAULT NULL,
  `TOTALTRANSAC` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`IDCAJA`),
  KEY `FK_INFORMA_A` (`IDTRABAJO`),
  KEY `FK_TIENE_RESPONSABLE` (`CODPERSONAL`),
  CONSTRAINT `FK_INFORMA_A` FOREIGN KEY (`IDTRABAJO`) REFERENCES `trabajo` (`IDTRABAJO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_RESPONSABLE` FOREIGN KEY (`CODPERSONAL`) REFERENCES `personal` (`CODPERSONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.facturacion: ~24 rows (aproximadamente)
DELETE FROM `facturacion`;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` (`IDCAJA`, `IDTRABAJO`, `CODPERSONAL`, `FECHAREG`, `TOTALTRANSAC`) VALUES
	(10000, 7001, 1219, '2020-10-16', 838.00),
	(10001, 7002, 1219, '2021-01-31', 2253.00),
	(10002, 7003, 1219, '2020-03-15', 2105.00),
	(10003, 7004, 1219, '2021-08-31', 2401.00),
	(10004, 7005, 1219, '2021-09-25', 904.00),
	(10005, 7006, 1219, '2019-05-18', 2246.00),
	(10006, 7007, 1219, '2021-10-18', 2170.00),
	(10007, 7008, 1219, '2020-02-16', 1909.00),
	(10008, 7009, 1219, '2021-02-22', 2465.00),
	(10009, 7010, 1219, '2020-06-18', 1772.00),
	(10010, 7011, 1219, '2020-12-31', 1409.00),
	(10011, 7012, 1219, '2019-12-16', 906.00),
	(10012, 7013, 1219, '2021-05-05', 1303.00),
	(10013, 7014, 1219, '2020-01-20', 2005.00),
	(10014, 7015, 1219, '2021-07-09', 1209.00),
	(10015, 7016, 1219, '2021-06-10', 781.00),
	(10016, 7017, 1219, '2021-07-31', 979.00),
	(10017, 7018, 1219, '2020-05-31', 2470.00),
	(10018, 7019, 1219, '2020-07-05', 751.00),
	(10019, 7020, 1219, '2021-07-31', 1763.00),
	(10020, 7021, 1219, '2020-08-31', 1310.00),
	(10021, 7022, 1219, '2020-01-05', 911.00),
	(10022, 7023, 1219, '2020-12-05', 2411.00),
	(10023, 7024, 1219, '2021-04-05', 762.00);
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.herramientasmenores
CREATE TABLE IF NOT EXISTS `herramientasmenores` (
  `CODHERRA` int NOT NULL,
  `IDTIPOHERR` int DEFAULT NULL,
  `NOMHERRAMIENTA` varchar(100) DEFAULT NULL,
  `CANTIDADHERR` int DEFAULT NULL,
  `OBS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODHERRA`),
  KEY `FK_CLASIFICA_EN` (`IDTIPOHERR`),
  CONSTRAINT `FK_CLASIFICA_EN` FOREIGN KEY (`IDTIPOHERR`) REFERENCES `tipoherramientas` (`IDTIPOHERR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.herramientasmenores: ~15 rows (aproximadamente)
DELETE FROM `herramientasmenores`;
/*!40000 ALTER TABLE `herramientasmenores` DISABLE KEYS */;
INSERT INTO `herramientasmenores` (`CODHERRA`, `IDTIPOHERR`, `NOMHERRAMIENTA`, `CANTIDADHERR`, `OBS`) VALUES
	(8000, 50, 'llave halem', 3, ' Ninguna'),
	(8001, 50, 'alicate GH', 2, 'Ninguna'),
	(8002, 50, 'Jgo llaves GHY', 3, 'Ninguna'),
	(8003, 51, 'Voltimetro', 5, ' Ninguna'),
	(8004, 51, 'cargad bat', 4, 'Ninguna'),
	(8005, 51, 'cables de bat', 2, 'Ninguna'),
	(8006, 52, 'martillo goma', 3, 'Ninguna'),
	(8007, 52, 'martillo fierro', 5, ' Ninguna'),
	(8008, 53, 'soplador 12', 4, 'Ninguna'),
	(8009, 53, 'soplador 11', 8, 'Ninguna'),
	(8010, 53, 'bomba peq	', 2, 'Ninguna'),
	(8011, 54, 'barreta 23', 5, 'Ninguna'),
	(8012, 54, 'barreta 12', 6, 'Ninguna'),
	(8013, 55, 'gata', 10, 'Ninguna'),
	(8014, 55, 'jgo dados', 2, 'Ninguna');
/*!40000 ALTER TABLE `herramientasmenores` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.marcadoingreso
CREATE TABLE IF NOT EXISTS `marcadoingreso` (
  `IDREGISTROHORARIO` int NOT NULL,
  `CODPERSONAL` int DEFAULT NULL,
  `IDTURNO` int DEFAULT NULL,
  `FECHA_HORARIO` date DEFAULT NULL,
  `HORAINGMANANA` time DEFAULT NULL,
  `HORASALTARDE` time DEFAULT NULL,
  `HORASTRABAJADAS` int DEFAULT NULL,
  `ATRASOS` int DEFAULT NULL,
  `obsHorario` varchar(122) DEFAULT NULL,
  PRIMARY KEY (`IDREGISTROHORARIO`),
  KEY `FK_ACOMPANA_A` (`IDTURNO`),
  KEY `FK_TIENE_QUE` (`CODPERSONAL`),
  CONSTRAINT `FK_ACOMPANA_A` FOREIGN KEY (`IDTURNO`) REFERENCES `turno` (`IDTURNO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_QUE` FOREIGN KEY (`CODPERSONAL`) REFERENCES `personal` (`CODPERSONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.marcadoingreso: ~46 rows (aproximadamente)
DELETE FROM `marcadoingreso`;
/*!40000 ALTER TABLE `marcadoingreso` DISABLE KEYS */;
INSERT INTO `marcadoingreso` (`IDREGISTROHORARIO`, `CODPERSONAL`, `IDTURNO`, `FECHA_HORARIO`, `HORAINGMANANA`, `HORASALTARDE`, `HORASTRABAJADAS`, `ATRASOS`, `obsHorario`) VALUES
	(1700, 1201, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1701, 1202, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1702, 1203, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1703, 1204, 21, '2022-02-01', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1704, 1205, 21, '2022-02-01', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1705, 1206, 21, '2022-02-01', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1706, 1207, 21, '2022-02-01', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1707, 1208, 21, '2022-02-01', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1708, 1209, 21, '2022-02-01', '14:15:00', '18:00:00', 4, 0, 'permiso	'),
	(1709, 1210, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1710, 1211, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1711, 1212, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1712, 1213, 21, '2022-02-01', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1713, 1214, 21, '2022-02-01', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1714, 1215, 21, '2022-02-01', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1715, 1216, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1716, 1217, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1717, 1218, 20, '2022-02-01', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1718, 1219, 21, '2022-02-01', '14:15:00', '18:00:00', 4, 0, 'permiso'),
	(1719, 1211, 20, '2022-02-02', '08:15:00', '12:00:00', 4, 0, 'permiso'),
	(1720, 1211, 20, '2022-02-03', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1721, 1211, 20, '2022-02-04', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1722, 1211, 20, '2022-02-07', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1723, 1211, 20, '2022-02-08', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1724, 1211, 20, '2022-02-09', '08:20:00', '12:00:00', 4, 0, 'permiso	'),
	(1725, 1211, 20, '2022-02-10', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1726, 1211, 20, '2022-02-11', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1727, 1211, 21, '2022-02-21', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1728, 1211, 21, '2022-02-22', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1729, 1211, 21, '2022-02-23', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1730, 1211, 21, '2022-02-24', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1731, 1211, 21, '2022-02-25', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1732, 1208, 21, '2022-02-02', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1733, 1208, 21, '2022-02-03', '14:20:00', '18:00:00', 4, 33, 'permiso'),
	(1734, 1208, 21, '2022-02-04', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1735, 1208, 20, '2022-02-18', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1736, 1208, 22, '2022-02-19', '08:00:00', '14:00:00', 6, 0, 'almuerzo'),
	(1737, 1208, 22, '2022-02-20', '08:00:00', '14:00:00', 6, 0, 'almuerzo'),
	(1738, 1209, 20, '2022-02-02', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1739, 1209, 20, '2022-02-03', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1740, 1209, 20, '2022-02-04', '08:00:00', '12:00:00', 4, 0, 'ninguno'),
	(1741, 1209, 21, '2022-02-07', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1742, 1209, 21, '2022-02-08', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1743, 1209, 21, '2022-02-09', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1744, 1209, 21, '2022-02-10', '14:00:00', '18:00:00', 4, 0, 'ninguno'),
	(1745, 1209, 21, '2022-02-11', '14:00:00', '18:00:00', 4, 0, 'ninguno');
/*!40000 ALTER TABLE `marcadoingreso` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.pagoproveedores
CREATE TABLE IF NOT EXISTS `pagoproveedores` (
  `IDEGRESO` varchar(9) NOT NULL DEFAULT '',
  `IDPEDIDOREPP` varchar(8) DEFAULT NULL,
  `IDPROVEEDOR` int DEFAULT NULL,
  `COMPRA` float(8,2) DEFAULT NULL,
  `FECHACOMPRA` date DEFAULT NULL,
  PRIMARY KEY (`IDEGRESO`),
  KEY `FK_CANCELA_EL_PEDIDO_A` (`IDPROVEEDOR`),
  KEY `FK_PEDIDO_VINCULO_DE` (`IDPEDIDOREPP`),
  CONSTRAINT `FK_CANCELA_EL_PEDIDO_A` FOREIGN KEY (`IDPROVEEDOR`) REFERENCES `proveedores` (`IDPROVEEDOR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PEDIDO_VINCULO_DE` FOREIGN KEY (`IDPEDIDOREPP`) REFERENCES `pedidorepuestosprov` (`IDPEDIDOREPP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.pagoproveedores: ~0 rows (aproximadamente)
DELETE FROM `pagoproveedores`;
/*!40000 ALTER TABLE `pagoproveedores` DISABLE KEYS */;
INSERT INTO `pagoproveedores` (`IDEGRESO`, `IDPEDIDOREPP`, `IDPROVEEDOR`, `COMPRA`, `FECHACOMPRA`) VALUES
	('CJ0001', 'R001', 6900, 20.00, '2021-01-20'),
	('CJ0002', 'R002', 6901, 15.00, '2021-01-20'),
	('CJ0003', 'R003', 6902, 25.00, '2021-01-20'),
	('CJ0004', 'R004', 6903, 35.00, '2021-10-20'),
	('CJ0005', 'R005', 6904, 45.00, '2021-10-20'),
	('CJ0006', 'R006', 6905, 58.00, '2021-10-20'),
	('CJ0007', 'R007', 6900, 12.00, '2021-10-20'),
	('CJ0008', 'R008', 6901, 65.00, '2021-12-15'),
	('CJ0009', 'R009', 6902, 89.00, '2021-12-15'),
	('CJ0010', 'R010', 6903, 120.00, '2021-12-15'),
	('CJ0011', 'R011', 6904, 25.00, '2022-01-20'),
	('CJ0012', 'R012', 6905, 32.00, '2022-01-20'),
	('CJ0013', 'R013', 6900, 65.00, '2022-01-20'),
	('CJ0014', 'R014', 6901, 89.00, '2022-01-20'),
	('CJ0015', 'R015', 6902, 74.00, '2022-01-20'),
	('CJ0016', 'R016', 6903, 120.00, '2022-01-20'),
	('CJ0017', 'R017', 6904, 12.00, '2022-02-25'),
	('CJ0018', 'R018', 6905, 25.00, '2022-02-25'),
	('CJ0019', 'R019', 6900, 23.00, '2022-02-25'),
	('CJ0020', 'R020', 6901, 56.00, '2022-02-25'),
	('CJ0021', 'R021', 6902, 69.00, '2022-02-25'),
	('CJ0022', 'R022', 6903, 36.00, '2022-03-10'),
	('CJ0023', 'R023', 6904, 45.00, '2022-03-10'),
	('CJ0024', 'R024', 6905, 78.00, '2022-03-10');
/*!40000 ALTER TABLE `pagoproveedores` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.pedidoequipos
CREATE TABLE IF NOT EXISTS `pedidoequipos` (
  `ID_PEDEQUIPO` char(10) NOT NULL,
  `IDTRABAJO` int DEFAULT NULL,
  `IDEQUIPO` int DEFAULT NULL,
  `FECHA_PEDEQ` date DEFAULT NULL,
  `FECHA_DEVEQ` date DEFAULT NULL,
  PRIMARY KEY (`ID_PEDEQUIPO`),
  KEY `FK_SE_USARA` (`IDEQUIPO`),
  KEY `FK_SOLICITA` (`IDTRABAJO`),
  CONSTRAINT `FK_SE_USARA` FOREIGN KEY (`IDEQUIPO`) REFERENCES `almacenequipos` (`IDEQUIPO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SOLICITA` FOREIGN KEY (`IDTRABAJO`) REFERENCES `trabajo` (`IDTRABAJO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.pedidoequipos: ~24 rows (aproximadamente)
DELETE FROM `pedidoequipos`;
/*!40000 ALTER TABLE `pedidoequipos` DISABLE KEYS */;
INSERT INTO `pedidoequipos` (`ID_PEDEQUIPO`, `IDTRABAJO`, `IDEQUIPO`, `FECHA_PEDEQ`, `FECHA_DEVEQ`) VALUES
	('PE001', 7001, 8500, '2020-10-13', '2020-10-16'),
	('PE002', 7002, 8501, '2021-01-26', '2021-01-31'),
	('PE003', 7003, 8502, '2020-03-04', '2020-03-15'),
	('PE004', 7004, 8503, '2021-08-15', '2021-08-31'),
	('PE005', 7005, 8504, '2021-09-22', '2021-09-25'),
	('PE006', 7006, 8505, '2019-05-13', '2019-05-18'),
	('PE007', 7007, 8506, '2021-10-14', '2021-10-18'),
	('PE008', 7008, 8507, '2020-02-11', '2020-02-16'),
	('PE009', 7009, 8500, '2021-02-17', '2021-02-22'),
	('PE010', 7010, 8501, '2020-06-15', '2020-06-18'),
	('PE011', 7011, 8502, '2020-12-26', '2020-12-31'),
	('PE012', 7012, 8503, '2019-12-05', '2019-12-16'),
	('PE013', 7013, 8504, '2021-04-30', '2021-05-05'),
	('PE014', 7014, 8505, '2020-01-18', '2020-01-20'),
	('PE015', 7015, 8506, '2021-07-05', '2021-07-09'),
	('PE016', 7016, 8507, '2021-05-25', '2021-06-10'),
	('PE017', 7017, 8504, '2021-07-02', '2021-07-31'),
	('PE018', 7018, 8505, '2020-05-25', '2020-05-31'),
	('PE019', 7019, 8506, '2020-06-28', '2020-07-05'),
	('PE020', 7020, 8507, '2021-07-17', '2021-07-31'),
	('PE021', 7021, 8500, '2020-08-28', '2020-08-31'),
	('PE022', 7022, 8501, '2019-12-24', '2020-01-05'),
	('PE023', 7023, 8502, '2020-11-01', '2020-12-05'),
	('PE024', 7024, 8505, '2021-03-13', '2021-04-05');
/*!40000 ALTER TABLE `pedidoequipos` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.pedidoherrmen
CREATE TABLE IF NOT EXISTS `pedidoherrmen` (
  `CODPEDHM` int NOT NULL,
  `CODHERRA` int DEFAULT NULL,
  `IDTRABAJO` int DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `CANTHERRSOLICITADAS` int DEFAULT NULL,
  PRIMARY KEY (`CODPEDHM`),
  KEY `FK_ATIENDE_SI_LO_TIENE` (`CODHERRA`),
  KEY `FK_SOLICITA_LO_NECESARIO` (`IDTRABAJO`),
  CONSTRAINT `FK_ATIENDE_SI_LO_TIENE` FOREIGN KEY (`CODHERRA`) REFERENCES `herramientasmenores` (`CODHERRA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SOLICITA_LO_NECESARIO` FOREIGN KEY (`IDTRABAJO`) REFERENCES `trabajo` (`IDTRABAJO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.pedidoherrmen: ~24 rows (aproximadamente)
DELETE FROM `pedidoherrmen`;
/*!40000 ALTER TABLE `pedidoherrmen` DISABLE KEYS */;
INSERT INTO `pedidoherrmen` (`CODPEDHM`, `CODHERRA`, `IDTRABAJO`, `FECHA`, `CANTHERRSOLICITADAS`) VALUES
	(800, 8000, 7001, '2020-10-13', 2),
	(801, 8001, 7002, '2021-01-26', 1),
	(802, 8002, 7003, '2020-03-04', 2),
	(803, 8003, 7004, '2021-08-15', 3),
	(804, 8004, 7005, '2021-09-22', 2),
	(805, 8005, 7006, '2019-05-13', 1),
	(806, 8006, 7007, '2021-10-14', 2),
	(807, 8007, 7008, '2020-02-11', 5),
	(808, 8008, 7009, '2021-02-17', 2),
	(809, 8009, 7010, '2020-06-15', 3),
	(810, 8010, 7011, '2020-12-26', 1),
	(811, 8011, 7012, '2019-12-05', 2),
	(812, 8012, 7013, '2021-04-30', 2),
	(813, 8013, 7014, '2020-01-18', 5),
	(814, 8014, 7015, '2021-07-05', 2),
	(815, 8004, 7016, '2021-05-25', 1),
	(816, 8005, 7017, '2021-07-02', 4),
	(817, 8006, 7018, '2020-05-25', 2),
	(818, 8007, 7019, '2020-06-28', 3),
	(819, 8008, 7020, '2021-07-17', 1),
	(820, 8001, 7021, '2020-08-28', 2),
	(821, 8002, 7022, '2019-12-24', 2),
	(822, 8003, 7023, '2020-11-01', 3),
	(823, 8012, 7024, '2021-03-13', 2);
/*!40000 ALTER TABLE `pedidoherrmen` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.pedidorepuestos
CREATE TABLE IF NOT EXISTS `pedidorepuestos` (
  `IDPEDREP` int NOT NULL DEFAULT '0',
  `ID_REP` int DEFAULT NULL,
  `IDTRABAJO` int DEFAULT NULL,
  `FECHASALIDAREP` date DEFAULT NULL,
  `FECHAINGREP` date DEFAULT NULL,
  PRIMARY KEY (`IDPEDREP`),
  KEY `FK_ENCUENTRA_LO_NECESARIO` (`ID_REP`),
  KEY `FK_PRECISA_UN` (`IDTRABAJO`),
  CONSTRAINT `FK_ENCUENTRA_LO_NECESARIO` FOREIGN KEY (`ID_REP`) REFERENCES `almacenrepuestos` (`ID_REP`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRECISA_UN` FOREIGN KEY (`IDTRABAJO`) REFERENCES `trabajo` (`IDTRABAJO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.pedidorepuestos: ~24 rows (aproximadamente)
DELETE FROM `pedidorepuestos`;
/*!40000 ALTER TABLE `pedidorepuestos` DISABLE KEYS */;
INSERT INTO `pedidorepuestos` (`IDPEDREP`, `ID_REP`, `IDTRABAJO`, `FECHASALIDAREP`, `FECHAINGREP`) VALUES
	(9000, 300, 7001, '2020-10-13', '2020-10-16'),
	(9001, 301, 7002, '2021-01-26', '2021-01-31'),
	(9002, 302, 7003, '2020-03-04', '2020-03-15'),
	(9003, 303, 7004, '2021-08-15', '2021-08-31'),
	(9004, 304, 7005, '2021-09-22', '2021-09-25'),
	(9005, 305, 7006, '2019-05-13', '2019-05-18'),
	(9006, 306, 7007, '2021-10-14', '2021-10-18'),
	(9007, 307, 7008, '2020-02-11', '2020-02-16'),
	(9008, 308, 7009, '2021-02-17', '2021-02-22'),
	(9009, 309, 7010, '2020-06-15', '2020-06-18'),
	(9010, 310, 7011, '2020-12-26', '2020-12-31'),
	(9011, 311, 7012, '2019-12-05', '2019-12-16'),
	(9012, 312, 7013, '2021-04-30', '2021-05-05'),
	(9013, 313, 7014, '2020-01-18', '2020-01-20'),
	(9014, 314, 7015, '2021-07-05', '2021-07-09'),
	(9015, 315, 7016, '2021-05-25', '2021-06-10'),
	(9016, 316, 7017, '2021-07-02', '2021-07-31'),
	(9017, 317, 7018, '2020-05-25', '2020-05-31'),
	(9018, 318, 7019, '2020-06-28', '2020-07-05'),
	(9019, 319, 7020, '2021-07-17', '2021-07-31'),
	(9020, 320, 7021, '2020-08-28', '2020-08-31'),
	(9021, 321, 7022, '2019-12-24', '2020-01-05'),
	(9022, 322, 7023, '2020-11-01', '2020-12-05'),
	(9023, 323, 7024, '2021-03-13', '2021-04-05');
/*!40000 ALTER TABLE `pedidorepuestos` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.pedidorepuestosprov
CREATE TABLE IF NOT EXISTS `pedidorepuestosprov` (
  `IDPEDIDOREPP` varchar(8) NOT NULL DEFAULT '',
  `ID_REP` int DEFAULT NULL,
  `FECHAPEDIDOREP` date DEFAULT NULL,
  `CANTIDADHERRM` int DEFAULT NULL,
  PRIMARY KEY (`IDPEDIDOREPP`),
  KEY `FK_PRECISA` (`ID_REP`),
  CONSTRAINT `FK_PRECISA` FOREIGN KEY (`ID_REP`) REFERENCES `almacenrepuestos` (`ID_REP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.pedidorepuestosprov: ~0 rows (aproximadamente)
DELETE FROM `pedidorepuestosprov`;
/*!40000 ALTER TABLE `pedidorepuestosprov` DISABLE KEYS */;
INSERT INTO `pedidorepuestosprov` (`IDPEDIDOREPP`, `ID_REP`, `FECHAPEDIDOREP`, `CANTIDADHERRM`) VALUES
	('R001', 300, '2021-01-20', 1),
	('R002', 301, '2021-01-20', 2),
	('R003', 302, '2021-01-20', 1),
	('R004', 306, '2021-10-20', 1),
	('R005', 305, '2021-10-20', 2),
	('R006', 304, '2021-10-20', 1),
	('R007', 316, '2021-10-20', 2),
	('R008', 314, '2021-12-15', 3),
	('R009', 315, '2021-12-15', 2),
	('R010', 322, '2021-12-15', 1),
	('R011', 300, '2022-01-20', 2),
	('R012', 301, '2022-01-20', 1),
	('R013', 324, '2022-01-20', 2),
	('R014', 325, '2022-01-20', 1),
	('R015', 306, '2022-01-20', 2),
	('R016', 305, '2022-01-20', 1),
	('R017', 311, '2022-02-25', 2),
	('R018', 310, '2022-02-25', 1),
	('R019', 312, '2022-02-25', 5),
	('R020', 317, '2022-02-25', 1),
	('R021', 319, '2022-02-25', 2),
	('R022', 320, '2022-03-10', 2),
	('R023', 304, '2022-03-10', 6),
	('R024', 300, '2022-03-10', 5);
/*!40000 ALTER TABLE `pedidorepuestosprov` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.personal
CREATE TABLE IF NOT EXISTS `personal` (
  `CODPERSONAL` int NOT NULL,
  `NOMBREEMP` varchar(75) DEFAULT NULL,
  `APELLIDOEMP` varchar(98) DEFAULT NULL,
  `FECHA_NAC_PER` date DEFAULT NULL,
  `CEDULAEMP` int DEFAULT NULL,
  `SEXOPERS` varchar(15) DEFAULT NULL,
  `CARGOEMP` varchar(78) DEFAULT NULL,
  `SUELDO` float(8,2) DEFAULT NULL,
  `FECHAING` date DEFAULT NULL,
  `FECHARET` date DEFAULT NULL,
  `DIRECCIONEMP` varchar(150) DEFAULT NULL,
  `EMAILEMP` varchar(154) DEFAULT NULL,
  `OBSEMP` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`CODPERSONAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.personal: ~19 rows (aproximadamente)
DELETE FROM `personal`;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` (`CODPERSONAL`, `NOMBREEMP`, `APELLIDOEMP`, `FECHA_NAC_PER`, `CEDULAEMP`, `SEXOPERS`, `CARGOEMP`, `SUELDO`, `FECHAING`, `FECHARET`, `DIRECCIONEMP`, `EMAILEMP`, `OBSEMP`) VALUES
	(1200, 'jorge', 'losa', '1975-10-10', 777458, 'MAS', 'gerente', 12000.00, '1980-10-21', NULL, 'dorbigni 45', 'jorge@tre.cc', 'socio'),
	(1201, 'sonia', 'goycochea', '2000-05-31', 555889, 'FEM', 'recepcionista', 2000.00, '2019-05-20', NULL, 'solar 125', 'song@go.com', 'ninguno'),
	(1202, 'Felipe', 'gomez', '1999-08-30', 225586, 'MAS', 'mecanico', 3500.00, '2020-12-15', NULL, 'blanco galindo 58', '@GMAIL.COM', 'ninguno'),
	(1203, 'jhery', 'lazarte', '1980-10-15', 558266, 'MAS', 'chapero', 2800.00, '2019-05-20', NULL, 'lanza 58', 'jlazarte@GMAIL.COM', 'ninguno'),
	(1204, 'david', 'flores', '1999-12-25', 668955, 'MAS', 'pintor', 2400.00, '2020-12-15', NULL, 'tupuraya 258', 'dflores@GMAIL.COM', 'ninguno'),
	(1205, 'sergio', 'lazao', '2000-11-10', 251454, 'MAS', 'auxiliar', 1800.00, '2020-12-15', NULL, 'aroma 54', 'sglz@GMAIL.COM', 'ninguno'),
	(1206, 'gary', 'gomez', '1985-05-21', 258996, 'MAS', 'auxiliar', 1750.00, '2020-12-15', NULL, 'america 587', 'ggomez@GMAIL.COM', 'ninguno'),
	(1207, 'donato', 'espinoza', '2001-01-15', 998899, 'MAS', 'auxiliar', 1850.00, '2019-05-20', NULL, 'tadeo ahenque 25', 'despino@GMAIL.COM', 'ninguno'),
	(1208, 'jhamil', 'revollo', '2005-05-30', 665599, 'MAS', 'mecanico', 2850.00, '2020-12-15', NULL, 'barbit 89', 'jrevollo@GMAIL.COM', 'ninguno'),
	(1209, 'marcelo', 'meruvia', '1998-06-25', 225558, 'MAS', 'auxiliar', 1750.00, '2020-12-15', NULL, 'quilmes 369', 'mmeruvia@GMAIL.COM', 'ninguno'),
	(1210, 'alexis', 'cruz', '1980-06-30', 99887, 'MAS', 'pintor', 1800.00, '2020-12-15', NULL, 'papa 5to 58', 'acruz@GMAIL.COM', 'ninguno'),
	(1211, 'jorge', 'chavez', '1998-04-15', 33226, 'MAS', 'auxiliar', 2400.00, '2020-12-15', NULL, 'claveles 587', 'jsarat@GMAIL.COM', 'ninguno'),
	(1212, 'junior', 'santa cruz', '1997-08-18', 11225, 'MAS', 'mecanico', 3250.00, '2020-12-15', NULL, 'rosas 58', 'jscz@GMAIL.COM', 'ninguno'),
	(1213, 'gonzalo', 'jimenez', '2001-10-15', 998702, 'MAS', 'auxiliar', 1750.00, '2020-12-15', NULL, 'hamiraya 258', 'gjime@GMAIL.COM', 'ninguno'),
	(1214, 'luis', 'la puerta', '2000-12-01', 1474405, 'MAS', 'chapero', 2000.00, '2019-05-20', NULL, 'tumusla 68', 'lpuerta@GMAIL.COM', 'ninguno'),
	(1215, 'jhony', 'costa', '1999-07-31', 3321001, 'MAS', 'auxiliar', 1540.00, '2020-12-15', NULL, 'madrid 89', 'jcosta@GMAIL.COM', 'ninguno'),
	(1216, 'daniel', 'de maria', '1978-08-15', 33221, 'MAS', 'mecanico', 3580.00, '2020-12-15', NULL, 'chiriguano 547', 'damar@GMAIL.COM', 'ninguno'),
	(1217, 'joel', 'montaño', '2000-05-21', 99865, 'MAS', 'mecanico', 4000.00, '2019-05-20', NULL, 'claravich 369', 'jmont@GMAIL.COM', 'ninguno'),
	(1218, 'david', 'flores', '1999-12-25', 668955, 'MAS', 'pintor', 2400.00, '2020-12-15', NULL, 'blanco galindo 897', 'dflores@GMAIL.COM', 'ninguno'),
	(1219, 'maria', 'gongora', '1989-07-15', 55898, 'FEM', 'cajera', 2400.00, '1989-08-25', NULL, 'los jazmines 258', 'camicita@gmail.com', 'socia');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `IDPROVEEDOR` int NOT NULL,
  `RAZONSOCIAL` varchar(125) DEFAULT NULL,
  `DIRECCIONPROV` varchar(124) DEFAULT NULL,
  `EMAILPROV` varchar(87) DEFAULT NULL,
  PRIMARY KEY (`IDPROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.proveedores: ~6 rows (aproximadamente)
DELETE FROM `proveedores`;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` (`IDPROVEEDOR`, `RAZONSOCIAL`, `DIRECCIONPROV`, `EMAILPROV`) VALUES
	(6900, 'VITOS SHOP', 'LAS LOMAS 23', 'VITOS78@YAHOO.COM'),
	(6901, 'GEORGE REPAIR', 'REPUBLICA 234', 'COCOQUITO@OUTLOOK.COM'),
	(6902, 'NISMO INT', 'TUMUSLA 234', 'NISMO.CB@OUTLOOK.COM'),
	(6903, 'GUADALUPE REPUESTOS', 'SAN MARTIN 58', 'SMARTIN56@OUTLOOK.COM'),
	(6904, 'PEDRO AJUCHO', 'LANZA 369', 'PAJUACHO@OUTLOOK.COM'),
	(6905, 'NICO SHOP CAR', 'ECUADOR 2344', 'NICO.CBB@OUTLOOK.COM');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.recepcion
CREATE TABLE IF NOT EXISTS `recepcion` (
  `IDRECEP` int NOT NULL,
  `CODPERSONAL` int DEFAULT NULL,
  `IDCLIENTE` int DEFAULT NULL,
  `OBSREP` varchar(125) DEFAULT NULL,
  `FECHA_REC` date DEFAULT NULL,
  PRIMARY KEY (`IDRECEP`),
  KEY `FK_ES_ATENDIDO_EN` (`IDCLIENTE`),
  KEY `FK_ES_PARTE_DE` (`CODPERSONAL`),
  CONSTRAINT `FK_ES_ATENDIDO_EN` FOREIGN KEY (`IDCLIENTE`) REFERENCES `cliente` (`IDCLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ES_PARTE_DE` FOREIGN KEY (`CODPERSONAL`) REFERENCES `personal` (`CODPERSONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.recepcion: ~21 rows (aproximadamente)
DELETE FROM `recepcion`;
/*!40000 ALTER TABLE `recepcion` DISABLE KEYS */;
INSERT INTO `recepcion` (`IDRECEP`, `CODPERSONAL`, `IDCLIENTE`, `OBSREP`, `FECHA_REC`) VALUES
	(5500, 1201, 100, 'ninguna', '2019-05-15'),
	(5501, 1201, 101, 'ninguna', '2019-05-18'),
	(5502, 1201, 114, 'ninguna', '2019-07-21'),
	(5503, 1201, 102, 'ninguna', '2020-09-20'),
	(5504, 1201, 103, 'ninguna', '2020-10-05'),
	(5505, 1201, 104, 'ninguna', '2020-11-04'),
	(5506, 1201, 105, 'ninguna', '2020-11-12'),
	(5507, 1201, 106, 'ninguna', '2020-12-20'),
	(5508, 1201, 107, 'ninguna', '2020-12-22'),
	(5509, 1201, 108, 'ninguna', '2021-05-15'),
	(5510, 1201, 109, 'ninguna', '2021-05-16'),
	(5511, 1201, 110, 'ninguna', '2021-05-18'),
	(5512, 1201, 111, 'ninguna', '2021-06-30'),
	(5513, 1201, 112, 'ninguna', '2021-07-31'),
	(5514, 1201, 113, 'ninguna', '2018-04-14');
/*!40000 ALTER TABLE `recepcion` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.reparacion
CREATE TABLE IF NOT EXISTS `reparacion` (
  `IDTIPOREPARACION` int NOT NULL,
  `IDCOTIZ` int DEFAULT NULL,
  `idTipoRep` varchar(10) NOT NULL DEFAULT '',
  `OBSREPARAC` varchar(123) DEFAULT NULL,
  PRIMARY KEY (`IDTIPOREPARACION`),
  KEY `FK_RELATIONSHIP_33` (`IDCOTIZ`),
  KEY `FK_esPArteDeALgomasG_09` (`idTipoRep`),
  CONSTRAINT `FK_esPArteDeALgomasG_09` FOREIGN KEY (`idTipoRep`) REFERENCES `tiporep` (`idTipoRep`),
  CONSTRAINT `FK_RELATIONSHIP_33` FOREIGN KEY (`IDCOTIZ`) REFERENCES `cotizacion` (`IDCOTIZ`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.reparacion: ~45 rows (aproximadamente)
DELETE FROM `reparacion`;
/*!40000 ALTER TABLE `reparacion` DISABLE KEYS */;
INSERT INTO `reparacion` (`IDTIPOREPARACION`, `IDCOTIZ`, `idTipoRep`, `OBSREPARAC`) VALUES
	(5001, 6000, 'TR03', 'de 1 a 2 electrodos'),
	(5002, 6003, 'TR03', 'de 3 a 6 electrodos'),
	(5003, 6006, 'TR03', 'de 7 a 12 electrodos'),
	(5004, 6007, 'TR01', 'anillas - 1500 cc cilindrada'),
	(5005, 6008, 'TR01', 'anillas - 2500cc cilindrada'),
	(5006, 6010, 'TR01', 'limpieza de bujes'),
	(5007, 6011, 'TR01', 'medir compresion'),
	(5008, 6013, 'TR06', 'arreglo parcial'),
	(5009, 6014, 'TR06', 'arreglo parcial'),
	(5010, 6015, 'TR06', 'neumaticos'),
	(5011, 6016, 'TR02', 'puerta trasera'),
	(5012, 6018, 'TR07', 'Total'),
	(5013, 6019, 'TR06', 'total'),
	(5014, 6020, 'TR02', 'solo puerta'),
	(5015, 6021, 'TR09', 'cambio resortes en frenos'),
	(5016, 6022, 'TR08', 'aceite 2040'),
	(5017, 6025, 'TR00', 'Muelles de acero'),
	(5018, 6027, 'TR04', 'puerta trasera'),
	(5019, 6030, 'TR03', 'parachoeque'),
	(5020, 6036, 'TR02', 'baulera'),
	(5021, 6037, 'TR00', 'engranes motor'),
	(5022, 6040, 'TR06', 'cambio de arandelas cajuela trasera'),
	(5023, 6043, 'TR05', 'sistema de sonido'),
	(5024, 6045, 'TR04', 'capot delantero'),
	(5025, 6009, 'TR02', 'choque delantero'),
	(5026, 6012, 'TR02', 'choque baulera'),
	(5027, 6017, 'TR03', 'muelles'),
	(5028, 6023, 'TR04', 'puertas'),
	(5029, 6024, 'TR05', 'sistema de sonido'),
	(5030, 6026, 'TR06', 'frenos de disco'),
	(5031, 6028, 'TR08', 'cambio de aceite'),
	(5032, 6029, 'TR09', 'cambio de llantas'),
	(5033, 6031, 'TR03', 'parte de chaperio'),
	(5034, 6032, 'TR02', 'lado derecho compostura'),
	(5035, 6033, 'TR01', 'arreglo de embriague'),
	(5036, 6034, 'TR02', 'maletero y delantero'),
	(5037, 6035, 'TR04', 'todo el carro'),
	(5038, 6038, 'TR04', 'solo baulera'),
	(5039, 6041, 'TR03', 'tren delantero'),
	(5040, 6042, 'TR01', 'cambbio de anillas'),
	(5041, 6044, 'TR00', 'tren delantero'),
	(5042, 6046, 'TR09', 'arreglo de caja automatica'),
	(5043, 6047, 'TR08', 'cambio de aceite'),
	(5044, 6048, 'TR05', 'arreglo arranque'),
	(5045, 6049, 'TR06', 'verificacion de frenos y radiador');
/*!40000 ALTER TABLE `reparacion` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.sucursales
CREATE TABLE IF NOT EXISTS `sucursales` (
  `IDSUCURSAL` int NOT NULL,
  `IDPROVEEDOR` int DEFAULT NULL,
  `CONTACTO` varchar(125) DEFAULT NULL,
  `DIRSUCURSAL` varchar(200) DEFAULT NULL,
  `TELEFSUCURSAL` int DEFAULT NULL,
  PRIMARY KEY (`IDSUCURSAL`),
  KEY `FK_TAMBIEN_ESTAN_SUS` (`IDPROVEEDOR`),
  CONSTRAINT `FK_TAMBIEN_ESTAN_SUS` FOREIGN KEY (`IDPROVEEDOR`) REFERENCES `proveedores` (`IDPROVEEDOR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.sucursales: ~6 rows (aproximadamente)
DELETE FROM `sucursales`;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` (`IDSUCURSAL`, `IDPROVEEDOR`, `CONTACTO`, `DIRSUCURSAL`, `TELEFSUCURSAL`) VALUES
	(690, 6900, 'freddy guaman', 'los cedros 15', 7154896),
	(691, 6901, 'ines tapia', 'uruguau 897', 71498562),
	(692, 6902, 'federico tola', 'pando 78', 70589569),
	(693, 6903, 'cesar cuadros', 'juan de la rosa 23', 56896325),
	(694, 6904, 'gualberto drid', 'losano 23', 60265478),
	(695, 6905, 'fransis nicole', 'jordan 8800', 62645678);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.sueldo
CREATE TABLE IF NOT EXISTS `sueldo` (
  `IDSUELDO` varchar(5) NOT NULL DEFAULT '',
  `IDPERSONAL` int DEFAULT NULL,
  `BONOSGANADOS` decimal(8,2) DEFAULT NULL,
  `DESCUENTOSMES` decimal(8,2) DEFAULT NULL,
  `TTALGANADO` decimal(8,2) GENERATED ALWAYS AS ((`BONOSGANADOS` + `DESCUENTOSMES`)) VIRTUAL,
  `messueldo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDSUELDO`),
  KEY `FK_HORAS_TRAB` (`IDPERSONAL`) USING BTREE,
  CONSTRAINT `FK_PERSONALPLLA_01` FOREIGN KEY (`IDPERSONAL`) REFERENCES `personal` (`CODPERSONAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.sueldo: ~1 rows (aproximadamente)
DELETE FROM `sueldo`;
/*!40000 ALTER TABLE `sueldo` DISABLE KEYS */;
INSERT INTO `sueldo` (`IDSUELDO`, `IDPERSONAL`, `BONOSGANADOS`, `DESCUENTOSMES`, `messueldo`) VALUES
	('10000', 1201, 120.00, 0.00, 'enero'),
	('10001', 1202, 120.00, 0.00, 'enero'),
	('10002', 1203, 120.00, 0.00, 'enero'),
	('10003', 1204, 120.00, -45.00, 'enero'),
	('10004', 1205, 120.00, 0.00, 'enero'),
	('10005', 1206, 120.00, 0.00, 'enero'),
	('10006', 1207, 120.00, -8.00, 'enero'),
	('10007', 1208, 120.00, -15.00, 'enero'),
	('10008', 1209, 120.00, 0.00, 'enero'),
	('10009', 1210, 120.00, -12.00, 'enero'),
	('10010', 1211, 120.00, 0.00, 'enero'),
	('10011', 1212, 120.00, 0.00, 'enero'),
	('10012', 1213, 120.00, 0.00, 'enero'),
	('10013', 1214, 120.00, -20.00, 'enero'),
	('10014', 1215, 120.00, 0.00, 'enero'),
	('10015', 1216, 120.00, 0.00, 'enero'),
	('10016', 1217, 120.00, -25.00, 'enero'),
	('10017', 1218, 120.00, 0.00, 'enero'),
	('10018', 1219, 120.00, -20.00, 'enero');
/*!40000 ALTER TABLE `sueldo` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.telefcliente
CREATE TABLE IF NOT EXISTS `telefcliente` (
  `CEDULACLIENTE` int DEFAULT NULL,
  `TELEFCLIENTE` int DEFAULT NULL,
  KEY `FK_CUENTA_CON` (`CEDULACLIENTE`),
  CONSTRAINT `FK_CUENTA_CON` FOREIGN KEY (`CEDULACLIENTE`) REFERENCES `titularauto` (`CEDULACLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.telefcliente: ~13 rows (aproximadamente)
DELETE FROM `telefcliente`;
/*!40000 ALTER TABLE `telefcliente` DISABLE KEYS */;
INSERT INTO `telefcliente` (`CEDULACLIENTE`, `TELEFCLIENTE`) VALUES
	(4411467, 4245535),
	(4589167, 72274756),
	(55897, 71760258),
	(896658, 72169854),
	(777239, 77463945),
	(482869, 258966),
	(99958, 7254789),
	(98985, 70359548),
	(99965, 6589874),
	(9878589, 61456981),
	(55869, 60523564),
	(44487, 4240647),
	(251445, 4243125);
/*!40000 ALTER TABLE `telefcliente` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.telefempleados
CREATE TABLE IF NOT EXISTS `telefempleados` (
  `CODPERSONAL` int DEFAULT NULL,
  `NUMTELEFEMP` int DEFAULT NULL,
  KEY `FK_ES_DE` (`CODPERSONAL`),
  CONSTRAINT `FK_ES_DE` FOREIGN KEY (`CODPERSONAL`) REFERENCES `personal` (`CODPERSONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.telefempleados: ~18 rows (aproximadamente)
DELETE FROM `telefempleados`;
/*!40000 ALTER TABLE `telefempleados` DISABLE KEYS */;
INSERT INTO `telefempleados` (`CODPERSONAL`, `NUMTELEFEMP`) VALUES
	(1201, 71487881),
	(1202, 425587),
	(1203, 7148321),
	(1204, 7584521),
	(1205, 6589215),
	(1206, 6051247),
	(1207, 4245589),
	(1208, 9636521),
	(1209, 7254879),
	(1210, 7936935),
	(1211, 6986598),
	(1212, 6093265),
	(1213, 4662598),
	(1214, 4587652),
	(1215, 7045698),
	(1216, 7086598),
	(1217, 6091235),
	(1218, 4521589);
/*!40000 ALTER TABLE `telefempleados` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.telefproveedor
CREATE TABLE IF NOT EXISTS `telefproveedor` (
  `IDPROVEEDOR` int DEFAULT NULL,
  `TELEFONO` char(10) DEFAULT NULL,
  KEY `FK_TIENE_CONTACTO` (`IDPROVEEDOR`),
  CONSTRAINT `FK_TIENE_CONTACTO` FOREIGN KEY (`IDPROVEEDOR`) REFERENCES `proveedores` (`IDPROVEEDOR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.telefproveedor: ~6 rows (aproximadamente)
DELETE FROM `telefproveedor`;
/*!40000 ALTER TABLE `telefproveedor` DISABLE KEYS */;
INSERT INTO `telefproveedor` (`IDPROVEEDOR`, `TELEFONO`) VALUES
	(6900, '4255865'),
	(6901, '4577899'),
	(6902, '6589545'),
	(6903, '1254899'),
	(6904, '6665989'),
	(6905, '2255869');
/*!40000 ALTER TABLE `telefproveedor` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.tipoequipos
CREATE TABLE IF NOT EXISTS `tipoequipos` (
  `IDTIPOEQ` int NOT NULL,
  `TIPOEQUIPO` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`IDTIPOEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.tipoequipos: ~8 rows (aproximadamente)
DELETE FROM `tipoequipos`;
/*!40000 ALTER TABLE `tipoequipos` DISABLE KEYS */;
INSERT INTO `tipoequipos` (`IDTIPOEQ`, `TIPOEQUIPO`) VALUES
	(450, 'ELECTRONICO'),
	(451, 'ELECTRICO'),
	(452, 'CHAPERIA'),
	(453, 'PINTURA'),
	(454, 'NEUMATICO'),
	(455, 'HIDRAULICO'),
	(456, 'PRENSA'),
	(457, 'OTROS');
/*!40000 ALTER TABLE `tipoequipos` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.tipoherramientas
CREATE TABLE IF NOT EXISTS `tipoherramientas` (
  `IDTIPOHERR` int NOT NULL,
  `TIPOHERRAM` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`IDTIPOHERR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.tipoherramientas: ~6 rows (aproximadamente)
DELETE FROM `tipoherramientas`;
/*!40000 ALTER TABLE `tipoherramientas` DISABLE KEYS */;
INSERT INTO `tipoherramientas` (`IDTIPOHERR`, `TIPOHERRAM`) VALUES
	(50, 'MECANICOS'),
	(51, 'ELECTRICO'),
	(52, 'CHAPERIA'),
	(53, 'PINTURA'),
	(54, 'NEUMATICO'),
	(55, 'OTROS');
/*!40000 ALTER TABLE `tipoherramientas` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.tiporep
CREATE TABLE IF NOT EXISTS `tiporep` (
  `idTipoRep` varchar(10) NOT NULL DEFAULT '',
  `reparacion` varchar(122) DEFAULT NULL,
  PRIMARY KEY (`idTipoRep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.tiporep: ~10 rows (aproximadamente)
DELETE FROM `tiporep`;
/*!40000 ALTER TABLE `tiporep` DISABLE KEYS */;
INSERT INTO `tiporep` (`idTipoRep`, `reparacion`) VALUES
	('TR00', 'soldadura'),
	('TR01', 'arreglo motor'),
	('TR02', 'chaperio'),
	('TR03', 'soldadura'),
	('TR04', 'pintura'),
	('TR05', 'electronico - electrico'),
	('TR06', 'mantenimiento preventivo'),
	('TR07', 'mantenimiento correctivo'),
	('TR08', 'cambio lubricantes'),
	('TR09', 'otros trabajos');
/*!40000 ALTER TABLE `tiporep` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.tiporepuestos
CREATE TABLE IF NOT EXISTS `tiporepuestos` (
  `IDTIPREP` int NOT NULL,
  `TIPOREP` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`IDTIPREP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.tiporepuestos: ~12 rows (aproximadamente)
DELETE FROM `tiporepuestos`;
/*!40000 ALTER TABLE `tiporepuestos` DISABLE KEYS */;
INSERT INTO `tiporepuestos` (`IDTIPREP`, `TIPOREP`) VALUES
	(60, 'tornillos'),
	(61, 'niples'),
	(62, 'lubricantes'),
	(63, 'arandelas'),
	(64, 'electrodos'),
	(65, 'diodos'),
	(66, 'mascaras'),
	(67, 'grasa'),
	(68, 'envases metalicos'),
	(69, 'cables electricos'),
	(70, 'baterias'),
	(71, 'otros');
/*!40000 ALTER TABLE `tiporepuestos` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.titularauto
CREATE TABLE IF NOT EXISTS `titularauto` (
  `CEDULACLIENTE` int NOT NULL,
  `NOMBRECLIENTE` varchar(55) DEFAULT NULL,
  `APELLIDOCLIENTE` varchar(55) DEFAULT NULL,
  `DIRECCIONCLIENTE` varchar(98) DEFAULT NULL,
  `NACIONALIDAD` varchar(45) DEFAULT NULL,
  `EMAILCLIENTE` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`CEDULACLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.titularauto: ~13 rows (aproximadamente)
DELETE FROM `titularauto`;
/*!40000 ALTER TABLE `titularauto` DISABLE KEYS */;
INSERT INTO `titularauto` (`CEDULACLIENTE`, `NOMBRECLIENTE`, `APELLIDOCLIENTE`, `DIRECCIONCLIENTE`, `NACIONALIDAD`, `EMAILCLIENTE`) VALUES
	(44487, 'jorge', 'gumucio soldan', 'peru 158', 'peruana', '4587jorge@gmail.com'),
	(55869, 'simon', 'perez diego', 'calama 5889', 'boliviana', 'simon.pe@gmail.com'),
	(55897, 'maria', 'fernandez cosio', 'madrigal 15', 'peruana', 'mafeco@gmail.com'),
	(98985, 'freddy', 'soria', 'santivañez 58', 'boliviana', 'fresor@gmail.com'),
	(99958, 'sonia', 'braga fernandez', 'dorbigni 89', 'peruana', 'sobrafe@gmail.com'),
	(99965, 'anna', 'caceres jordam', '16 de julio 258', 'peruana', 'anna.hu@gmail.com'),
	(251445, 'carlos', 'jaldin mantero', 'las rosas 889', 'boliviana', 'jaldinsaso@gmail.com'),
	(482869, 'juan carlos', 'diaz muñoz', 'colombia 258', 'boliviana', 'jucadimu@gmail.com'),
	(777239, 'roger', 'tapia cespedes', 'jordan 15', 'boliviana', 'rotace@gmail.com'),
	(896658, 'carlos', 'sejas condori', 'las rosas 234', 'colombiano', 'casecon@gmail.com'),
	(4411467, 'jorge', 'ledezma zeballos', 'tumusla 235', 'boliviana', 'jledezma@gmail.com'),
	(4589167, 'cesar', 'lopez caceres', 'heroinas 2585', 'boliviana', 'celoca@gmail.com'),
	(9878589, 'diego', 'perez', 'los cedros 69', 'colombiano', 'dipe@gmail.com');
/*!40000 ALTER TABLE `titularauto` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.trabajo
CREATE TABLE IF NOT EXISTS `trabajo` (
  `IDTRABAJO` int NOT NULL,
  `IDCOTIZ` int DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL,
  `observTrab` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`IDTRABAJO`),
  KEY `FK_PROCEDE_A` (`IDCOTIZ`),
  CONSTRAINT `FK_PROCEDE_A` FOREIGN KEY (`IDCOTIZ`) REFERENCES `cotizacion` (`IDCOTIZ`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.trabajo: ~24 rows (aproximadamente)
DELETE FROM `trabajo`;
/*!40000 ALTER TABLE `trabajo` DISABLE KEYS */;
INSERT INTO `trabajo` (`IDTRABAJO`, `IDCOTIZ`, `FECHA_INICIO`, `FECHA_FIN`, `observTrab`) VALUES
	(7001, 6000, '2020-10-13', '2020-10-16', NULL),
	(7002, 6003, '2021-01-26', '2021-01-31', NULL),
	(7003, 6006, '2020-03-04', '2020-03-15', NULL),
	(7004, 6007, '2021-08-15', '2021-08-31', NULL),
	(7005, 6008, '2021-09-22', '2021-09-25', NULL),
	(7006, 6010, '2019-05-13', '2019-05-18', NULL),
	(7007, 6011, '2021-10-14', '2021-10-18', NULL),
	(7008, 6013, '2020-02-11', '2020-02-16', NULL),
	(7009, 6014, '2021-02-17', '2021-02-22', NULL),
	(7010, 6015, '2020-06-15', '2020-06-18', NULL),
	(7011, 6016, '2020-12-26', '2020-12-31', NULL),
	(7012, 6018, '2019-12-05', '2019-12-16', NULL),
	(7013, 6019, '2021-04-30', '2021-05-05', NULL),
	(7014, 6020, '2020-01-18', '2020-01-20', NULL),
	(7015, 6021, '2021-07-05', '2021-07-09', NULL),
	(7016, 6022, '2021-05-25', '2021-06-10', NULL),
	(7017, 6025, '2021-07-02', '2021-07-31', NULL),
	(7018, 6027, '2020-05-25', '2020-05-31', NULL),
	(7019, 6030, '2020-06-28', '2020-07-05', NULL),
	(7020, 6036, '2021-07-17', '2021-07-31', NULL),
	(7021, 6037, '2020-08-28', '2020-08-31', NULL),
	(7022, 6040, '2019-12-24', '2020-01-05', NULL),
	(7023, 6043, '2020-11-01', '2020-12-05', NULL),
	(7024, 6045, '2021-03-13', '2021-04-05', NULL);
/*!40000 ALTER TABLE `trabajo` ENABLE KEYS */;

-- Volcando estructura para tabla carsystem.turno
CREATE TABLE IF NOT EXISTS `turno` (
  `IDTURNO` int NOT NULL,
  `INICIO_TURNO` time DEFAULT NULL,
  `FIN_TURNO` time DEFAULT NULL,
  `TURNO__DETALLE` varchar(50) DEFAULT NULL,
  `OBS_TURNO` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`IDTURNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla carsystem.turno: ~3 rows (aproximadamente)
DELETE FROM `turno`;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` (`IDTURNO`, `INICIO_TURNO`, `FIN_TURNO`, `TURNO__DETALLE`, `OBS_TURNO`) VALUES
	(20, '08:00:01', '14:00:10', 'MAÑANA', 'LUNES A VIERNES'),
	(21, '14:15:30', '20:30:30', 'TARDE', 'LUNES A VIERNES'),
	(22, '09:10:01', '15:30:00', 'FINDE', 'SABADO Y FERIADO');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
