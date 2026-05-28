-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemapos
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sistemapos`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sistemapos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sistemapos`;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos` (
  `contacto_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '0',
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '0',
  `correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '0',
  `transporte_id` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  PRIMARY KEY (`contacto_id`),
  KEY `pretenece_id` (`transporte_id`) USING BTREE,
  KEY `proveedor_id` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `orden_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `sectorID` int DEFAULT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `autorizada` enum('SI','NO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `activa` enum('SI','NO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `presupuesto_id` int DEFAULT NULL,
  PRIMARY KEY (`orden_id`),
  KEY `sector` (`sectorID`) USING BTREE,
  CONSTRAINT `FK_ordenes_sector` FOREIGN KEY (`sectorID`) REFERENCES `sectores` (`sector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (10,'RULEMAN 32310 2U/ RULEMAN 32313 1U/ RULEMAN 30313 1U',4,3,'2025-04-15 10:48:18','SI','SI',17),(11,'MOTOSIERRA - FP - 150 49.3CC BARRA 20&quot;',1,4,'2025-04-15 12:31:00','SI','SI',18),(12,'NAFTA SUPER POR 20LTS.SECTOR PELETIZADO / MOTOGUADAÑA',20,4,'2025-04-16 14:03:49','SI','SI',19),(13,'RECARGA CARTUCHOS TONER 2 UNIDADES',2,1,'2025-04-16 14:14:09','SI','SI',20),(14,'CORREAS C-79 - PELETIZADO',3,4,'2025-04-17 09:01:07','SI','SI',21),(15,'ESMALTE GRIS RAL7046 X 20 LTS. 2U/ CINTA DE PAPEL 36MM X 50 MTS. 20U/ RODILLO N°22 1U/ LATEX BLANCO X 4LTS. 1U/ PINCEL N°25 1U/ PINCEL N°10 1U (TRABAJOS FALTANTES DE PISO DE PLANTA Y CIELO RASO SECTOR COCINA ADMINISTRACION ',26,10,'2025-04-17 09:27:07','SI','SI',22),(16,'NAFTA SUPER POR 20LTS. P/PINTURA / GASTOS EMPRESA',20,4,'2025-04-17 11:52:30','SI','SI',23),(17,'FILTRO DE AIRE 25100020-001 2U/ FILTRO DE ACEITE 25200007-005 2U/ SEPARADOR 25350030-021 1U/ BIDON ACEITE POR 20LTS SCREW 91346-200/ KIT DE VALVULA DE ADMISION 50780000-013',7,3,'2025-04-17 17:02:01','SI','SI',24),(18,'orden de prueba',2,9,'2025-04-17 23:45:33','SI','NO',25),(19,'CABLE IMPRESORA PC PRODUCCION EN PLANTA 1U/ FICHA RJ45 10U',11,2,'2025-04-21 16:14:20','SI','SI',27),(20,'RODAMIENTO 6205 Z 2 UNIDADES P/SIERRA',2,3,'2025-04-21 16:16:46','SI','SI',28),(21,'RECARGA CARTUCHOS TONER 2 UNIDADES',17000,1,'2025-04-22 14:27:07','SI','SI',29),(22,'PINTURA ALBA X 30LTS. / ENDUIDO INT.1KG/ 3 LIJAS N° 150/ 1 RODILLO LANA NAT. LARGA/ 1 PINCEL N°30/ 1 EXTENSOR (TRABAJOS DPTO.DUOMO)',6,10,'2025-04-22 14:40:07','SI','SI',30),(23,'CAPSULAS CAFE P/MAQUINA DIRECTORIO ',2,10,'2025-04-22 14:50:37','SI','SI',31),(24,'PINTURA BLANCA CIELORRASO QUIMEXUR (DPTO. DUOMO) 10LTS.',10,10,'2025-04-24 09:13:32','SI','SI',32),(25,'ESMALTE DTM SINTEPLAST GRIS RAL 7046 X 20LTS. 2U/ CINTA DE PAPEL 36MM X 50MTS. 20U/ RODILLO GALGO N°22 1U/ LATEX BLANCO X 4LTS. 1U/ PINCEL N°25 1U/ PINCEL N°10 1U (FACT. DE FECHA 16/04/2025)',26,10,'2025-04-24 09:29:58','SI','SI',33),(26,'ZOCALO BLANCO X 2U/ SILICONA PEGADO TOTAL 1U/ (RECAMBIOS DPTO.DUOMO)',3,10,'2025-04-24 09:32:29','SI','SI',34),(27,'ACEITE LUBRICANTE PESADO 15W-40 X 20LTS.',20,3,'2025-04-24 09:33:51','SI','SI',35),(28,'SOPORTE PARA TV 43&quot; DPTO. DUOMO',1,10,'2025-04-24 17:19:27','SI','SI',36),(29,'RECARGA CARTUCHO TONER 1U/ SECTOR PRODUCCION',1,5,'2025-04-25 13:16:59','SI','SI',37),(30,'REPARACION MANGUERAS HCA P/CALIDAD',1,6,'2025-04-25 13:25:53','SI','SI',38),(31,'ARTEF ALUMB PUB LED 150-C 3U/ REF LEDS 200W 4U/ PORTALAMP CERAMIC R EDISON 6U/ PORTAL CERAMIC R GOLIAT 6U/ TUBOS LEDS 18W 120CM 20U/ TUBOS LEDS 36W 240CM 20U/ REF LEDS 100W 4U/ REF LEDS 10W 4U/ LAMP GALPONERAS 30W R GOLIAT 10U/ LAMP GALPONERAS LEDS 30W R EDISON 10U/ CABLE TIPO TALLER 3X1.5 100MTS/ CINTA AISLAD NEGRA 10U/ PRECINT CHICOS/PEQUEÑOS/MEDIANOS/GRANDES 100C/U/ LAMPARAS GALPONERAS 50W ROSCA GOLIAT 5U/ LAMPARAS GALP R EDISON 5U/ RELEVAMIENTO LUMINARIAS ACTA DIGITAL 1010546 REL. LAB.',609,10,'2025-04-30 15:23:21','SI','SI',39),(32,'POLICARBONATO 1MT X 1.80 MT / DESTINO GARITA SEGURIDAD PLAYON ',1,10,'2025-04-30 15:26:32','SI','SI',41),(33,'JABALINA 3/4&amp;quot; 1U/ MORSETO 1U/ CAJA DE INSPECCION ESTANDAR 1U/ CORRESPONDE ACTA DIGITAL 1010546 REL.LAB',3,10,'2025-04-30 15:30:03','SI','SI',44),(34,'RODAMIENTO 6206 2RST SKF 3U/ LINEA DE MALLA',3,3,'2025-05-02 12:24:50','SI','SI',45),(35,'LISTONES PINO ELLIOTS SECO 2&quot;X2&quot;X3MTS. 76 TABLAS P/NATURY NO',76,7,'2025-05-06 14:35:26','SI','SI',46),(36,'ABROCHADORA 2U/ BOLIGOMA 1U/ LAPICERAS AZUL 50U/ LAPICERAS NEGRAS 50U/ CALCULADORA 1U/ CARPETAS TRANSPARENTES 20U/ CINTA ADHESIVA 4U/ CINTA ADESIVA DOBLE FAZ 1U/ CORRECTOR 12U/ CUADERNO ESPIRALADO A4 3U/ MARCADOR NEGRO 12U/ POSTICKS CON ADHESIVO 4U/ PORTA CINTA 4U/ RESALTADOR AMARILLO 12U/ RESALTADOR NARANJA 12U/ RESALTADOR ROSA 12U/ RESMA A4 10U/ ROLLERBALL NEGRA 1U',211,1,'2025-05-07 12:32:39','SI','SI',47),(37,'REPARACION EJE TRASERO AUTOELEVADOR DE PRODUCCION',1,5,'2025-05-07 12:42:13','SI','SI',49),(38,'FLEXIBLE CONEXION P/GAS 1/2&quot; X 42 CM 2U P/MALLA OBSERVADO POR SEG.E HIG. SILICONA ROJA ALTA TEMPERATURA 1U P/ARMADO DE CAJA LINEA 5',3,3,'2025-05-08 11:48:29','SI','SI',50),(39,'TORNILLOS ALLEN M6 DE 15 A 20CM DE LARGO P/SELLADORA 50U/ LLAVES ALLEN 3U/ ALAMBRE P/ATAR ',52,2,'2025-05-08 11:53:57','SI','SI',51),(40,'PAPEL HIGIENICO GAMUZA PACK POR 48U P/ENTREGAR AL PERSONAL X 2PACKS',96,10,'2025-05-08 11:58:04','SI','SI',52),(41,'PALLETS DE 1.70X1.70 2U/ PALLETS DE 2.20X2.20 3U/ PALLETS DE 2.50X2.50 4U PARA NATURGY NO',9,7,'2025-05-09 16:58:19','SI','SI',53),(42,'GARRAFA GAS R410a POR 11.3 Kg 2U/ PARA REPARACION CHILLERS SOLICITADOS POR DASCENZO CLIMATIZACIONES',2,10,'2025-05-09 17:01:38','SI','SI',54),(43,'FLEXIBLE PARA GAS MALLADO DE 1/2&quot; X 80CM 2U/ P/LINEA DE MALLAS OBSERVADO POR SEG.E HIGIENE',2,3,'2025-05-09 17:09:51','SI','SI',55),(44,'CLAVOS ESPIRALADOS DE 3&quot; 3Kg / P/ARMADO DE CAJONES P/NATURGY NO',3,7,'2025-05-09 17:17:49','SI','SI',57),(45,'DISCOS DE CORTE Ø 115 15U',15,3,'2025-05-14 16:13:12','SI','SI',56),(46,'BANDEJAS 3X100 PORTA CABLES PARA TOLVAS 8U/ CUPLA UNION 6U',14,3,'2025-05-15 09:27:52','SI','SI',58),(47,'RODAMIENTOS 6012-2RS P/LINEA 5 2U (1 SKF - 1 TIMKEN)',2,3,'2025-05-15 09:31:17','SI','SI',59),(48,'TEMPORIZADOR ANALOGICO H3CR-A AC100-2 1U/ P/MOLINO',1,4,'2025-05-15 09:36:26','SI','SI',60),(49,'NAFTA SUPER P/FIORINIO BLANCA 45.58 LTS',45,10,'2025-05-15 12:13:35','SI','SI',61),(50,'TEE GALVANIZADA HHH DE 1/2 1U/ TUERCA GALVANIZADA DE 1/2 1U/ NIPLE GALVANIZADO DE 1/2 X 10CM 1U/ CONEXION GALVANIZADA CORTA DE 1/2 1U/ BUJE RED BRONCE MH DE 1/2 X1/4 1U (P/ FERIA EN BUENOS AIRES)',5,3,'2025-05-15 12:24:09','SI','SI',62),(51,'CEPILLOS DE TALADRO CHICO PARA LIMPIEZA DE MATRICERIA 3U',3,2,'2025-05-16 15:08:42','SI','SI',63),(52,'GUANTES MOTEADOS 100 PARES',100,2,'2025-05-16 15:37:33','SI','SI',64),(53,'CORTINA INTERIOR SECTOR OFICINA CALIDAD 1U',1,6,'2025-05-16 15:46:45','SI','SI',65),(54,'ACEITE SOLUBLE P/FRESADORA X 20LTS.',20,3,'2025-05-16 15:51:27','SI','SI',66),(55,'TRAPO X 10 KILOS',10,2,'2025-05-19 13:53:21','SI','SI',67),(56,'REPUESTO TUERCA DE TORNO BOSCH 1U',1,2,'2025-05-19 13:59:37','SI','SI',68),(57,'HORMIGUICIDA FIPRONIL X 5LTS.',5,10,'2025-05-20 12:07:19','SI','SI',69),(58,'BUJE RED BRONCE 1/2 X 1/4MM 2U/ CAÑO DE COBRE DE 5/16 X 3MTS. / CONEXION TANQUE PPP COMPLETO X 1/2&quot; ',7,6,'2025-05-20 14:22:31','SI','SI',70),(59,'COMPRA DE 2 CUBIERTAS 650X10 P/AUTOELEVADIOR LONKING N° 3 2U/ DESARME Y ARMADO CON CAMARA NUEVA 2/9/15 AUTOELEVADOR LATERAL N°4',4,7,'2025-05-20 14:30:06','SI','SI',71),(60,'GASOIL X 1000 LTS.',1000,2,'2025-05-22 14:27:30','SI','SI',72),(61,'RETEN 120-150-12 2U/ RETEN 80-110-10 2U/ RETEN 50-72-10 2U',6,3,'2025-05-22 15:45:55','SI','SI',73),(62,'MANGUERA CORRUGADA ALTA FLEXIBILIDAD 38MM X 30MTS.',30,3,'2025-05-23 11:32:54','SI','SI',74),(63,'CAÑO ESTRUCTURAL DE 30X30X1.6 POR 3U P/MESA DE TRABAJO EN PLANTA / PLANCHUELAS 1/8 POR 10U P/BANDEJAS PARA LAS TOLVAS',13,3,'2025-05-23 11:39:14','SI','SI',75),(64,'BATERIA 12V 70AH P/FIAT FIORINO',1,10,'2025-05-23 11:52:51','SI','SI',76),(65,'NAFTA SUPER X 20LTS.',20,2,'2025-05-28 14:31:36','SI','SI',77),(66,'RECARGA CARTUCHOS TONER 3 UNIDADES',3,1,'2025-05-28 15:27:40','SI','SI',78),(67,'CUADERNOS A4 ESPIRALADOS 4U/ LIBRETA A5 4U/ LIBRETAS A6 4U/ BROCHES P/ABROCHADORA  21/6 3U Y 50 3U/ LIBRO DE ACTAS P/LA GUARDIA 2U/ 20 HOJAS P/PLASTIFICAR',41,1,'2025-05-28 15:41:18','SI','SI',79),(68,'BURLETE ZOCALO DE ALUMINIO PARA PUERTA DE SERVICIO DPTO.DUOMO',1,10,'2025-05-29 14:57:52','SI','SI',80),(69,'LATA MAP/PRO-3600° F 1U',1,3,'2025-05-29 15:05:33','SI','SI',81),(70,'CORREAS B-36 3U/ CADENA N° 80 5MTS',8,2,'2025-05-29 15:08:33','SI','SI',82),(71,'CORREA SPB 2240 PIX 5U',5,2,'2025-05-29 15:09:41','SI','SI',83),(72,'TERMOMETRO 63MM DE 0 A 100° 1U',1,4,'2025-05-29 15:11:32','SI','SI',84),(73,'PICO GRACERA 4 AGARRES 2U',2,3,'2025-05-29 15:20:33','SI','SI',85),(74,'CARRETEL MOTOGUADAÑA 1U',1,4,'2025-06-09 11:13:12','SI','SI',86),(75,'MEDICACION P/&quot;BELTRAN&quot; PARA LOS HUESOS',30,10,'2025-06-09 11:17:03','SI','SI',87),(76,'TONER P/DESPACHO 1U/ MOUSE INHALAMBRICO P/SALA DE REUNIONES 1U/ CABLE P/CAMARA SALA DE REUNIONES 2U/ SOPORTE NETEBOOK P/ADRIANA',5,10,'2025-06-09 11:23:43','SI','SI',88),(77,'ZAPATILLA FUNCIONAL MAUI P/CALIDAD',1,9,'2025-06-09 14:55:09','SI','SI',89),(78,'POLARIZADO INTERMEDIO P/3 VENTANAS DE 40X85 DE LABORATORIO/CALIDAD',3,6,'2025-06-12 10:29:49','SI','SI',90),(79,'PROMO CARNES 3KG ASADO SURTIDO + 1/2 KG CHORIZOS / OBSEQUIO DIA DEL PADRE',28,10,'2025-06-12 10:33:22','SI','SI',91),(80,'10 KG TRAPO ',10,2,'2025-06-13 15:59:31','SI','SI',92),(81,'28 PROMOS 3KG DE ASADO SURTIDO Y 1/2 KG DE CHORIZOS OBSEQUIO DIA DEL PADRE',2,10,'2025-06-13 16:21:27','SI','NO',93),(82,'10 VARILLAS M8/ 40 TUERCAS M8/ 40 ARANDELAS M8 - P/BANDEJAS TOLVAS ',90,3,'2025-06-17 16:25:05','SI','SI',94),(83,'2 RODAMIENTOS 32922/ 2 RETENES 110-130-13',4,3,'2025-06-17 16:30:54','SI','SI',95),(84,'MANGUERA CORRUGADA ALTA FLEXIBILIDAD 50MM X 7MTS. /2 SILICONAS TRANSPARENTES/ 2 LUBRICANTES MULTIUSO',11,4,'2025-06-17 16:36:45','SI','SI',96),(85,'50MTS. CABLE ALTA TEMP. COBRE DE 4MM/ 20 FICHAS GOMA SILICONADA UNIPOLAR COMPLETA',70,2,'2025-06-23 11:09:52','SI','SI',97),(86,'LISTONES PINO ELLIOTS SECO 2&quot;X2&quot;X3MTS. 40 TABLAS P/DESPACHO',40,7,'2025-06-27 09:09:10','SI','SI',98),(87,'RODAMIENTO 6205 2RS SKF 1U/ RODAMIENTO 6206 2RS SKF 1U P/REPARACION BOMBA DE VACIO LINEA 6',2,3,'2025-06-27 09:12:05','SI','SI',99),(88,'BOBINA 24W / SELENOIDE MOD.B83 P/TRITURADOR',1,3,'2025-06-27 09:50:46','SI','SI',100),(89,'1 CANDADO GRANDE P/PORTON DE CALLE FONDO FATEC/ 1 BLISTER DE PILAS AA 6U/ 1/ DESENGRASANTE MULTIUSO',3,2,'2025-07-02 10:18:46','SI','SI',101),(90,'RETEN DBH 8162 2UNIDADES / P/CAJA REDUCTORA LINEA 5',2,3,'2025-07-14 08:51:57','SI','SI',102),(91,'BLISTER HOJA DE CUTER X 10U/ HOJA DE SIERRA BIMETAL 5U',6,2,'2025-07-14 08:59:24','SI','SI',103),(92,'AGUA DESTILADA / DESMINERALIZADA X 40LTS.',40,6,'2025-07-14 09:01:31','SI','SI',104),(93,'HILO PIOLA PLASTICO EN BOBINA P/MALLAS 3U',3,2,'2025-07-14 09:09:10','SI','SI',105),(94,'PAPEL HIGIENICO Y ROLLO DE PAPEL P/COCINA 2 C/U P/ADMINISTRACION',4,1,'2025-07-14 09:12:09','SI','SI',106),(95,'ADAPTADORES DE CORRIENTE Y ZAPATILLA P/DIRECTORIO (DIEGO)',4,10,'2025-07-14 09:14:34','SI','SI',107),(96,'ALMUERZO DIRECTORIO (DIEGO Y CLAUDIO)',2,10,'2025-07-14 09:16:45','SI','SI',108),(97,'PACK DE 12U DE COCA COLA ZERO (CLAUDIO)',12,10,'2025-07-14 09:19:33','SI','SI',109),(98,'TORNILLOS ALLEN M6 DE 15 A 20CM DE LARGO P/SELLADORA 50U/ LLAVES ALLEN 3U/ ALAMBRE P/ATAR ',100,3,'2026-05-27 10:25:20','SI','NO',110);
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenestransporte`
--

DROP TABLE IF EXISTS `ordenestransporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenestransporte` (
  `ordenesT_id` int NOT NULL AUTO_INCREMENT,
  `fecha_transporte` datetime NOT NULL,
  `desde` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `hasta` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `transportista` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `solicitante` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `activa` enum('S','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `presupuesto_id` int DEFAULT NULL,
  PRIMARY KEY (`ordenesT_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenestransporte`
--

LOCK TABLES `ordenestransporte` WRITE;
/*!40000 ALTER TABLE `ordenestransporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenestransporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuesto` (
  `pres_id` int NOT NULL AUTO_INCREMENT,
  `orden_id` int NOT NULL,
  `tienda` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `activo` enum('SI','NO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `seleccionado` enum('S','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`pres_id`),
  KEY `FK__ordenes` (`orden_id`),
  CONSTRAINT `FK__ordenes` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`orden_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuesto`
--

LOCK TABLES `presupuesto` WRITE;
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;
INSERT INTO `presupuesto` VALUES (17,10,'RULEMANES DALMAN ',367380,'SI','S'),(18,11,'SURI FERRETERIA INDUSTRIAL SA ',1,'SI','S'),(19,12,'GNC DEL VALLE',25520,'SI','S'),(20,13,'LCI SAN LUIS SRL FEDETEK ',14900,'SI','S'),(21,14,'SEGADO GOMA',120000,'SI','S'),(22,15,'CASA ALAMO PINTURERIA',565482,'SI','S'),(23,16,'GNC DEL VALLE',25520,'SI','S'),(24,17,'FAMYC S.A. ',1476590,'SI','S'),(25,18,'RULEMANES DALMAN ',120000,'SI','S'),(26,15,'CASA ALAMO PINTURERIA',0.01,'SI','N'),(27,19,'ELECTRONICA LIBIA',8500,'SI','S'),(28,20,'RODAMIENTOS BRASIL',15000,'SI','S'),(29,21,'LCI SAN LUIS SRL FEDETEK ',17000,'SI','S'),(30,22,'PINTOLINDO SUC.REP. DEL LIBANO (ADAN S.A.)',324426,'SI','S'),(31,23,'SUPERMERCADO VEA ',16333.6,'SI','S'),(32,24,'CASA ALAMO PINTURERIA',41254.6,'SI','S'),(33,25,'CASA ALAMO PINTURERIA',565482,'SI','S'),(34,26,'MADERAS ROBERTO GENTILE',22300,'SI','S'),(35,27,'AUTO NAUTICA SUR SRL ',75427.2,'SI','S'),(36,28,'CHANGO MAS HIPERMERCADO',13999,'SI','S'),(37,29,'LCI SAN LUIS SRL FEDETEK ',9500,'SI','S'),(38,30,'OMAR J. ROMERO',80000,'SI','S'),(39,31,'L&amp;amp;B MATERIALES ELECTRICOS ',868609,'SI','S'),(40,31,'ASELEC SRL',1332440,'SI','N'),(41,32,'CORAZA HIERROS',51000,'SI','S'),(42,32,'VIDRIERIA SAN ROQUE (AVDA.LAFINUR)',55000,'SI','N'),(43,33,'L&amp;amp;B MATERIALES ELECTRICOS ',21667.9,'SI','N'),(44,33,'ASELEC SRL',11590,'SI','S'),(45,34,'OMAR J. ROMERO',30300,'SI','S'),(46,35,'MADERAS ROBERTO GENTILE',308603,'SI','S'),(47,36,'PAPELERIA JUNIN ',169422,'SI','S'),(48,36,'PAPELERIA SABINO',205470,'SI','N'),(49,37,'AUTOELEVADORES SAN LUIS SRL (GAUDIO JUAN CARLOS)',923575,'SI','S'),(50,38,'VALENTINI SANITARIOS',92628.4,'SI','S'),(51,39,'BULONERA SANTA FE',22700,'SI','S'),(52,40,'COMISSO SRL',36275.8,'SI','S'),(53,41,'CARMISCIANO LEANDRO MAURO',374400,'SI','S'),(54,42,'CASA ZANABRIA ',338843,'SI','S'),(55,43,'QUIROGAS SRL',10400,'SI','S'),(56,45,'CORAZA HIERROS',27870.7,'SI','S'),(57,44,'FERRETERIA SUR (PRESTI ANTONIO OMAR)',19500,'SI','S'),(58,46,'ASELEC SRL',103025,'SI','S'),(59,47,'OMAR J. ROMERO',92562,'SI','S'),(60,48,'CORPUS S.A.',119799,'SI','S'),(61,49,'GNC DEL VALLE',56975,'SI','S'),(62,50,'QUIROGAS SRL',10349,'SI','S'),(63,51,'BULONERA SANTA FE',16600,'SI','S'),(64,52,'PRODIND ',61880,'SI','S'),(65,53,'ROMERO DAVID ALEJANDRO (LA TERCER ROTONDA)',309600,'SI','S'),(66,54,'25 DE MAYO S.R.L. YPF AGRO',200474,'SI','S'),(67,55,'ALASUR FERRETERIA INDUSTRIAL',60000,'SI','S'),(68,56,'ALFONSO RAMON EL ROOSTER',15000,'SI','S'),(69,57,'TECNOPLANT S.R.L.',519752,'SI','S'),(70,58,'QUIROGAS SRL',26960,'SI','S'),(71,59,'AUTOELEVADORES SAN LUIS SRL (GAUDIO JUAN CARLOS)',455000,'SI','S'),(72,60,'GNC DEL VALLE',1345000,'SI','S'),(73,61,'OMAR J. ROMERO',45800,'SI','S'),(74,62,'ALASUR FERRETERIA INDUSTRIAL',130000,'SI','S'),(75,63,'C.P.A. SRL',125870,'SI','S'),(76,64,'AUTO NAUTICA SUR SRL ',111677,'SI','S'),(77,65,'GNC DEL VALLE',25000,'SI','S'),(78,66,'LCI SAN LUIS SRL FEDETEK ',24000,'SI','S'),(79,67,'PAPELERIA JUNIN ',62800,'SI','S'),(80,68,'EASY SAN LUIS',7475.21,'SI','S'),(81,69,'CASA ZANABRIA ',12900,'SI','S'),(82,70,'SEGADO GOMA',129500,'SI','S'),(83,71,'SEGADO GOMA',160000,'SI','S'),(84,72,'ALASUR FERRETERIA INDUSTRIAL',33057.9,'SI','S'),(85,73,'ALASUR FERRETERIA INDUSTRIAL',19008.3,'SI','S'),(86,74,'CARAVELLO ORNELLA AYELEN',30500,'SI','S'),(87,75,'MASKOTAS SRL',26000,'SI','S'),(88,76,'LCI SAN LUIS SRL FEDETEK ',64900,'SI','S'),(89,77,'PRODIND ',139963,'SI','S'),(90,78,'GRUPO VIEWCOLORS S.A.S.',55000,'SI','S'),(91,79,'DISTRISUR S.R.L.',623336,'SI','S'),(92,80,'ALASUR FERRETERIA INDUSTRIAL',54545.5,'SI','S'),(93,81,'DISTRISUR S.R.L.',623636,'SI','S'),(94,82,'BULONERA SANTA FE',26600,'SI','S'),(95,83,'F.J. SRL (RODAMIENTOS BRASIL - MZA)',330000,'SI','S'),(96,84,'ALASUR FERRETERIA INDUSTRIAL',65785.1,'SI','S'),(97,85,'GRUPO SUR S.A. (GSA) ',291375,'SI','S'),(98,86,'MADERAS ROBERTO GENTILE',117341,'SI','S'),(99,87,'OMAR J. ROMERO',18800,'SI','S'),(100,88,'CAMOZZI AUTOMACION',35000,'SI','S'),(101,89,'ALASUR FERRETERIA INDUSTRIAL',27900,'SI','S'),(102,90,'OMAR J. ROMERO',8000,'SI','S'),(103,91,'BULONERA SANTA FE',19000,'SI','S'),(104,92,'G &amp;amp; L LABORATORIO S.R.L.',17569.2,'SI','S'),(105,93,'S.L. DESCARTABLES Y EMBALAJES S.H.',24864.8,'SI','S'),(106,94,'SUPERMERCADO VEA ',12635.5,'SI','S'),(107,95,'ASELEC SRL',32819,'SI','S'),(108,96,'CROKANTES DE SAN ANDRES S.R.L.',9540,'SI','S'),(109,97,'MINI BODEGA S.A.S.',12444,'SI','S'),(110,98,'OMAR J. ROMERO',100000,'SI','S');
/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuestotransporte`
--

DROP TABLE IF EXISTS `presupuestotransporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuestotransporte` (
  `pres_id` int NOT NULL AUTO_INCREMENT,
  `ordenT_id` int NOT NULL,
  `transporte` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `activo` enum('SI','NO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `seleccionado` enum('S','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`pres_id`),
  KEY `ordenT_id` (`ordenT_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuestotransporte`
--

LOCK TABLES `presupuestotransporte` WRITE;
/*!40000 ALTER TABLE `presupuestotransporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuestotransporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `rubro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `cant_rating` int NOT NULL DEFAULT '0',
  `acum_rating` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (10,'RULEMANES DALMAN ','RODAMIENTOS',2,9),(11,'AUTOELEVADORES SAN LUIS SRL (GAUDIO JUAN CARLOS)','REPUESTOS INSUMOS SERVICE AUTOELEVADORES',2,10),(12,'TECNICA SYD SAN LUIS GOMA','FERRETERIA INDUSTRIAL',0,0),(13,'GNC DEL VALLE','COMBUSTIBLES Y LUBRICANTES',6,30),(14,'AGUILA SEGURITY ','EMPRESA DE SEGURIDAD',0,0),(15,'PRODIND ','INSUMOS DE SEGURIDAD INDUSTRIAL',2,10),(16,'LOGICAL SUPPLY','INSUMOS DE SEGURIDAD INDUSTRIAL',0,0),(17,'RESISTACK FILM','VENTA DE FILM STRECH',0,0),(18,'SANDURI ACEITES','COMBUSTIBLES Y LUBRICANTES',0,0),(19,'CORAZA HIERROS','MATERIALES DE HERRERIA / FERRETERIA',2,10),(20,'RESORTECNICA','VENTA DE RESORTES',0,0),(21,'LCI SAN LUIS SRL FEDETEK ','INSUMOS DE IMPRESORAS Y COMPUTADORAS RECARGA DE TONER',6,30),(22,'EL ROOSTER SAN LUIS ','SERVICE Y REPARACION DE AMOLADORAS',0,0),(23,'SEGADO GOMA','VENTA DE CORREAS Y ARTICULOS DE FERRETRIA VARIOS',4,20),(24,'FRISIA S.A.','INSUMOS DE REFRIGERACION',0,0),(25,'MADERAS ROBERTO GENTILE','MADERERA',3,14),(26,'OMAR J. ROMERO','VENTA DE RODAMIENTOS / FERRETERIA INDUSTRIAL',6,30),(27,'LAS CASA DE LA PISCINA','VENTA DE INSUMOS DE PILETONES',0,0),(28,'EL PELADO DE LAS PISCINAS (LAVALLE)','VENTA DE INSUMOS DE PILETONES',0,0),(29,'CASA ZANABRIA ','REPUESTOS Y ACCESORIOS DE REFRIGERACION',3,15),(30,'ASELEC SRL','VENTA DE INSUMOS DE ELECTRICIDAD',3,15),(31,'PABLO COMPUTACION ','INSUMOS DE ELECTRONICA Y COMPUTACION',0,0),(32,'VILLA DEL SUYUQUE','SERVICIO DE ABASTECIMENTO DE AGUA MINERAL',0,0),(33,'D&#039;ASCENZO CLIMATIZACIONES (ARIEL)','SERVICIO DE MANTENIMIENTO DE CHILLERS',0,0),(34,'BULONERA SANTA FE','BULONERA -  FERRETERIA',5,25),(35,'GOMERIA LA ESTRELLA (BATTI ORNELLA)','GOMERIA',0,0),(36,'SURI FERRETERIA INDUSTRIAL SA ','FERRETERIA INDUSTRIAL',2,10),(37,'CASA ALAMO PINTURERIA','PINTURERIA',4,20),(38,'FAMYC S.A. ','INSUMOS DE COMPRESOR',2,9),(39,'ELECTRONICA LIBIA','ELECTRONICA',1,4),(40,'RODAMIENTOS BRASIL','RODAMIENTOS VARIOS INDUSTRIALES',1,3),(41,'PINTOLINDO SUC.REP. DEL LIBANO (ADAN S.A.)','FERRETERIA INDUSTRIAL Y PINTURERIA',1,5),(42,'SUPERMERCADO VEA ','SUPER',2,9),(43,'AUTO NAUTICA SUR SRL ','VENTA DE LUBRICANTES Y REPUESTOS',2,9),(44,'CHANGO MAS HIPERMERCADO','HIPERMERCADO',1,5),(45,'L&amp;B MATERIALES ELECTRICOS ','VENTA DE MATERIALES ELECTRICOS',0,0),(46,'VIDRIERIA SAN ROQUE (AVDA.LAFINUR)','VIDRIERIA',0,0),(47,'PAPELERIA JUNIN ','PAPELERIA',1,5),(48,'PAPELERIA SABINO','PAPELERIA',0,0),(49,'VALENTINI SANITARIOS','VENTA DE MATERALES P/LA CONSTRUCCION',1,4),(50,'COMISSO SRL','VENTA DE ARTICULOS DE LIMPIEZA',1,5),(51,'CARMISCIANO LEANDRO MAURO','VENTA DE PALLETS A PEDIDO EN VILLA MERCEDES SL',1,5),(52,'QUIROGAS SRL','VENTA DE MATERIALES P/AGUA Y GAS',4,20),(53,'FERRETERIA SUR (PRESTI ANTONIO OMAR)','FERRETERIA',1,4),(54,'CORPUS S.A.','VENTA DE INSUMOS Y MATERIALES ELECTRICOS INDUSTRIALES',1,5),(55,'ROMERO DAVID ALEJANDRO (LA TERCER ROTONDA)','FABRICACION Y COLOCACION DE CORTINAS ROLLERS ',1,5),(56,'25 DE MAYO S.R.L. YPF AGRO','VENTA DE ACEITES Y LUBRICANTES',1,5),(57,'ALASUR FERRETERIA INDUSTRIAL','VENTA DE INSUMOS Y MATERIALES INDUSTRIALES',8,38),(58,'ALFONSO RAMON EL ROOSTER','VENTA DE PIEZAS Y REPARACION DE MAQUINAS ',1,5),(59,'TECNOPLANT S.R.L.','AGROQUIMICOS - FERTILIZANTES - SEMILLAS - LUBRICANTES',2,7),(60,'C.P.A. SRL','METALURGICA',1,5),(61,'EASY SAN LUIS','FERRETERIA GENERAL ',1,4),(62,'CARAVELLO ORNELLA AYELEN','VENTA DE INSUMOS Y REPUESTOS PARA MOTOGUADAÑA',1,3),(63,'MASKOTAS SRL','VETERINARIA',1,5),(64,'GRUPO VIEWCOLORS S.A.S.','IMPRENTA - GRAFICA',2,10),(65,'DISTRISUR S.R.L.','FRIGORIFICO',2,10),(66,'F.J. SRL (RODAMIENTOS BRASIL - MZA)','RODAMIENTOS Y RETENES',1,5),(67,'GRUPO SUR S.A. (GSA) ','COMPONENTES TERMICOS',1,5),(68,'CAMOZZI AUTOMACION','AUTOMACION - ELECTRONICA INDUSTRIAL',1,5),(69,'G &amp; L LABORATORIO S.R.L.','PRODUCTOS VARIOS DE LIMPIEZA Y DE LABORATORIO',0,0),(70,'S.L. DESCARTABLES Y EMBALAJES S.H.','VENTA DE ARTICULOS DESCARTABLES',1,5),(71,'CROKANTES DE SAN ANDRES S.R.L.','PANADERIA',1,3),(72,'MINI BODEGA S.A.S.','VENTA AL POR MAYOR DE BEBIDAS',1,5);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `state` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin','ACTIVO'),(2,'Test','INACTIVO'),(3,'Encargado','ACTIVO');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectores`
--

DROP TABLE IF EXISTS `sectores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectores` (
  `sector_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`sector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectores`
--

LOCK TABLES `sectores` WRITE;
/*!40000 ALTER TABLE `sectores` DISABLE KEYS */;
INSERT INTO `sectores` VALUES (1,'Administración'),(2,'Pañol'),(3,'Mantenimiento'),(4,'Molino de Reciclado'),(5,'Producción'),(6,'Laboratorio / Control de Calidad'),(7,'Logística'),(8,'Arquitecto'),(9,'Talento Humano'),(10,'Empresa (General)');
/*!40000 ALTER TABLE `sectores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporte` (
  `transporte_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT '0',
  `contacto_id` int DEFAULT NULL,
  `acum_rating` int DEFAULT NULL,
  `cant_rating` int DEFAULT NULL,
  PRIMARY KEY (`transporte_id`),
  KEY `contacto_id` (`contacto_id`) USING BTREE,
  CONSTRAINT `contacto` FOREIGN KEY (`contacto_id`) REFERENCES `contactos` (`contacto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporte`
--

LOCK TABLES `transporte` WRITE;
/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `mail` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `intentos` int NOT NULL,
  `status` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `role_id` int NOT NULL DEFAULT '0',
  `img` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `name` (`username`) USING BTREE,
  KEY `FK_user_role` (`role_id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2y$10$uAFoF/pnPBTvXN40W/ehQO58xmppf9Fq3o6LiiMtDPwfuhpbhKWXa','admin@mail.com',1,'ACTIVO',1,NULL),(3,'Gustavo','$2y$10$OXcWtUfZeEj.9A70PhdVyusnoS2HCPtmrQoT.LjdiLD24SPndrqw.','gmaldocena@gmail.com',1,'ACTIVO',3,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sistemapos'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ORDEN`(IN idImportante INT)
BEGIN
	UPDATE ordenes set
	activa = 'NO'
	WHERE orden_id=idImportante;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_ORDEN_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ORDEN_T`(IN idT INT)
BEGIN
	UPDATE ordenestransporte set
	activa = 'N'
	WHERE ordenesT_id=idT;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FILTER_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FILTER_ORDEN`(
	IN `SECTORID` INT
)
SELECT
		ordenes.orden_id,
		ordenes.nombre,
		ordenes.cantidad,
		ordenes.fecha_apertura,
		ordenes.presupuesto_id
	FROM 
		ordenes
	WHERE ordenes.sectorID = SECTORID AND ordenes.activa = 'SI' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FILTER_PRESUPUESTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FILTER_PRESUPUESTO`(
	IN `idP` INT
)
SELECT
		presupuesto.pres_id,
		presupuesto.precio
	FROM 
		presupuesto
	WHERE presupuesto.pres_id = idP ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GET_ROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GET_ROLE`(IN idR INT)
BEGIN
SELECT
	role.nombre
FROM 
	role
WHERE role.role_id = idR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_CONTACTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_CONTACTOS`(
	IN `idProveedor` INT,
	IN `idTransporte` INT
)
SELECT
	contactos.contacto_id,
	contactos.nombre,
	contactos.telefono,
	contactos.correo
FROM 
	contactos
WHERE contactos.proveedor_id=idProveedor
AND contactos.transporte_id=idTransporte ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_ORDENES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_ORDENES`()
SELECT
	ordenes.orden_id,
	ordenes.nombre,
	ordenes.cantidad,
	ordenes.sectorID,
	ordenes.fecha_apertura,
	ordenes.autorizada,
	ordenes.activa,
	ordenes.presupuesto_id
FROM
	ordenes
WHERE ordenes.activa='SI' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_ORDENES_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_ORDENES_T`()
SELECT
	ordenestransporte.ordenesT_id,
	ordenestransporte.solicitante,
	ordenestransporte.fecha_transporte,
	ordenestransporte.desde,
	ordenestransporte.hasta,
	ordenestransporte.transportista,
	ordenestransporte.activa,
	ordenestransporte.presupuesto_id
FROM
	ordenestransporte
WHERE ordenestransporte.activa='S' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_PRESUPUESTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_PRESUPUESTOS`(
	IN `ordenID` INT
)
SELECT
	presupuesto.pres_id,
	presupuesto.orden_id,
	presupuesto.tienda,
	presupuesto.precio,
	presupuesto.seleccionado
FROM 
	presupuesto
WHERE presupuesto.activo='SI'
AND presupuesto.orden_id=ordenID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_PRESUPUESTOS_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_PRESUPUESTOS_T`(
	IN `idT` INT
)
SELECT
	presupuestotransporte.pres_id,
	presupuestotransporte.ordenT_id,
	presupuestotransporte.transporte,
	presupuestotransporte.precio,
	presupuestotransporte.seleccionado
FROM 
	presupuestotransporte
WHERE presupuestotransporte.activo='SI'
AND presupuestotransporte.ordenT_id=idT ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_PROVEEDORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_PROVEEDORES`()
SELECT
		proveedores.proveedor_id,
		proveedores.nombre,
		proveedores.rubro,
		proveedores.cant_rating,
		proveedores.acum_rating
	FROM 
		proveedores ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_ROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_ROLE`()
SELECT
	role.role_id,
	role.nombre,
	role.state
FROM
	role ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_SECTORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_SECTORES`()
SELECT
	sectores.sector_id,
	sectores.nombre
FROM
	sectores ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LIST_TRANSPORTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LIST_TRANSPORTES`()
SELECT
	transporte.transporte_id,
	transporte.nombre,
	transporte.cant_rating,
	transporte.acum_rating
FROM 
	transporte ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PRESUPUESTAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PRESUPUESTAR`(
	IN `idO` INT,
	IN `idP` INT
)
BEGIN
	UPDATE ordenes set
	presupuesto_id = idP
	WHERE orden_id=idO;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PRESUPUESTAR_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PRESUPUESTAR_T`(IN idO INT, IN idP INT)
BEGIN
	UPDATE ordenestransporte set
	presupuesto_id = idP
	WHERE ordenesT_id=idO;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTER_CONTACTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTER_CONTACTO`(
	IN `nombreN` VARCHAR(50),
	IN `telefonoN` VARCHAR(50),
	IN `correoN` VARCHAR(100),
	IN `transporteID` INT,
	IN `proveedorID` INT
)
BEGIN
	INSERT INTO contactos(nombre, telefono, correo, transporte_id, proveedor_id)
		VALUES(nombreN, telefonoN, correoN, transporteID, proveedorID);
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTER_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTER_ORDEN`(
	IN `nombreN` VARCHAR(500),
	IN `cantidadN` INT,
	IN `sectorS` INT,
	IN `auth` VARCHAR(10),
	IN `fecha` DATETIME
)
BEGIN
	INSERT INTO ordenes(nombre, cantidad, sectorID, fecha_apertura, autorizada, activa, presupuesto_id)
		VALUES(nombreN,cantidadN,sectorS,fecha,auth, 'SI', 0);
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTER_ORDEN_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTER_ORDEN_T`(IN desdeN VARCHAR(150), IN hastaN VARCHAR(150), IN solicitanteN VARCHAR(150), IN fechaN DATETIME)
BEGIN
	INSERT INTO ordenestransporte(desde, hasta, solicitante, fecha_transporte, activa, presupuesto_id)
		VALUES(desdeN,hastaN,solicitanteN,fechaN, 'S', 0);
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTER_PRESUPUESTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTER_PRESUPUESTOS`(IN ordenID INT, IN tiendaN VARCHAR(50), IN precioN FLOAT)
BEGIN
	INSERT INTO presupuesto(orden_id, tienda, precio, activo, seleccionado)
		VALUES(ordenID, tiendaN, precioN, 'SI', 'N');
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTER_PRESUPUESTOS_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTER_PRESUPUESTOS_T`(
	IN `ordenID` INT,
	IN `transporteN` VARCHAR(150),
	IN `precioN` FLOAT
)
BEGIN
	INSERT INTO presupuestotransporte(ordenT_id, transporte, precio, activo, seleccionado)
		VALUES(ordenID, transporteN, precioN, 'SI', 'N');
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTER_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTER_PROVEEDOR`(
	IN `nombreN` VARCHAR(50),
	IN `rubroN` VARCHAR(100)
)
BEGIN
	INSERT INTO proveedores(nombre,rubro,cant_rating,acum_rating)
		VALUES(nombreN, rubroN, 0, 0);
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTER_ROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTER_ROLE`(
	IN `NROLE` VARCHAR(15)
)
BEGIN
	DECLARE CANT INT;
	SET @CANT:=(SELECT COUNT(*) FROM role WHERE nombre = NROLE);
	IF @CANT = 0 THEN
		INSERT INTO role(nombre, state)VALUES(NROLE,'ACTIVO');
		SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTER_TRANSPORTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTER_TRANSPORTE`(IN nombreN VARCHAR(100))
BEGIN
	INSERT INTO transporte(nombre, contacto_id, cant_rating, acum_rating)
		VALUES(nombreN, null, 0, 0);
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SEARCH_SECTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SEARCH_SECTOR`(IN SECTORID INT)
BEGIN
	SELECT sector_id, nombre
	FROM sectores
	WHERE sector_id = SECTORID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PRESUPUESTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PRESUPUESTO`(
	IN `idP` INT
)
BEGIN
	DECLARE CANT INT;
	SET @CANT:=(SELECT COUNT(*) FROM presupuesto WHERE seleccionado = 'S');
	IF @CANT > 0 THEN
	UPDATE presupuesto set
		seleccionado = 'S'
		WHERE pres_id=idP;
		SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PRESUPUESTO_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PRESUPUESTO_T`(
	IN `idP` INT
)
BEGIN
	DECLARE CANT INT;
	SET @CANT:=(SELECT COUNT(*) FROM presupuestotransporte WHERE seleccionado = 'S');
	IF @CANT > 0 THEN
		SELECT 2;
	ELSE
		UPDATE presupuestotransporte set
		seleccionado = 'S'
		WHERE pres_id=idP;
		SELECT 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UNSELECT_PRESUPUESTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UNSELECT_PRESUPUESTO`(IN idP INT)
BEGIN
	DECLARE CANT INT;
	SET @CANT:=(SELECT COUNT(*) FROM presupuesto WHERE seleccionado = 'S');
	IF @CANT = 0 THEN
		SELECT 2;
	ELSE
		UPDATE presupuesto set
		seleccionado = 'N'
		WHERE pres_id=idP;
		SELECT 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UNSELECT_PRESUPUESTO_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UNSELECT_PRESUPUESTO_T`(IN idP INT)
BEGIN
	DECLARE CANT INT;
	SET @CANT:=(SELECT COUNT(*) FROM presupuestotransporte WHERE seleccionado = 'S');
	IF @CANT = 0 THEN
		SELECT 2;
	ELSE
		UPDATE presupuestotransporte set
		seleccionado = 'N'
		WHERE pres_id=idP;
		SELECT 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_CONTACTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_CONTACTO`(IN idContacto INT, IN nombreN VARCHAR(50), IN telefonoN VARCHAR(50), IN correoN VARCHAR(100))
BEGIN
	UPDATE contactos set
	nombre = nombreN,
   telefono = telefonoN,
   correo = correoN
	WHERE contacto_id=idContacto;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ORDEN`(
	IN `idImportante` INT,
	IN `nombreN` VARCHAR(500),
	IN `cantidadN` INT,
	IN `sectorN` INT,
	IN `auth` VARCHAR(10)
)
BEGIN
	UPDATE ordenes set
	nombre = nombreN,
   cantidad = cantidadN,
   sectorID = sectorN,
   autorizada = auth
	WHERE orden_id=idImportante;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_ORDEN_T` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ORDEN_T`(IN idT INT, IN desdeN VARCHAR(150), IN hastaN VARCHAR(150), IN solicitanteN VARCHAR(150))
BEGIN
	UPDATE ordenestransporte set
	desde = desdeN,
   hasta = hastaN,
   solicitante = solicitanteN
	WHERE ordenesT_id=idT;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_PROVEEDORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_PROVEEDORES`(IN idProv INT ,IN nombreN VARCHAR(50), IN rubroN VARCHAR(100))
BEGIN
	UPDATE proveedores set
	nombre = nombreN,
   rubro = rubroN
	WHERE proveedor_id=idProv;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_ROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ROLE`(
	IN `ID` INT,
	IN `ROLENAME` VARCHAR(15),
	IN `NEWSTATE` VARCHAR(10)
)
BEGIN
	DECLARE CANT INT;
	SET CANT:=(SELECT COUNT(*) FROM role WHERE nombre = ROLENAME);
	IF CANT = 1 THEN
		UPDATE role set
		nombre = ROLENAME,
		state = NEWSTATE
		WHERE role_id=ID;
		SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_TRANSPORTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_TRANSPORTE`(IN idTransporte INT, IN nombreN VARCHAR(100))
BEGIN
	UPDATE transporte set
	nombre = nombreN
	WHERE transporte_id=idTransporte;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VALORAR_PROVEEDORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VALORAR_PROVEEDORES`(IN idProveedor INT, IN acumRating INT, IN cantRating INT)
BEGIN
	UPDATE proveedores set
	acum_rating = acumRating,
   cant_rating = cantRating
	WHERE proveedor_id=idProveedor;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VALORAR_TRANSPORTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VALORAR_TRANSPORTES`(IN idT INT, IN acumRating INT, IN cantRating INT)
BEGIN
	UPDATE transporte set
	acum_rating = acumRating,
   cant_rating = cantRating
	WHERE transporte_id=idT;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VERIFY_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFY_USER`(IN USERNAME VARCHAR(15))
SELECT * FROM user WHERE username = USERNAME ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-28 16:13:32
