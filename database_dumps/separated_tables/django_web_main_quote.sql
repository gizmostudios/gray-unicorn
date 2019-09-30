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
-- Table structure for table `main_quote`
--

DROP TABLE IF EXISTS `main_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `main_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `quote` longtext NOT NULL,
  `quote_en` longtext,
  `quote_nl` longtext,
  `who` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `description_en` varchar(200) DEFAULT NULL,
  `description_nl` varchar(200) DEFAULT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_quote_89694383` (`asset_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_quote`
--

LOCK TABLES `main_quote` WRITE;
/*!40000 ALTER TABLE `main_quote` DISABLE KEYS */;
INSERT INTO `main_quote` VALUES (1,NULL,'Except’s people storm the gates of heaven, work extremely hard and invest unbelievable amounts of energy into solving your problem, making it their own and getting to the bottom of it.','Except’s people storm the gates of heaven, work extremely hard and invest unbelievable amounts of energy into solving your problem, making it their own and getting to the bottom of it.','Except is een club hemelbestormers die gewoon heel hard werkt en met ongelofelijk veel energie met jouw probleem aan de haal gaan. En daar tot op de bodem induiken.','Bart Verhagen','Development Manager, Estrade / Vestia Housing Corporation','Development Manager, Estrade / Vestia Housing Corporation','Onwikkelingsmanager, Estrade / Vestia','http://www.estrade.nl/'),(2,NULL,'Except is a couple of years ahead of other organizations... they are one of the pioneers in this area.','Except is a couple of years ahead of other organizations... they are one of the pioneers in this area.','Except loopt een paar jaar voor op andere organisaties... ze zijn de pioniers op dit gebied.','Paul van de Sande','Sustainability Program Manager, City Government of Roosendaal','Sustainability Program Manager, City Government of Roosendaal','Programmamanager Duurzaamheid, Gemeente Roosendaal','http://www.roosendaal.nl'),(3,NULL,'If you want to know where the future of integrated sustainable area development is heading, take a look at [Except\'s] Schiebroek-Zuid project.','If you want to know where the future of integrated sustainable area development is heading, take a look at [Except\'s] Schiebroek-Zuid project.','Als je wilt weten waar de toekomst van gebieds-ontwikkeling over gaat, duik dan eens in Except\'s visie voor Schiebroek-zuid.','Marion Bakker','Advisor Area Development, NL Agency, Government of the Netherlands','Advisor Area Development, NL Agency, Government of the Netherlands','Adviseur gebiedsontwikkeling, Agentschap NL','http://www.agentschapnl.nl'),(6,196,'Working with Except was inspiring and effective. They quickly delivered beyond our expectations. We look forward to future projects.','Working with Except was inspiring and effective. They quickly delivered beyond our expectations. We look forward to future projects.','Werken met Except was inspirerend en effectief. Ze hebben snel en boven verwachting geleverd. We kijken uit naar toekomstige projecten.','Justin Elicker','Coordinator Community Carbon Fund, Yale University Office of Sustainability','Coordinator Community Carbon Fund, Yale University Office of Sustainability','Coordinator Gemeenschaps Carbon fonds, Yale University','http://sustainability.yale.edu/carbonfund/'),(5,NULL,'I was surprised at how many connections and relations were created for the project. Except is very open to people and connects stakeholders and participants throughout the process.','I was surprised at how many connections and relations were created for the project. Except is very open to people and connects stakeholders and participants throughout the process.','Wat Except heel goed doet is dat ze veel verbindingen proberen te leggen. Ze staan erg open voor mensen en brengen partijen met elkaar in contact.','Bart Verhagen','Development Manager, Estrade / Vestia Housing Corporation','Development Manager, Estrade / Vestia Housing Corporation','Onwikkelingsmanager, Estrade / Vestia','http://www.estrade.nl/'),(7,NULL,'Except is a group of inspired people that works in a very innovative way. With Except\'s integrated approach they work on highly relevant issues, because they also take health and happiness into account, next to economy and ecology.','Except is a group of inspired people that works in a very innovative way. With Except\'s integrated approach they work on highly relevant issues, because they also take health and happiness into account, next to economy and ecology.','Except is een groep bevlogen mensen die heel vernieuwend werkt. Met Except\'s integrale aanpak zijn ze heel relevant in deze tijd, omdat ze ook geluk en gezondheid meenemen, naast economie en ecologie.','Peter Oei','Program director, SIGN / InnovationNetwork','Program director, SIGN / InnovationNetwork','Programmadirecteur SIGN / InnovatieNetwerk','http://www.innovatieglastuinbouw.nl/sign/sign-is-peter/'),(8,NULL,'Except can make a detailed vision, and make it inspiring with images and stories for both professionals and the general public. ','Except can make a detailed vision, and make it inspiring with images and stories for both professionals and the general public. ','Except is heel vaardig in het vertalen van een complexe visie in beeld en verhaal dat zowel professional als leek inspireert.','Ivo Opstelten','Program director SEV','Program director SEV','Programmaregisseur SEV','http://www.sev.nl/over-de-sev/default.asp?code_ond=5'),(9,NULL,'I\'m very satisfied with the work of Except on various projects of Eneco Wind. They collaborate very well during the process and create outstanding work.','I\'m very satisfied with the work of Except on various projects of Eneco Wind. They collaborate very well during the process and create outstanding work.','Ik ben heel erg tevreden met het werk van Except voor de Eneco Wind projecten. Ze werken heel goed samen gedurende het proces en maken uitstekend werk. ','Jaap Bosch','Projectontwikkelaar, Eneco Wind','Projectontwikkelaar, Eneco Wind','Project Developer, Eneco Wind','http://www.linkedin.com/in/jaapbosch'),(11,NULL,'They always give us new perspectives and insights that accelerate our projects.','They always give us new perspectives and insights that accelerate our projects.','Ze komen altijd met nieuwe perspectieven en inzichten, die ons snel stappen verder brengen.','Jaap Bosch','Project Developer, Eneco Wind','Project Developer, Eneco Wind','Projectontwikkelaar, Eneco Wind','http://nl.linkedin.com/in/jaapbosch'),(10,NULL,'We\'ve experienced the collaboration with Except as very positive and inspiring. They really dive into our question and find custom and suitable solutions. They don\'t just deliver a product, but participate in the process and engage the context.\r\n ','We\'ve experienced the collaboration with Except as very positive and inspiring. They really dive into our question and find custom and suitable solutions. They don\'t just deliver a product, but participate in the process and engage the context.\r\n ','Wij hebben de samenwerking met Except als zeer positief en inspirerend ervaren. Zij hebben zich verdiept in onze vraag en daar een passend antwoord op geformuleerd, en leveren daarmee niet alleen een product af, maar denken ook mee over het proces en de context. \r\n ','Gerben in \'t Hout','Program manager Woonstad Housing Association','Program manager Woonstad Housing Association','Programma manager Woonstad','http://www.linkedin.com/in/inthout'),(12,NULL,'Because Except understands both content and communication, they are an ideal partner to work with. Ideas are quickly processed and critically reviewed, the process is fast, and delivers quality.','Because Except understands both content and communication, they are an ideal partner to work with. Ideas are quickly processed and critically reviewed, the process is fast, and delivers quality.','Omdat Except zowel inhoud als communicatie en ontwerp begrijpt zijn ze een ideale partner om mee te werken. Ideeën worden snel opgepakt en kritisch bekeken, en er wordt snel kwaliteit geleverd.','Ben Roemgens ','Principal consultant, DNV','Principal consultant, DNV','Principal consultant, DNV','http://');
/*!40000 ALTER TABLE `main_quote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:17
