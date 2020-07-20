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
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'except','except','','info@except.nl','pbkdf2_sha256$10000$1r8uw4O6R6if$Adg4csQ0xmSlrFKArPBbMChg2Gx7A58AlkeXKQg5oh4=',1,1,1,'2014-10-01 09:24:43','2011-10-10 09:14:03'),(2,'stephi','Stephi','Bartscht','sbartscht@gmail.com','sha1$b4723$6b19bfb73189ebc026f6ba48464400a5339840cc',0,0,0,'2011-11-09 15:45:29','2011-10-10 11:56:36'),(3,'tomasz','Tomasz','Kaye','info@redshiftmedia.com','sha1$568c7$57f1e4fc5164c34538c917720d15a0d4bdba2d0d',0,0,0,'2011-10-20 10:55:35','2011-10-10 11:57:37'),(8,'matthew','Matthew','Fraser','matthew.fraser@except.nl','sha1$afe70$1245eae18def41c0dbbd5ed7a5ad60da309277e2',0,0,0,'2012-09-02 13:57:31','2011-11-01 14:57:39'),(5,'imanol','','','','sha1$3782b$2b7d4c3a92ca770f68006b5e17c6853f55571e2b',0,0,0,'2011-11-01 14:29:46','2011-11-01 14:28:55'),(6,'eva','Eva','Gladek','eva@except.nl','sha1$985af$b9c5149e060ff7da95c2c46b296d18e014130b65',0,0,0,'2012-03-03 20:26:39','2011-11-01 14:38:53'),(7,'tom','Tom','Bosschaert','tom@except.nl','pbkdf2_sha256$10000$ywd7fRjLKcFT$e2K4JSy/IgFdf9X9OuYPsepicCIhjCtwEUkOi8ivmw4=',1,1,1,'2014-10-10 10:29:16','2011-11-01 14:49:53'),(9,'natasja','Natasja','Jonckheere','natasja@except.nl','pbkdf2_sha256$10000$HWV95IYXghGr$m4Bg4z7cP2Md9AxSwi36oU3B0IB6WAlp7mrovPtBqAE=',0,0,0,'2012-05-18 13:59:17','2011-11-01 15:06:14'),(10,'marten','','','','pbkdf2_sha256$10000$HUhJuEhK6S74$LGUi9KpyH0L+pkFZqr/JoXdneB+1nSo79Z9XsaH4PiU=',0,0,0,'2013-02-14 16:48:32','2011-11-01 15:09:13'),(11,'tijn','Tijn','Schmits','tijn.schmits@except.nl','pbkdf2_sha256$10000$oFrPIlx3NZND$ux0QmrAuUVfX6uI2xRutb036+B4W0lJ0/Eq4RfqA/jw=',1,1,0,'2014-10-01 09:24:14','2011-11-01 15:12:43'),(12,'elias','Elias','de Valk','elias.de.valk@except.nl','sha1$00076$fa3bb04db9f46fae70610daeb5ad019c675a07d5',0,0,0,'2012-02-23 15:50:51','2012-02-23 15:50:51'),(13,'Alberto','','','','sha1$70831$e5b9055dd6abb1a29ab886627fda908ba3980db3',0,0,0,'2012-02-26 17:58:53','2012-02-26 17:58:53'),(14,'Anteneh','','','','sha1$f52cc$3f420eefbd01122987b21b6edc892f1f68f0323e',1,1,0,'2012-02-26 18:03:19','2012-02-26 18:03:19'),(15,'Ariana','','','','sha1$126a2$84408ccf1ce91299be1fee44c4fea2fafd8d5cea',0,0,0,'2012-02-26 18:07:45','2012-02-26 18:07:45'),(16,'Bob','','','','sha1$63fcd$830826c3dd2c07179a305dad7ec81d7a4fc6cb0a',0,0,0,'2012-07-03 20:01:05','2012-02-26 18:08:33'),(17,'Carlos','','','','sha1$6b770$932c022675b79c668926edf11a64365e5e258edd',0,0,0,'2012-02-26 18:10:52','2012-02-26 18:10:52'),(18,'Floor','','','','sha1$aa33c$bb20e0991a0fc82addf8261704ae317393f8bb2e',0,0,0,'2012-06-16 18:06:11','2012-02-26 18:14:10'),(19,'Gerard','','','','pbkdf2_sha256$10000$fmtgucTGnleg$pMIlWizevAkVITiolUSx0wd4IxTG+X2kRgqbTJata9I=',1,1,0,'2013-06-21 00:22:34','2012-02-26 18:15:22'),(20,'Grey','','','','sha1$f47f6$168abf3aa624743656960fce523bcaa8260d4f1d',0,0,0,'2012-02-26 18:16:36','2012-02-26 18:16:36'),(21,'Jeroen','','','','sha1$1cc7c$d828ef272743c68acdd6b2180a7b6791560ba8af',0,0,0,'2012-02-26 18:48:12','2012-02-26 18:48:12'),(22,'Joseph','','','','sha1$2cc46$bbfa1b0e31d5e62b958ffbf6d48e5d091d730ea6',0,0,0,'2012-06-27 05:47:17','2012-02-26 18:49:33'),(23,'Karin','','','','sha1$a81d2$32b1e88a606f9afc17d9da6992262a6c9f4b2877',0,0,0,'2012-02-26 18:50:44','2012-02-26 18:50:44'),(24,'Luis','','','','sha1$2b8ae$f2393df3c9f3cfdb7fb56bb7e36289f04e17160d',0,0,0,'2012-02-26 19:01:14','2012-02-26 19:01:14'),(25,'Melinda','','','','sha1$2a95d$bf41361df51a3dfa3684e5d9b258f578f36c7368',0,0,0,'2012-02-26 19:25:26','2012-02-26 19:25:26'),(26,'Michiel','','','','pbkdf2_sha256$10000$epQkf2dySlgA$0rjyTsOrjN6zGoi99lprCk8MhMwplmT1pysVKlR1s/I=',1,1,0,'2013-05-28 22:59:12','2012-02-26 19:26:19'),(27,'Piero','','','','sha1$e6ca6$2e5fcb96bb90edf38ea6ca446ced4b89cf1ee22d',1,1,0,'2012-02-26 19:31:13','2012-02-26 19:31:13'),(28,'Tim','','','','sha1$460a6$7c700266d3aa226485672cae53da7a456cdd50b8',1,1,0,'2012-06-22 13:46:56','2012-02-26 19:33:54'),(29,'patrick','','','','sha1$ec709$7decdf1d11eb08bce5b6b9983b2c023d07783cd5',0,0,0,'2012-04-11 17:35:26','2012-04-11 17:35:26'),(30,'pierce','','','','sha1$6729f$35f5b8d5c46de539cb74bc3cbd6654dbc469f79f',1,1,0,'2012-04-11 17:37:58','2012-04-11 17:37:58'),(31,'jacob','Jacob','Verhaart','','sha1$ebf60$950414f002a2b52d010efb6142a5dbcbeea537fb',0,0,0,'2012-05-17 16:19:28','2012-04-11 17:41:42'),(32,'james','','','','sha1$775a2$ea91b6ac08c8d306327f59afd4e44cbb1a324c0b',1,1,0,'2012-04-11 17:45:43','2012-04-11 17:45:43'),(60,'chris','chris','muglia','chris@except.nl','pbkdf2_sha256$10000$MeQ1l2IO6KAE$UJGiDpLs134dB5t3Y+OgYPIRNuCpBhQpk8tXy07RDBQ=',1,1,0,'2014-01-15 23:26:21','2013-10-24 16:34:33'),(33,'freek','','','','sha1$60a1a$4cd1f17bba83451289f0e7f92a229c633648c60e',0,0,0,'2012-07-18 16:58:40','2012-06-05 17:17:13'),(34,'tester','','','','sha1$00eec$9a6b06ec60bd738033bbb1039a884c017e019ddc',1,1,0,'2012-06-21 19:51:44','2012-06-07 13:34:53'),(35,'natalija','Natalija','','','sha1$e75a9$c255687a571267fdd0eb9c0e45925595ac99bf5e',0,0,0,'2012-06-19 12:14:51','2012-06-07 13:55:40'),(36,'jules','Jules','Marshall','','sha1$9e29c$e62ed8e1a066efbcb04cac689dd829f231c67320',0,0,0,'2012-06-13 12:46:03','2012-06-13 12:46:03'),(37,'Arjan','','','','pbkdf2_sha256$10000$H0oI5uRRwrM8$bA9U6Eyx42gIsr4xuQhQYwqC8qIATw/JMF/UURNhN4w=',0,0,0,'2013-09-11 09:13:39','2012-06-22 10:42:30'),(38,'erik','Erik','Westerduin','erik@except.nl','pbkdf2_sha256$10000$mlo6jJhOyzky$wmSwTaYphPay54iwOxfX4hLmaTrRU8KDLBiUu/6u83U=',1,1,0,'2014-07-23 14:35:56','2012-10-19 22:46:06'),(39,'renske','','','','pbkdf2_sha256$10000$9m0xkFCEzbOo$LIf+9XoDY9WopU7uiAisMIPf2Jj8ZSPaWpNLqw9wtQI=',1,1,0,'2013-03-18 12:27:24','2012-12-24 14:35:00'),(40,'noemie','','','','pbkdf2_sha256$10000$l5MvawtsKWyk$SfERjQ0LGCLLKg6JV9IIOKV2Mh8UjpQtTTFQgtEFzCA=',1,1,0,'2013-03-14 15:28:49','2012-12-24 14:35:10'),(41,'merel','','','','pbkdf2_sha256$10000$nqpwBFRwaBU3$NXfHWLnUuBBcXvf07b3uARQ3GB3ZBJxEO7cR/TGPV7w=',1,1,0,'2014-09-09 10:07:27','2012-12-24 14:35:21'),(42,'gijs','Gijs','Broos','gijs@except.nl','pbkdf2_sha256$10000$56JGn2c8sDqm$P+UhptCumRfpf4fWm1wFcmuVE0BS8D2jOyCdshGeV9k=',1,1,0,'2013-01-21 13:14:43','2013-01-21 13:14:43'),(43,'walter','Walter','Faaij','walter@except.nl','pbkdf2_sha256$10000$NKvalA1FP38h$zzqJWNuyX1Rg8UaNnw+FLwu5uat7dOoLes6nkyGOZCM=',1,1,0,'2013-12-09 15:55:44','2013-02-26 17:22:35'),(44,'hidde','Hidde ','van der Lijn','hidde@except.nl','pbkdf2_sha256$10000$RN6z7VCNltsE$BRewkrbSt9RTibGgTSioONx4ay07HtFEHSQtESeWQ4U=',1,1,1,'2014-06-11 13:31:35','2013-03-04 14:58:13'),(46,'hester','','','','pbkdf2_sha256$10000$uiPn3goyPU6k$osBHVMTz+zkm6muazzR51fyPpgd4r6KMNnw0iXfW804=',1,1,0,'2013-04-29 13:11:49','2013-04-02 15:29:57'),(47,'chantal','Chantal','Klaver','chantal@except.nl','pbkdf2_sha256$10000$XDrB7WL6aobZ$MRHIA+ypLvMT1IW7K0T9coGjFxUhRsqXz5H9QBOf9hc=',1,1,0,'2014-09-26 09:19:45','2013-04-22 17:29:42'),(48,'punita','punita','koustubhan','punita@except.nl','pbkdf2_sha256$10000$mzaW963HoiLM$PX01YYkPgI7JEkS99C/UqJFTXAaaOYXsCrE4XwM+u1w=',1,1,0,'2013-05-29 15:26:05','2013-05-08 11:07:44'),(49,'marcos','Marcos','Spinella','','pbkdf2_sha256$10000$0qZEo4fQmkS0$vTm1PSWUyfgJiHmGQnYOWUw9eYmjrFA4NP1j4vtwcCU=',1,1,0,'2013-06-23 07:07:58','2013-06-05 15:03:39'),(50,'elke','','','','pbkdf2_sha256$10000$mYzadKeT3fMF$IsfIRLX1OPSG9HKWoenp+YP1Q0an8Bc802pTxjCXktU=',1,1,0,'2013-12-05 14:45:07','2013-06-12 17:12:18'),(51,'sharon','Sharon','Hesp','sharon.hesp@gmail.com','pbkdf2_sha256$10000$IUGBlzCq5lbL$4/yODrT1AiyNPoIURLGCnn+JGHrQJYjy4iMjhFKuN5s=',0,0,0,'2013-07-04 14:43:17','2013-06-26 14:55:06'),(52,'ivo','ivo','jelinek','','pbkdf2_sha256$10000$KWdEsHpmzmAZ$q1zWZQ/YZX/xdsw58upqfaviFqme2O+Xb74YdBu0TNw=',0,0,0,'2013-07-01 15:06:21','2013-07-01 15:06:21'),(53,'john','John','Harris','john@except.nl','pbkdf2_sha256$10000$aSoDNrnRRpEt$eIxpThmLCCK75FxRLNZFE324jO01Lf1GBOAYOAuBdsk=',0,0,0,'2013-07-09 17:30:02','2013-07-09 17:30:02'),(54,'pedro','Pedro','da Silva','pedro@except.nl','pbkdf2_sha256$10000$HK359LPnUxZj$INe12nnYv4rWeCtD30ZsrxbXLGQcjUIGxBYEfZkYXsc=',1,1,0,'2013-08-06 19:25:16','2013-08-06 19:25:16'),(55,'aki','aernout','aki ackerman','aki@except.nl','pbkdf2_sha256$10000$yP62q1HswYSy$Rqcg8xivRaGrNX90VLlBD5klFb2x0PWzIOYwmevub9M=',1,1,0,'2013-09-12 13:31:09','2013-08-27 16:22:11'),(56,'carmen','carmen','vercauteren','carmen@except.nl','pbkdf2_sha256$10000$IuVUjvaH7ePu$oEutcwyR5Mq3vzUTYpqr7YvG8thNSwXRFZjTfaJEMz8=',1,1,0,'2014-05-07 11:37:50','2013-09-26 12:01:47'),(57,'caroline','caroline','zaoui','caroline@except.nl','pbkdf2_sha256$10000$dc31jSvKrbUn$5u3JiGAUZypg/5ZVPRH5x3yMCTEX4xpXqvfVefdujqs=',1,1,0,'2013-10-23 14:32:02','2013-09-26 12:04:54'),(58,'marta','marta','suanzes','marta@except.nl','pbkdf2_sha256$10000$y2HoQFN4R7t5$dj/s8miQy8cTVjkSzF6+/ypiN6LWdcCAfmGwICPzePM=',1,1,0,'2014-10-02 16:36:21','2013-09-26 15:20:56'),(59,'gina','Georgina','Villarreal Herrara','gina@except.nl','pbkdf2_sha256$10000$cZlIqWV9idFU$tWAsU5WMSueaM2AM1XdVTisH+DRryuJiLXyLBmtsZbs=',0,0,0,'2013-10-02 13:25:12','2013-10-02 12:56:48'),(61,'laurina','laurina','phillip muglia','laurina@except.nl','pbkdf2_sha256$10000$RzpONKbzZM7d$wCNlmcV4zXUpMvYaxOMYYpkfH8zVFFO5iEvYF/xmNqo=',1,1,0,'2014-01-16 23:22:20','2013-10-24 16:35:39'),(62,'gael','','','','pbkdf2_sha256$10000$TWDKVRGI1B8j$r1lzH4h8rFkUfrCEeF3Q3v3ZuIEXxUhs9wm25kdaR8k=',1,1,0,'2014-03-12 11:51:50','2014-02-10 10:54:28'),(63,'roy','Roy','van Pamelen','roy@except.nl','pbkdf2_sha256$10000$fejlvIMkG0rX$072HXewk2d1ZBWI65tM+m8M4GNbqQm7ifwF81ZTyDsE=',1,1,0,'2014-03-13 15:34:22','2014-02-26 11:43:47'),(64,'nash','Natascha','Schuiling','nash@except.nl','pbkdf2_sha256$10000$5rGpvpUsNfcQ$ncntoIeFxrq2vaIvHatVf7L4QMMupQOnC5DYyCbUE4s=',1,1,1,'2014-09-29 21:05:20','2014-05-26 16:54:52'),(65,'rachel','Rachel','Visser','rachel@except.nl','pbkdf2_sha256$10000$h363uzl7X45I$11cuxMOviturFNoCduIkDtDl3BtFoPkvi/7oT4AzcqI=',1,1,0,'2014-07-30 14:34:25','2014-06-10 10:57:37'),(66,'darina','Darina','Kruity','darina@except.nl','pbkdf2_sha256$10000$Vbm1MMQIqJLi$kZgfJP+cURSkwD66SEWYDASF5w4vnAtihiIR2Qk9SX4=',1,1,0,'2014-07-09 17:27:07','2014-07-09 17:27:07');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 21:56:22
