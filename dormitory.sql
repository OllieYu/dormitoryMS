-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dormitory
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Current Database: `dormitory`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dormitory` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dormitory`;

--
-- Table structure for table `absent`
--

DROP TABLE IF EXISTS `absent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int DEFAULT NULL,
  `dormitory_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `dormitory_admin_id` int DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `reason` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absent`
--

LOCK TABLES `absent` WRITE;
/*!40000 ALTER TABLE `absent` DISABLE KEYS */;
INSERT INTO `absent` VALUES (13,1,2,5,16,'2022-04-16','absent'),(14,1,1,1,1,'2022-04-26','absent');
/*!40000 ALTER TABLE `absent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Building 1','Queens street Dormitory Building',16),(2,'Building 2','Ponsonby Dormitory Building',16),(3,'Building 5','Albany Dormitory Building',16);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory`
--

DROP TABLE IF EXISTS `dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `available` int DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES (1,1,'101',4,0,'88230001'),(2,1,'102',4,0,'88230002'),(3,1,'211',4,0,'88230007'),(4,2,'212',6,1,'88230008'),(5,2,'321',8,6,'88230013'),(6,2,'322',10,10,'88230016'),(36,1,'666',6,6,'88136666');
/*!40000 ALTER TABLE `dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory_admin`
--

DROP TABLE IF EXISTS `dormitory_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_admin`
--

LOCK TABLES `dormitory_admin` WRITE;
/*!40000 ALTER TABLE `dormitory_admin` DISABLE KEYS */;
INSERT INTO `dormitory_admin` VALUES (1,'ll','123123','Song','female','13312345678'),(2,'ww','123123','Wang','male','13612345678'),(16,'zz','123123','Zhang','female','13312345678');
/*!40000 ALTER TABLE `dormitory_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moveout`
--

DROP TABLE IF EXISTS `moveout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moveout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(11) DEFAULT NULL,
  `dormitory_id` varchar(50) DEFAULT NULL,
  `reason` varchar(11) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moveout`
--

LOCK TABLES `moveout` WRITE;
/*!40000 ALTER TABLE `moveout` DISABLE KEYS */;
INSERT INTO `moveout` VALUES (17,'18','4','graduated','2022-04-27');
/*!40000 ALTER TABLE `moveout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dormitory_id` int DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'001','James','male',1,'in-house','2022-04-14'),(2,'002','Robert','male',1,'in-house','2022-04-14'),(3,'003','John','male',1,'in-house','2022-04-14'),(4,'004','Michael','male',1,'in-house','2022-04-14'),(5,'005','David','male',2,'in-house','2022-04-14'),(6,'006','William','female',2,'in-house','2022-04-14'),(7,'007','Richard','male',2,'in-house','2022-04-14'),(8,'008','Joseph','male',2,'in-house','2022-04-14'),(9,'009','Thomas','female',3,'in-house','2022-04-14'),(10,'010','Charles','male',3,'in-house','2022-04-14'),(11,'011','Christopher','male',3,'in-house','2022-04-14'),(12,'012','Daniel','male',3,'in-house','2022-04-14'),(13,'013','Matthew','male',4,'in-house','2022-04-14'),(14,'014','Anthony','male',4,'in-house','2022-04-14'),(15,'015','Mark','male',4,'in-house','2022-04-14'),(16,'016','Donald','female',4,'in-house','2022-04-14'),(17,'017','Donald','female',4,'in-house','2022-04-14'),(18,'018','Paul','female',4,'moveout','2022-04-14');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_admin`
--

DROP TABLE IF EXISTS `system_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_admin`
--

LOCK TABLES `system_admin` WRITE;
/*!40000 ALTER TABLE `system_admin` DISABLE KEYS */;
INSERT INTO `system_admin` VALUES (1,'admin1','123123','admin1','88132001'),(2,'admin2','123123','admin2','88132002');
/*!40000 ALTER TABLE `system_admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 16:59:42
