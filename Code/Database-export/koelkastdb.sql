-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: koelkastdb
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Drank`
--

DROP TABLE IF EXISTS `Drank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drank` (
  `DrankID` int(11) NOT NULL AUTO_INCREMENT,
  `merk` varchar(100) DEFAULT NULL,
  `type_drank` varchar(100) DEFAULT NULL,
  `naam` varchar(100) DEFAULT NULL,
  `formaat` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`DrankID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drank`
--

LOCK TABLES `Drank` WRITE;
/*!40000 ALTER TABLE `Drank` DISABLE KEYS */;
INSERT INTO `Drank` VALUES (1,'Coca-cola','frisdrank','Cola',33),(2,'Nalu','frisdrank','Nalu',33),(3,'Sprite','frisdrank','Sprite',33);
/*!40000 ALTER TABLE `Drank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sensor`
--

DROP TABLE IF EXISTS `Sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sensor` (
  `sensorID` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(100) DEFAULT NULL,
  `omschrijving` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sensorID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sensor`
--

LOCK TABLES `Sensor` WRITE;
/*!40000 ALTER TABLE `Sensor` DISABLE KEYS */;
INSERT INTO `Sensor` VALUES (1,'Afstandssensor','gescand om'),(2,'Lichtssensor','gescand om'),(3,'Temperatuursensor','gescand om');
/*!40000 ALTER TABLE `Sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gebruikers`
--

DROP TABLE IF EXISTS `gebruikers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gebruikers` (
  `gebruikerID` int(11) NOT NULL AUTO_INCREMENT,
  `gebruikersnaam` varchar(150) NOT NULL,
  `wachtwoord` varchar(150) NOT NULL,
  `emailadres` varchar(150) NOT NULL,
  `voornaam` varchar(45) DEFAULT NULL,
  `achternaam` varchar(45) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`gebruikerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gebruikers`
--

LOCK TABLES `gebruikers` WRITE;
/*!40000 ALTER TABLE `gebruikers` DISABLE KEYS */;
INSERT INTO `gebruikers` VALUES (1,'tanguydhooge','123','tanguy.dhooge@gmail.com','Tanguy','Dhooge','BD 31 15 2B'),(2,'tanguy.dhooge','aba','tanguy.dhooge@gmail.com','Jhon','Cena','22 4A 9C OB'),(3,'Jetski','blabla','tanguy.dhooge@gmail.com','Brooklynn','Boeykens','B2 3A 1C 2B'),(4,'tanguy__dhooge','456','tanguy.dhooge@student.howest.be','Jetski','Dhooge',NULL);
/*!40000 ALTER TABLE `gebruikers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inloghistoriek`
--

DROP TABLE IF EXISTS `inloghistoriek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inloghistoriek` (
  `historiekID` int(11) NOT NULL,
  `gebruikersID` int(11) NOT NULL AUTO_INCREMENT,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`historiekID`),
  KEY `fk_inloghistoriek_gebruikers1_idx` (`gebruikersID`),
  CONSTRAINT `fk_inloghistoriek_gebruikers1` FOREIGN KEY (`gebruikersID`) REFERENCES `gebruikers` (`gebruikerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inloghistoriek`
--

LOCK TABLES `inloghistoriek` WRITE;
/*!40000 ALTER TABLE `inloghistoriek` DISABLE KEYS */;
/*!40000 ALTER TABLE `inloghistoriek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensorData`
--

DROP TABLE IF EXISTS `sensorData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensorData` (
  `sensorDataID` int(11) NOT NULL AUTO_INCREMENT,
  `meetdatum` datetime DEFAULT NULL,
  `drankID` int(11) DEFAULT NULL,
  `sensorID` int(11) DEFAULT NULL,
  `waarde` float DEFAULT NULL,
  PRIMARY KEY (`sensorDataID`),
  KEY `fk_sensorData_Drank1_idx` (`drankID`),
  KEY `fk_sensorData_Afstandssensor1_idx` (`sensorID`),
  CONSTRAINT `fk_sensorData_Afstandssensor1` FOREIGN KEY (`sensorID`) REFERENCES `Sensor` (`sensorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sensorData_Drank1` FOREIGN KEY (`drankID`) REFERENCES `Drank` (`DrankID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensorData`
--

LOCK TABLES `sensorData` WRITE;
/*!40000 ALTER TABLE `sensorData` DISABLE KEYS */;
INSERT INTO `sensorData` VALUES (1,'2021-06-09 16:48:06',1,1,4),(2,'2021-06-09 16:48:06',2,2,850),(3,'2021-06-09 16:48:06',3,3,23.5),(4,'2021-06-09 16:48:06',1,1,4),(5,'2021-06-09 16:48:06',2,2,850),(6,'2021-06-09 16:48:06',3,3,23.5),(7,'2021-06-09 16:48:06',1,1,4),(8,'2021-06-09 16:48:06',2,2,850),(9,'2021-06-09 16:48:06',3,3,23.5),(10,'2021-06-09 16:48:06',1,1,4),(11,'2021-06-09 16:48:06',2,2,850),(12,'2021-06-09 16:48:06',3,3,23.5),(13,'2021-06-09 16:48:06',1,1,4),(14,'2021-06-09 16:48:06',2,2,850),(15,'2021-06-09 16:48:06',3,3,23.5),(16,'2021-06-09 16:48:06',1,1,4),(17,'2021-06-09 16:48:06',2,2,850),(18,'2021-06-09 16:48:06',3,3,23.5),(19,'2021-06-09 16:48:06',1,1,4),(20,'2021-06-09 16:48:06',2,2,850),(21,'2021-06-09 16:48:06',3,3,23.5),(22,'2021-06-09 16:48:06',1,1,4),(23,'2021-06-09 16:48:06',2,2,850),(24,'2021-06-09 16:48:06',3,3,23.5),(25,'2021-06-09 16:48:06',1,1,4),(26,'2021-06-09 16:48:06',2,2,850),(27,'2021-06-09 16:48:06',3,3,23.5),(28,'2021-06-09 16:48:06',1,1,4),(29,'2021-06-09 16:48:06',2,2,850),(30,'2021-06-09 16:48:06',3,3,23.5),(31,'2021-06-09 16:48:06',1,1,4),(32,'2021-06-09 16:48:06',2,2,850),(33,'2021-06-09 16:48:06',3,3,23.5),(34,'2021-06-09 16:48:06',1,1,4),(35,'2021-06-09 16:48:06',2,2,850),(36,'2021-06-09 16:48:06',3,3,23.5),(37,'2021-06-09 16:48:06',1,1,4),(38,'2021-06-09 16:48:06',2,2,850),(39,'2021-06-09 16:48:06',3,3,23.5),(40,'2021-06-09 16:48:06',1,1,4),(41,'2021-06-09 16:48:06',2,2,850),(42,'2021-06-09 16:48:06',3,3,23.5),(43,'2021-06-09 16:48:06',1,1,4),(44,'2021-06-09 16:48:06',2,2,850),(45,'2021-06-09 16:48:06',3,3,23.5),(46,'2021-06-09 16:48:06',1,1,4),(47,'2021-06-09 16:48:06',2,2,850),(48,'2021-06-09 16:48:06',3,3,23.5),(49,'2021-06-09 16:48:06',1,1,4),(50,'2021-06-09 16:48:06',2,2,850),(51,'2021-06-09 16:48:06',3,3,23.5),(52,'2021-06-09 16:48:06',1,1,4),(53,'2021-06-09 16:48:06',2,2,850),(54,'2021-06-09 16:48:06',3,3,23.5),(55,'2021-06-09 16:48:06',1,1,4),(56,'2021-06-09 16:48:06',2,2,850),(57,'2021-06-09 16:48:06',3,3,23.5),(58,'2021-06-09 16:48:06',1,1,4),(59,'2021-06-09 16:48:06',2,2,850),(60,'2021-06-09 16:48:06',3,3,23.5);
/*!40000 ALTER TABLE `sensorData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verbruik`
--

DROP TABLE IF EXISTS `verbruik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verbruik` (
  `verbruikID` int(11) NOT NULL,
  `gebruikersID` int(11) DEFAULT NULL,
  `DrankID` int(11) DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`verbruikID`),
  KEY `fk_verbruik_gebruikers1_idx` (`gebruikersID`),
  KEY `fk_verbruik_Drank1_idx` (`DrankID`),
  CONSTRAINT `fk_verbruik_Drank1` FOREIGN KEY (`DrankID`) REFERENCES `Drank` (`DrankID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_verbruik_gebruikers1` FOREIGN KEY (`gebruikersID`) REFERENCES `gebruikers` (`gebruikerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verbruik`
--

LOCK TABLES `verbruik` WRITE;
/*!40000 ALTER TABLE `verbruik` DISABLE KEYS */;
INSERT INTO `verbruik` VALUES (1,2,2,'2021-06-09 16:43:30'),(2,1,1,'2021-06-09 16:43:30'),(4,3,3,'2021-06-09 16:43:30');
/*!40000 ALTER TABLE `verbruik` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 18:52:40
