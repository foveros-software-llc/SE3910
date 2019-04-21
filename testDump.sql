CREATE DATABASE  IF NOT EXISTS `sdg_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `sdg_db`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: sdg_db
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointments` (
  `appointmentid` int(11) NOT NULL AUTO_INCREMENT,
  `AppointmentDate` date NOT NULL,
  `AppointmentStartTime` time NOT NULL,
  `AppointmentEndTime` time NOT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `BankLocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`appointmentid`),
  KEY `fk_cid` (`CustomerId`),
  KEY `fk_lid` (`BankLocationId`),
  CONSTRAINT `fk_cid` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`CustomerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lid` FOREIGN KEY (`BankLocationId`) REFERENCES `banklocations` (`BankLocationId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,'2019-04-01','10:30:00','11:00:00',2,1),(3,'2019-04-03','12:00:00','13:00:00',1,1);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentservices`
--

DROP TABLE IF EXISTS `appointmentservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointmentservices` (
  `AppointmentServiceId` int(11) NOT NULL AUTO_INCREMENT,
  `appointmentid` int(11) DEFAULT NULL,
  `BankLocationServiceId` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AppointmentServiceId`),
  KEY `fk_aid` (`appointmentid`),
  KEY `fk_bls` (`BankLocationServiceId`),
  KEY `fk_sd` (`ServiceId`),
  CONSTRAINT `fk_aid` FOREIGN KEY (`appointmentid`) REFERENCES `appointments` (`appointmentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bls` FOREIGN KEY (`BankLocationServiceId`) REFERENCES `banklocationservices` (`BankLocationServiceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sd` FOREIGN KEY (`ServiceId`) REFERENCES `services` (`ServiceId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentservices`
--

LOCK TABLES `appointmentservices` WRITE;
/*!40000 ALTER TABLE `appointmentservices` DISABLE KEYS */;
INSERT INTO `appointmentservices` VALUES (1,1,1,2),(2,3,2,1);
/*!40000 ALTER TABLE `appointmentservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banklocations`
--

DROP TABLE IF EXISTS `banklocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banklocations` (
  `BankLocationId` int(11) NOT NULL AUTO_INCREMENT,
  `BankStreet` varchar(50) NOT NULL,
  `BankCity` varchar(50) NOT NULL,
  `BankState` varchar(50) NOT NULL,
  `BankZipCode` varchar(50) NOT NULL,
  PRIMARY KEY (`BankLocationId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banklocations`
--

LOCK TABLES `banklocations` WRITE;
/*!40000 ALTER TABLE `banklocations` DISABLE KEYS */;
INSERT INTO `banklocations` VALUES (1,'301 SE MO-291','Lee\'s Summit','Missouri','64063'),(2,'1301 Locust St','Harrisonville','Missouri','64071'),(3,'809 MO-150 Hwy','Lee\'s Summit','Missouri','64082'),(4,'503 NW Hwy 7','Blue Springs','Missouri','64014'),(5,'18700 East 39th St S','Independence','Missouri','64057'),(6,'8200 E 171st St','Belton','Missouri','64012'),(7,'6705 Blue Ridge Blvd','Raytown','Missouri','64133'),(8,'6100 Troost Ave','Kansas City','Missouri','64110'),(9,'6336 Brookside Plaze','Kansas City','Missouri','64113'),(10,'118 W 47th St','Kansas City','Missouri','64112'),(11,'9001 State Line Rd','Kansas City','Missouri','64114'),(12,'13441 State Line Rd','Kansas City','Missouri','64145'),(13,'4006 W 83rd St','Prairie Village','Kansas','66208'),(14,'11405 Nall Ave','Leawood','Kansas','66211'),(15,'9501 Antioch Rd','Overland Park','Kansas','66212'),(16,'8700 Monrovia','Lenexa','Kansas','66215'),(17,'11900 S Strang Line Rd','Olathe','Kansas','66062');
/*!40000 ALTER TABLE `banklocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banklocationservices`
--

DROP TABLE IF EXISTS `banklocationservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banklocationservices` (
  `BankLocationServiceId` int(11) NOT NULL AUTO_INCREMENT,
  `BankLocationId` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`BankLocationServiceId`),
  KEY `fk_sli` (`BankLocationId`),
  KEY `fk_s` (`ServiceId`),
  CONSTRAINT `fk_s` FOREIGN KEY (`ServiceId`) REFERENCES `services` (`ServiceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sli` FOREIGN KEY (`BankLocationId`) REFERENCES `banklocations` (`BankLocationId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banklocationservices`
--

LOCK TABLES `banklocationservices` WRITE;
/*!40000 ALTER TABLE `banklocationservices` DISABLE KEYS */;
INSERT INTO `banklocationservices` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `banklocationservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerappointments`
--

DROP TABLE IF EXISTS `customerappointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customerappointments` (
  `CustomerAppointmentId` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerAppointmentStatus` int(11) NOT NULL COMMENT '0=not completed, 1=completed, 2=canceled',
  `appointmentid` int(11) DEFAULT NULL,
  `AppointmentServiceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerAppointmentId`),
  KEY `fk_app` (`appointmentid`),
  KEY `fk_aps` (`AppointmentServiceId`),
  CONSTRAINT `fk_app` FOREIGN KEY (`appointmentid`) REFERENCES `appointments` (`appointmentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_aps` FOREIGN KEY (`AppointmentServiceId`) REFERENCES `appointmentservices` (`AppointmentServiceId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerappointments`
--

LOCK TABLES `customerappointments` WRITE;
/*!40000 ALTER TABLE `customerappointments` DISABLE KEYS */;
INSERT INTO `customerappointments` VALUES (1,1,1,1),(2,2,3,2);
/*!40000 ALTER TABLE `customerappointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerFirstName` varchar(50) NOT NULL,
  `CustomerLastName` varchar(50) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerPhoneNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE KEY `CustomerEmail` (`CustomerEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'bob','smith','bob.smith@gmail.com','123'),(2,'bob2','smith2','bob2.smith2@gmail.com','456');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `services` (
  `ServiceId` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`ServiceId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Loans'),(2,'Credit Card'),(3,'Debit Card');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-17 12:36:53
