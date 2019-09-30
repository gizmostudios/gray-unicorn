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
-- Table structure for table `main_service_related_services`
--

DROP TABLE IF EXISTS `main_service_related_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_service_related_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_service_id` int(11) NOT NULL,
  `to_service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_service_related_serv_from_service_id_3de6de4fc88bef7c_uniq` (`from_service_id`,`to_service_id`),
  KEY `main_service_related_services_da8c8cec` (`from_service_id`),
  KEY `main_service_related_services_23306c2b` (`to_service_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5651 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_service_related_services`
--

LOCK TABLES `main_service_related_services` WRITE;
/*!40000 ALTER TABLE `main_service_related_services` DISABLE KEYS */;
INSERT INTO `main_service_related_services` VALUES (5646,52,55),(5616,57,123),(4897,165,254),(4173,58,166),(5614,123,2),(5603,57,117),(5407,2,57),(5643,52,306),(5372,143,62),(5384,49,125),(5602,117,143),(5650,55,52),(4900,145,254),(4901,61,254),(5631,54,306),(4890,254,165),(5582,306,53),(5386,143,125),(5414,55,2),(5649,54,52),(5604,2,117),(5647,306,52),(5615,123,117),(5606,143,117),(5599,117,57),(4894,254,61),(5410,2,55),(4119,50,143),(5589,53,306),(5371,49,62),(5648,51,52),(5617,2,123),(4892,254,144),(5373,53,62),(4893,254,145),(3999,161,49),(5618,117,123),(5370,62,165),(5580,306,51),(3007,166,61),(5385,50,125),(4078,50,55),(5613,123,57),(5382,125,50),(4891,254,49),(5645,52,54),(4114,143,50),(5586,143,306),(5577,306,161),(5585,162,306),(3996,49,164),(5633,306,54),(5626,61,167),(5578,306,162),(5367,62,49),(5369,62,53),(5383,125,143),(4113,143,49),(5600,117,2),(5381,125,49),(5625,167,61),(3995,49,161),(4075,55,50),(4896,164,254),(5411,57,2),(5368,62,143),(4889,254,164),(4898,49,254),(4174,166,58),(3003,61,166),(4118,49,143),(4899,144,254),(5374,165,62),(5584,161,306),(5587,51,306),(4000,164,49),(5644,52,51),(5579,306,143);
/*!40000 ALTER TABLE `main_service_related_services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:09
