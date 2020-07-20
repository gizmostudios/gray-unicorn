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
-- Table structure for table `main_project_related_clients`
--

DROP TABLE IF EXISTS `main_project_related_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_project_related_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_project_related_clients_project_id_610946bb59ad5bcd_uniq` (`project_id`,`client_id`),
  KEY `main_project_related_clients_b6620684` (`project_id`),
  KEY `main_project_related_clients_4a4e8ffb` (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=645 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_project_related_clients`
--

LOCK TABLES `main_project_related_clients` WRITE;
/*!40000 ALTER TABLE `main_project_related_clients` DISABLE KEYS */;
INSERT INTO `main_project_related_clients` VALUES (310,78,120),(366,56,242),(633,1,120),(218,12,188),(442,139,141),(280,139,140),(304,65,121),(367,56,142),(568,154,155),(644,172,169),(643,175,177),(287,63,182),(180,69,182),(309,16,185),(311,78,195),(191,12,182),(635,201,177),(286,73,187),(569,219,220),(567,241,242),(363,78,242),(365,56,120),(634,1,242),(638,255,257),(639,255,258),(640,255,259),(641,255,260),(642,255,261),(553,300,186),(622,303,177),(636,325,177),(637,325,326),(621,333,332),(590,329,177);
/*!40000 ALTER TABLE `main_project_related_clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:16
