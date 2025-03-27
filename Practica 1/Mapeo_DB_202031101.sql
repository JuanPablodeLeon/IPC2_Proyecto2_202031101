/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: proyecto2
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Anuncios`
--

DROP TABLE IF EXISTS `Anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Anuncios` (
  `id_anuncio` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `contenido` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `id_marketing` int(11) NOT NULL,
  PRIMARY KEY (`id_anuncio`),
  KEY `id_marketing` (`id_marketing`),
  KEY `idx_anuncios_fecha` (`fecha_inicio`,`fecha_fin`),
  CONSTRAINT `Anuncios_ibfk_1` FOREIGN KEY (`id_marketing`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anuncios`
--

LOCK TABLES `Anuncios` WRITE;
/*!40000 ALTER TABLE `Anuncios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Citas`
--

DROP TABLE IF EXISTS `Citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Citas` (
  `id_cita` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  `motivo_cancelacion` text DEFAULT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_servicio` (`id_servicio`),
  KEY `idx_citas_fecha` (`fecha_hora`),
  CONSTRAINT `Citas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `Citas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `Citas_ibfk_3` FOREIGN KEY (`id_servicio`) REFERENCES `Servicios` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Citas`
--

LOCK TABLES `Citas` WRITE;
/*!40000 ALTER TABLE `Citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados_Servicios`
--

DROP TABLE IF EXISTS `Empleados_Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados_Servicios` (
  `id_empleado` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  PRIMARY KEY (`id_empleado`,`id_servicio`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `Empleados_Servicios_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `Empleados_Servicios_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `Servicios` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados_Servicios`
--

LOCK TABLES `Empleados_Servicios` WRITE;
/*!40000 ALTER TABLE `Empleados_Servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleados_Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas`
--

DROP TABLE IF EXISTS `Facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facturas` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_cita` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_emision` datetime DEFAULT current_timestamp(),
  `metodo_pago` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_cita` (`id_cita`),
  CONSTRAINT `Facturas_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `Citas` (`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas`
--

LOCK TABLES `Facturas` WRITE;
/*!40000 ALTER TABLE `Facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Intereses_Clientes`
--

DROP TABLE IF EXISTS `Intereses_Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Intereses_Clientes` (
  `id_cliente` int(11) NOT NULL,
  `interes` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`,`interes`),
  CONSTRAINT `Intereses_Clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Intereses_Clientes`
--

LOCK TABLES `Intereses_Clientes` WRITE;
/*!40000 ALTER TABLE `Intereses_Clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Intereses_Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lista_Negra`
--

DROP TABLE IF EXISTS `Lista_Negra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lista_Negra` (
  `id_cliente` int(11) NOT NULL,
  `motivo` text DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `Lista_Negra_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lista_Negra`
--

LOCK TABLES `Lista_Negra` WRITE;
/*!40000 ALTER TABLE `Lista_Negra` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lista_Negra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES
(1,'Cliente'),
(2,'Empleado'),
(3,'Administrador'),
(4,'Marketing'),
(5,'Encargado de Servicios');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servicios`
--

DROP TABLE IF EXISTS `Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servicios` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `duracion` int(11) NOT NULL,
  `visible` tinyint(1) DEFAULT 1,
  `ruta_catalogo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `idx_servicios_visible` (`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servicios`
--

LOCK TABLES `Servicios` WRITE;
/*!40000 ALTER TABLE `Servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `dpi` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` text DEFAULT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `Roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-03-27 12:53:13
