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
-- Table structure for table `main_person`
--

DROP TABLE IF EXISTS `main_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `company` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `manager` tinyint(1) NOT NULL DEFAULT '0',
  `role_en` varchar(200) DEFAULT NULL,
  `role_nl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_person_89694383` (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_person`
--

LOCK TABLES `main_person` WRITE;
/*!40000 ALTER TABLE `main_person` DISABLE KEYS */;
INSERT INTO `main_person` VALUES (2,69,'Boris Hocks','Posad Spatial Strategies','','http://www.except.nl/nl/partners/126-posad',0,NULL,NULL),(3,69,'Han Dijk','Posad Spatial Strategies','','http://www.except.nl/nl/partners/126-posad',0,NULL,NULL),(4,142,'Paul Duyts','','Department director Rotterdam North','',0,'Department director Rotterdam North','Bedrijfsdirecteur Rotterdam Noord'),(5,142,'Hilde Postema','','Policymaker Real-Estate','',0,'Policymaker Real-Estate','Beleidsmedewerker Vastgoedbeheer'),(6,142,'Jan-Willem Smid','','Teamleader','',0,'Teamleader','Teamleider'),(7,56,'Stephanie Bartscht','Except Integrated Sustainability','Communication','',0,'Communication','Communicatie'),(8,56,'Hidde van der Lijn','Except Integrated Sustainability','Photography & Visualization','',0,'Photography & Visualization','Fotografie & Visualisatie'),(9,56,'Patrick Bellew','Atelier Ten','Environmental engineering','http://www.at10.co.uk/2011/team/patrick-bellew/',0,'Environmental engineering','Ingenieur'),(10,56,'Han Dijk','Posad','Spatial Strategy','',0,'Spatial Strategy','Ruimtelijke strategie'),(11,56,'Stephanie Carlisle','Except Integrated Sustainability','Environmental Design','',0,'Environmental Design','Environmental Design'),(12,56,'Bart Verhagen','Estrade / Vestia','Client Representative','',0,'Client Representative',NULL),(13,56,'Peter Oei ','InnovatieNetwerk / SiGN','Partner Representative','',0,'Partner Representative',NULL),(14,65,'Nels Nelson','Except Integrated Sustainability','Urban Ecologist','',0,'Urban Ecologist','Urban Ecologist'),(15,65,'Rebecca Blum','Except Integrated Sustainability','Designer','',0,'Designer','Designer'),(16,65,'Nico Langeveld','Except Integrated Sustainability','Designer','',0,'Designer','Designer'),(17,65,'Meredith Davey','Atelier Ten','Engineering','',0,'Engineering','Ingenieur'),(18,65,'Stephanie Bartscht','Except Integrated Sustainability','Communication Design','',0,'Communication Design','Communicatie Ontwerp'),(19,1,'Stephanie Carlisle','Except Integrated Sustainability','','',0,NULL,NULL),(20,1,'Peter Oei','InnovatieNetwork','','',0,NULL,NULL),(21,154,'Frans Koene','TNO','','',0,NULL,NULL),(22,154,'Ernst-Jan Bakker','TNO','','',0,NULL,NULL),(23,154,'Hans Phaff','TNO','','',0,NULL,NULL),(24,154,'Wouter Borsboom','TNO','','',0,NULL,NULL),(25,154,'Ivo Opstelten','SEV','Client Representative','',0,'Client Representative',NULL),(26,154,'Michiel Bakx','SEV','Client Representative','',0,'Client Representative',NULL),(27,154,'Jasper van de Kerkhof','Conciso Communicatie','','',0,NULL,NULL),(28,172,'Daniël van Rijn','NL Agency','client','',0,'client','client'),(29,136,'Rebecca Blum','Except Integrated Sustainability','','',0,NULL,NULL),(30,63,'Noud te Riele','Storrm CS Consultants','','http://www.storrmcs.nl/',0,NULL,NULL),(31,63,'Harry te Riele','Storrm CS Consultants','','http://www.storrmcs.nl/',0,NULL,NULL),(32,67,'Richard Boeser','Sparpweed','','http://www.sparpweed.nl',0,NULL,NULL),(33,14,'Isaac Strachbein','','Architect','http://www.linkedin.com/pub/isaac-strackbein/8/823/985',0,'Architect',NULL),(34,196,'Henrik Rudstrom','Rudstrom Design','','www.uniqueidentifier.net',0,NULL,NULL),(35,78,'Hidde van der Lijn','Lijn 1 Visualisaties','Specializing in flocks of birds and happy dogs.','http://www.lijn1.net',0,'Specializing in flocks of birds and happy dogs.',NULL),(36,201,'Yulia Kryazheva','Yulia Ink','Graphics Designer','http://www.yulia-ink.com/home.html',0,'Graphics Designer',NULL),(37,241,'Peter Oei','SIGN','Opdrachtgever','http://www.innovatieglastuinbouw.nl/',0,'Client','Opdrachtgever'),(38,241,'Peter van Zandvoort','Kelsey\'s o.o.m.','Procesmanager','http://www.kelseys-oom.nl/',0,'Procesmanager','Procesmanager'),(39,241,'Chiel Bartels en Jelle Vedder','Bartels & Vedder','Constructeurs','http://www.bartelsvedder.nl/',0,'Constructional Engineers','Constructeurs'),(40,241,'Jaco van Halen en Peter Brouwer','Van Riessen','Bouwmanagement & Advies','http://www.vanreisen.nl/',0,'Buildingmanagement','Bouwmanagement & Advies'),(46,300,'Jaap Bosch','Eneco ','Project Developer Wind','http://www.linkedin.com/in/jaapbosch',0,'Project Developer Wind','Project Developer Wind'),(47,300,'Rolf Koster','Eneco ','Senior Projectontwikkelaar Wind','http://www.linkedin.com/profile/view?id=44327609&authType=NAME_SEARCH&authToken=Gd23&locale=en_US&srchid=283857481386079886139&srchindex=2&srchtotal=8&trk=vsrp_people_res_name&trkInfo=VSRPsearchId%3A2',0,'Senior Project Developer Wind','Senior Projectontwikkelaar Wind'),(42,255,'John Baken','Overview B.V.','Strategie','http://www.overviewbv.nl/profiel.html',0,'Strategy','Strategie'),(43,255,'Tony Schoen','Ovalen Tafel / New Energy Works','Technische en business case analyse','http://www.new-energy-works.com/',0,'Technical & Business Case Analysis','Technische en business case analyse'),(44,255,'Bart van der Ree','Sustainomy','Strategische en technische ondersteuning','http://sustainomy.biz/profiel/',0,'Strategic and Technical support','Strategische en technische ondersteuning'),(45,255,'Max Oosterhuis','Loyens & Loeff','Jurridische support en specialist \'liberaliseren en privatiseren van energiebedrijven\'','http://www.loyensloeff.com/nl-NL/OurPeople/Pages/OosterhuisMax.aspx',0,'Juridical support and Specialist in privatization of Energy Companies','Jurridische support en specialist \'liberaliseren en privatiseren van energiebedrijven\''),(48,303,'Ben Römgens','DNV','Client','http://www.dnv.nl/onzediensten/advies/kennismanagement_nieuw/team/ben_romgens.asp',0,'Client',NULL),(49,322,'Pam de Sterke','','Project Manager','',1,'Project Manager','Project Manager'),(50,325,'Ben Römgens','DNV','Project manager DNV','http://www.dnv.nl/onzediensten/advies/kennismanagement_nieuw/team/ben_romgens.asp',1,'Project manager DNV','Project manager DNV'),(51,333,'Jacco Beije','Redproc BV','IT Infrastructure Specialist','www.redproc.com',0,'IT Infrastructure Specialist',NULL);
/*!40000 ALTER TABLE `main_person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:10
