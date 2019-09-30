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
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'agriculture','sec_agriculture'),(3,'education','sec_education'),(4,'communities & social justice','art_communities-social-justice'),(32,'health & wellbeing','art_health-wellbeing'),(54,'cell_guadalajara','cell_guadalajara'),(12,'architecture','architecture'),(52,'cell_utrecht','cell_utrecht'),(50,'communication-visualization','communication-visualization'),(51,'cell_rotterdam','cell_rotterdam'),(47,'communication & tools','art_communication-visualization'),(21,'waste & water','art_waste-water'),(22,'energy','art_energy'),(23,'resource management','art_resource-management'),(26,'cities / built environment','art_cities-built-environment'),(29,'business','sec_business'),(30,'built environment','sec_built-environment'),(31,'industry','sec_industry'),(33,'(urban) agriculture','art_urban-agriculture'),(53,'cell_new_haven','cell_new_haven'),(49,'visual design','visual-design'),(36,'biodiversity & ecosystems','art_biodiversity'),(37,'sustainable economies','art_sustainable-economies'),(38,'governance','sec_art_governance'),(39,'sustainability methodology','art_sustainability-methodology'),(40,'sustainability assessment','ser_sustainability-assesment'),(41,'design & development','ser_design-development'),(42,'strategy','ser_strategy'),(43,'communication','ser_communication'),(45,'signature service','ser_signature-service'),(55,'cell_basel','cell_basel'),(56,'cell_foundation','cell_foundation'),(57,'unlisted','unlisted'),(58,'wormfood','wormfood'),(59,'download','download'),(60,'publication','publication'),(61,'stuffwelove','stuffwelove'),(62,'headlight','headlight'),(63,'sustainable cities','sustainable-cities'),(64,'highlight','highlight'),(65,'health','health'),(67,'hea','hea'),(68,'nolink','nolink'),(69,'gaming','gaming'),(70,'workshops','workshops'),(72,'punita','punita'),(73,'washington','washington'),(74,'snoqualamine','snoqualamine'),(75,'visie','visie'),(76,'masterclass','masterclass'),(77,'workshop','workshop'),(78,'city of tomorrow','city-of-tomorrow'),(79,'talk','talk'),(80,'sustainability','sustainability'),(81,'ecosystem','ecosystem'),(82,'arctic','arctic'),(83,'greenland','greenland'),(84,'Ilulissat','ilulissat'),(85,'fishery','fishery'),(86,'Nuuk','nuuk'),(87,'social housing','social-housing'),(88,'Greenland','greenland_1'),(89,'expedition','expedition'),(90,'social issues','social-issues'),(91,'kennisdeling','kennisdeling'),(92,'gridnight','gridnight'),(93,'knowledge','knowledge'),(94,'cityoftomorrow','cityoftomorrow'),(95,'co-creation','co-creation'),(96,'Design','design'),(97,'bottom up','bottom-up'),(98,'urban development','urban-development'),(99,'visualisation','visualisation'),(100,'grid night','grid-night'),(101,'rebel group','rebel-group'),(102,'ahold','ahold'),(103,'cap gemini','cap-gemini'),(104,'indira','indira'),(105,'pllek','pllek'),(106,'michiel','michiel'),(107,'SWIG card game','swig-card-game'),(108,'wastewater','wastewater'),(109,'MWH Global','mwh-global'),(110,'internship','internship'),(111,'academy','academy'),(112,'except','except'),(113,'systems','systems'),(114,'Academy','academy_1'),(115,'SiD','sid'),(116,'Except','except_1'),(117,'graduate','graduate'),(118,'prj_food','prj_food'),(119,'prj_urban','prj_urban'),(120,'prj_industry','prj_industry'),(121,'prj_tools','prj_tools'),(122,'prj_energy','prj_energy'),(123,'prj_strategy','prj_strategy'),(124,'prj_research','prj_research');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:11
