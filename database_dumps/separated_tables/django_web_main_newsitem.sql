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
-- Table structure for table `main_newsitem`
--

DROP TABLE IF EXISTS `main_newsitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_newsitem` (
  `asset_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`asset_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_newsitem`
--

LOCK TABLES `main_newsitem` WRITE;
/*!40000 ALTER TABLE `main_newsitem` DISABLE KEYS */;
INSERT INTO `main_newsitem` VALUES (83),(84),(122),(178),(193),(197),(198),(202),(205),(207),(208),(209),(210),(212),(216),(217),(218),(222),(228),(229),(231),(233),(234),(235),(236),(237),(239),(243),(244),(245),(247),(250),(252),(264),(268),(269),(272),(276),(278),(279),(281),(285),(286),(291),(297),(299),(301),(302),(304),(305),(309),(310),(313),(314),(317),(318),(319),(320),(321),(323),(327),(328),(330),(331),(334),(335),(336),(339),(341),(342),(343),(345),(346),(356),(357),(358),(359),(360),(361),(362),(363),(364),(365),(366),(369),(370),(371),(372),(377),(378),(379),(380),(381);
/*!40000 ALTER TABLE `main_newsitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:12
