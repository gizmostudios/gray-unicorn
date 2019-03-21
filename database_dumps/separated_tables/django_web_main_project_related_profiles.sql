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
-- Table structure for table `main_project_related_profiles`
--

DROP TABLE IF EXISTS `main_project_related_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_project_related_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_project_related_profiles_project_id_5203e746c2c9c76a_uniq` (`project_id`,`userprofile_id`),
  KEY `main_project_related_profiles_b6620684` (`project_id`),
  KEY `main_project_related_profiles_1be3128f` (`userprofile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4773 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_project_related_profiles`
--

LOCK TABLES `main_project_related_profiles` WRITE;
/*!40000 ALTER TABLE `main_project_related_profiles` DISABLE KEYS */;
INSERT INTO `main_project_related_profiles` VALUES (3054,179,76),(4661,333,66),(4769,95,72),(4715,201,66),(4670,154,108),(4755,199,66),(4754,199,64),(4317,154,107),(4742,175,70),(4747,172,74),(2652,196,110),(4660,329,66),(4738,255,108),(4737,255,96),(4725,325,108),(4733,253,173),(4741,175,64),(2525,139,64),(2762,65,64),(4710,1,107),(4762,322,74),(4770,95,66),(4768,95,64),(4325,219,110),(4679,303,66),(4656,300,66),(3248,139,96),(4734,253,214),(4672,179,108),(4654,241,66),(4319,154,74),(2952,56,64),(2630,63,64),(4653,219,66),(4716,201,76),(4708,1,66),(4315,154,104),(4756,199,70),(2765,65,68),(2990,65,107),(4650,196,66),(2956,56,110),(4748,172,99),(4749,172,108),(4649,179,66),(4648,154,66),(4707,1,64),(4709,1,68),(4750,172,101),(4647,139,66),(4771,95,68),(2520,9,64),(4772,95,96),(4645,78,66),(4728,75,66),(4323,219,64),(2785,78,240),(4330,241,173),(4643,69,66),(4642,65,66),(4732,253,66),(4711,1,110),(3246,56,96),(4669,56,108),(3938,300,226),(4641,63,66),(3936,300,238),(3939,300,246),(4680,303,270),(4640,56,66),(4761,322,66),(4639,16,66),(4760,322,64),(4724,325,66),(4675,329,108),(4638,14,66),(4723,325,96),(4722,325,64),(4415,329,106),(4726,325,106),(4637,9,66),(4412,329,96),(4411,329,64),(4609,333,214),(4608,333,76),(4712,1,114),(4606,333,240);
/*!40000 ALTER TABLE `main_project_related_profiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:07