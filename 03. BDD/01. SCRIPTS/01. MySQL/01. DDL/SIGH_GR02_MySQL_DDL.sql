-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: sigh_gr02
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ficar_cargo`
--

DROP TABLE IF EXISTS `ficar_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficar_cargo` (
  `FICAR_CARGO_IDCARGO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CUENTA_FACTURACION_IDCUENTA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FITAR_TARIF_IDTARIFA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FICAR_CARGO_CARGOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FICAR_CARGO_TIPOORIGEN` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FICAR_CARGO_REFERENCIAORIGEN` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `FICAR_CARGO_CANTIDAD` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `FICAR_CARGO_DESCRIPCIONORIGEN` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `FICAR_CARGO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FICAR_CARGO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FICAR_CARGO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`FICAR_CARGO_IDCARGO`),
  KEY `FK_R104_CARGOS` (`GH_CUENTA_FACTURACION_IDCUENTA`),
  KEY `FK_R106_TARIFAORIGEN` (`FITAR_TARIF_IDTARIFA`),
  CONSTRAINT `FK_R104_CARGOS` FOREIGN KEY (`GH_CUENTA_FACTURACION_IDCUENTA`) REFERENCES `gh_cuenta_facturacion` (`GH_CUENTA_FACTURACION_IDCUENTA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R106_TARIFAORIGEN` FOREIGN KEY (`FITAR_TARIF_IDTARIFA`) REFERENCES `fitar_tarif` (`FITAR_TARIF_IDTARIFA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-001\nServicio o producto realmente prestado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficar_cargo`
--

LOCK TABLES `ficar_cargo` WRITE;
/*!40000 ALTER TABLE `ficar_cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficar_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fifac_factu`
--

DROP TABLE IF EXISTS `fifac_factu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fifac_factu` (
  `FIFAC_FACTU_IDFACTURA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CUENTA_FACTURACION_IDCUENTA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FIFAC_FACTU_NUMERODOCUMENTO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `FIFAC_FACTU_TIPODOCUMENTO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FIFAC_FACTU_EMITIDAEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FIFAC_FACTU_MONEDA` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FIFAC_FACTU_SUBTOTAL` decimal(18,6) DEFAULT NULL COMMENT 'Tipo conceptual: Importe. ',
  `FIFAC_FACTU_DESCUENTO` decimal(18,6) DEFAULT NULL COMMENT 'Tipo conceptual: Importe. ',
  `FIFAC_FACTU_IMPUESTO` decimal(18,6) DEFAULT NULL COMMENT 'Tipo conceptual: Importe. ',
  `FIFAC_FACTU_TOTAL` decimal(18,6) DEFAULT NULL COMMENT 'Tipo conceptual: Importe. ',
  `FIFAC_FACTU_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FIFAC_FACTU_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FIFAC_FACTU_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`FIFAC_FACTU_IDFACTURA`),
  KEY `AK_AK_FACTURA_NUMERODOCUMENTO` (`FIFAC_FACTU_NUMERODOCUMENTO`),
  KEY `FK_R107_DOCUMENTOS` (`GH_CUENTA_FACTURACION_IDCUENTA`),
  CONSTRAINT `FK_R107_DOCUMENTOS` FOREIGN KEY (`GH_CUENTA_FACTURACION_IDCUENTA`) REFERENCES `gh_cuenta_facturacion` (`GH_CUENTA_FACTURACION_IDCUENTA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-002, RF-FAC-003, RF-FAC-006\nDocumento de l';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fifac_factu`
--

LOCK TABLES `fifac_factu` WRITE;
/*!40000 ALTER TABLE `fifac_factu` DISABLE KEYS */;
/*!40000 ALTER TABLE `fifac_factu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fifor_forma`
--

DROP TABLE IF EXISTS `fifor_forma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fifor_forma` (
  `FIFOR_FORMA_IDFORMAPAGO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FIFOR_FORMA_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FIFOR_FORMA_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `FIFOR_FORMA_VIGENTEDESDE` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `FIFOR_FORMA_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `FIFOR_FORMA_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FIFOR_FORMA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FIFOR_FORMA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`FIFOR_FORMA_IDFORMAPAGO`),
  KEY `AK_AK_FORMA_PAGO_CODIGO` (`FIFOR_FORMA_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-004, RF-CAT-001, RF-CAT-002\n\nregistr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fifor_forma`
--

LOCK TABLES `fifor_forma` WRITE;
/*!40000 ALTER TABLE `fifor_forma` DISABLE KEYS */;
/*!40000 ALTER TABLE `fifor_forma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fipag_pago`
--

DROP TABLE IF EXISTS `fipag_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fipag_pago` (
  `FIPAG_PAGO_IDPAGO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FIFAC_FACTU_IDFACTURA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FIFOR_FORMA_IDFORMAPAGO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FIPAG_PAGO_PAGADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FIPAG_PAGO_IMPORTE` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Importe. ',
  `FIPAG_PAGO_REFERENCIA` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `FIPAG_PAGO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FIPAG_PAGO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FIPAG_PAGO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`FIPAG_PAGO_IDPAGO`),
  KEY `FK_R110_PAGOS` (`FIFAC_FACTU_IDFACTURA`),
  KEY `FK_R111_MEDIO` (`FIFOR_FORMA_IDFORMAPAGO`),
  CONSTRAINT `FK_R110_PAGOS` FOREIGN KEY (`FIFAC_FACTU_IDFACTURA`) REFERENCES `fifac_factu` (`FIFAC_FACTU_IDFACTURA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R111_MEDIO` FOREIGN KEY (`FIFOR_FORMA_IDFORMAPAGO`) REFERENCES `fifor_forma` (`FIFOR_FORMA_IDFORMAPAGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-004, RF-FAC-006\nPago de un documento con u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fipag_pago`
--

LOCK TABLES `fipag_pago` WRITE;
/*!40000 ALTER TABLE `fipag_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `fipag_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiser_servic`
--

DROP TABLE IF EXISTS `fiser_servic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiser_servic` (
  `FISER_SERVIC_IDSERVICIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FISER_SERVIC_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FISER_SERVIC_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `FISER_SERVIC_TIPOSERVICIO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FISER_SERVIC_VIGENTEDESDE` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `FISER_SERVIC_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `FISER_SERVIC_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FISER_SERVIC_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FISER_SERVIC_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`FISER_SERVIC_IDSERVICIO`),
  KEY `AK_AK_SERVICIO_CODIGO` (`FISER_SERVIC_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-001, RF-CAT-001, RF-CAT-002\nPrestaci n fac';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiser_servic`
--

LOCK TABLES `fiser_servic` WRITE;
/*!40000 ALTER TABLE `fiser_servic` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiser_servic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fitar_tarif`
--

DROP TABLE IF EXISTS `fitar_tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fitar_tarif` (
  `FITAR_TARIF_IDTARIFA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FISER_SERVIC_IDSERVICIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FITAR_TARIF_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `FITAR_TARIF_VIGENTEDESDE` date NOT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `FITAR_TARIF_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `FITAR_TARIF_PRECIOUNITARIO` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Importe. ',
  `FITAR_TARIF_TASADESCUENTO` decimal(18,6) DEFAULT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `FITAR_TARIF_TASAIMPUESTO` decimal(18,6) DEFAULT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `FITAR_TARIF_MONEDA` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FITAR_TARIF_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `FITAR_TARIF_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `FITAR_TARIF_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`FITAR_TARIF_IDTARIFA`),
  KEY `FK_R105_TARIFAS` (`FISER_SERVIC_IDSERVICIO`),
  CONSTRAINT `FK_R105_TARIFAS` FOREIGN KEY (`FISER_SERVIC_IDSERVICIO`) REFERENCES `fiser_servic` (`FISER_SERVIC_IDSERVICIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-002, RF-CAT-002\nVersi n temporal de tarifa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fitar_tarif`
--

LOCK TABLES `fitar_tarif` WRITE;
/*!40000 ALTER TABLE `fitar_tarif` DISABLE KEYS */;
/*!40000 ALTER TABLE `fitar_tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gepac_pacie`
--

DROP TABLE IF EXISTS `gepac_pacie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gepac_pacie` (
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDENTIFICADORHOSPITALARIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_TIPOIDENTIDAD` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GEPAC_PACIE_TIPODOCUMENTO` varchar(40) DEFAULT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GEPAC_PACIE_NUMERODOCUMENTO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GEPAC_PACIE_NOMBRES` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GEPAC_PACIE_APELLIDOS` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GEPAC_PACIE_FECHANACIMIENTO` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GEPAC_PACIE_SEXOREGISTRADO` varchar(40) DEFAULT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GEPAC_PACIE_DIRECCION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GEPAC_PACIE_ENTIDADCOBERTURA` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GEPAC_PACIE_REFERENCIACOBERTURA` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GEPAC_PACIE_ESTADOREGISTRO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GEPAC_PACIE_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GEPAC_PACIE_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GEPAC_PACIE_IDPACIENTE`),
  KEY `AK_AK_PACIENTE_IDENTIFICADORHOSPITALARIO` (`GEPAC_PACIE_IDENTIFICADORHOSPITALARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-PAC-001, RF-PAC-002, RF-PAC-003, RF-PAC-004, RF-EME-';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gepac_pacie`
--

LOCK TABLES `gepac_pacie` WRITE;
/*!40000 ALTER TABLE `gepac_pacie` DISABLE KEYS */;
/*!40000 ALTER TABLE `gepac_pacie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_ajuste_financiero`
--

DROP TABLE IF EXISTS `gh_ajuste_financiero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_ajuste_financiero` (
  `GH_AJUSTE_FINANCIERO_IDAJUSTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FIFAC_FACTU_IDFACTURA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FIPAG_PAGO_IDPAGO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_AJUSTE_FINANCIERO_TIPOAJUSTE` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_AJUSTE_FINANCIERO_AJUSTADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_AJUSTE_FINANCIERO_IMPORTE` decimal(18,6) DEFAULT NULL COMMENT 'Tipo conceptual: Importe. ',
  `GH_AJUSTE_FINANCIERO_MOTIVO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_AJUSTE_FINANCIERO_REFERENCIAAUTORIZACION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_AJUSTE_FINANCIERO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_AJUSTE_FINANCIERO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_AJUSTE_FINANCIERO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_AJUSTE_FINANCIERO_IDAJUSTE`),
  KEY `FK_R112_DOCUMENTOORIGINAL` (`FIFAC_FACTU_IDFACTURA`),
  KEY `FK_R113_PAGOORIGINAL` (`FIPAG_PAGO_IDPAGO`),
  CONSTRAINT `FK_R112_DOCUMENTOORIGINAL` FOREIGN KEY (`FIFAC_FACTU_IDFACTURA`) REFERENCES `fifac_factu` (`FIFAC_FACTU_IDFACTURA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R113_PAGOORIGINAL` FOREIGN KEY (`FIPAG_PAGO_IDPAGO`) REFERENCES `fipag_pago` (`FIPAG_PAGO_IDPAGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-005, RF-FAC-006\nAnulaci n o devoluci n exp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_ajuste_financiero`
--

LOCK TABLES `gh_ajuste_financiero` WRITE;
/*!40000 ALTER TABLE `gh_ajuste_financiero` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_ajuste_financiero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_alta_medica`
--

DROP TABLE IF EXISTS `gh_alta_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_alta_medica` (
  `GH_ALTA_MEDICA_IDALTAMEDICA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHADM_ADMIS_IDADMISION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_EGRESO_ADMINISTRATIVO_IDEGRESO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ALTA_MEDICA_AUTORIZADAEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_ALTA_MEDICA_INDICACIONESSALIDA` text NOT NULL COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_ALTA_MEDICA_DOCUMENTACIONREQUERIDA` text COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_ALTA_MEDICA_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_ALTA_MEDICA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_ALTA_MEDICA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_ALTA_MEDICA_IDALTAMEDICA`),
  KEY `FK_R049_ALTAS` (`GHADM_ADMIS_IDADMISION`),
  KEY `FK_R050_DOCUMENTAALTA` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R051_AUTORIZAALTA` (`GHPRO_PROFE_IDPROFESIONAL`),
  KEY `FK_R053_HABILITAEGRESO` (`GH_EGRESO_ADMINISTRATIVO_IDEGRESO`),
  CONSTRAINT `FK_R049_ALTAS` FOREIGN KEY (`GHADM_ADMIS_IDADMISION`) REFERENCES `ghadm_admis` (`GHADM_ADMIS_IDADMISION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R050_DOCUMENTAALTA` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R051_AUTORIZAALTA` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R053_HABILITAEGRESO` FOREIGN KEY (`GH_EGRESO_ADMINISTRATIVO_IDEGRESO`) REFERENCES `gh_egreso_administrativo` (`GH_EGRESO_ADMINISTRATIVO_IDEGRESO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-006\nDecisi n cl nica del m dico para admis';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_alta_medica`
--

LOCK TABLES `gh_alta_medica` WRITE;
/*!40000 ALTER TABLE `gh_alta_medica` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_alta_medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_atencion_emergencia`
--

DROP TABLE IF EXISTS `gh_atencion_emergencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_atencion_emergencia` (
  `GH_ATENCION_EMERGENCIA_IDEMERGENCIA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ATENCION_EMERGENCIA_INGRESOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_ATENCION_EMERGENCIA_PROCEDENCIA` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_ATENCION_EMERGENCIA_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_ATENCION_EMERGENCIA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_ATENCION_EMERGENCIA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`),
  KEY `FK_R018_ORIGINAEMERGENCIA` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R031_EMERGENCIAS` (`GEPAC_PACIE_IDPACIENTE`),
  CONSTRAINT `FK_R018_ORIGINAEMERGENCIA` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R031_EMERGENCIAS` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-EME-001, RF-EME-003\nEl paciente puede conserva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_atencion_emergencia`
--

LOCK TABLES `gh_atencion_emergencia` WRITE;
/*!40000 ALTER TABLE `gh_atencion_emergencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_atencion_emergencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_cambio_catalogo`
--

DROP TABLE IF EXISTS `gh_cambio_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_cambio_catalogo` (
  `GH_CAMBIO_CATALOGO_IDCAMBIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_VALOR_CATALOGO_IDVALOR` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CAMBIO_CATALOGO_CAMBIADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CAMBIO_CATALOGO_OPERACION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CAMBIO_CATALOGO_VALORANTERIOR` text COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_CAMBIO_CATALOGO_VALORNUEVO` text COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_CAMBIO_CATALOGO_MOTIVO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CAMBIO_CATALOGO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CAMBIO_CATALOGO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_CAMBIO_CATALOGO_IDCAMBIO`),
  KEY `FK_R115_HISTORIALCONFIGURACION` (`GH_VALOR_CATALOGO_IDVALOR`),
  CONSTRAINT `FK_R115_HISTORIALCONFIGURACION` FOREIGN KEY (`GH_VALOR_CATALOGO_IDVALOR`) REFERENCES `gh_valor_catalogo` (`GH_VALOR_CATALOGO_IDVALOR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CAT-003\nHistorial de configuraci n de negocio ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_cambio_catalogo`
--

LOCK TABLES `gh_cambio_catalogo` WRITE;
/*!40000 ALTER TABLE `gh_cambio_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_cambio_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_catalogo`
--

DROP TABLE IF EXISTS `gh_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_catalogo` (
  `GH_CATALOGO_IDCATALOGO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CATALOGO_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CATALOGO_NOMBRE` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CATALOGO_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CATALOGO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CATALOGO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CATALOGO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_CATALOGO_IDCATALOGO`),
  KEY `AK_AK_CATALOGO_CODIGO` (`GH_CATALOGO_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CAT-001, RF-CAT-002\nCat logos operativos aprob';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_catalogo`
--

LOCK TABLES `gh_catalogo` WRITE;
/*!40000 ALTER TABLE `gh_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_catalogo_diagnostico`
--

DROP TABLE IF EXISTS `gh_catalogo_diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_catalogo_diagnostico` (
  `GH_CATALOGO_DIAGNOSTICO_IDCONCEPTODIAGNOSTICO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CATALOGO_DIAGNOSTICO_SISTEMACLASIFICACION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CATALOGO_DIAGNOSTICO_VERSIONCLASIFICACION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CATALOGO_DIAGNOSTICO_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CATALOGO_DIAGNOSTICO_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CATALOGO_DIAGNOSTICO_VIGENTEDESDE` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_CATALOGO_DIAGNOSTICO_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_CATALOGO_DIAGNOSTICO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CATALOGO_DIAGNOSTICO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CATALOGO_DIAGNOSTICO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_CATALOGO_DIAGNOSTICO_IDCONCEPTODIAGNOSTICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HC-003, RF-CAT-001, RF-CAT-002\nClasificaci n i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_catalogo_diagnostico`
--

LOCK TABLES `gh_catalogo_diagnostico` WRITE;
/*!40000 ALTER TABLE `gh_catalogo_diagnostico` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_catalogo_diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_contacto_paciente`
--

DROP TABLE IF EXISTS `gh_contacto_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_contacto_paciente` (
  `GH_CONTACTO_PACIENTE_IDCONTACTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CONTACTO_PACIENTE_TIPOVINCULO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CONTACTO_PACIENTE_NOMBRECONTACTO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CONTACTO_PACIENTE_TELEFONO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CONTACTO_PACIENTE_CORREO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CONTACTO_PACIENTE_PARENTESCO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CONTACTO_PACIENTE_PRIORIDAD` int DEFAULT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GH_CONTACTO_PACIENTE_VIGENTEDESDE` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_CONTACTO_PACIENTE_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_CONTACTO_PACIENTE_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CONTACTO_PACIENTE_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_CONTACTO_PACIENTE_IDCONTACTO`),
  KEY `FK_R001_CONTACTOS` (`GEPAC_PACIE_IDPACIENTE`),
  CONSTRAINT `FK_R001_CONTACTOS` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-PAC-001, RF-PAC-003\nContacto propio, represent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_contacto_paciente`
--

LOCK TABLES `gh_contacto_paciente` WRITE;
/*!40000 ALTER TABLE `gh_contacto_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_contacto_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_control_preoperatorio`
--

DROP TABLE IF EXISTS `gh_control_preoperatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_control_preoperatorio` (
  `GH_CONTROL_PREOPERATORIO_IDCONTROL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRQ_PROCQ_IDPROCEDIMIENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CONTROL_PREOPERATORIO_PROTOCOLO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CONTROL_PREOPERATORIO_VERSIONPROTOCOLO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CONTROL_PREOPERATORIO_CODIGOCONTROL` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CONTROL_PREOPERATORIO_RESULTADOREGISTRADO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_CONTROL_PREOPERATORIO_COMPLETADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CONTROL_PREOPERATORIO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CONTROL_PREOPERATORIO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_CONTROL_PREOPERATORIO_IDCONTROL`),
  KEY `FK_R098_VERIFICACIONES` (`GHPRQ_PROCQ_IDPROCEDIMIENTO`),
  KEY `FK_R099_COMPLETACONTROL` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R098_VERIFICACIONES` FOREIGN KEY (`GHPRQ_PROCQ_IDPROCEDIMIENTO`) REFERENCES `ghprq_procq` (`GHPRQ_PROCQ_IDPROCEDIMIENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R099_COMPLETACONTROL` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-QUI-002\nControles y personal que los completa ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_control_preoperatorio`
--

LOCK TABLES `gh_control_preoperatorio` WRITE;
/*!40000 ALTER TABLE `gh_control_preoperatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_control_preoperatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_cuenta_facturacion`
--

DROP TABLE IF EXISTS `gh_cuenta_facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_cuenta_facturacion` (
  `GH_CUENTA_FACTURACION_IDCUENTA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CUENTA_FACTURACION_ABIERTAEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CUENTA_FACTURACION_CERRADAEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CUENTA_FACTURACION_MONEDA` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CUENTA_FACTURACION_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_CUENTA_FACTURACION_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_CUENTA_FACTURACION_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_CUENTA_FACTURACION_IDCUENTA`),
  KEY `FK_R102_CUENTAS` (`GEPAC_PACIE_IDPACIENTE`),
  KEY `FK_R103_CUENTAEPISODIO` (`GHEPI_EPISO_IDEPISODIO`),
  CONSTRAINT `FK_R102_CUENTAS` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R103_CUENTAEPISODIO` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-001, RF-FAC-006\nCuenta de un paciente, vin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_cuenta_facturacion`
--

LOCK TABLES `gh_cuenta_facturacion` WRITE;
/*!40000 ALTER TABLE `gh_cuenta_facturacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_cuenta_facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_detalle_dispensacion`
--

DROP TABLE IF EXISTS `gh_detalle_dispensacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_detalle_dispensacion` (
  `GH_DETALLE_DISPENSACION_IDDETALLEDISPENSACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_DISPENSACION_IDDISPENSACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ITEM_PRESCRIPCION_IDITEMPRESCRIPCION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHLOT_LOTE_IDLOTE` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHMOV_MOVIM_IDMOVIMIENTO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_DETALLE_DISPENSACION_CANTIDAD` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_DETALLE_DISPENSACION_UNIDAD` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_DETALLE_DISPENSACION_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_DETALLE_DISPENSACION_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_DETALLE_DISPENSACION_IDDETALLEDISPENSACION`),
  KEY `FK_R059_DETALLES` (`GH_DISPENSACION_IDDISPENSACION`),
  KEY `FK_R060_ENTREGADO` (`GH_ITEM_PRESCRIPCION_IDITEMPRESCRIPCION`),
  KEY `FK_R061_LOTEENTREGADO` (`GHLOT_LOTE_IDLOTE`),
  KEY `FK_R071_SALIDADISPENSACION` (`GHMOV_MOVIM_IDMOVIMIENTO`),
  CONSTRAINT `FK_R059_DETALLES` FOREIGN KEY (`GH_DISPENSACION_IDDISPENSACION`) REFERENCES `gh_dispensacion` (`GH_DISPENSACION_IDDISPENSACION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R060_ENTREGADO` FOREIGN KEY (`GH_ITEM_PRESCRIPCION_IDITEMPRESCRIPCION`) REFERENCES `gh_item_prescripcion` (`GH_ITEM_PRESCRIPCION_IDITEMPRESCRIPCION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R061_LOTEENTREGADO` FOREIGN KEY (`GHLOT_LOTE_IDLOTE`) REFERENCES `ghlot_lote` (`GHLOT_LOTE_IDLOTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R071_SALIDADISPENSACION` FOREIGN KEY (`GHMOV_MOVIM_IDMOVIMIENTO`) REFERENCES `ghmov_movim` (`GHMOV_MOVIM_IDMOVIMIENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAR-004, RF-FAR-005, RF-FAR-006\nCantidad entre';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_detalle_dispensacion`
--

LOCK TABLES `gh_detalle_dispensacion` WRITE;
/*!40000 ALTER TABLE `gh_detalle_dispensacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_detalle_dispensacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_detalle_factura`
--

DROP TABLE IF EXISTS `gh_detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_detalle_factura` (
  `GH_DETALLE_FACTURA_IDDETALLEFACTURA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FIFAC_FACTU_IDFACTURA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `FICAR_CARGO_IDCARGO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_DETALLE_FACTURA_DESCRIPCIONAPLICADA` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_DETALLE_FACTURA_CANTIDAD` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_DETALLE_FACTURA_PRECIOUNITARIOAPLICADO` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Importe. ',
  `GH_DETALLE_FACTURA_DESCUENTOAPLICADO` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Importe. ',
  `GH_DETALLE_FACTURA_TASAIMPUESTOAPLICADA` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_DETALLE_FACTURA_IMPUESTOAPLICADO` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Importe. ',
  `GH_DETALLE_FACTURA_TOTALLINEA` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Importe. ',
  `GH_DETALLE_FACTURA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_DETALLE_FACTURA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_DETALLE_FACTURA_IDDETALLEFACTURA`),
  KEY `FK_R108_LINEAS` (`FIFAC_FACTU_IDFACTURA`),
  KEY `FK_R109_CARGOFACTURADO` (`FICAR_CARGO_IDCARGO`),
  CONSTRAINT `FK_R108_LINEAS` FOREIGN KEY (`FIFAC_FACTU_IDFACTURA`) REFERENCES `fifac_factu` (`FIFAC_FACTU_IDFACTURA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R109_CARGOFACTURADO` FOREIGN KEY (`FICAR_CARGO_IDCARGO`) REFERENCES `ficar_cargo` (`FICAR_CARGO_IDCARGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAC-001, RF-FAC-002, RF-FAC-003\nInstant nea de';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_detalle_factura`
--

LOCK TABLES `gh_detalle_factura` WRITE;
/*!40000 ALTER TABLE `gh_detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_dispensacion`
--

DROP TABLE IF EXISTS `gh_dispensacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_dispensacion` (
  `GH_DISPENSACION_IDDISPENSACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRES_PRESC_IDPRESCRIPCION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_UBICACION_INVENTARIO_IDUBICACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_DISPENSACION_DISPENSADAEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_DISPENSACION_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_DISPENSACION_OBSERVACIONES` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_DISPENSACION_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_DISPENSACION_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_DISPENSACION_IDDISPENSACION`),
  KEY `FK_R058_ENTREGAS` (`GHPRES_PRESC_IDPRESCRIPCION`),
  KEY `FK_R062_FARMACIAORIGEN` (`GH_UBICACION_INVENTARIO_IDUBICACION`),
  CONSTRAINT `FK_R058_ENTREGAS` FOREIGN KEY (`GHPRES_PRESC_IDPRESCRIPCION`) REFERENCES `ghpres_presc` (`GHPRES_PRESC_IDPRESCRIPCION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R062_FARMACIAORIGEN` FOREIGN KEY (`GH_UBICACION_INVENTARIO_IDUBICACION`) REFERENCES `gh_ubicacion_inventario` (`GH_UBICACION_INVENTARIO_IDUBICACION`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAR-003, RF-FAR-004\nEntrega vinculada a una pr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_dispensacion`
--

LOCK TABLES `gh_dispensacion` WRITE;
/*!40000 ALTER TABLE `gh_dispensacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_dispensacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_disposicion_emergencia`
--

DROP TABLE IF EXISTS `gh_disposicion_emergencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_disposicion_emergencia` (
  `GH_DISPOSICION_EMERGENCIA_IDDISPOSICION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ATENCION_EMERGENCIA_IDEMERGENCIA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_DISPOSICION_EMERGENCIA_DECIDIDAEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_DISPOSICION_EMERGENCIA_TIPODISPOSICION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_DISPOSICION_EMERGENCIA_INDICACIONES` text COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_DISPOSICION_EMERGENCIA_DOCUMENTACION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_DISPOSICION_EMERGENCIA_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_DISPOSICION_EMERGENCIA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_DISPOSICION_EMERGENCIA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_DISPOSICION_EMERGENCIA_IDDISPOSICION`),
  KEY `FK_R034_DISPOSICIONES` (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`),
  KEY `FK_R035_DECIDEDISPOSICION` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R034_DISPOSICIONES` FOREIGN KEY (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`) REFERENCES `gh_atencion_emergencia` (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R035_DECIDEDISPOSICION` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-EME-004\nDecisi n profesional de alta, hospital';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_disposicion_emergencia`
--

LOCK TABLES `gh_disposicion_emergencia` WRITE;
/*!40000 ALTER TABLE `gh_disposicion_emergencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_disposicion_emergencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_documento_clinico`
--

DROP TABLE IF EXISTS `gh_documento_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_documento_clinico` (
  `GH_DOCUMENTO_CLINICO_IDDOCUMENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEST_ESTUD_IDESTUDIO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_DOCUMENTO_CLINICO_TIPODOCUMENTO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_DOCUMENTO_CLINICO_NOMBRE` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_DOCUMENTO_CLINICO_TIPOCONTENIDO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_DOCUMENTO_CLINICO_TAMANOBYTES` int NOT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GH_DOCUMENTO_CLINICO_REFERENCIAREPOSITORIO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_DOCUMENTO_CLINICO_VERSION` int NOT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GH_DOCUMENTO_CLINICO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_DOCUMENTO_CLINICO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_DOCUMENTO_CLINICO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_DOCUMENTO_CLINICO_IDDOCUMENTO`),
  KEY `FK_R027_DOCUMENTOS` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R091_IMAGENESYDOCUMENTOS` (`GHEST_ESTUD_IDESTUDIO`),
  CONSTRAINT `FK_R027_DOCUMENTOS` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R091_IMAGENESYDOCUMENTOS` FOREIGN KEY (`GHEST_ESTUD_IDESTUDIO`) REFERENCES `ghest_estud` (`GHEST_ESTUD_IDESTUDIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HC-008, RF-IMG-004\nReferencia al contenido pro';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_documento_clinico`
--

LOCK TABLES `gh_documento_clinico` WRITE;
/*!40000 ALTER TABLE `gh_documento_clinico` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_documento_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_egreso_administrativo`
--

DROP TABLE IF EXISTS `gh_egreso_administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_egreso_administrativo` (
  `GH_EGRESO_ADMINISTRATIVO_IDEGRESO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHADM_ADMIS_IDADMISION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ALTA_MEDICA_IDALTAMEDICA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_EGRESO_ADMINISTRATIVO_EGRESOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_EGRESO_ADMINISTRATIVO_DOCUMENTACIONVERIFICADA` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_EGRESO_ADMINISTRATIVO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_EGRESO_ADMINISTRATIVO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_EGRESO_ADMINISTRATIVO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_EGRESO_ADMINISTRATIVO_IDEGRESO`),
  KEY `FK_R052_EGRESO2` (`GHADM_ADMIS_IDADMISION`),
  KEY `FK_R053_HABILITAEGRESO2` (`GH_ALTA_MEDICA_IDALTAMEDICA`),
  CONSTRAINT `FK_R052_EGRESO2` FOREIGN KEY (`GHADM_ADMIS_IDADMISION`) REFERENCES `ghadm_admis` (`GHADM_ADMIS_IDADMISION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R053_HABILITAEGRESO2` FOREIGN KEY (`GH_ALTA_MEDICA_IDALTAMEDICA`) REFERENCES `gh_alta_medica` (`GH_ALTA_MEDICA_IDALTAMEDICA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-006\nSolo se confirma con alta m dica autor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_egreso_administrativo`
--

LOCK TABLES `gh_egreso_administrativo` WRITE;
/*!40000 ALTER TABLE `gh_egreso_administrativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_egreso_administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_examen_laboratorio`
--

DROP TABLE IF EXISTS `gh_examen_laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_examen_laboratorio` (
  `GH_EXAMEN_LABORATORIO_IDEXAMEN` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_EXAMEN_LABORATORIO_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_EXAMEN_LABORATORIO_NOMBRE` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_EXAMEN_LABORATORIO_VIGENTEDESDE` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_EXAMEN_LABORATORIO_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_EXAMEN_LABORATORIO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_EXAMEN_LABORATORIO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_EXAMEN_LABORATORIO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_EXAMEN_LABORATORIO_IDEXAMEN`),
  KEY `AK_AK_EXAMEN_LABORATORIO_CODIGO` (`GH_EXAMEN_LABORATORIO_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-LAB-001, RF-CAT-001, RF-CAT-002\n\nregistr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_examen_laboratorio`
--

LOCK TABLES `gh_examen_laboratorio` WRITE;
/*!40000 ALTER TABLE `gh_examen_laboratorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_examen_laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_existencia`
--

DROP TABLE IF EXISTS `gh_existencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_existencia` (
  `GH_EXISTENCIA_IDEXISTENCIA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHMED_MEDIC_IDMEDICAMENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_UBICACION_INVENTARIO_IDUBICACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHLOT_LOTE_IDLOTE` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_EXISTENCIA_CANTIDADFISICA` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_EXISTENCIA_CANTIDADRESERVADA` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_EXISTENCIA_CANTIDADNODISPENSABLE` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_EXISTENCIA_ACTUALIZADAEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_EXISTENCIA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_EXISTENCIA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_EXISTENCIA_IDEXISTENCIA`),
  KEY `FK_R064_EXISTENCIAS` (`GHMED_MEDIC_IDMEDICAMENTO`),
  KEY `FK_R065_UBICADO` (`GH_UBICACION_INVENTARIO_IDUBICACION`),
  KEY `FK_R066_PORLOTE` (`GHLOT_LOTE_IDLOTE`),
  CONSTRAINT `FK_R064_EXISTENCIAS` FOREIGN KEY (`GHMED_MEDIC_IDMEDICAMENTO`) REFERENCES `ghmed_medic` (`GHMED_MEDIC_IDMEDICAMENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R065_UBICADO` FOREIGN KEY (`GH_UBICACION_INVENTARIO_IDUBICACION`) REFERENCES `gh_ubicacion_inventario` (`GH_UBICACION_INVENTARIO_IDUBICACION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R066_PORLOTE` FOREIGN KEY (`GHLOT_LOTE_IDLOTE`) REFERENCES `ghlot_lote` (`GHLOT_LOTE_IDLOTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAR-002, RF-FAR-004, RF-FAR-005\n nica por medi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_existencia`
--

LOCK TABLES `gh_existencia` WRITE;
/*!40000 ALTER TABLE `gh_existencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_existencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_habilitacion_profesional`
--

DROP TABLE IF EXISTS `gh_habilitacion_profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_habilitacion_profesional` (
  `GH_HABILITACION_PROFESIONAL_IDHABILITACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHESP_ESPEC_IDESPECIALIDAD` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_HABILITACION_PROFESIONAL_REGISTROHABILITACION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_HABILITACION_PROFESIONAL_VIGENTEDESDE` date NOT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_HABILITACION_PROFESIONAL_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_HABILITACION_PROFESIONAL_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_HABILITACION_PROFESIONAL_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HABILITACION_PROFESIONAL_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_HABILITACION_PROFESIONAL_IDHABILITACION`),
  KEY `FK_R004_HABILITACIONES` (`GHPRO_PROFE_IDPROFESIONAL`),
  KEY `FK_R005_ESPECIALIZA` (`GHESP_ESPEC_IDESPECIALIDAD`),
  CONSTRAINT `FK_R004_HABILITACIONES` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R005_ESPECIALIZA` FOREIGN KEY (`GHESP_ESPEC_IDESPECIALIDAD`) REFERENCES `ghesp_espec` (`GHESP_ESPEC_IDESPECIALIDAD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CIT-001\nAsociaci n temporal entre profesional ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_habilitacion_profesional`
--

LOCK TABLES `gh_habilitacion_profesional` WRITE;
/*!40000 ALTER TABLE `gh_habilitacion_profesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_habilitacion_profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_habitacion`
--

DROP TABLE IF EXISTS `gh_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_habitacion` (
  `GH_HABITACION_IDHABITACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_HABITACION_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_HABITACION_PISO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_HABITACION_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_HABITACION_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_HABITACION_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HABITACION_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_HABITACION_IDHABITACION`),
  KEY `AK_AK_HABITACION_CODIGO` (`GH_HABITACION_CODIGO`),
  KEY `FK_R039_HABITACIONES` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`),
  CONSTRAINT `FK_R039_HABITACIONES` FOREIGN KEY (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) REFERENCES `gh_servicio_hospitalario` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-002\n\nregistradoPor identifica al res';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_habitacion`
--

LOCK TABLES `gh_habitacion` WRITE;
/*!40000 ALTER TABLE `gh_habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_historial_cita`
--

DROP TABLE IF EXISTS `gh_historial_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_historial_cita` (
  `GH_HISTORIAL_CITA_IDCAMBIOCITA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHCIT_CITA_IDCITA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_HISTORIAL_CITA_FECHAEFECTIVA` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HISTORIAL_CITA_ESTADOANTERIOR` varchar(40) DEFAULT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_HISTORIAL_CITA_ESTADONUEVO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_HISTORIAL_CITA_INICIOANTERIOR` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HISTORIAL_CITA_INICIONUEVO` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HISTORIAL_CITA_MOTIVO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_HISTORIAL_CITA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HISTORIAL_CITA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_HISTORIAL_CITA_IDCAMBIOCITA`),
  KEY `FK_R012_CAMBIOS` (`GHCIT_CITA_IDCITA`),
  CONSTRAINT `FK_R012_CAMBIOS` FOREIGN KEY (`GHCIT_CITA_IDCITA`) REFERENCES `ghcit_cita` (`GHCIT_CITA_IDCITA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CIT-003, RF-CIT-004, RF-CIT-005\nRegistra creac';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_historial_cita`
--

LOCK TABLES `gh_historial_cita` WRITE;
/*!40000 ALTER TABLE `gh_historial_cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_historial_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_historial_estado_cama`
--

DROP TABLE IF EXISTS `gh_historial_estado_cama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_historial_estado_cama` (
  `GH_HISTORIAL_ESTADO_CAMA_IDESTADOCAMA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHCAM_CAMA_IDCAMA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_HISTORIAL_ESTADO_CAMA_DESDE` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HISTORIAL_ESTADO_CAMA_HASTA` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HISTORIAL_ESTADO_CAMA_ESTADOOPERATIVO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_HISTORIAL_ESTADO_CAMA_MOTIVO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_HISTORIAL_ESTADO_CAMA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_HISTORIAL_ESTADO_CAMA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_HISTORIAL_ESTADO_CAMA_IDESTADOCAMA`),
  KEY `FK_R041_ESTADOS` (`GHCAM_CAMA_IDCAMA`),
  CONSTRAINT `FK_R041_ESTADOS` FOREIGN KEY (`GHCAM_CAMA_IDCAMA`) REFERENCES `ghcam_cama` (`GHCAM_CAMA_IDCAMA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-002, RF-HOS-006\nPermite reconstruir estado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_historial_estado_cama`
--

LOCK TABLES `gh_historial_estado_cama` WRITE;
/*!40000 ALTER TABLE `gh_historial_estado_cama` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_historial_estado_cama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_informe_imagen`
--

DROP TABLE IF EXISTS `gh_informe_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_informe_imagen` (
  `GH_INFORME_IMAGEN_IDINFORME` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEST_ESTUD_IDESTUDIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHP_GHPRO_PROFE_IDPROFESIONAL` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_INFORME_IMAGEN_VERSION` int NOT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GH_INFORME_IMAGEN_CONTENIDO` text NOT NULL COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_INFORME_IMAGEN_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_INFORME_IMAGEN_ELABORADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_INFORME_IMAGEN_VALIDADOEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_INFORME_IMAGEN_PUBLICADOEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_INFORME_IMAGEN_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_INFORME_IMAGEN_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_INFORME_IMAGEN_IDINFORME`),
  KEY `FK_R088_INFORMES` (`GHEST_ESTUD_IDESTUDIO`),
  KEY `FK_R089_AUTORINFORME` (`GHPRO_PROFE_IDPROFESIONAL`),
  KEY `FK_R090_VALIDADORIMAGEN` (`GHP_GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R088_INFORMES` FOREIGN KEY (`GHEST_ESTUD_IDESTUDIO`) REFERENCES `ghest_estud` (`GHEST_ESTUD_IDESTUDIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R089_AUTORINFORME` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R090_VALIDADORIMAGEN` FOREIGN KEY (`GHP_GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-IMG-003, RF-IMG-004\nInforme del profesional ha';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_informe_imagen`
--

LOCK TABLES `gh_informe_imagen` WRITE;
/*!40000 ALTER TABLE `gh_informe_imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_informe_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_item_prescripcion`
--

DROP TABLE IF EXISTS `gh_item_prescripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_item_prescripcion` (
  `GH_ITEM_PRESCRIPCION_IDITEMPRESCRIPCION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRES_PRESC_IDPRESCRIPCION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHMED_MEDIC_IDMEDICAMENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ITEM_PRESCRIPCION_DOSIS` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_ITEM_PRESCRIPCION_VIA` varchar(40) DEFAULT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_ITEM_PRESCRIPCION_FRECUENCIA` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_ITEM_PRESCRIPCION_DURACION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_ITEM_PRESCRIPCION_CANTIDADINDICADA` decimal(18,6) DEFAULT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_ITEM_PRESCRIPCION_INDICACIONES` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_ITEM_PRESCRIPCION_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_ITEM_PRESCRIPCION_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_ITEM_PRESCRIPCION_IDITEMPRESCRIPCION`),
  KEY `FK_R056_ITEMS` (`GHPRES_PRESC_IDPRESCRIPCION`),
  KEY `FK_R057_MEDICAMENTOINDICADO` (`GHMED_MEDIC_IDMEDICAMENTO`),
  CONSTRAINT `FK_R056_ITEMS` FOREIGN KEY (`GHPRES_PRESC_IDPRESCRIPCION`) REFERENCES `ghpres_presc` (`GHPRES_PRESC_IDPRESCRIPCION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R057_MEDICAMENTOINDICADO` FOREIGN KEY (`GHMED_MEDIC_IDMEDICAMENTO`) REFERENCES `ghmed_medic` (`GHMED_MEDIC_IDMEDICAMENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HC-002, RF-FAR-003\nUn medicamento por  tem. La';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_item_prescripcion`
--

LOCK TABLES `gh_item_prescripcion` WRITE;
/*!40000 ALTER TABLE `gh_item_prescripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_item_prescripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_item_solicitud_lab`
--

DROP TABLE IF EXISTS `gh_item_solicitud_lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_item_solicitud_lab` (
  `GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHSOL_SOLIC_IDSOLICITUD` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_EXAMEN_LABORATORIO_IDEXAMEN` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ITEM_SOLICITUD_LAB_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_ITEM_SOLICITUD_LAB_INSTRUCCIONES` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_ITEM_SOLICITUD_LAB_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_ITEM_SOLICITUD_LAB_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD`),
  KEY `FK_R076_EXAMENES` (`GHSOL_SOLIC_IDSOLICITUD`),
  KEY `FK_R077_TIPOEXAMEN` (`GH_EXAMEN_LABORATORIO_IDEXAMEN`),
  CONSTRAINT `FK_R076_EXAMENES` FOREIGN KEY (`GHSOL_SOLIC_IDSOLICITUD`) REFERENCES `ghsol_solic` (`GHSOL_SOLIC_IDSOLICITUD`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R077_TIPOEXAMEN` FOREIGN KEY (`GH_EXAMEN_LABORATORIO_IDEXAMEN`) REFERENCES `gh_examen_laboratorio` (`GH_EXAMEN_LABORATORIO_IDEXAMEN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-LAB-001, RF-LAB-002\nUn examen solicitado dentr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_item_solicitud_lab`
--

LOCK TABLES `gh_item_solicitud_lab` WRITE;
/*!40000 ALTER TABLE `gh_item_solicitud_lab` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_item_solicitud_lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_medicion_signo`
--

DROP TABLE IF EXISTS `gh_medicion_signo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_medicion_signo` (
  `GH_MEDICION_SIGNO_IDMEDICION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_REGISTRO_ENFERMERIA_IDREGISTROENFERMERIA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_MEDICION_SIGNO_TIPOSIGNO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_MEDICION_SIGNO_VALOR` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_MEDICION_SIGNO_UNIDAD` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_MEDICION_SIGNO_MEDIDOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_MEDICION_SIGNO_OBSERVACION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_MEDICION_SIGNO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_MEDICION_SIGNO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_MEDICION_SIGNO_IDMEDICION`),
  KEY `FK_R030_MEDICIONES` (`GH_REGISTRO_ENFERMERIA_IDREGISTROENFERMERIA`),
  CONSTRAINT `FK_R030_MEDICIONES` FOREIGN KEY (`GH_REGISTRO_ENFERMERIA_IDREGISTROENFERMERIA`) REFERENCES `gh_registro_enfermeria` (`GH_REGISTRO_ENFERMERIA_IDREGISTROENFERMERIA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-005, RF-EME-003\nUna medici n identificable';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_medicion_signo`
--

LOCK TABLES `gh_medicion_signo` WRITE;
/*!40000 ALTER TABLE `gh_medicion_signo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_medicion_signo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_muestra_laboratorio`
--

DROP TABLE IF EXISTS `gh_muestra_laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_muestra_laboratorio` (
  `GH_MUESTRA_LABORATORIO_IDMUESTRA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_MUESTRA_LABORATORIO_IDENTIFICADORMUESTRA` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_MUESTRA_LABORATORIO_TIPOMUESTRA` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_MUESTRA_LABORATORIO_TOMADAEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_MUESTRA_LABORATORIO_RECIBIDAEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_MUESTRA_LABORATORIO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_MUESTRA_LABORATORIO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_MUESTRA_LABORATORIO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_MUESTRA_LABORATORIO_IDMUESTRA`),
  KEY `AK_AK_MUESTRA_LABORATORIO_IDENTIFICADORMUESTRA` (`GH_MUESTRA_LABORATORIO_IDENTIFICADORMUESTRA`),
  KEY `FK_R079_MUESTRAS` (`GEPAC_PACIE_IDPACIENTE`),
  CONSTRAINT `FK_R079_MUESTRAS` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-LAB-002, RF-LAB-003\nPertenece al paciente de l';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_muestra_laboratorio`
--

LOCK TABLES `gh_muestra_laboratorio` WRITE;
/*!40000 ALTER TABLE `gh_muestra_laboratorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_muestra_laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_parametro_examen`
--

DROP TABLE IF EXISTS `gh_parametro_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_parametro_examen` (
  `GH_PARAMETRO_EXAMEN_IDPARAMETRO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_EXAMEN_LABORATORIO_IDEXAMEN` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_PARAMETRO_EXAMEN_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_PARAMETRO_EXAMEN_NOMBRE` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_PARAMETRO_EXAMEN_TIPOVALOR` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_PARAMETRO_EXAMEN_UNIDADORIENTATIVA` varchar(40) DEFAULT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_PARAMETRO_EXAMEN_METODO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_PARAMETRO_EXAMEN_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_PARAMETRO_EXAMEN_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_PARAMETRO_EXAMEN_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_PARAMETRO_EXAMEN_IDPARAMETRO`),
  KEY `FK_R078_PARAMETROS` (`GH_EXAMEN_LABORATORIO_IDEXAMEN`),
  CONSTRAINT `FK_R078_PARAMETROS` FOREIGN KEY (`GH_EXAMEN_LABORATORIO_IDEXAMEN`) REFERENCES `gh_examen_laboratorio` (`GH_EXAMEN_LABORATORIO_IDEXAMEN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-LAB-003\nComponente de un examen, incluso una c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_parametro_examen`
--

LOCK TABLES `gh_parametro_examen` WRITE;
/*!40000 ALTER TABLE `gh_parametro_examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_parametro_examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_participacion_quirurgica`
--

DROP TABLE IF EXISTS `gh_participacion_quirurgica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_participacion_quirurgica` (
  `GH_PARTICIPACION_QUIRURGICA_IDPARTICIPACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRQ_PROCQ_IDPROCEDIMIENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_PARTICIPACION_QUIRURGICA_ROLENEQUIPO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_PARTICIPACION_QUIRURGICA_DESDE` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_PARTICIPACION_QUIRURGICA_HASTA` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_PARTICIPACION_QUIRURGICA_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_PARTICIPACION_QUIRURGICA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_PARTICIPACION_QUIRURGICA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_PARTICIPACION_QUIRURGICA_IDPARTICIPACION`),
  KEY `FK_R096_EQUIPO` (`GHPRQ_PROCQ_IDPROCEDIMIENTO`),
  KEY `FK_R097_INTEGRANTE` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R096_EQUIPO` FOREIGN KEY (`GHPRQ_PROCQ_IDPROCEDIMIENTO`) REFERENCES `ghprq_procq` (`GHPRQ_PROCQ_IDPROCEDIMIENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R097_INTEGRANTE` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-QUI-001, RF-QUI-003\nEquipo profesional con rol';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_participacion_quirurgica`
--

LOCK TABLES `gh_participacion_quirurgica` WRITE;
/*!40000 ALTER TABLE `gh_participacion_quirurgica` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_participacion_quirurgica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_politica_stock`
--

DROP TABLE IF EXISTS `gh_politica_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_politica_stock` (
  `GH_POLITICA_STOCK_IDPOLITICASTOCK` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHMED_MEDIC_IDMEDICAMENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_UBICACION_INVENTARIO_IDUBICACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_POLITICA_STOCK_NIVELMINIMO` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GH_POLITICA_STOCK_VIGENTEDESDE` date NOT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_POLITICA_STOCK_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_POLITICA_STOCK_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_POLITICA_STOCK_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_POLITICA_STOCK_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_POLITICA_STOCK_IDPOLITICASTOCK`),
  KEY `FK_R072_MINIMOS` (`GHMED_MEDIC_IDMEDICAMENTO`),
  KEY `FK_R073_UMBRALUBICACION` (`GH_UBICACION_INVENTARIO_IDUBICACION`),
  CONSTRAINT `FK_R072_MINIMOS` FOREIGN KEY (`GHMED_MEDIC_IDMEDICAMENTO`) REFERENCES `ghmed_medic` (`GHMED_MEDIC_IDMEDICAMENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R073_UMBRALUBICACION` FOREIGN KEY (`GH_UBICACION_INVENTARIO_IDUBICACION`) REFERENCES `gh_ubicacion_inventario` (`GH_UBICACION_INVENTARIO_IDUBICACION`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAR-007\nUmbral por medicamento y ubicaci n. La';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_politica_stock`
--

LOCK TABLES `gh_politica_stock` WRITE;
/*!40000 ALTER TABLE `gh_politica_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_politica_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_recurso_quirurgico`
--

DROP TABLE IF EXISTS `gh_recurso_quirurgico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_recurso_quirurgico` (
  `GH_RECURSO_QUIRURGICO_IDRECURSO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_RECURSO_QUIRURGICO_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_RECURSO_QUIRURGICO_TIPORECURSO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_RECURSO_QUIRURGICO_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_RECURSO_QUIRURGICO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_RECURSO_QUIRURGICO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_RECURSO_QUIRURGICO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_RECURSO_QUIRURGICO_IDRECURSO`),
  KEY `AK_AK_RECURSO_QUIRURGICO_CODIGO` (`GH_RECURSO_QUIRURGICO_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-QUI-001\n\nregistradoPor identifica al res';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_recurso_quirurgico`
--

LOCK TABLES `gh_recurso_quirurgico` WRITE;
/*!40000 ALTER TABLE `gh_recurso_quirurgico` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_recurso_quirurgico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_registro_enfermeria`
--

DROP TABLE IF EXISTS `gh_registro_enfermeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_registro_enfermeria` (
  `GH_REGISTRO_ENFERMERIA_IDREGISTROENFERMERIA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_REGISTRO_ENFERMERIA_TIPOREGISTRO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_REGISTRO_ENFERMERIA_FECHAEFECTIVA` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_REGISTRO_ENFERMERIA_OBSERVACIONOCUIDADO` text COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_REGISTRO_ENFERMERIA_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_REGISTRO_ENFERMERIA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_REGISTRO_ENFERMERIA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_REGISTRO_ENFERMERIA_IDREGISTROENFERMERIA`),
  KEY `FK_R028_CUIDADOS` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R029_PERSONALENFERMERIA` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R028_CUIDADOS` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R029_PERSONALENFERMERIA` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-005, RF-EME-003\nDocumenta mediciones y cui';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_registro_enfermeria`
--

LOCK TABLES `gh_registro_enfermeria` WRITE;
/*!40000 ALTER TABLE `gh_registro_enfermeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_registro_enfermeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_registro_recuperacion`
--

DROP TABLE IF EXISTS `gh_registro_recuperacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_registro_recuperacion` (
  `GH_REGISTRO_RECUPERACION_IDRECUPERACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRQ_PROCQ_IDPROCEDIMIENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_REGISTRO_RECUPERACION_FECHAEFECTIVA` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_REGISTRO_RECUPERACION_EVENTO` text NOT NULL COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_REGISTRO_RECUPERACION_ESTADOPROCEDIMIENTO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_REGISTRO_RECUPERACION_DISPOSICIONPOSTERIOR` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_REGISTRO_RECUPERACION_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_REGISTRO_RECUPERACION_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_REGISTRO_RECUPERACION_IDRECUPERACION`),
  KEY `FK_R100_RECUPERACION` (`GHPRQ_PROCQ_IDPROCEDIMIENTO`),
  KEY `FK_R101_DOCUMENTARECUPERACION` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R100_RECUPERACION` FOREIGN KEY (`GHPRQ_PROCQ_IDPROCEDIMIENTO`) REFERENCES `ghprq_procq` (`GHPRQ_PROCQ_IDPROCEDIMIENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R101_DOCUMENTARECUPERACION` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-QUI-004\nEventos de recuperaci n y cierre docum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_registro_recuperacion`
--

LOCK TABLES `gh_registro_recuperacion` WRITE;
/*!40000 ALTER TABLE `gh_registro_recuperacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_registro_recuperacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_reserva_recurso`
--

DROP TABLE IF EXISTS `gh_reserva_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_reserva_recurso` (
  `GH_RESERVA_RECURSO_IDRESERVA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRQ_PROCQ_IDPROCEDIMIENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_RECURSO_QUIRURGICO_IDRECURSO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_RESERVA_RECURSO_DESDE` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_RESERVA_RECURSO_HASTA` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_RESERVA_RECURSO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_RESERVA_RECURSO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_RESERVA_RECURSO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_RESERVA_RECURSO_IDRESERVA`),
  KEY `FK_R094_RESERVASRECURSOS` (`GHPRQ_PROCQ_IDPROCEDIMIENTO`),
  KEY `FK_R095_RECURSO` (`GH_RECURSO_QUIRURGICO_IDRECURSO`),
  CONSTRAINT `FK_R094_RESERVASRECURSOS` FOREIGN KEY (`GHPRQ_PROCQ_IDPROCEDIMIENTO`) REFERENCES `ghprq_procq` (`GHPRQ_PROCQ_IDPROCEDIMIENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R095_RECURSO` FOREIGN KEY (`GH_RECURSO_QUIRURGICO_IDRECURSO`) REFERENCES `gh_recurso_quirurgico` (`GH_RECURSO_QUIRURGICO_IDRECURSO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-QUI-001\nUn recurso gestionado para una cirug a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_reserva_recurso`
--

LOCK TABLES `gh_reserva_recurso` WRITE;
/*!40000 ALTER TABLE `gh_reserva_recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_reserva_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_revision_identidad`
--

DROP TABLE IF EXISTS `gh_revision_identidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_revision_identidad` (
  `GH_REVISION_IDENTIDAD_IDREVISION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEP_GEPAC_PACIE_IDPACIENTE` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_REVISION_IDENTIDAD_TIPOREVISION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_REVISION_IDENTIDAD_DECISION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_REVISION_IDENTIDAD_FUNDAMENTO` text NOT NULL COMMENT 'Tipo conceptual: TextoLargo. ',
  `GH_REVISION_IDENTIDAD_IDENTIFICADORANTERIOR` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_REVISION_IDENTIDAD_IDENTIFICADORCONFIRMADO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_REVISION_IDENTIDAD_RESUELTOEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_REVISION_IDENTIDAD_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_REVISION_IDENTIDAD_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_REVISION_IDENTIDAD_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_REVISION_IDENTIDAD_IDREVISION`),
  KEY `FK_R002_ORIGEN` (`GEPAC_PACIE_IDPACIENTE`),
  KEY `FK_R003_DESTINO` (`GEP_GEPAC_PACIE_IDPACIENTE`),
  CONSTRAINT `FK_R002_ORIGEN` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R003_DESTINO` FOREIGN KEY (`GEP_GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-PAC-005, RF-EME-001\nDistingue coincidencia des';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_revision_identidad`
--

LOCK TABLES `gh_revision_identidad` WRITE;
/*!40000 ALTER TABLE `gh_revision_identidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_revision_identidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_servicio_hospitalario`
--

DROP TABLE IF EXISTS `gh_servicio_hospitalario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_servicio_hospitalario` (
  `GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_SERVICIO_HOSPITALARIO_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_SERVICIO_HOSPITALARIO_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_SERVICIO_HOSPITALARIO_VIGENTEDESDE` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_SERVICIO_HOSPITALARIO_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_SERVICIO_HOSPITALARIO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_SERVICIO_HOSPITALARIO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_SERVICIO_HOSPITALARIO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`),
  KEY `AK_AK_SERVICIO_HOSPITALARIO_CODIGO` (`GH_SERVICIO_HOSPITALARIO_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CIT-001, RF-HC-001, RF-HOS-001, RF-HOS-002, RF-CAT-0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_servicio_hospitalario`
--

LOCK TABLES `gh_servicio_hospitalario` WRITE;
/*!40000 ALTER TABLE `gh_servicio_hospitalario` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_servicio_hospitalario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_traslado_hospitalario`
--

DROP TABLE IF EXISTS `gh_traslado_hospitalario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_traslado_hospitalario` (
  `GH_TRASLADO_HOSPITALARIO_IDTRASLADO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHADM_ADMIS_IDADMISION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH__GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHCAM_CAMA_IDCAMA` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHC_GHCAM_CAMA_IDCAMA` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_TRASLADO_HOSPITALARIO_TRASLADADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_TRASLADO_HOSPITALARIO_MOTIVO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_TRASLADO_HOSPITALARIO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_TRASLADO_HOSPITALARIO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_TRASLADO_HOSPITALARIO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_TRASLADO_HOSPITALARIO_IDTRASLADO`),
  KEY `FK_R044_TRASLADOS` (`GHADM_ADMIS_IDADMISION`),
  KEY `FK_R045_SERVICIOORIGEN` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`),
  KEY `FK_R046_SERVICIODESTINO` (`GH__GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`),
  KEY `FK_R047_CAMAORIGEN` (`GHCAM_CAMA_IDCAMA`),
  KEY `FK_R048_CAMADESTINO` (`GHC_GHCAM_CAMA_IDCAMA`),
  CONSTRAINT `FK_R044_TRASLADOS` FOREIGN KEY (`GHADM_ADMIS_IDADMISION`) REFERENCES `ghadm_admis` (`GHADM_ADMIS_IDADMISION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R045_SERVICIOORIGEN` FOREIGN KEY (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) REFERENCES `gh_servicio_hospitalario` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R046_SERVICIODESTINO` FOREIGN KEY (`GH__GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) REFERENCES `gh_servicio_hospitalario` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R047_CAMAORIGEN` FOREIGN KEY (`GHCAM_CAMA_IDCAMA`) REFERENCES `ghcam_cama` (`GHCAM_CAMA_IDCAMA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R048_CAMADESTINO` FOREIGN KEY (`GHC_GHCAM_CAMA_IDCAMA`) REFERENCES `ghcam_cama` (`GHCAM_CAMA_IDCAMA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-004\nRegistra admisi n, servicios origen y ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_traslado_hospitalario`
--

LOCK TABLES `gh_traslado_hospitalario` WRITE;
/*!40000 ALTER TABLE `gh_traslado_hospitalario` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_traslado_hospitalario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_triaje`
--

DROP TABLE IF EXISTS `gh_triaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_triaje` (
  `GH_TRIAJE_IDTRIAJE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ATENCION_EMERGENCIA_IDEMERGENCIA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_TRIAJE_EVALUADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_TRIAJE_PROTOCOLO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_TRIAJE_VERSIONPROTOCOLO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_TRIAJE_PRIORIDADREGISTRADA` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_TRIAJE_OBSERVACIONES` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_TRIAJE_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_TRIAJE_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_TRIAJE_IDTRIAJE`),
  KEY `FK_R032_EVALUACIONES` (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`),
  KEY `FK_R033_CLASIFICAPRIORIDAD` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R032_EVALUACIONES` FOREIGN KEY (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`) REFERENCES `gh_atencion_emergencia` (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R033_CLASIFICAPRIORIDAD` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-EME-002\nLa prioridad la ingresa personal compe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_triaje`
--

LOCK TABLES `gh_triaje` WRITE;
/*!40000 ALTER TABLE `gh_triaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_triaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_turno_agenda`
--

DROP TABLE IF EXISTS `gh_turno_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_turno_agenda` (
  `GH_TURNO_AGENDA_IDTURNO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHAGE_AGEND_IDAGENDA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_TURNO_AGENDA_INICIO` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_TURNO_AGENDA_FIN` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_TURNO_AGENDA_CAPACIDAD` int NOT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GH_TURNO_AGENDA_ESTADODISPONIBILIDAD` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_TURNO_AGENDA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_TURNO_AGENDA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_TURNO_AGENDA_IDTURNO`),
  KEY `FK_R009_TURNOS` (`GHAGE_AGEND_IDAGENDA`),
  CONSTRAINT `FK_R009_TURNOS` FOREIGN KEY (`GHAGE_AGEND_IDAGENDA`) REFERENCES `ghage_agend` (`GHAGE_AGEND_IDAGENDA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CIT-001, RF-CIT-002, RF-CIT-003\nUnidad reserva';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_turno_agenda`
--

LOCK TABLES `gh_turno_agenda` WRITE;
/*!40000 ALTER TABLE `gh_turno_agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_turno_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_ubicacion_inventario`
--

DROP TABLE IF EXISTS `gh_ubicacion_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_ubicacion_inventario` (
  `GH_UBICACION_INVENTARIO_IDUBICACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_UBICACION_INVENTARIO_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_UBICACION_INVENTARIO_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_UBICACION_INVENTARIO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_UBICACION_INVENTARIO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_UBICACION_INVENTARIO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_UBICACION_INVENTARIO_IDUBICACION`),
  KEY `AK_AK_UBICACION_INVENTARIO_CODIGO` (`GH_UBICACION_INVENTARIO_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAR-002, RF-FAR-006\n\nregistradoPor ident';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_ubicacion_inventario`
--

LOCK TABLES `gh_ubicacion_inventario` WRITE;
/*!40000 ALTER TABLE `gh_ubicacion_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_ubicacion_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_validacion_resultado`
--

DROP TABLE IF EXISTS `gh_validacion_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_validacion_resultado` (
  `GH_VALIDACION_RESULTADO_IDVALIDACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHRES_RESUL_IDRESULTADO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_VALIDACION_RESULTADO_VALIDADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_VALIDACION_RESULTADO_DECISION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_VALIDACION_RESULTADO_OBSERVACIONES` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_VALIDACION_RESULTADO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_VALIDACION_RESULTADO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_VALIDACION_RESULTADO_IDVALIDACION`),
  KEY `FK_R084_VALIDACIONES` (`GHRES_RESUL_IDRESULTADO`),
  KEY `FK_R085_VALIDADORLAB` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R084_VALIDACIONES` FOREIGN KEY (`GHRES_RESUL_IDRESULTADO`) REFERENCES `ghres_resul` (`GHRES_RESUL_IDRESULTADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R085_VALIDADORLAB` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-LAB-004, RF-LAB-005\nValidaci n por profesional';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_validacion_resultado`
--

LOCK TABLES `gh_validacion_resultado` WRITE;
/*!40000 ALTER TABLE `gh_validacion_resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_validacion_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gh_valor_catalogo`
--

DROP TABLE IF EXISTS `gh_valor_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh_valor_catalogo` (
  `GH_VALOR_CATALOGO_IDVALOR` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CATALOGO_IDCATALOGO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_VALOR_CATALOGO_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_VALOR_CATALOGO_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GH_VALOR_CATALOGO_VIGENTEDESDE` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_VALOR_CATALOGO_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GH_VALOR_CATALOGO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GH_VALOR_CATALOGO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GH_VALOR_CATALOGO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GH_VALOR_CATALOGO_IDVALOR`),
  KEY `FK_R114_VALORES` (`GH_CATALOGO_IDCATALOGO`),
  CONSTRAINT `FK_R114_VALORES` FOREIGN KEY (`GH_CATALOGO_IDCATALOGO`) REFERENCES `gh_catalogo` (`GH_CATALOGO_IDCATALOGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CAT-001, RF-CAT-002\nC digo  nico dentro de su ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh_valor_catalogo`
--

LOCK TABLES `gh_valor_catalogo` WRITE;
/*!40000 ALTER TABLE `gh_valor_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gh_valor_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghadm_admis`
--

DROP TABLE IF EXISTS `ghadm_admis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghadm_admis` (
  `GHADM_ADMIS_IDADMISION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_EGRESO_ADMINISTRATIVO_IDEGRESO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHADM_ADMIS_INGRESOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHADM_ADMIS_TIPOADMISION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHADM_ADMIS_INDICACIONINGRESO` text NOT NULL COMMENT 'Tipo conceptual: TextoLargo. ',
  `GHADM_ADMIS_PROCEDENCIA` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHADM_ADMIS_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHADM_ADMIS_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHADM_ADMIS_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHADM_ADMIS_IDADMISION`),
  KEY `FK_R036_ADMISIONES` (`GEPAC_PACIE_IDPACIENTE`),
  KEY `FK_R037_RESPONSABLEINGRESO` (`GHPRO_PROFE_IDPROFESIONAL`),
  KEY `FK_R038_SERVICIOINGRESO` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`),
  KEY `FK_R052_EGRESO` (`GH_EGRESO_ADMINISTRATIVO_IDEGRESO`),
  CONSTRAINT `FK_R036_ADMISIONES` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R037_RESPONSABLEINGRESO` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R038_SERVICIOINGRESO` FOREIGN KEY (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) REFERENCES `gh_servicio_hospitalario` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R052_EGRESO` FOREIGN KEY (`GH_EGRESO_ADMINISTRATIVO_IDEGRESO`) REFERENCES `gh_egreso_administrativo` (`GH_EGRESO_ADMINISTRATIVO_IDEGRESO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-001, RF-PAC-004\nIngreso administrativo con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghadm_admis`
--

LOCK TABLES `ghadm_admis` WRITE;
/*!40000 ALTER TABLE `ghadm_admis` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghadm_admis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghage_agend`
--

DROP TABLE IF EXISTS `ghage_agend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghage_agend` (
  `GHAGE_AGEND_IDAGENDA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHESP_ESPEC_IDESPECIALIDAD` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHAGE_AGEND_FECHA` date NOT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GHAGE_AGEND_INICIOJORNADA` time NOT NULL COMMENT 'Tipo conceptual: Hora. ',
  `GHAGE_AGEND_FINJORNADA` time NOT NULL COMMENT 'Tipo conceptual: Hora. ',
  `GHAGE_AGEND_DURACIONCITAMINUTOS` int NOT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GHAGE_AGEND_CAPACIDAD` int NOT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GHAGE_AGEND_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHAGE_AGEND_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHAGE_AGEND_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHAGE_AGEND_IDAGENDA`),
  KEY `FK_R006_AGENDAS` (`GHPRO_PROFE_IDPROFESIONAL`),
  KEY `FK_R007_ESPECIALIDAD` (`GHESP_ESPEC_IDESPECIALIDAD`),
  KEY `FK_R008_SERVICIO` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`),
  CONSTRAINT `FK_R006_AGENDAS` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R007_ESPECIALIDAD` FOREIGN KEY (`GHESP_ESPEC_IDESPECIALIDAD`) REFERENCES `ghesp_espec` (`GHESP_ESPEC_IDESPECIALIDAD`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R008_SERVICIO` FOREIGN KEY (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) REFERENCES `gh_servicio_hospitalario` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CIT-001\nAgenda de un profesional, especialidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghage_agend`
--

LOCK TABLES `ghage_agend` WRITE;
/*!40000 ALTER TABLE `ghage_agend` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghage_agend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghale_alerg`
--

DROP TABLE IF EXISTS `ghale_alerg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghale_alerg` (
  `GHALE_ALERG_IDALERGIA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHALE_ALERG_SUSTANCIAOCONDICION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHALE_ALERG_REACCION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHALE_ALERG_SEVERIDAD` varchar(40) DEFAULT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHALE_ALERG_FUENTEINFORMACION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHALE_ALERG_ESTADOVERIFICACION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHALE_ALERG_FECHAEFECTIVA` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHALE_ALERG_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHALE_ALERG_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHALE_ALERG_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHALE_ALERG_IDALERGIA`),
  KEY `FK_R025_ALERGIAS` (`GEPAC_PACIE_IDPACIENTE`),
  KEY `FK_R026_REGISTRAALERGIA` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R025_ALERGIAS` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R026_REGISTRAALERGIA` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HC-006\nConserva fuente, responsable y verifica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghale_alerg`
--

LOCK TABLES `ghale_alerg` WRITE;
/*!40000 ALTER TABLE `ghale_alerg` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghale_alerg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghasi_asign`
--

DROP TABLE IF EXISTS `ghasi_asign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghasi_asign` (
  `GHASI_ASIGN_IDASIGNACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHADM_ADMIS_IDADMISION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHCAM_CAMA_IDCAMA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHASI_ASIGN_DESDE` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHASI_ASIGN_HASTA` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHASI_ASIGN_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHASI_ASIGN_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHASI_ASIGN_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHASI_ASIGN_IDASIGNACION`),
  KEY `FK_R042_OCUPACIONES` (`GHADM_ADMIS_IDADMISION`),
  KEY `FK_R043_ASIGNACIONES` (`GHCAM_CAMA_IDCAMA`),
  CONSTRAINT `FK_R042_OCUPACIONES` FOREIGN KEY (`GHADM_ADMIS_IDADMISION`) REFERENCES `ghadm_admis` (`GHADM_ADMIS_IDADMISION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R043_ASIGNACIONES` FOREIGN KEY (`GHCAM_CAMA_IDCAMA`) REFERENCES `ghcam_cama` (`GHCAM_CAMA_IDCAMA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-003, RF-HOS-004\nIntervalo de ocupaci n de ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghasi_asign`
--

LOCK TABLES `ghasi_asign` WRITE;
/*!40000 ALTER TABLE `ghasi_asign` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghasi_asign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghcam_cama`
--

DROP TABLE IF EXISTS `ghcam_cama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghcam_cama` (
  `GHCAM_CAMA_IDCAMA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_HABITACION_IDHABITACION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHCAM_CAMA_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHCAM_CAMA_TIPOCAMA` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHCAM_CAMA_ESTADOOPERATIVO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHCAM_CAMA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHCAM_CAMA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHCAM_CAMA_IDCAMA`),
  KEY `AK_AK_CAMA_CODIGO` (`GHCAM_CAMA_CODIGO`),
  KEY `FK_R040_CAMAS` (`GH_HABITACION_IDHABITACION`),
  CONSTRAINT `FK_R040_CAMAS` FOREIGN KEY (`GH_HABITACION_IDHABITACION`) REFERENCES `gh_habitacion` (`GH_HABITACION_IDHABITACION`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HOS-002\nLa habitaci n y su servicio se represe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghcam_cama`
--

LOCK TABLES `ghcam_cama` WRITE;
/*!40000 ALTER TABLE `ghcam_cama` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghcam_cama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghcit_cita`
--

DROP TABLE IF EXISTS `ghcit_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghcit_cita` (
  `GHCIT_CITA_IDCITA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_TURNO_AGENDA_IDTURNO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHCIT_CITA_MOTIVO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHCIT_CITA_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHCIT_CITA_MOTIVOCANCELACION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHCIT_CITA_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHCIT_CITA_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHCIT_CITA_IDCITA`),
  KEY `FK_R010_RESERVAS` (`GH_TURNO_AGENDA_IDTURNO`),
  KEY `FK_R011_CITAS` (`GEPAC_PACIE_IDPACIENTE`),
  KEY `FK_R016_ORIGINA` (`GHEPI_EPISO_IDEPISODIO`),
  CONSTRAINT `FK_R010_RESERVAS` FOREIGN KEY (`GH_TURNO_AGENDA_IDTURNO`) REFERENCES `gh_turno_agenda` (`GH_TURNO_AGENDA_IDTURNO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R011_CITAS` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R016_ORIGINA` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CIT-002, RF-CIT-003, RF-CIT-004, RF-CIT-005, RF-CIT-';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghcit_cita`
--

LOCK TABLES `ghcit_cita` WRITE;
/*!40000 ALTER TABLE `ghcit_cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghcit_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghdia_diagn`
--

DROP TABLE IF EXISTS `ghdia_diagn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghdia_diagn` (
  `GHDIA_DIAGN_IDDIAGNOSTICO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_CATALOGO_DIAGNOSTICO_IDCONCEPTODIAGNOSTICO` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHDIA_DIAGN_FECHAEFECTIVA` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHDIA_DIAGN_DESCRIPCIONREGISTRADA` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHDIA_DIAGN_TIPODIAGNOSTICO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHDIA_DIAGN_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHDIA_DIAGN_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHDIA_DIAGN_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHDIA_DIAGN_IDDIAGNOSTICO`),
  KEY `FK_R022_DIAGNOSTICOS` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R023_DOCUMENTA` (`GHPRO_PROFE_IDPROFESIONAL`),
  KEY `FK_R024_CLASIFICA` (`GH_CATALOGO_DIAGNOSTICO_IDCONCEPTODIAGNOSTICO`),
  CONSTRAINT `FK_R022_DIAGNOSTICOS` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R023_DOCUMENTA` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R024_CLASIFICA` FOREIGN KEY (`GH_CATALOGO_DIAGNOSTICO_IDCONCEPTODIAGNOSTICO`) REFERENCES `gh_catalogo_diagnostico` (`GH_CATALOGO_DIAGNOSTICO_IDCONCEPTODIAGNOSTICO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HC-003\nDiagn stico ingresado por un profesiona';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghdia_diagn`
--

LOCK TABLES `ghdia_diagn` WRITE;
/*!40000 ALTER TABLE `ghdia_diagn` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghdia_diagn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghepi_episo`
--

DROP TABLE IF EXISTS `ghepi_episo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghepi_episo` (
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GEPAC_PACIE_IDPACIENTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHCIT_CITA_IDCITA` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHADM_ADMIS_IDADMISION` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ATENCION_EMERGENCIA_IDEMERGENCIA` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_TIPOATENCION` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHEPI_EPISO_INICIO` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHEPI_EPISO_FIN` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHEPI_EPISO_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHEPI_EPISO_MOTIVOATENCION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHEPI_EPISO_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHEPI_EPISO_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R013_EPISODIOS` (`GEPAC_PACIE_IDPACIENTE`),
  KEY `FK_R014_RESPONSABLE` (`GHPRO_PROFE_IDPROFESIONAL`),
  KEY `FK_R015_ATENCIONES` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`),
  KEY `FK_R016_ORIGINA2` (`GHCIT_CITA_IDCITA`),
  KEY `FK_R017_CONTEXTOINGRESO` (`GHADM_ADMIS_IDADMISION`),
  KEY `FK_R018_ORIGINAEMERGENCIA2` (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`),
  CONSTRAINT `FK_R013_EPISODIOS` FOREIGN KEY (`GEPAC_PACIE_IDPACIENTE`) REFERENCES `gepac_pacie` (`GEPAC_PACIE_IDPACIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R014_RESPONSABLE` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R015_ATENCIONES` FOREIGN KEY (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) REFERENCES `gh_servicio_hospitalario` (`GH_SERVICIO_HOSPITALARIO_IDSERVICIOHOSPITALARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R016_ORIGINA2` FOREIGN KEY (`GHCIT_CITA_IDCITA`) REFERENCES `ghcit_cita` (`GHCIT_CITA_IDCITA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R017_CONTEXTOINGRESO` FOREIGN KEY (`GHADM_ADMIS_IDADMISION`) REFERENCES `ghadm_admis` (`GHADM_ADMIS_IDADMISION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R018_ORIGINAEMERGENCIA2` FOREIGN KEY (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`) REFERENCES `gh_atencion_emergencia` (`GH_ATENCION_EMERGENCIA_IDEMERGENCIA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HC-001, RF-HC-005\nPertenece a un paciente, pro';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghepi_episo`
--

LOCK TABLES `ghepi_episo` WRITE;
/*!40000 ALTER TABLE `ghepi_episo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghepi_episo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghesp_espec`
--

DROP TABLE IF EXISTS `ghesp_espec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghesp_espec` (
  `GHESP_ESPEC_IDESPECIALIDAD` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHESP_ESPEC_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHESP_ESPEC_DESCRIPCION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHESP_ESPEC_VIGENTEDESDE` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GHESP_ESPEC_VIGENTEHASTA` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GHESP_ESPEC_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHESP_ESPEC_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHESP_ESPEC_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHESP_ESPEC_IDESPECIALIDAD`),
  KEY `AK_AK_ESPECIALIDAD_CODIGO` (`GHESP_ESPEC_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CIT-001, RF-CAT-001, RF-CAT-002\n\nregistr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghesp_espec`
--

LOCK TABLES `ghesp_espec` WRITE;
/*!40000 ALTER TABLE `ghesp_espec` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghesp_espec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghest_estud`
--

DROP TABLE IF EXISTS `ghest_estud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghest_estud` (
  `GHEST_ESTUD_IDESTUDIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEST_ESTUD_SOLICITADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHEST_ESTUD_TIPOESTUDIO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHEST_ESTUD_INDICACIONCLINICA` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHEST_ESTUD_PROGRAMADOEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHEST_ESTUD_INICIADOEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHEST_ESTUD_FINALIZADOEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHEST_ESTUD_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHEST_ESTUD_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHEST_ESTUD_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHEST_ESTUD_IDESTUDIO`),
  KEY `FK_R086_ESTUDIOS` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R087_SOLICITANTEIMAGEN` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R086_ESTUDIOS` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R087_SOLICITANTEIMAGEN` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-IMG-001, RF-IMG-002\nSolicitud y ejecuci n del ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghest_estud`
--

LOCK TABLES `ghest_estud` WRITE;
/*!40000 ALTER TABLE `ghest_estud` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghest_estud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghlot_lote`
--

DROP TABLE IF EXISTS `ghlot_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghlot_lote` (
  `GHLOT_LOTE_IDLOTE` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHMED_MEDIC_IDMEDICAMENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHLOT_LOTE_NUMEROLOTE` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHLOT_LOTE_FABRICADOEL` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GHLOT_LOTE_CADUCAEL` date DEFAULT NULL COMMENT 'Tipo conceptual: Fecha. ',
  `GHLOT_LOTE_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHLOT_LOTE_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHLOT_LOTE_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHLOT_LOTE_IDLOTE`),
  KEY `FK_R063_LOTES` (`GHMED_MEDIC_IDMEDICAMENTO`),
  CONSTRAINT `FK_R063_LOTES` FOREIGN KEY (`GHMED_MEDIC_IDMEDICAMENTO`) REFERENCES `ghmed_medic` (`GHMED_MEDIC_IDMEDICAMENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAR-005\nLote de un medicamento, sin cantidad g';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghlot_lote`
--

LOCK TABLES `ghlot_lote` WRITE;
/*!40000 ALTER TABLE `ghlot_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghlot_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghmed_medic`
--

DROP TABLE IF EXISTS `ghmed_medic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghmed_medic` (
  `GHMED_MEDIC_IDMEDICAMENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHMED_MEDIC_CODIGO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHMED_MEDIC_NOMBRE` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHMED_MEDIC_PRESENTACION` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHMED_MEDIC_CONCENTRACION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHMED_MEDIC_FORMAFARMACEUTICA` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHMED_MEDIC_UNIDADMEDIDA` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHMED_MEDIC_REQUIERELOTE` tinyint(1) NOT NULL COMMENT 'Tipo conceptual: Booleano. ',
  `GHMED_MEDIC_REQUIERECADUCIDAD` tinyint(1) NOT NULL COMMENT 'Tipo conceptual: Booleano. ',
  `GHMED_MEDIC_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHMED_MEDIC_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHMED_MEDIC_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHMED_MEDIC_IDMEDICAMENTO`),
  KEY `AK_AK_MEDICAMENTO_CODIGO` (`GHMED_MEDIC_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAR-001\nCat logo; no almacena un stock global ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghmed_medic`
--

LOCK TABLES `ghmed_medic` WRITE;
/*!40000 ALTER TABLE `ghmed_medic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghmed_medic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghmov_movim`
--

DROP TABLE IF EXISTS `ghmov_movim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghmov_movim` (
  `GHMOV_MOVIM_IDMOVIMIENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHMED_MEDIC_IDMEDICAMENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHLOT_LOTE_IDLOTE` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_UBICACION_INVENTARIO_IDUBICACION` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH__GH_UBICACION_INVENTARIO_IDUBICACION` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_DETALLE_DISPENSACION_IDDETALLEDISPENSACION` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHMOV_MOVIM_MOVIDOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHMOV_MOVIM_TIPOMOVIMIENTO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHMOV_MOVIM_CANTIDAD` decimal(18,6) NOT NULL COMMENT 'Tipo conceptual: Cantidad. ',
  `GHMOV_MOVIM_MOTIVO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHMOV_MOVIM_REFERENCIADOCUMENTO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHMOV_MOVIM_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHMOV_MOVIM_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHMOV_MOVIM_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHMOV_MOVIM_IDMOVIMIENTO`),
  KEY `FK_R067_MOVIMIENTOS` (`GHMED_MEDIC_IDMEDICAMENTO`),
  KEY `FK_R068_LOTEMOVIDO` (`GHLOT_LOTE_IDLOTE`),
  KEY `FK_R069_ORIGEN` (`GH_UBICACION_INVENTARIO_IDUBICACION`),
  KEY `FK_R070_DESTINO` (`GH__GH_UBICACION_INVENTARIO_IDUBICACION`),
  KEY `FK_R071_SALIDADISPENSACION2` (`GH_DETALLE_DISPENSACION_IDDETALLEDISPENSACION`),
  CONSTRAINT `FK_R067_MOVIMIENTOS` FOREIGN KEY (`GHMED_MEDIC_IDMEDICAMENTO`) REFERENCES `ghmed_medic` (`GHMED_MEDIC_IDMEDICAMENTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R068_LOTEMOVIDO` FOREIGN KEY (`GHLOT_LOTE_IDLOTE`) REFERENCES `ghlot_lote` (`GHLOT_LOTE_IDLOTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R069_ORIGEN` FOREIGN KEY (`GH_UBICACION_INVENTARIO_IDUBICACION`) REFERENCES `gh_ubicacion_inventario` (`GH_UBICACION_INVENTARIO_IDUBICACION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R070_DESTINO` FOREIGN KEY (`GH__GH_UBICACION_INVENTARIO_IDUBICACION`) REFERENCES `gh_ubicacion_inventario` (`GH_UBICACION_INVENTARIO_IDUBICACION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R071_SALIDADISPENSACION2` FOREIGN KEY (`GH_DETALLE_DISPENSACION_IDDETALLEDISPENSACION`) REFERENCES `gh_detalle_dispensacion` (`GH_DETALLE_DISPENSACION_IDDETALLEDISPENSACION`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-FAR-006, RF-FAR-004\nUn producto y lote aplicab';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghmov_movim`
--

LOCK TABLES `ghmov_movim` WRITE;
/*!40000 ALTER TABLE `ghmov_movim` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghmov_movim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghnot_notac`
--

DROP TABLE IF EXISTS `ghnot_notac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghnot_notac` (
  `GHNOT_NOTAC_IDNOTA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHN_GHNOT_NOTAC_IDNOTA` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHNOT_NOTAC_TIPONOTA` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHNOT_NOTAC_FECHAEFECTIVA` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHNOT_NOTAC_CONTENIDO` text NOT NULL COMMENT 'Tipo conceptual: TextoLargo. ',
  `GHNOT_NOTAC_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHNOT_NOTAC_VERSION` int NOT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GHNOT_NOTAC_FINALIZADAEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHNOT_NOTAC_MECANISMOFINALIZACION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHNOT_NOTAC_MOTIVORECTIFICACION` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHNOT_NOTAC_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHNOT_NOTAC_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHNOT_NOTAC_IDNOTA`),
  KEY `FK_R019_NOTAS` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R020_AUTOR` (`GHPRO_PROFE_IDPROFESIONAL`),
  KEY `FK_R021_RECTIFICACIONES` (`GHN_GHNOT_NOTAC_IDNOTA`),
  CONSTRAINT `FK_R019_NOTAS` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R020_AUTOR` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R021_RECTIFICACIONES` FOREIGN KEY (`GHN_GHNOT_NOTAC_IDNOTA`) REFERENCES `ghnot_notac` (`GHNOT_NOTAC_IDNOTA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HC-002, RF-HC-004, RF-HC-007\nEl autor es un pr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghnot_notac`
--

LOCK TABLES `ghnot_notac` WRITE;
/*!40000 ALTER TABLE `ghnot_notac` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghnot_notac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghpres_presc`
--

DROP TABLE IF EXISTS `ghpres_presc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghpres_presc` (
  `GHPRES_PRESC_IDPRESCRIPCION` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRES_PRESC_PRESCRITAEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHPRES_PRESC_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHPRES_PRESC_OBSERVACIONES` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHPRES_PRESC_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHPRES_PRESC_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHPRES_PRESC_IDPRESCRIPCION`),
  KEY `FK_R054_PRESCRIPCIONES` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R055_PRESCRIPTOR` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R054_PRESCRIPCIONES` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R055_PRESCRIPTOR` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-HC-002, RF-FAR-003\nCabecera de orden terap uti';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghpres_presc`
--

LOCK TABLES `ghpres_presc` WRITE;
/*!40000 ALTER TABLE `ghpres_presc` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghpres_presc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghpro_profe`
--

DROP TABLE IF EXISTS `ghpro_profe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghpro_profe` (
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_NOMBRES` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHPRO_PROFE_APELLIDOS` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHPRO_PROFE_TIPOPROFESIONAL` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHPRO_PROFE_REGISTROPROFESIONAL` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHPRO_PROFE_TELEFONO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHPRO_PROFE_CORREO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHPRO_PROFE_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHPRO_PROFE_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHPRO_PROFE_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHPRO_PROFE_IDPROFESIONAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-CIT-001, RF-HC-001\nIdentidad profesional cl ni';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghpro_profe`
--

LOCK TABLES `ghpro_profe` WRITE;
/*!40000 ALTER TABLE `ghpro_profe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghpro_profe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghprq_procq`
--

DROP TABLE IF EXISTS `ghprq_procq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghprq_procq` (
  `GHPRQ_PROCQ_IDPROCEDIMIENTO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRQ_PROCQ_PROCEDIMIENTOINDICADO` varchar(200) NOT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHPRQ_PROCQ_PROGRAMADODESDE` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHPRQ_PROCQ_PROGRAMADOHASTA` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHPRQ_PROCQ_INICIOREAL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHPRQ_PROCQ_FINREAL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHPRQ_PROCQ_PROCEDIMIENTOREALIZADO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHPRQ_PROCQ_OBSERVACIONES` text COMMENT 'Tipo conceptual: TextoLargo. ',
  `GHPRQ_PROCQ_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHPRQ_PROCQ_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHPRQ_PROCQ_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHPRQ_PROCQ_IDPROCEDIMIENTO`),
  KEY `FK_R092_CIRUGIAS` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R093_RESPONSABLECIRUGIA` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R092_CIRUGIAS` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R093_RESPONSABLECIRUGIA` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-QUI-001, RF-QUI-003\nProgramaci n e intervenci ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghprq_procq`
--

LOCK TABLES `ghprq_procq` WRITE;
/*!40000 ALTER TABLE `ghprq_procq` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghprq_procq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghres_resul`
--

DROP TABLE IF EXISTS `ghres_resul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghres_resul` (
  `GHRES_RESUL_IDRESULTADO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_PARAMETRO_EXAMEN_IDPARAMETRO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_MUESTRA_LABORATORIO_IDMUESTRA` varchar(36) DEFAULT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHRES_RESUL_PROCESADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHRES_RESUL_TIPOVALOR` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHRES_RESUL_VALORREGISTRADO` text NOT NULL COMMENT 'Tipo conceptual: TextoLargo. ',
  `GHRES_RESUL_UNIDADAPLICADA` varchar(40) DEFAULT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHRES_RESUL_REFERENCIAAPLICADA` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHRES_RESUL_METODOAPLICADO` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHRES_RESUL_OBSERVACIONES` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHRES_RESUL_VERSION` int NOT NULL COMMENT 'Tipo conceptual: Entero. ',
  `GHRES_RESUL_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHRES_RESUL_LIBERADOEL` datetime DEFAULT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHRES_RESUL_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHRES_RESUL_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHRES_RESUL_IDRESULTADO`),
  KEY `FK_R081_RESULTADOS` (`GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD`),
  KEY `FK_R082_PARAMETRO` (`GH_PARAMETRO_EXAMEN_IDPARAMETRO`),
  KEY `FK_R083_MUESTRAANALIZADA` (`GH_MUESTRA_LABORATORIO_IDMUESTRA`),
  CONSTRAINT `FK_R081_RESULTADOS` FOREIGN KEY (`GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD`) REFERENCES `gh_item_solicitud_lab` (`GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R082_PARAMETRO` FOREIGN KEY (`GH_PARAMETRO_EXAMEN_IDPARAMETRO`) REFERENCES `gh_parametro_examen` (`GH_PARAMETRO_EXAMEN_IDPARAMETRO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R083_MUESTRAANALIZADA` FOREIGN KEY (`GH_MUESTRA_LABORATORIO_IDMUESTRA`) REFERENCES `gh_muestra_laboratorio` (`GH_MUESTRA_LABORATORIO_IDMUESTRA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-LAB-003, RF-LAB-004, RF-LAB-005\nResultado de u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghres_resul`
--

LOCK TABLES `ghres_resul` WRITE;
/*!40000 ALTER TABLE `ghres_resul` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghres_resul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghsol_solic`
--

DROP TABLE IF EXISTS `ghsol_solic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghsol_solic` (
  `GHSOL_SOLIC_IDSOLICITUD` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHEPI_EPISO_IDEPISODIO` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHPRO_PROFE_IDPROFESIONAL` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GHSOL_SOLIC_SOLICITADAEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHSOL_SOLIC_INSTRUCCIONESCLINICAS` varchar(200) DEFAULT NULL COMMENT 'Tipo conceptual: Texto. ',
  `GHSOL_SOLIC_PRIORIDAD` varchar(40) DEFAULT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHSOL_SOLIC_ESTADO` varchar(40) NOT NULL COMMENT 'Tipo conceptual: Codigo. ',
  `GHSOL_SOLIC_REGISTRADOEL` datetime NOT NULL COMMENT 'Tipo conceptual: FechaHora. ',
  `GHSOL_SOLIC_REGISTRADOPOR` varchar(100) NOT NULL COMMENT 'Tipo conceptual: Responsable. Referencia al responsable de registro; la cuenta existente no se modifica.',
  PRIMARY KEY (`GHSOL_SOLIC_IDSOLICITUD`),
  KEY `FK_R074_SOLICITUDES` (`GHEPI_EPISO_IDEPISODIO`),
  KEY `FK_R075_SOLICITANTELAB` (`GHPRO_PROFE_IDPROFESIONAL`),
  CONSTRAINT `FK_R074_SOLICITUDES` FOREIGN KEY (`GHEPI_EPISO_IDEPISODIO`) REFERENCES `ghepi_episo` (`GHEPI_EPISO_IDEPISODIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R075_SOLICITANTELAB` FOREIGN KEY (`GHPRO_PROFE_IDPROFESIONAL`) REFERENCES `ghpro_profe` (`GHPRO_PROFE_IDPROFESIONAL`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ERS: RF-LAB-001, RF-LAB-002\nCabecera del episodio y pr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghsol_solic`
--

LOCK TABLES `ghsol_solic` WRITE;
/*!40000 ALTER TABLE `ghsol_solic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghsol_solic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peaca_acade`
--

DROP TABLE IF EXISTS `peaca_acade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peaca_acade` (
  `PEACA_CODIGO` int NOT NULL AUTO_INCREMENT,
  `PEPER_CODIGO` char(10) NOT NULL,
  `PEACA_NIVEL` varchar(50) NOT NULL COMMENT 'Bachiller, Tecnólogo, Licenciado...',
  `PEACA_INSTI` varchar(100) NOT NULL COMMENT 'Institución educativa',
  `PEACA_TITUL` varchar(100) NOT NULL COMMENT 'Título obtenido',
  PRIMARY KEY (`PEACA_CODIGO`),
  KEY `FK_ACA_PERSONA` (`PEPER_CODIGO`),
  CONSTRAINT `FK_ACA_PERSONA` FOREIGN KEY (`PEPER_CODIGO`) REFERENCES `peper_perso` (`PEPER_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peaca_acade`
--

LOCK TABLES `peaca_acade` WRITE;
/*!40000 ALTER TABLE `peaca_acade` DISABLE KEYS */;
INSERT INTO `peaca_acade` VALUES (1,'P000000002','Bachiller','Unidad Educativa Manuela Cañizares','Bachiller en Contabilidad'),(2,'P000000002','Licenciado','Universidad Central del Ecuador','Licenciada en Contabilidad'),(5,'P000000003','Tecnólogo','Instituto Tecnológico Quito','Tecnólogo en Redes'),(8,'P000000001','Bachiller','Unidad Educativa Benalcázar','Bachiller en Ciencias'),(9,'P000000001','Licenciado','Escuela Politécnica Nacional','Licenciado en Informática');
/*!40000 ALTER TABLE `peaca_acade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecar_cargo`
--

DROP TABLE IF EXISTS `pecar_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecar_cargo` (
  `PEDEP_CODIGO` char(3) NOT NULL,
  `PECAR_CODIGO` char(3) NOT NULL,
  `PECAR_DESCRI` varchar(50) NOT NULL,
  PRIMARY KEY (`PEDEP_CODIGO`,`PECAR_CODIGO`),
  CONSTRAINT `FK_PR_PEDEP_PECAR` FOREIGN KEY (`PEDEP_CODIGO`) REFERENCES `pedep_depar` (`PEDEP_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para gestionar los cargos que pertenecen a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecar_cargo`
--

LOCK TABLES `pecar_cargo` WRITE;
/*!40000 ALTER TABLE `pecar_cargo` DISABLE KEYS */;
INSERT INTO `pecar_cargo` VALUES ('001','001','Medico Jefe del Departamento'),('001','002','Medico Especialista'),('001','003','Medico General'),('001','004','Medico Residente'),('002','001','Enfermera Jefe'),('002','002','Enfermera Asistencial'),('002','003','Tecnico en Enfermeria'),('003','001','Quimico Farmaceutico'),('003','002','Tecnico en Farmacia'),('004','001','Bioquimico'),('004','002','Tecnico de Laboratorio'),('005','001','Jefe de Administracion'),('005','002','Analista Administrativo'),('005','003','Asistente Administrativo'),('006','001','Jefe de Admision'),('006','002','Admisor'),('007','001','Jefe de Facturacion'),('007','002','Facturador'),('007','003','Cajero');
/*!40000 ALTER TABLE `pecar_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedep_depar`
--

DROP TABLE IF EXISTS `pedep_depar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedep_depar` (
  `PEDEP_CODIGO` char(3) NOT NULL,
  `PEDEP_DESCRI` varchar(50) NOT NULL,
  PRIMARY KEY (`PEDEP_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para gestionar los diferentes departamento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedep_depar`
--

LOCK TABLES `pedep_depar` WRITE;
/*!40000 ALTER TABLE `pedep_depar` DISABLE KEYS */;
INSERT INTO `pedep_depar` VALUES ('001','Medicina'),('002','Departamento de Enfermeria'),('003','Departamento de Farmacia'),('004','Departamento de Laboratorio'),('005','Departamento de Administracion'),('006','Departamento de Admision'),('007','Departamento de Facturacion');
/*!40000 ALTER TABLE `pedep_depar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peesc_estciv`
--

DROP TABLE IF EXISTS `peesc_estciv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peesc_estciv` (
  `PEESC_CODIGO` char(1) NOT NULL,
  `PEESC_DESCRI` varchar(50) NOT NULL,
  PRIMARY KEY (`PEESC_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para gestionar el ESTADO CIVIL de una pers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peesc_estciv`
--

LOCK TABLES `peesc_estciv` WRITE;
/*!40000 ALTER TABLE `peesc_estciv` DISABLE KEYS */;
INSERT INTO `peesc_estciv` VALUES ('C','CASADO'),('D','DIVORCIADO'),('S','SOLTERO'),('U','UNION LIBRE'),('V','VIUDO');
/*!40000 ALTER TABLE `peesc_estciv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pefam_famil`
--

DROP TABLE IF EXISTS `pefam_famil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pefam_famil` (
  `PEFAM_CODIGO` int NOT NULL AUTO_INCREMENT,
  `PEPER_CODIGO` char(10) NOT NULL,
  `PEFAM_PAREN` varchar(20) NOT NULL COMMENT 'Persona: PADRE, MADRE, CONYUGE...',
  `PEFAM_NOMBRE` varchar(100) NOT NULL COMMENT 'Apellidos y nombres',
  `PEFAM_FECNAC` date NOT NULL COMMENT 'Fecha de nacimiento',
  PRIMARY KEY (`PEFAM_CODIGO`),
  KEY `FK_FAM_PERSONA` (`PEPER_CODIGO`),
  CONSTRAINT `FK_FAM_PERSONA` FOREIGN KEY (`PEPER_CODIGO`) REFERENCES `peper_perso` (`PEPER_CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pefam_famil`
--

LOCK TABLES `pefam_famil` WRITE;
/*!40000 ALTER TABLE `pefam_famil` DISABLE KEYS */;
INSERT INTO `pefam_famil` VALUES (1,'P000000002','CONYUGE','GÓMEZ ROJAS PABLO ANDRÉS','1996-04-22'),(2,'P000000002','HIJO/A','GÓMEZ PEREZ EMILIANO','2022-06-11'),(5,'P000000003','HERMANO/A','GÓMEZ GÓMEZ LUIS MATEO','2004-04-03'),(8,'P000000001','PADRE','CHANGO PÉREZ LUIS ALBERTO','1968-02-17'),(9,'P000000001','MADRE','DÍAZ ANA LUCÍA','1971-09-05');
/*!40000 ALTER TABLE `pefam_famil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegen_genero`
--

DROP TABLE IF EXISTS `pegen_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pegen_genero` (
  `PEGEN_CODIGO` char(1) NOT NULL,
  `PEGEN_DESCRI` varchar(50) NOT NULL,
  PRIMARY KEY (`PEGEN_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para gestionar el genero o sexo de una per';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegen_genero`
--

LOCK TABLES `pegen_genero` WRITE;
/*!40000 ALTER TABLE `pegen_genero` DISABLE KEYS */;
INSERT INTO `pegen_genero` VALUES ('F','FEMENINO'),('M','MASCULINO');
/*!40000 ALTER TABLE `pegen_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peper_perso`
--

DROP TABLE IF EXISTS `peper_perso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peper_perso` (
  `PEPER_CODIGO` char(10) NOT NULL,
  `PEGEN_CODIGO` char(1) NOT NULL,
  `PEESC_CODIGO` char(1) DEFAULT NULL,
  `PEPER_APELLI` varchar(50) NOT NULL,
  `PEPER_NOMBRE` varchar(50) NOT NULL,
  `PEPER_FECNAC` date NOT NULL,
  `PEPER_CEDULA` varchar(10) DEFAULT NULL,
  `PEPER_PASAPO` varchar(15) DEFAULT NULL,
  `PEPER_EMAIL` varchar(50) DEFAULT NULL,
  `PEPER_CARFAM` decimal(2,0) NOT NULL,
  `PEPER_FOTO` varchar(100) NOT NULL,
  `PEPER_PESO` decimal(5,2) DEFAULT NULL COMMENT 'Peso en kilogramos',
  `PEPER_TIPSANG` varchar(3) DEFAULT NULL COMMENT 'Tipo de sangre: O+, A-, ...',
  `PEPER_DISC` char(1) NOT NULL,
  PRIMARY KEY (`PEPER_CODIGO`),
  KEY `FK_PR_PEESC_PEPER` (`PEESC_CODIGO`),
  KEY `FK_PR_PEGEN_PEPER` (`PEGEN_CODIGO`),
  CONSTRAINT `FK_PR_PEESC_PEPER` FOREIGN KEY (`PEESC_CODIGO`) REFERENCES `peesc_estciv` (`PEESC_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PR_PEGEN_PEPER` FOREIGN KEY (`PEGEN_CODIGO`) REFERENCES `pegen_genero` (`PEGEN_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para gestionar las personas que haran uso ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peper_perso`
--

LOCK TABLES `peper_perso` WRITE;
/*!40000 ALTER TABLE `peper_perso` DISABLE KEYS */;
INSERT INTO `peper_perso` VALUES ('P000000001','M','S','CHANGO','JOSUE','2003-04-21','0102030405','Admin123','josue.chango@example.com',0,'josue1.jpeg',70.50,'O+','N'),('P000000002','F','C','PEREZ','MARIA','1995-08-20','0987654321',NULL,'maria.perez@example.com',2,'monster1.jpeg',62.30,'A-','N'),('P000000003','M','S','GOMEZ','CARLOS','1988-01-15',NULL,'AB1234567','carlos.gomez@example.com',1,'monster2.jpeg',81.00,'B+','N');
/*!40000 ALTER TABLE `peper_perso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r080_procesamuestra`
--

DROP TABLE IF EXISTS `r080_procesamuestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `r080_procesamuestra` (
  `GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  `GH_MUESTRA_LABORATORIO_IDMUESTRA` varchar(36) NOT NULL COMMENT 'Tipo conceptual: ID. ',
  PRIMARY KEY (`GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD`,`GH_MUESTRA_LABORATORIO_IDMUESTRA`),
  KEY `FK_R080_PROCESAMUESTRA2` (`GH_MUESTRA_LABORATORIO_IDMUESTRA`),
  CONSTRAINT `FK_R080_PROCESAMUESTRA` FOREIGN KEY (`GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD`) REFERENCES `gh_item_solicitud_lab` (`GH_ITEM_SOLICITUD_LAB_IDITEMSOLICITUD`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R080_PROCESAMUESTRA2` FOREIGN KEY (`GH_MUESTRA_LABORATORIO_IDMUESTRA`) REFERENCES `gh_muestra_laboratorio` (`GH_MUESTRA_LABORATORIO_IDMUESTRA`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Por cada MUESTRA_LABORATORIO: 0,n de ITEM_SOLICITUD_LAB. Por';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r080_procesamuestra`
--

LOCK TABLES `r080_procesamuestra` WRITE;
/*!40000 ALTER TABLE `r080_procesamuestra` DISABLE KEYS */;
/*!40000 ALTER TABLE `r080_procesamuestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xeest_estad`
--

DROP TABLE IF EXISTS `xeest_estad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xeest_estad` (
  `XEEST_CODIGO` char(1) NOT NULL,
  `XEEST_DESCRI` varchar(50) NOT NULL,
  PRIMARY KEY (`XEEST_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para gestionar el estado de las difetrente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xeest_estad`
--

LOCK TABLES `xeest_estad` WRITE;
/*!40000 ALTER TABLE `xeest_estad` DISABLE KEYS */;
INSERT INTO `xeest_estad` VALUES ('A','ACTIVO'),('B','BLOQUEADO'),('I','INACTIVO');
/*!40000 ALTER TABLE `xeest_estad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xeopc_opcio`
--

DROP TABLE IF EXISTS `xeopc_opcio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xeopc_opcio` (
  `XEOPC_CODIGO` char(3) NOT NULL,
  `XESIS_CODIGO` char(1) NOT NULL,
  `XEOPC_DESCRI` varchar(100) NOT NULL,
  PRIMARY KEY (`XEOPC_CODIGO`),
  KEY `FK_XR_XESIS_XEOPC` (`XESIS_CODIGO`),
  CONSTRAINT `FK_XR_XESIS_XEOPC` FOREIGN KEY (`XESIS_CODIGO`) REFERENCES `xesis_siste` (`XESIS_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para realizar el registro de las diferente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xeopc_opcio`
--

LOCK TABLES `xeopc_opcio` WRITE;
/*!40000 ALTER TABLE `xeopc_opcio` DISABLE KEYS */;
INSERT INTO `xeopc_opcio` VALUES ('001','S','Inicio'),('002','S','Gestión de usuarios'),('003','S','Gestión de perfiles'),('004','S','Historia clínica');
/*!40000 ALTER TABLE `xeopc_opcio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xeoxp_opcpe`
--

DROP TABLE IF EXISTS `xeoxp_opcpe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xeoxp_opcpe` (
  `XEOPC_CODIGO` char(3) NOT NULL,
  `XEPER_CODIGO` char(8) NOT NULL,
  `XEOXP_FECASI` date NOT NULL,
  `XEOXP_FECRET` date DEFAULT NULL,
  PRIMARY KEY (`XEOPC_CODIGO`,`XEPER_CODIGO`,`XEOXP_FECASI`),
  KEY `FK_XR_XEPER_XEOXP` (`XEPER_CODIGO`),
  CONSTRAINT `FK_XR_XEOPC_XEOXP` FOREIGN KEY (`XEOPC_CODIGO`) REFERENCES `xeopc_opcio` (`XEOPC_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_XR_XEPER_XEOXP` FOREIGN KEY (`XEPER_CODIGO`) REFERENCES `xeper_perfi` (`XEPER_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para llevar el registro de las opciones qu';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xeoxp_opcpe`
--

LOCK TABLES `xeoxp_opcpe` WRITE;
/*!40000 ALTER TABLE `xeoxp_opcpe` DISABLE KEYS */;
INSERT INTO `xeoxp_opcpe` VALUES ('001','ADMIN','2026-11-05',NULL),('001','MEDICO','2026-11-05',NULL),('001','USUARIO','2026-11-05',NULL),('002','ADMIN','2026-11-05',NULL),('003','ADMIN','2026-11-05',NULL),('004','ADMIN','2026-11-05',NULL),('004','MEDICO','2026-11-05',NULL);
/*!40000 ALTER TABLE `xeoxp_opcpe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xeper_perfi`
--

DROP TABLE IF EXISTS `xeper_perfi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xeper_perfi` (
  `XEPER_CODIGO` char(8) NOT NULL,
  `XEPER_DESCRI` varchar(100) NOT NULL,
  `XEPER_OBSER` text,
  PRIMARY KEY (`XEPER_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para realizar la gesti n de los diferentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xeper_perfi`
--

LOCK TABLES `xeper_perfi` WRITE;
/*!40000 ALTER TABLE `xeper_perfi` DISABLE KEYS */;
INSERT INTO `xeper_perfi` VALUES ('ADMIN','Administrador','Acceso total al sistema'),('MEDICO','Médico','Acceso al módulo clínico'),('USUARIO','Usuario','Acceso básico al sistema');
/*!40000 ALTER TABLE `xeper_perfi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xesis_siste`
--

DROP TABLE IF EXISTS `xesis_siste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xesis_siste` (
  `XESIS_CODIGO` char(1) NOT NULL,
  `XESIS_DESCRI` varchar(50) NOT NULL,
  PRIMARY KEY (`XESIS_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para realziar la gesti n de los diferentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xesis_siste`
--

LOCK TABLES `xesis_siste` WRITE;
/*!40000 ALTER TABLE `xesis_siste` DISABLE KEYS */;
INSERT INTO `xesis_siste` VALUES ('S','SIGH');
/*!40000 ALTER TABLE `xesis_siste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xeusu_usuar`
--

DROP TABLE IF EXISTS `xeusu_usuar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xeusu_usuar` (
  `XEUSU_PASWD` varchar(16) NOT NULL,
  `XEEST_CODIGO` char(1) NOT NULL,
  `PEPER_CODIGO` char(10) NOT NULL,
  `XEUSU_FECCRE` datetime NOT NULL,
  `XEUSU_FECMOD` datetime NOT NULL,
  `XEUSU_PIEFIR` varchar(100) NOT NULL,
  PRIMARY KEY (`XEUSU_PASWD`),
  KEY `FK_XR_PEPER_XEUSU` (`PEPER_CODIGO`),
  KEY `FK_XR_XEEST_XEUSU` (`XEEST_CODIGO`),
  CONSTRAINT `FK_XR_PEPER_XEUSU` FOREIGN KEY (`PEPER_CODIGO`) REFERENCES `peper_perso` (`PEPER_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_XR_XEEST_XEUSU` FOREIGN KEY (`XEEST_CODIGO`) REFERENCES `xeest_estad` (`XEEST_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad relacionada para gentionar los usuario que ingrsan a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xeusu_usuar`
--

LOCK TABLES `xeusu_usuar` WRITE;
/*!40000 ALTER TABLE `xeusu_usuar` DISABLE KEYS */;
INSERT INTO `xeusu_usuar` VALUES ('Admin123','A','P000000001','2026-11-05 20:25:46','2026-11-05 20:25:46','firmas/josue.png'),('Bloqueado1','B','P000000003','2026-11-05 20:25:46','2026-11-05 20:25:46','firmas/carlos.png'),('User1234','A','P000000002','2026-11-05 20:25:46','2026-11-05 20:25:46','firmas/maria.png');
/*!40000 ALTER TABLE `xeusu_usuar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xeuxp_usupe`
--

DROP TABLE IF EXISTS `xeuxp_usupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xeuxp_usupe` (
  `XEUSU_PASWD` varchar(16) NOT NULL,
  `XEPER_CODIGO` char(8) NOT NULL,
  `XEUXP_FECASI` date NOT NULL,
  `XEUXP_FECRET` date DEFAULT NULL,
  PRIMARY KEY (`XEUSU_PASWD`,`XEPER_CODIGO`,`XEUXP_FECASI`),
  KEY `FK_XR_XEPER_XEUXP` (`XEPER_CODIGO`),
  CONSTRAINT `FK_XR_XEPER_XEUXP` FOREIGN KEY (`XEPER_CODIGO`) REFERENCES `xeper_perfi` (`XEPER_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_XR_XEUSU_XEUXP` FOREIGN KEY (`XEUSU_PASWD`) REFERENCES `xeusu_usuar` (`XEUSU_PASWD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Entidad utilizada para realizar el registro de los diferente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xeuxp_usupe`
--

LOCK TABLES `xeuxp_usupe` WRITE;
/*!40000 ALTER TABLE `xeuxp_usupe` DISABLE KEYS */;
INSERT INTO `xeuxp_usupe` VALUES ('Admin123','ADMIN','2026-11-05',NULL),('Bloqueado1','USUARIO','2026-11-05',NULL),('User1234','USUARIO','2026-11-05',NULL);
/*!40000 ALTER TABLE `xeuxp_usupe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25 15:30:07
