-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: django_web
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `main_userprofile`
--

DROP TABLE IF EXISTS `main_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_userprofile` (
  `asset_ptr_id` int(11) NOT NULL,
  `user_type` varchar(1) NOT NULL DEFAULT 'u',
  PRIMARY KEY (`asset_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_userprofile`
--

LOCK TABLES `main_userprofile` WRITE;
/*!40000 ALTER TABLE `main_userprofile` DISABLE KEYS */;
INSERT INTO `main_userprofile` VALUES (64,'x'),(66,'e'),(68,'x'),(70,'x'),(72,'x'),(74,'x'),(76,'a'),(96,'a'),(97,'x'),(98,'x'),(99,'x'),(100,'a'),(101,'a'),(102,'x'),(103,'x'),(104,'m'),(105,'x'),(106,'x'),(107,'x'),(108,'x'),(109,'x'),(110,'x'),(111,'x'),(249,'a'),(113,'a'),(114,'x'),(115,'x'),(116,'a'),(127,'a'),(246,'a'),(170,'x'),(173,'x'),(211,'x'),(214,'a'),(223,'a'),(225,'a'),(226,'a'),(232,'a'),(238,'a'),(240,'e'),(251,'a'),(265,'a'),(270,'a'),(274,'x'),(316,'a'),(315,'a'),(280,'x'),(283,'a'),(287,'a'),(288,'a'),(289,'a'),(290,'a'),(295,'a'),(296,'a'),(337,'a'),(340,'a'),(344,'a');
/*!40000 ALTER TABLE `main_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:14
