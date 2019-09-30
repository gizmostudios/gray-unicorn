-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: except_wagtail
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Editors'),(1,'Moderators');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,1),(6,1,2),(7,1,3),(8,1,4),(12,1,5),(13,1,6),(14,1,7),(1,2,1),(3,2,2),(4,2,3),(5,2,4),(9,2,5),(10,2,6),(11,2,7);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can access Wagtail admin',3,'access_admin'),(2,'Can add document',4,'add_document'),(3,'Can change document',4,'change_document'),(4,'Can delete document',4,'delete_document'),(5,'Can add image',5,'add_image'),(6,'Can change image',5,'change_image'),(7,'Can delete image',5,'delete_image'),(8,'Can add home page',2,'add_homepage'),(9,'Can change home page',2,'change_homepage'),(10,'Can delete home page',2,'delete_homepage'),(11,'Can add form submission',6,'add_formsubmission'),(12,'Can change form submission',6,'change_formsubmission'),(13,'Can delete form submission',6,'delete_formsubmission'),(14,'Can add redirect',7,'add_redirect'),(15,'Can change redirect',7,'change_redirect'),(16,'Can delete redirect',7,'delete_redirect'),(17,'Can add embed',8,'add_embed'),(18,'Can change embed',8,'change_embed'),(19,'Can delete embed',8,'delete_embed'),(20,'Can add user profile',9,'add_userprofile'),(21,'Can change user profile',9,'change_userprofile'),(22,'Can delete user profile',9,'delete_userprofile'),(23,'Can add rendition',10,'add_rendition'),(24,'Can change rendition',10,'change_rendition'),(25,'Can delete rendition',10,'delete_rendition'),(26,'Can add query',11,'add_query'),(27,'Can change query',11,'change_query'),(28,'Can delete query',11,'delete_query'),(29,'Can add Query Daily Hits',12,'add_querydailyhits'),(30,'Can change Query Daily Hits',12,'change_querydailyhits'),(31,'Can delete Query Daily Hits',12,'delete_querydailyhits'),(32,'Can add page',1,'add_page'),(33,'Can change page',1,'change_page'),(34,'Can delete page',1,'delete_page'),(35,'Can add group page permission',13,'add_grouppagepermission'),(36,'Can change group page permission',13,'change_grouppagepermission'),(37,'Can delete group page permission',13,'delete_grouppagepermission'),(38,'Can add page revision',14,'add_pagerevision'),(39,'Can change page revision',14,'change_pagerevision'),(40,'Can delete page revision',14,'delete_pagerevision'),(41,'Can add page view restriction',15,'add_pageviewrestriction'),(42,'Can change page view restriction',15,'change_pageviewrestriction'),(43,'Can delete page view restriction',15,'delete_pageviewrestriction'),(44,'Can add site',16,'add_site'),(45,'Can change site',16,'change_site'),(46,'Can delete site',16,'delete_site'),(47,'Can add collection',17,'add_collection'),(48,'Can change collection',17,'change_collection'),(49,'Can delete collection',17,'delete_collection'),(50,'Can add group collection permission',18,'add_groupcollectionpermission'),(51,'Can change group collection permission',18,'change_groupcollectionpermission'),(52,'Can delete group collection permission',18,'delete_groupcollectionpermission'),(53,'Can add collection view restriction',19,'add_collectionviewrestriction'),(54,'Can change collection view restriction',19,'change_collectionviewrestriction'),(55,'Can delete collection view restriction',19,'delete_collectionviewrestriction'),(56,'Can add Tag',20,'add_tag'),(57,'Can change Tag',20,'change_tag'),(58,'Can delete Tag',20,'delete_tag'),(59,'Can add Tagged Item',21,'add_taggeditem'),(60,'Can change Tagged Item',21,'change_taggeditem'),(61,'Can delete Tagged Item',21,'delete_taggeditem'),(62,'Can add log entry',22,'add_logentry'),(63,'Can change log entry',22,'change_logentry'),(64,'Can delete log entry',22,'delete_logentry'),(65,'Can add permission',23,'add_permission'),(66,'Can change permission',23,'change_permission'),(67,'Can delete permission',23,'delete_permission'),(68,'Can add group',24,'add_group'),(69,'Can change group',24,'change_group'),(70,'Can delete group',24,'delete_group'),(71,'Can add user',25,'add_user'),(72,'Can change user',25,'change_user'),(73,'Can delete user',25,'delete_user'),(74,'Can add content type',26,'add_contenttype'),(75,'Can change content type',26,'change_contenttype'),(76,'Can delete content type',26,'delete_contenttype'),(77,'Can add session',27,'add_session'),(78,'Can change session',27,'change_session'),(79,'Can delete session',27,'delete_session'),(80,'Can view home page',2,'view_homepage'),(81,'Can view form submission',6,'view_formsubmission'),(82,'Can view redirect',7,'view_redirect'),(83,'Can view embed',8,'view_embed'),(84,'Can view user profile',9,'view_userprofile'),(85,'Can view document',4,'view_document'),(86,'Can view image',5,'view_image'),(87,'Can view rendition',10,'view_rendition'),(88,'Can view query',11,'view_query'),(89,'Can view Query Daily Hits',12,'view_querydailyhits'),(90,'Can view page',1,'view_page'),(91,'Can view group page permission',13,'view_grouppagepermission'),(92,'Can view page revision',14,'view_pagerevision'),(93,'Can view page view restriction',15,'view_pageviewrestriction'),(94,'Can view site',16,'view_site'),(95,'Can view collection',17,'view_collection'),(96,'Can view group collection permission',18,'view_groupcollectionpermission'),(97,'Can view collection view restriction',19,'view_collectionviewrestriction'),(98,'Can view Tag',20,'view_tag'),(99,'Can view Tagged Item',21,'view_taggeditem'),(100,'Can view log entry',22,'view_logentry'),(101,'Can view permission',23,'view_permission'),(102,'Can view group',24,'view_group'),(103,'Can view user',25,'view_user'),(104,'Can view content type',26,'view_contenttype'),(105,'Can view session',27,'view_session'),(106,'Can add blog index page',28,'add_blogindexpage'),(107,'Can change blog index page',28,'change_blogindexpage'),(108,'Can delete blog index page',28,'delete_blogindexpage'),(109,'Can view blog index page',28,'view_blogindexpage'),(110,'Can add blog page',29,'add_blogpage'),(111,'Can change blog page',29,'change_blogpage'),(112,'Can delete blog page',29,'delete_blogpage'),(113,'Can view blog page',29,'view_blogpage'),(114,'Can add carousel item',30,'add_carouselitem'),(115,'Can change carousel item',30,'change_carouselitem'),(116,'Can delete carousel item',30,'delete_carouselitem'),(117,'Can view carousel item',30,'view_carouselitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$ZimvYjTe8uRH$gJ3Zn3L1DMjasqrZ3DIo1RI0Xiuw4Y3Ads03STuFUps=','2019-04-17 12:31:23.184634',1,'bert','','','bert@gizmostudios.net',1,1,'2019-02-28 21:19:30.698997');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogindexpage`
--

DROP TABLE IF EXISTS `blog_blogindexpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_blogindexpage` (
  `page_ptr_id` int(11) NOT NULL,
  `intro` longtext NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `blog_blogindexpage_page_ptr_id_d87c3ac2_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogindexpage`
--

LOCK TABLES `blog_blogindexpage` WRITE;
/*!40000 ALTER TABLE `blog_blogindexpage` DISABLE KEYS */;
INSERT INTO `blog_blogindexpage` VALUES (374,'<p>All our news will be shown here</p>'),(376,'<p>List of all the projects</p>');
/*!40000 ALTER TABLE `blog_blogindexpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogpage`
--

DROP TABLE IF EXISTS `blog_blogpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_blogpage` (
  `page_ptr_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `intro` varchar(250) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `blog_blogpage_page_ptr_id_1d78e2b7_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogpage`
--

LOCK TABLES `blog_blogpage` WRITE;
/*!40000 ALTER TABLE `blog_blogpage` DISABLE KEYS */;
INSERT INTO `blog_blogpage` VALUES (375,'2019-03-05','Just to see if it will show up!','<p>Not bad gringo. Let&#x27;s move on!</p>');
/*!40000 ALTER TABLE `blog_blogpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (22,'admin','logentry'),(24,'auth','group'),(23,'auth','permission'),(25,'auth','user'),(28,'blog','blogindexpage'),(29,'blog','blogpage'),(26,'contenttypes','contenttype'),(30,'home','carouselitem'),(2,'home','homepage'),(27,'sessions','session'),(20,'taggit','tag'),(21,'taggit','taggeditem'),(3,'wagtailadmin','admin'),(17,'wagtailcore','collection'),(19,'wagtailcore','collectionviewrestriction'),(18,'wagtailcore','groupcollectionpermission'),(13,'wagtailcore','grouppagepermission'),(1,'wagtailcore','page'),(14,'wagtailcore','pagerevision'),(15,'wagtailcore','pageviewrestriction'),(16,'wagtailcore','site'),(4,'wagtaildocs','document'),(8,'wagtailembeds','embed'),(6,'wagtailforms','formsubmission'),(5,'wagtailimages','image'),(10,'wagtailimages','rendition'),(7,'wagtailredirects','redirect'),(11,'wagtailsearch','query'),(12,'wagtailsearch','querydailyhits'),(9,'wagtailusers','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-02-28 21:15:20.695379'),(2,'auth','0001_initial','2019-02-28 21:15:21.052300'),(3,'admin','0001_initial','2019-02-28 21:15:21.154846'),(4,'admin','0002_logentry_remove_auto_add','2019-02-28 21:15:21.164197'),(5,'contenttypes','0002_remove_content_type_name','2019-02-28 21:15:21.226672'),(6,'auth','0002_alter_permission_name_max_length','2019-02-28 21:15:21.265648'),(7,'auth','0003_alter_user_email_max_length','2019-02-28 21:15:21.309939'),(8,'auth','0004_alter_user_username_opts','2019-02-28 21:15:21.321393'),(9,'auth','0005_alter_user_last_login_null','2019-02-28 21:15:21.359097'),(10,'auth','0006_require_contenttypes_0002','2019-02-28 21:15:21.361686'),(11,'auth','0007_alter_validators_add_error_messages','2019-02-28 21:15:21.371438'),(12,'auth','0008_alter_user_username_max_length','2019-02-28 21:15:21.414957'),(13,'auth','0009_alter_user_last_name_max_length','2019-02-28 21:15:21.458682'),(14,'wagtailcore','0001_initial','2019-02-28 21:15:21.965954'),(15,'wagtailcore','0002_initial_data','2019-02-28 21:15:21.968422'),(16,'wagtailcore','0003_add_uniqueness_constraint_on_group_page_permission','2019-02-28 21:15:21.970975'),(17,'wagtailcore','0004_page_locked','2019-02-28 21:15:21.973597'),(18,'wagtailcore','0005_add_page_lock_permission_to_moderators','2019-02-28 21:15:21.976150'),(19,'wagtailcore','0006_add_lock_page_permission','2019-02-28 21:15:21.978562'),(20,'wagtailcore','0007_page_latest_revision_created_at','2019-02-28 21:15:21.981021'),(21,'wagtailcore','0008_populate_latest_revision_created_at','2019-02-28 21:15:21.983591'),(22,'wagtailcore','0009_remove_auto_now_add_from_pagerevision_created_at','2019-02-28 21:15:21.986338'),(23,'wagtailcore','0010_change_page_owner_to_null_on_delete','2019-02-28 21:15:21.988916'),(24,'wagtailcore','0011_page_first_published_at','2019-02-28 21:15:21.991330'),(25,'wagtailcore','0012_extend_page_slug_field','2019-02-28 21:15:21.993895'),(26,'wagtailcore','0013_update_golive_expire_help_text','2019-02-28 21:15:21.996307'),(27,'wagtailcore','0014_add_verbose_name','2019-02-28 21:15:21.998969'),(28,'wagtailcore','0015_add_more_verbose_names','2019-02-28 21:15:22.001477'),(29,'wagtailcore','0016_change_page_url_path_to_text_field','2019-02-28 21:15:22.003800'),(30,'wagtailcore','0017_change_edit_page_permission_description','2019-02-28 21:15:22.015957'),(31,'wagtailcore','0018_pagerevision_submitted_for_moderation_index','2019-02-28 21:15:22.041725'),(32,'wagtailcore','0019_verbose_names_cleanup','2019-02-28 21:15:22.091885'),(33,'wagtailcore','0020_add_index_on_page_first_published_at','2019-02-28 21:15:22.137450'),(34,'wagtailcore','0021_capitalizeverbose','2019-02-28 21:15:23.042039'),(35,'wagtailcore','0022_add_site_name','2019-02-28 21:15:23.065386'),(36,'wagtailcore','0023_alter_page_revision_on_delete_behaviour','2019-02-28 21:15:23.135771'),(37,'wagtailcore','0024_collection','2019-02-28 21:15:23.153712'),(38,'wagtailcore','0025_collection_initial_data','2019-02-28 21:15:23.171230'),(39,'wagtailcore','0026_group_collection_permission','2019-02-28 21:15:23.290740'),(40,'wagtailcore','0027_fix_collection_path_collation','2019-02-28 21:15:23.306021'),(41,'wagtailcore','0024_alter_page_content_type_on_delete_behaviour','2019-02-28 21:15:23.411624'),(42,'wagtailcore','0028_merge','2019-02-28 21:15:23.414813'),(43,'wagtailcore','0029_unicode_slugfield_dj19','2019-02-28 21:15:23.426940'),(44,'wagtailcore','0030_index_on_pagerevision_created_at','2019-02-28 21:15:23.455595'),(45,'wagtailcore','0031_add_page_view_restriction_types','2019-02-28 21:15:23.636709'),(46,'wagtailcore','0032_add_bulk_delete_page_permission','2019-02-28 21:15:23.650283'),(47,'wagtailcore','0033_remove_golive_expiry_help_text','2019-02-28 21:15:23.679868'),(48,'wagtailcore','0034_page_live_revision','2019-02-28 21:15:23.803242'),(49,'wagtailcore','0035_page_last_published_at','2019-02-28 21:15:23.845813'),(50,'wagtailcore','0036_populate_page_last_published_at','2019-02-28 21:15:23.864854'),(51,'wagtailcore','0037_set_page_owner_editable','2019-02-28 21:15:23.987810'),(52,'wagtailcore','0038_make_first_published_at_editable','2019-02-28 21:15:24.002238'),(53,'wagtailcore','0039_collectionviewrestriction','2019-02-28 21:15:24.221513'),(54,'wagtailcore','0040_page_draft_title','2019-02-28 21:15:24.308922'),(55,'home','0001_initial','2019-02-28 21:15:24.348613'),(56,'home','0002_create_homepage','2019-02-28 21:15:24.389703'),(57,'sessions','0001_initial','2019-02-28 21:15:24.412895'),(58,'taggit','0001_initial','2019-02-28 21:15:24.549331'),(59,'taggit','0002_auto_20150616_2121','2019-02-28 21:15:24.570877'),(60,'wagtailadmin','0001_create_admin_access_permissions','2019-02-28 21:15:24.606286'),(61,'wagtaildocs','0001_initial','2019-02-28 21:15:24.669808'),(62,'wagtaildocs','0002_initial_data','2019-02-28 21:15:24.705321'),(63,'wagtaildocs','0003_add_verbose_names','2019-02-28 21:15:24.798552'),(64,'wagtaildocs','0004_capitalizeverbose','2019-02-28 21:15:24.915707'),(65,'wagtaildocs','0005_document_collection','2019-02-28 21:15:24.982090'),(66,'wagtaildocs','0006_copy_document_permissions_to_collections','2019-02-28 21:15:25.014192'),(67,'wagtaildocs','0005_alter_uploaded_by_user_on_delete_action','2019-02-28 21:15:25.103025'),(68,'wagtaildocs','0007_merge','2019-02-28 21:15:25.106745'),(69,'wagtaildocs','0008_document_file_size','2019-02-28 21:15:25.139611'),(70,'wagtailembeds','0001_initial','2019-02-28 21:15:25.183474'),(71,'wagtailembeds','0002_add_verbose_names','2019-02-28 21:15:25.190751'),(72,'wagtailembeds','0003_capitalizeverbose','2019-02-28 21:15:25.195922'),(73,'wagtailforms','0001_initial','2019-02-28 21:15:25.247541'),(74,'wagtailforms','0002_add_verbose_names','2019-02-28 21:15:25.265753'),(75,'wagtailforms','0003_capitalizeverbose','2019-02-28 21:15:25.286776'),(76,'wagtailimages','0001_initial','2019-02-28 21:15:25.471558'),(77,'wagtailimages','0002_initial_data','2019-02-28 21:15:25.557418'),(78,'wagtailimages','0003_fix_focal_point_fields','2019-02-28 21:15:25.593794'),(79,'wagtailimages','0004_make_focal_point_key_not_nullable','2019-02-28 21:15:25.665850'),(80,'wagtailimages','0005_make_filter_spec_unique','2019-02-28 21:15:25.720820'),(81,'wagtailimages','0006_add_verbose_names','2019-02-28 21:15:25.841769'),(82,'wagtailimages','0007_image_file_size','2019-02-28 21:15:25.882741'),(83,'wagtailimages','0008_image_created_at_index','2019-02-28 21:15:25.930029'),(84,'wagtailimages','0009_capitalizeverbose','2019-02-28 21:15:26.106633'),(85,'wagtailimages','0010_change_on_delete_behaviour','2019-02-28 21:15:26.200302'),(86,'wagtailimages','0011_image_collection','2019-02-28 21:15:26.318459'),(87,'wagtailimages','0012_copy_image_permissions_to_collections','2019-02-28 21:15:26.357835'),(88,'wagtailimages','0013_make_rendition_upload_callable','2019-02-28 21:15:26.369713'),(89,'wagtailimages','0014_add_filter_spec_field','2019-02-28 21:15:26.510280'),(90,'wagtailimages','0015_fill_filter_spec_field','2019-02-28 21:15:26.536203'),(91,'wagtailimages','0016_deprecate_rendition_filter_relation','2019-02-28 21:19:06.820526'),(92,'wagtailimages','0017_reduce_focal_point_key_max_length','2019-02-28 21:19:06.868330'),(93,'wagtailimages','0018_remove_rendition_filter','2019-02-28 21:19:06.944066'),(94,'wagtailimages','0019_delete_filter','2019-02-28 21:19:06.953002'),(95,'wagtailimages','0020_add-verbose-name','2019-02-28 21:19:06.971919'),(96,'wagtailimages','0021_image_file_hash','2019-02-28 21:19:07.032529'),(97,'wagtailredirects','0001_initial','2019-02-28 21:19:07.137200'),(98,'wagtailredirects','0002_add_verbose_names','2019-02-28 21:19:07.272247'),(99,'wagtailredirects','0003_make_site_field_editable','2019-02-28 21:19:07.366570'),(100,'wagtailredirects','0004_set_unique_on_path_and_site','2019-02-28 21:19:07.461803'),(101,'wagtailredirects','0005_capitalizeverbose','2019-02-28 21:19:07.723571'),(102,'wagtailredirects','0006_redirect_increase_max_length','2019-02-28 21:19:07.745787'),(103,'wagtailsearch','0001_initial','2019-02-28 21:19:07.945113'),(104,'wagtailsearch','0002_add_verbose_names','2019-02-28 21:19:08.081124'),(105,'wagtailsearch','0003_remove_editors_pick','2019-02-28 21:19:08.108391'),(106,'wagtailusers','0001_initial','2019-02-28 21:19:08.198378'),(107,'wagtailusers','0002_add_verbose_name_on_userprofile','2019-02-28 21:19:08.234489'),(108,'wagtailusers','0003_add_verbose_names','2019-02-28 21:19:08.253726'),(109,'wagtailusers','0004_capitalizeverbose','2019-02-28 21:19:08.310068'),(110,'wagtailusers','0005_make_related_name_wagtail_specific','2019-02-28 21:19:08.395799'),(111,'wagtailusers','0006_userprofile_prefered_language','2019-02-28 21:19:08.425431'),(112,'wagtailusers','0007_userprofile_current_time_zone','2019-02-28 21:19:08.473600'),(113,'wagtailusers','0008_userprofile_avatar','2019-02-28 21:19:08.509375'),(114,'wagtailcore','0001_squashed_0016_change_page_url_path_to_text_field','2019-02-28 21:19:08.515277'),(115,'admin','0003_logentry_add_action_flag_choices','2019-03-02 15:29:16.758662'),(116,'wagtailcore','0041_group_collection_permissions_verbose_name_plural','2019-03-02 15:29:16.828437'),(117,'wagtaildocs','0009_document_verbose_name_plural','2019-03-02 15:29:16.852412'),(118,'wagtaildocs','0010_document_file_hash','2019-03-02 15:29:16.935519'),(119,'wagtailembeds','0004_embed_verbose_name_plural','2019-03-02 15:29:16.942115'),(120,'wagtailsearch','0004_querydailyhits_verbose_name_plural','2019-03-02 15:29:16.950737'),(121,'wagtailusers','0009_userprofile_verbose_name_plural','2019-03-02 15:29:16.968108'),(122,'wagtailimages','0001_squashed_0021','2019-03-02 15:29:16.978080'),(123,'home','0003_homepage_body','2019-03-05 11:53:35.347540'),(124,'home','0004_auto_20190305_1457','2019-03-05 14:57:31.351129'),(125,'home','0005_homepage_hero_image','2019-03-05 15:10:48.925350'),(126,'home','0006_auto_20190305_1515','2019-03-05 15:15:20.570273'),(127,'home','0007_auto_20190305_1515','2019-03-05 15:15:48.286909'),(128,'blog','0001_initial','2019-03-05 17:13:54.762379'),(129,'blog','0002_blogpage','2019-03-05 17:21:38.050649'),(130,'home','0006_auto_20190305_1732','2019-03-05 17:32:20.442677'),(131,'home','0007_carouselitem','2019-03-27 14:35:41.738533'),(132,'home','0008_auto_20190403_1120','2019-04-03 11:20:23.613517'),(133,'home','0009_carouselitem_scaling','2019-04-29 20:09:44.047235');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('eomexdrzpwsu7kmxmu11zkud534ikho4','ODhkMTU3MGJiNjdjOGFmNGMyMWQ3M2RlOTk3ZjQ2ZjM2YjIwYTU1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2FkZWEzNTk1YzFlYmMwYWU2YmRjNTM3Yzk1NGI2NjQ3ZDBlZDBmIn0=','2019-05-01 12:31:23.190079'),('prg79mxweugqda7wg091lmbr72a68p90','ODhkMTU3MGJiNjdjOGFmNGMyMWQ3M2RlOTk3ZjQ2ZjM2YjIwYTU1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2FkZWEzNTk1YzFlYmMwYWU2YmRjNTM3Yzk1NGI2NjQ3ZDBlZDBmIn0=','2019-04-02 18:56:27.528034'),('q1yvaaxx6h23eenul38lp4gplzn4h0q4','ODhkMTU3MGJiNjdjOGFmNGMyMWQ3M2RlOTk3ZjQ2ZjM2YjIwYTU1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2FkZWEzNTk1YzFlYmMwYWU2YmRjNTM3Yzk1NGI2NjQ3ZDBlZDBmIn0=','2019-04-17 10:12:07.104372'),('qjncmh4mgneikns5zmi4gat1p5kci02l','YzU4Mjg3Zjc4OTMzYzg2ZTBmMzM3ZDg1ZmZmNTljOTcyNTM5NTE2MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTJmZjA5NTM1MDBiOTVlZWEzNjQwMjE5NGQxMGUwMWYwYTk5OTU3In0=','2019-03-14 21:20:20.212139'),('sbdsxtatqf2mndvu8caq6qsnx4dv8w5m','YzU4Mjg3Zjc4OTMzYzg2ZTBmMzM3ZDg1ZmZmNTljOTcyNTM5NTE2MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTJmZjA5NTM1MDBiOTVlZWEzNjQwMjE5NGQxMGUwMWYwYTk5OTU3In0=','2019-03-16 12:30:01.851327'),('vfsu2tsttnlj70do9rn0en3lbzw48gii','MTkwMzMyYTk4MzVlODVmM2FkODA2NTk1MzA0YzhhMzg0NWU5ODk0Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2FkZWEzNTk1YzFlYmMwYWU2YmRjNTM3Yzk1NGI2NjQ3ZDBlZDBmIiwid2FndGFpbC1wcmV2aWV3LTciOlsiY3NyZm1pZGRsZXdhcmV0b2tlbj04a0ZScXFhV3BtODhab1p3cnVLckZpVXJjWFh3RmdRdElBM2F1bGVCc0VlQXpMTnlvNTFTWTJKemQyWkNTWFdwJm5leHQ9JnRpdGxlPUhvbWUmaGVyb19pbWFnZT0maGVyb190aXRsZT1XRStNQUtFK05FVytGVVRVUkVTK1BPU1NJQkxFJmhlcm9fc3VidGl0bGU9TEVBRElORytTVVNUQUlOQUJJTElUWStDT05TVUxUQU5UUyslMjYrREVTSUdORVJTJmJvZHk9JTdCJTBEJTBBKysrKyUyMmJsb2NrcyUyMiUzQSslNUIlMEQlMEErKysrKysrKyU3QiUwRCUwQSsrKysrKysrKysrKyUyMmtleSUyMiUzQSslMjJqMzVsYSUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMnR5cGUlMjIlM0ErJTIydW5zdHlsZWQlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJkZXB0aCUyMiUzQSswJTJDJTBEJTBBKysrKysrKysrKysrJTIydGV4dCUyMiUzQSslMjIlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSslNUIlNUQlMkMlMEQlMEErKysrKysrKysrKyslMjJlbnRpdHlSYW5nZXMlMjIlM0ErJTVCJTVEJTBEJTBBKysrKysrKyslN0QlMkMlMEQlMEErKysrKysrKyU3QiUwRCUwQSsrKysrKysrKysrKyUyMmtleSUyMiUzQSslMjIwdWR6NSUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMnR5cGUlMjIlM0ErJTIyYXRvbWljJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyKyUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBKyU1QiU1RCUyQyUwRCUwQSsrKysrKysrKysrKyUyMmVudGl0eVJhbmdlcyUyMiUzQSslNUIlMEQlMEErKysrKysrKysrKysrKysrJTdCJTBEJTBBKysrKysrKysrKysrKysrKysrKyslMjJrZXklMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKysrKysrKysrJTIyb2Zmc2V0JTIyJTNBKzAlMkMlMEQlMEErKysrKysrKysrKysrKysrKysrKyUyMmxlbmd0aCUyMiUzQSsxJTBEJTBBKysrKysrKysrKysrKysrKyU3RCUwRCUwQSsrKysrKysrKysrKyU1RCUwRCUwQSsrKysrKysrJTdEJTJDJTBEJTBBKysrKysrKyslN0IlMEQlMEErKysrKysrKysrKyslMjJrZXklMjIlM0ErJTIyYzFhbTglMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMnVuc3R5bGVkJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyV2UraW5qZWN0K3Byb2plY3RzK3dpdGgrZGVlcCtzY2llbmNlJTJDK2Jlc3Bva2UrZGVzaWduJTJDK2FuZCtlbXBvd2VyK3RoZW0rd2l0aCthK3NtYXJ0K2J1c2luZXNzK3N0cmF0ZWd5LitXaXRoK2xlYW4rcHJvamVjdCttYW5hZ2VtZW50K3dlK2RlbGl2ZXIrY29uY3JldGUrcmVzdWx0cytmb3Irbm93K2FuZCtmb3IrZ2VuZXJhdGlvbnMrdG8rY29tZS4lMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSslNUIlNUQlMkMlMEQlMEErKysrKysrKysrKyslMjJlbnRpdHlSYW5nZXMlMjIlM0ErJTVCJTVEJTBEJTBBKysrKysrKyslN0QlMkMlMEQlMEErKysrKysrKyU3QiUwRCUwQSsrKysrKysrKysrKyUyMmtleSUyMiUzQSslMjJ3c3Z4NSUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMnR5cGUlMjIlM0ErJTIydW5zdHlsZWQlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJkZXB0aCUyMiUzQSswJTJDJTBEJTBBKysrKysrKysrKysrJTIydGV4dCUyMiUzQSslMjJBYm91dCUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBKyU1QiU1RCUyQyUwRCUwQSsrKysrKysrKysrKyUyMmVudGl0eVJhbmdlcyUyMiUzQSslNUIlMEQlMEErKysrKysrKysrKysrKysrJTdCJTBEJTBBKysrKysrKysrKysrKysrKysrKyslMjJrZXklMjIlM0ErMSUyQyUwRCUwQSsrKysrKysrKysrKysrKysrKysrJTIyb2Zmc2V0JTIyJTNBKzAlMkMlMEQlMEErKysrKysrKysrKysrKysrKysrKyUyMmxlbmd0aCUyMiUzQSs1JTBEJTBBKysrKysrKysrKysrKysrKyU3RCUwRCUwQSsrKysrKysrKysrKyU1RCUwRCUwQSsrKysrKysrJTdEJTJDJTBEJTBBKysrKysrKyslN0IlMEQlMEErKysrKysrKysrKyslMjJrZXklMjIlM0ErJTIyc2NhbXAlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMnVuc3R5bGVkJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ErJTVCJTVEJTJDJTBEJTBBKysrKysrKysrKysrJTIyZW50aXR5UmFuZ2VzJTIyJTNBKyU1QiU1RCUwRCUwQSsrKysrKysrJTdEJTJDJTBEJTBBKysrKysrKyslN0IlMEQlMEErKysrKysrKysrKyslMjJrZXklMjIlM0ErJTIybjhxYXQlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMnVuc3R5bGVkJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ErJTVCJTVEJTJDJTBEJTBBKysrKysrKysrKysrJTIyZW50aXR5UmFuZ2VzJTIyJTNBKyU1QiU1RCUwRCUwQSsrKysrKysrJTdEJTJDJTBEJTBBKysrKysrKyslN0IlMEQlMEErKysrKysrKysrKyslMjJrZXklMjIlM0ErJTIyNnVubHIlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMnVuc3R5bGVkJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ErJTVCJTVEJTJDJTBEJTBBKysrKysrKysrKysrJTIyZW50aXR5UmFuZ2VzJTIyJTNBKyU1QiU1RCUwRCUwQSsrKysrKysrJTdEJTJDJTBEJTBBKysrKysrKyslN0IlMEQlMEErKysrKysrKysrKyslMjJrZXklMjIlM0ErJTIyZHpmdTUlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMnVuc3R5bGVkJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ErJTVCJTVEJTJDJTBEJTBBKysrKysrKysrKysrJTIyZW50aXR5UmFuZ2VzJTIyJTNBKyU1QiU1RCUwRCUwQSsrKysrKysrJTdEJTJDJTBEJTBBKysrKysrKyslN0IlMEQlMEErKysrKysrKysrKyslMjJrZXklMjIlM0ErJTIybDFhenUlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMnVuc3R5bGVkJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ErJTVCJTVEJTJDJTBEJTBBKysrKysrKysrKysrJTIyZW50aXR5UmFuZ2VzJTIyJTNBKyU1QiU1RCUwRCUwQSsrKysrKysrJTdEJTBEJTBBKysrKyU1RCUyQyUwRCUwQSsrKyslMjJlbnRpdHlNYXAlMjIlM0ErJTdCJTBEJTBBKysrKysrKyslMjIwJTIyJTNBKyU3QiUwRCUwQSsrKysrKysrKysrKyUyMm11dGFiaWxpdHklMjIlM0ErJTIySU1NVVRBQkxFJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIydHlwZSUyMiUzQSslMjJJTUFHRSUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmRhdGElMjIlM0ErJTdCJTBEJTBBKysrKysrKysrKysrKysrKyUyMmlkJTIyJTNBKyUyMjElMjIlMkMlMEQlMEErKysrKysrKysrKysrKysrJTIyc3JjJTIyJTNBKyUyMiUyRm1lZGlhJTJGaW1hZ2VzJTJGaW5ub3ZhdGlvbi1ncmFwaGljLndpZHRoLTgwMC5wbmclMjIlMkMlMEQlMEErKysrKysrKysrKysrKysrJTIyYWx0JTIyJTNBKyUyMlNjaWVuY2UrJTI2K1Jlc2VhcmNoJTJDK0Rlc2lnbislMjYrRW5naW5lZXJpbmclMkMrQnVzaW5lc3MrJTI2K01hbmFnZW1lbnQlMjIlMkMlMEQlMEErKysrKysrKysrKysrKysrJTIyZm9ybWF0JTIyJTNBKyUyMmZ1bGx3aWR0aCUyMiUwRCUwQSsrKysrKysrKysrKyU3RCUwRCUwQSsrKysrKysrJTdEJTJDJTBEJTBBKysrKysrKyslMjIxJTIyJTNBKyU3QiUwRCUwQSsrKysrKysrKysrKyUyMm11dGFiaWxpdHklMjIlM0ErJTIyTVVUQUJMRSUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMnR5cGUlMjIlM0ErJTIyTElOSyUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmRhdGElMjIlM0ErJTdCJTBEJTBBKysrKysrKysrKysrKysrKyUyMmlkJTIyJTNBKzYlMkMlMEQlMEErKysrKysrKysrKysrKysrJTIydXJsJTIyJTNBKyUyMiUyRmFib3V0JTJGJTIyJTJDJTBEJTBBKysrKysrKysrKysrKysrKyUyMnBhcmVudElkJTIyJTNBKzMlMEQlMEErKysrKysrKysrKyslN0QlMEQlMEErKysrKysrKyU3RCUwRCUwQSsrKyslN0QlMEQlMEElN0Qmc2x1Zz1ob21lJnNlb190aXRsZT0mc2VhcmNoX2Rlc2NyaXB0aW9uPSZnb19saXZlX2F0PSZleHBpcmVfYXQ9IiwxNTUxODAwMDkxLjc5MjM0Ml19','2019-03-19 15:34:51.833493');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_carouselitem`
--

DROP TABLE IF EXISTS `home_carouselitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `home_carouselitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `caption` varchar(255) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `link_page_id` int(11) DEFAULT NULL,
  `link_title` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `scaling` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_carouselitem_image_id_95868deb_fk_wagtailimages_image_id` (`image_id`),
  KEY `home_carouselitem_page_id_da738e25` (`page_id`),
  KEY `home_carouselitem_link_page_id_dbea037a_fk_wagtailcore_page_id` (`link_page_id`),
  CONSTRAINT `home_carouselitem_image_id_95868deb_fk_wagtailimages_image_id` FOREIGN KEY (`image_id`) REFERENCES `wagtailimages_image` (`id`),
  CONSTRAINT `home_carouselitem_link_page_id_dbea037a_fk_wagtailcore_page_id` FOREIGN KEY (`link_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `home_carouselitem_page_id_da738e25_fk_home_homepage_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `home_homepage` (`page_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_carouselitem`
--

LOCK TABLES `home_carouselitem` WRITE;
/*!40000 ALTER TABLE `home_carouselitem` DISABLE KEYS */;
INSERT INTO `home_carouselitem` VALUES (1,1,'We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.',1,7,6,'More about us','Innovation realized','fit'),(2,2,'Test image of a dude playing piano',2,7,NULL,'','Dude playing piano','fill'),(3,0,'Some green stuff in a box!',3,7,NULL,'','Some grass guy!','fill');
/*!40000 ALTER TABLE `home_carouselitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_homepage`
--

DROP TABLE IF EXISTS `home_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `home_homepage` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `hero_subtitle` varchar(255) DEFAULT NULL,
  `hero_title` varchar(255) DEFAULT NULL,
  `hero_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`page_ptr_id`),
  CONSTRAINT `home_homepage_page_ptr_id_e5b77cf7_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_homepage`
--

LOCK TABLES `home_homepage` WRITE;
/*!40000 ALTER TABLE `home_homepage` DISABLE KEYS */;
INSERT INTO `home_homepage` VALUES (3,'<p>This is not a page but the root for all Except pages.</p>',NULL,NULL,NULL),(5,'',NULL,NULL,NULL),(6,'',NULL,NULL,NULL),(7,'<p></p>','LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS','WE MAKE NEW FUTURES POSSIBLE','Training_1.png'),(8,'',NULL,NULL,NULL),(10,'',NULL,NULL,NULL),(11,'',NULL,NULL,NULL),(12,'',NULL,NULL,NULL),(13,'',NULL,NULL,NULL),(14,'',NULL,NULL,NULL),(16,'',NULL,NULL,NULL),(17,'',NULL,NULL,NULL),(18,'',NULL,NULL,NULL),(56,'',NULL,NULL,NULL),(63,'',NULL,NULL,NULL),(65,'',NULL,NULL,NULL),(67,'',NULL,NULL,NULL),(69,'',NULL,NULL,NULL),(73,'',NULL,NULL,NULL),(75,'',NULL,NULL,NULL),(77,'',NULL,NULL,NULL),(78,'',NULL,NULL,NULL),(95,'',NULL,NULL,NULL),(139,'',NULL,NULL,NULL),(154,'',NULL,NULL,NULL),(171,'',NULL,NULL,NULL),(172,'',NULL,NULL,NULL),(175,'',NULL,NULL,NULL),(176,'',NULL,NULL,NULL),(179,'',NULL,NULL,NULL),(196,'',NULL,NULL,NULL),(199,'',NULL,NULL,NULL),(201,'',NULL,NULL,NULL),(219,'',NULL,NULL,NULL),(241,'',NULL,NULL,NULL),(253,'',NULL,NULL,NULL),(255,'',NULL,NULL,NULL),(300,'',NULL,NULL,NULL),(303,'',NULL,NULL,NULL),(322,'',NULL,NULL,NULL),(325,'',NULL,NULL,NULL),(329,'',NULL,NULL,NULL),(333,'',NULL,NULL,NULL),(368,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `home_homepage` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'vector','vector'),(2,'science&research','scienceresearch'),(3,'graphic','graphic'),(4,'design&engineering','designengineering'),(5,'business&management','businessmanagement'),(6,'except','except'),(7,'jazz-artist','jazz-artist'),(8,'human','human'),(9,'piano','piano'),(10,'black-white','black-white'),(11,'greenhouse','greenhouse'),(12,'plants','plants'),(13,'man','man'),(14,'green','green');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_9957a03c` (`content_type_id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767` (`tag_id`),
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,1,5,1),(2,1,5,2),(3,1,5,3),(4,1,5,4),(5,1,5,5),(6,1,5,6),(7,2,5,8),(8,2,5,9),(9,2,5,10),(10,2,5,7),(11,3,5,11),(12,3,5,12),(13,3,5,13),(14,3,5,14);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collection`
--

DROP TABLE IF EXISTS `wagtailcore_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collection`
--

LOCK TABLES `wagtailcore_collection` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collection` DISABLE KEYS */;
INSERT INTO `wagtailcore_collection` VALUES (1,'0001',1,0,'Root');
/*!40000 ALTER TABLE `wagtailcore_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_collectionviewrestriction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restriction_type` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `collection_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction`
--

LOCK TABLES `wagtailcore_collectionviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_collectionviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_collectionviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_collectionviewrestriction_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collectionviewrestriction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq` (`collectionviewrestriction_id`,`group_id`),
  KEY `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco` FOREIGN KEY (`collectionviewrestriction_id`) REFERENCES `wagtailcore_collectionviewrestriction` (`id`),
  CONSTRAINT `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_collectionviewrestriction_groups`
--

LOCK TABLES `wagtailcore_collectionviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_collectionviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_groupcollectionpermission`
--

DROP TABLE IF EXISTS `wagtailcore_groupcollectionpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_groupcollectionpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq` (`group_id`,`collection_id`,`permission_id`),
  KEY `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` (`collection_id`),
  KEY `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailcore_groupcol_group_id_05d61460_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_groupcollectionpermission`
--

LOCK TABLES `wagtailcore_groupcollectionpermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_groupcollectionpermission` VALUES (2,1,1,2),(4,1,1,3),(6,1,1,5),(8,1,1,6),(1,1,2,2),(3,1,2,3),(5,1,2,5),(7,1,2,6);
/*!40000 ALTER TABLE `wagtailcore_groupcollectionpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_grouppagepermission`
--

DROP TABLE IF EXISTS `wagtailcore_grouppagepermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_grouppagepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_type` varchar(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq` (`group_id`,`page_id`,`permission_type`),
  KEY `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_grouppagepermission`
--

LOCK TABLES `wagtailcore_grouppagepermission` WRITE;
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` DISABLE KEYS */;
INSERT INTO `wagtailcore_grouppagepermission` VALUES (1,'add',1,1),(2,'edit',1,1),(6,'lock',1,1),(3,'publish',1,1),(4,'add',2,1),(5,'edit',2,1);
/*!40000 ALTER TABLE `wagtailcore_grouppagepermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_page`
--

DROP TABLE IF EXISTS `wagtailcore_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `live` tinyint(1) NOT NULL,
  `has_unpublished_changes` tinyint(1) NOT NULL,
  `url_path` longtext NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `show_in_menus` tinyint(1) NOT NULL,
  `search_description` longtext NOT NULL,
  `go_live_at` datetime(6) DEFAULT NULL,
  `expire_at` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `latest_revision_created_at` datetime(6) DEFAULT NULL,
  `first_published_at` datetime(6) DEFAULT NULL,
  `live_revision_id` int(11) DEFAULT NULL,
  `last_published_at` datetime(6) DEFAULT NULL,
  `draft_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `wagtailcore_page_slug_e7c11b8f` (`slug`),
  KEY `wagtailcore_page_first_published_at_2b5dd637` (`first_published_at`),
  KEY `wagtailcore_page_content_type_id_c28424df_fk_django_co` (`content_type_id`),
  KEY `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` (`live_revision_id`),
  KEY `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `wagtailcore_page_content_type_id_c28424df_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` FOREIGN KEY (`live_revision_id`) REFERENCES `wagtailcore_pagerevision` (`id`),
  CONSTRAINT `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_page`
--

LOCK TABLES `wagtailcore_page` WRITE;
/*!40000 ALTER TABLE `wagtailcore_page` DISABLE KEYS */;
INSERT INTO `wagtailcore_page` VALUES (1,'0001',1,1,'Root','root',1,0,'/','',0,'',NULL,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL,'Root'),(3,'00010001',2,6,'Except','home',1,0,'/home/','',0,'',NULL,NULL,0,2,NULL,0,'2019-03-05 14:20:30.254713','2019-02-28 21:20:54.613734',84,'2019-03-05 14:20:30.294727','Except'),(5,'000100010006',3,0,'Services','services',1,0,'/home/services/','',0,'',NULL,NULL,0,2,1,0,'2019-03-04 20:26:02.797062','2019-03-04 20:26:02.819289',5,'2019-03-04 20:26:02.819289','Services'),(6,'000100010004',3,0,'About','about',1,0,'/home/about/','',0,'',NULL,NULL,0,2,1,0,'2019-03-04 20:35:10.727371','2019-03-04 20:26:16.060362',7,'2019-03-04 20:35:10.821118','About'),(7,'000100010003',3,0,'Home','home',1,0,'/home/home/','',0,'',NULL,NULL,0,2,1,0,'2019-04-29 20:16:35.146739','2019-03-04 20:38:11.847183',108,'2019-04-29 20:16:35.251645','Home'),(8,'000100010008',3,0,'Knowledge','knowledge',1,0,'/home/knowledge/','',0,'',NULL,NULL,0,2,1,0,'2019-03-04 20:38:25.785640','2019-03-04 20:38:25.898658',14,'2019-03-04 20:38:25.898658','Knowledge'),(10,'00010001000A700010',4,0,'RGD Building Portfolio Scan','rgd-building-portfolio-scan',1,0,'/home/projects_old/rgd-building-portfolio-scan/','',0,'',NULL,NULL,0,2,1,0,'2010-01-01 00:00:00.000000','2011-10-20 17:47:35.000000',16,'2012-05-15 17:56:45.000000','RGD Building Portfolio Scan'),(11,'00010001000A700011',4,0,'Wesleyan University Teaching Museum','wesleyan-university-teaching-museum',1,0,'/home/projects_old/wesleyan-university-teaching-museum/','',0,'',NULL,NULL,0,2,1,0,'2006-04-01 00:00:00.000000','2011-10-20 17:49:55.000000',17,'2014-01-07 20:41:37.000000','Wesleyan University Teaching Museum'),(12,'00010001000A700012',4,0,'Growth-Planning Area Planning & Development','growth-planning-area-planning-developm',1,0,'/home/projects_old/growth-planning-area-planning-developm/','',0,'',NULL,NULL,0,2,1,0,'2010-05-01 00:00:00.000000','2011-10-20 17:50:59.000000',18,'2012-07-15 11:20:25.000000','Growth-Planning Area Planning & Development'),(13,'00010001000A700013',4,0,'Rome Apartment Building','rome-apartment-building',1,0,'/home/projects_old/rome-apartment-building/','',0,'',NULL,NULL,0,2,1,0,'2004-06-11 00:00:00.000000','2011-10-20 17:53:07.000000',19,'2012-09-29 13:31:19.000000','Rome Apartment Building'),(14,'00010001000A700014',4,0,'Shanghai Urban Masterplan','shanghai-urban-masterplan',1,0,'/home/projects_old/shanghai-urban-masterplan/','',0,'',NULL,NULL,0,2,1,0,'2007-07-01 00:00:00.000000','2011-10-20 17:55:43.000000',20,'2013-11-29 06:14:53.000000','Shanghai Urban Masterplan'),(16,'00010001000A700016',4,0,'Maasterras Sustainability Scan','maasterras-sustainability-scan',1,0,'/home/projects_old/maasterras-sustainability-scan/','',0,'',NULL,NULL,0,2,1,0,'2009-05-01 00:00:00.000000','2011-10-20 18:01:15.000000',21,'2013-02-19 15:14:31.000000','Maasterras Sustainability Scan'),(17,'00010001000A700017',4,0,'Desert House in Kalgoorlie, Australia','desert-house-in-kalgoorlie-australia',1,0,'/home/projects_old/desert-house-in-kalgoorlie-australia/','',0,'',NULL,NULL,0,2,1,0,'2001-02-01 00:00:00.000000','2011-10-20 18:02:17.000000',22,'2014-10-10 21:36:55.000000','Desert House in Kalgoorlie, Australia'),(18,'00010001000A700018',4,0,'Boston Fort Point Masterplan','boston-fort-point-masterplan',1,0,'/home/projects_old/boston-fort-point-masterplan/','',0,'',NULL,NULL,0,2,1,0,'2007-01-20 00:00:00.000000','2011-10-20 18:03:46.000000',23,'2014-10-10 21:35:35.000000','Boston Fort Point Masterplan'),(56,'00010001000A700056',4,0,'Sustainable Schiebroek-Zuid','sustainable-schiebroek-zuid',1,0,'/home/projects_old/sustainable-schiebroek-zuid/','',0,'',NULL,NULL,0,2,1,0,'2010-09-01 00:00:00.000000','2011-11-01 14:41:27.000000',24,'2013-03-13 23:42:19.000000','Sustainable Schiebroek-Zuid'),(63,'00010001000A700063',4,0,'The Dandelion Project','the-dandelion-project',1,0,'/home/projects_old/the-dandelion-project/','',0,'',NULL,NULL,0,2,1,0,'2010-11-01 00:00:00.000000','2011-11-01 14:45:43.000000',25,'2012-11-14 10:14:59.000000','The Dandelion Project'),(65,'00010001000A700065',4,0,'BKCity Slim Refurbishment','bkcity-slim-refurbishment',1,0,'/home/projects_old/bkcity-slim-refurbishment/','',0,'',NULL,NULL,0,2,1,0,'2011-03-15 00:00:00.000000','2011-11-01 14:48:58.000000',26,'2013-02-19 15:13:18.000000','BKCity Slim Refurbishment'),(67,'00010001000A700067',4,0,'the Rotterdam Collective','the-rotterdam-collective',1,0,'/home/projects_old/the-rotterdam-collective/','',0,'',NULL,NULL,0,2,1,0,'2009-12-01 00:00:00.000000','2011-11-01 14:52:35.000000',27,'2012-06-28 23:42:56.000000','the Rotterdam Collective'),(69,'00010001000A700069',4,0,'Netherlands CO2040','netherlands-co2040',1,0,'/home/projects_old/netherlands-co2040/','',0,'',NULL,NULL,0,2,1,0,'2010-08-01 00:00:00.000000','2011-11-01 14:56:04.000000',28,'2012-07-09 22:53:17.000000','Netherlands CO2040'),(73,'00010001000A700073',4,0,'San Francisco Transbay Terminal','san-francisco-transbay-terminal',1,0,'/home/projects_old/san-francisco-transbay-terminal/','',0,'',NULL,NULL,0,2,1,0,'2006-06-01 00:00:00.000000','2011-11-01 15:10:24.000000',29,'2012-10-29 13:15:08.000000','San Francisco Transbay Terminal'),(75,'00010001000A700075',4,0,'Centrum: Spiritual Center','centrum-spiritual-center',1,0,'/home/projects_old/centrum-spiritual-center/','',0,'',NULL,NULL,0,2,1,0,'2008-07-01 00:00:00.000000','2011-11-01 15:13:46.000000',30,'2014-10-10 21:36:16.000000','Centrum: Spiritual Center'),(77,'00010001000A700077',4,0,'Merredin Health Industries Spirulina Plant','merredin-health-industries-spirulina-pla',1,0,'/home/projects_old/merredin-health-industries-spirulina-pla/','',0,'',NULL,NULL,0,2,1,0,'2001-06-10 00:00:00.000000','2011-11-01 15:20:49.000000',31,'2014-10-10 21:27:57.000000','Merredin Health Industries Spirulina Plant'),(78,'00010001000A700078',4,0,'Portal to Venlo','portal-to-venlo',1,0,'/home/projects_old/portal-to-venlo/','',0,'',NULL,NULL,0,2,1,0,'2009-08-23 13:04:16.000000','2011-11-01 15:24:01.000000',32,'2013-03-04 23:47:31.000000','Portal to Venlo'),(95,'00010001000A700095',4,0,'Greenprint Book','greenprint-book',1,0,'/home/projects_old/greenprint-book/','',0,'',NULL,NULL,0,2,1,0,'2011-06-16 14:05:31.000000','2012-02-24 04:03:56.000000',33,'2014-10-10 21:44:39.000000','Greenprint Book'),(139,'00010001000A7000139',4,0,'Inspiration Book Sustainable Overschie','inspiration-book-sustainable-overschie',1,0,'/home/projects_old/inspiration-book-sustainable-overschie/','',0,'',NULL,NULL,0,2,1,0,'2012-05-08 00:00:00.000000','2012-05-08 18:09:52.000000',34,'2012-09-12 03:36:54.000000','Inspiration Book Sustainable Overschie'),(154,'00010001000A7000154',4,0,'House of Energy','house-of-energy',1,0,'/home/projects_old/house-of-energy/','',0,'',NULL,NULL,0,2,1,0,'2011-09-20 00:00:00.000000','2012-05-20 01:53:39.000000',35,'2014-04-06 17:16:50.000000','House of Energy'),(171,'00010001000A7000171',4,0,'test project','test-project',1,0,'/home/projects_old/test-project/','',0,'',NULL,NULL,0,2,1,0,'2012-06-16 22:59:46.000000','2012-06-16 22:57:59.000000',36,'2012-06-17 13:42:38.000000','test project'),(172,'00010001000A7000172',4,0,'Exemplary Neighborhoods','exemplary-neighborhoods',1,0,'/home/projects_old/exemplary-neighborhoods/','',0,'',NULL,NULL,0,2,1,0,'2011-11-27 00:00:00.000000','2012-06-21 16:58:29.000000',37,'2014-10-10 21:38:21.000000','Exemplary Neighborhoods'),(175,'00010001000A7000175',4,0,'DNV Waste Water Chains ','dnv-waste-water-chains',1,0,'/home/projects_old/dnv-waste-water-chains/','',0,'',NULL,NULL,0,2,1,0,'2012-07-02 14:21:41.000000','2012-06-29 17:31:55.000000',38,'2014-10-10 21:37:53.000000','DNV Waste Water Chains '),(176,'00010001000A7000176',4,0,'Investment Projects','investment-projects',1,0,'/home/projects_old/investment-projects/','',0,'',NULL,NULL,0,2,1,0,'1999-12-01 00:00:00.000000','2012-06-30 02:53:36.000000',39,'2014-01-30 13:00:54.000000','Investment Projects'),(179,'00010001000A7000179',4,0,'The Except Website','the-except-website',1,0,'/home/projects_old/the-except-website/','',0,'',NULL,NULL,0,2,1,0,'2012-07-10 00:00:00.000000','2012-07-03 11:20:34.000000',40,'2012-07-19 15:15:55.000000','The Except Website'),(196,'00010001000A7000196',4,0,'Yale Carbon Calculator','yale-carbon-calculator',1,0,'/home/projects_old/yale-carbon-calculator/','',0,'',NULL,NULL,0,2,1,0,'2012-02-15 00:00:00.000000','2012-07-15 10:53:15.000000',41,'2012-12-01 15:34:15.000000','Yale Carbon Calculator'),(199,'00010001000A7000199',4,0,'Flemish Metropolitan Dreams','flemish-metropolitan-dreams',1,0,'/home/projects_old/flemish-metropolitan-dreams/','',0,'',NULL,NULL,0,2,1,0,'2012-07-19 00:00:00.000000','2012-07-19 17:50:40.000000',42,'2014-10-10 21:38:38.000000','Flemish Metropolitan Dreams'),(201,'00010001000A7000201',4,0,'Sustainable Water Innovation Game','sustainable-water-innovation-game',1,0,'/home/projects_old/sustainable-water-innovation-game/','',0,'',NULL,NULL,0,2,1,0,'2012-08-28 18:24:30.000000','2012-07-24 13:33:31.000000',43,'2014-10-10 21:35:19.000000','Sustainable Water Innovation Game'),(219,'00010001000A7000219',4,0,'Miya\'s Sushi Fish Menu','miyas-sushi-fish-menu',1,0,'/home/projects_old/miyas-sushi-fish-menu/','',0,'',NULL,NULL,0,2,1,0,'2012-12-07 00:00:00.000000','2012-12-07 10:14:30.000000',44,'2014-04-06 17:17:03.000000','Miya\'s Sushi Fish Menu'),(241,'00010001000A7000241',4,0,'Hortus Celestia','hortus-celestia',1,0,'/home/projects_old/hortus-celestia/','',0,'',NULL,NULL,0,2,1,0,'2013-04-08 00:00:00.000000','2013-03-05 12:37:11.000000',45,'2014-04-06 17:16:37.000000','Hortus Celestia'),(253,'00010001000A7000253',4,0,'Crystal Forest Office','crystal-forest-office',1,0,'/home/projects_old/crystal-forest-office/','',0,'',NULL,NULL,0,2,1,0,'2013-05-20 00:00:00.000000','2013-05-20 15:37:07.000000',46,'2014-10-10 21:36:34.000000','Crystal Forest Office'),(255,'00010001000A7000255',4,0,'District heating vision Tilburg','district-heating-vision-tilburg',1,0,'/home/projects_old/district-heating-vision-tilburg/','',0,'',NULL,NULL,0,2,1,0,'2013-05-31 00:00:00.000000','2013-05-28 23:34:02.000000',47,'2014-10-10 21:37:20.000000','District heating vision Tilburg'),(300,'00010001000A7000300',4,0,'Infographic: Wind and Local Economy','infographic-wind-and-local-economy',1,0,'/home/projects_old/infographic-wind-and-local-economy/','',0,'',NULL,NULL,0,2,1,0,'2013-12-10 00:00:00.000000','2013-11-15 16:26:23.000000',48,'2013-12-11 13:45:46.000000','Infographic: Wind and Local Economy'),(303,'00010001000A7000303',4,0,'Kansenkaart Afvalwaterketen','kansenkaart-afvalwaterketen',1,0,'/home/projects_old/kansenkaart-afvalwaterketen/','',0,'',NULL,NULL,0,2,1,0,'2013-12-10 00:00:00.000000','2013-12-05 15:49:09.000000',49,'2014-08-27 10:08:28.000000','Kansenkaart Afvalwaterketen'),(322,'00010001000A7000322',4,0,'Food for the Urbanite','food-for-the-urbanite',1,0,'/home/projects_old/food-for-the-urbanite/','',0,'',NULL,NULL,0,2,1,0,'2014-03-28 00:00:00.000000','2014-03-28 11:42:14.000000',50,'2014-10-10 21:38:55.000000','Food for the Urbanite'),(325,'00010001000A7000325',4,0,'Carpet sector roadmap','carpet-sector-roadmap',1,0,'/home/projects_old/carpet-sector-roadmap/','',0,'',NULL,NULL,0,2,1,0,'2014-04-14 00:00:00.000000','2014-04-14 21:33:16.000000',51,'2014-10-10 21:36:00.000000','Carpet sector roadmap'),(329,'00010001000A7000329',4,0,'Routekaart Vleesverwerkende Sector','routekaart-vleesverwerkende-sector',1,0,'/home/projects_old/routekaart-vleesverwerkende-sector/','',0,'',NULL,NULL,0,2,1,0,'2014-04-29 00:00:00.000000','2014-04-29 21:24:03.000000',52,'1972-01-01 00:00:00.000000','Routekaart Vleesverwerkende Sector'),(333,'00010001000A7000333',4,0,'Symoto','symoto',1,0,'/home/projects_old/symoto/','',0,'',NULL,NULL,0,2,1,0,'2013-01-01 00:00:00.000000','2014-05-10 13:03:03.000000',53,'2014-05-12 20:35:02.000000','Symoto'),(368,'00010001000A0001',4,0,'MWH Global wastewater','mwh-global-wastewater',1,0,'/home/projects/mwh-global-wastewater/','',0,'',NULL,NULL,0,2,1,0,'2014-05-01 13:00:00.000000','2014-09-09 14:21:15.000000',54,'2014-09-17 15:30:23.000000','MWH Global wastewater'),(374,'000100010009',3,1,'News','news',1,0,'/home/news/','',0,'',NULL,NULL,0,28,1,0,'2019-03-05 17:19:09.856411','2019-03-05 17:19:09.877506',96,'2019-03-05 17:19:09.877506','News'),(375,'0001000100090001',4,0,'Test news item','test-news-item',1,0,'/home/news/test-news-item/','',0,'',NULL,NULL,0,29,1,0,'2019-03-05 17:23:25.933003','2019-03-05 17:23:25.961645',97,'2019-03-05 17:23:25.961645','Test news item'),(376,'00010001000A',3,1,'Projects','projects',1,0,'/home/projects/','',0,'',NULL,NULL,0,28,1,0,'2019-03-05 17:33:53.534797','2019-03-05 17:33:53.565871',100,'2019-03-05 17:33:53.565871','Projects');
/*!40000 ALTER TABLE `wagtailcore_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pagerevision`
--

DROP TABLE IF EXISTS `wagtailcore_pagerevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_pagerevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted_for_moderation` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `content_json` longtext NOT NULL,
  `approved_go_live_at` datetime(6) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pagerevision_submitted_for_moderation_c682e44c` (`submitted_for_moderation`),
  KEY `wagtailcore_pagerevision_page_id_d421cc1d_fk_wagtailcore_page_id` (`page_id`),
  KEY `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` (`user_id`),
  KEY `wagtailcore_pagerevision_created_at_66954e3b` (`created_at`),
  CONSTRAINT `wagtailcore_pagerevision_page_id_d421cc1d_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pagerevision`
--

LOCK TABLES `wagtailcore_pagerevision` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pagerevision` DISABLE KEYS */;
INSERT INTO `wagtailcore_pagerevision` VALUES (5,0,'2019-03-04 20:26:02.797062','{\"pk\": 5, \"path\": \"00010003\", \"depth\": 2, \"numchild\": 0, \"title\": \"Services\", \"draft_title\": \"Services\", \"slug\": \"services\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/services/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,5,1),(7,0,'2019-03-04 20:35:10.727371','{\"pk\": 6, \"path\": \"00010004\", \"depth\": 2, \"numchild\": 0, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/about/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:26:16.060Z\", \"last_published_at\": \"2019-03-04T20:26:16.060Z\", \"latest_revision_created_at\": \"2019-03-04T20:26:16.038Z\", \"live_revision\": 6}',NULL,6,1),(14,0,'2019-03-04 20:38:25.785640','{\"pk\": 8, \"path\": \"000100010007\", \"depth\": 3, \"numchild\": 0, \"title\": \"Knowledge\", \"draft_title\": \"Knowledge\", \"slug\": \"knowledge\", \"content_type\": 2, \"live\": false, \"has_unpublished_changes\": true, \"url_path\": \"/home/knowledge/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": \"2019-03-04T20:38:22.729Z\", \"live_revision\": null}',NULL,8,1),(16,0,'2010-01-01 00:00:00.000000','{\"pk\": 10, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"RGD Building Portfolio Scan\", \"draft_title\": \"RGD Building Portfolio Scan\", \"slug\": \"rgd-building-portfolio-scan\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/RGD Building Portfolio Scan/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,10,1),(17,0,'2006-04-01 00:00:00.000000','{\"pk\": 11, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Wesleyan University Teaching Museum\", \"draft_title\": \"Wesleyan University Teaching Museum\", \"slug\": \"wesleyan-university-teaching-museum\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Wesleyan University Teaching Museum/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,11,1),(18,0,'2010-05-01 00:00:00.000000','{\"pk\": 12, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Growth-Planning Area Planning & Development\", \"draft_title\": \"Growth-Planning Area Planning & Development\", \"slug\": \"growth-planning-area-planning-developm\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Growth-Planning Area Planning & Development/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,12,1),(19,0,'2004-06-11 00:00:00.000000','{\"pk\": 13, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Rome Apartment Building\", \"draft_title\": \"Rome Apartment Building\", \"slug\": \"rome-apartment-building\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Rome Apartment Building/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,13,1),(20,0,'2007-07-01 00:00:00.000000','{\"pk\": 14, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Shanghai Urban Masterplan\", \"draft_title\": \"Shanghai Urban Masterplan\", \"slug\": \"shanghai-urban-masterplan\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Shanghai Urban Masterplan/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,14,1),(21,0,'2009-05-01 00:00:00.000000','{\"pk\": 16, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Maasterras Sustainability Scan\", \"draft_title\": \"Maasterras Sustainability Scan\", \"slug\": \"maasterras-sustainability-scan\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Maasterras Sustainability Scan/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,16,1),(22,0,'2001-02-01 00:00:00.000000','{\"pk\": 17, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Desert House in Kalgoorlie, Australia\", \"draft_title\": \"Desert House in Kalgoorlie, Australia\", \"slug\": \"desert-house-in-kalgoorlie-australia\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Desert House in Kalgoorlie, Australia/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,17,1),(23,0,'2007-01-20 00:00:00.000000','{\"pk\": 18, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Boston Fort Point Masterplan\", \"draft_title\": \"Boston Fort Point Masterplan\", \"slug\": \"boston-fort-point-masterplan\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Boston Fort Point Masterplan/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,18,1),(24,0,'2010-09-01 00:00:00.000000','{\"pk\": 56, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Sustainable Schiebroek-Zuid\", \"draft_title\": \"Sustainable Schiebroek-Zuid\", \"slug\": \"sustainable-schiebroek-zuid\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Sustainable Schiebroek-Zuid/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,56,1),(25,0,'2010-11-01 00:00:00.000000','{\"pk\": 63, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"The Dandelion Project\", \"draft_title\": \"The Dandelion Project\", \"slug\": \"the-dandelion-project\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/The Dandelion Project/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,63,1),(26,0,'2011-03-15 00:00:00.000000','{\"pk\": 65, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"BKCity Slim Refurbishment\", \"draft_title\": \"BKCity Slim Refurbishment\", \"slug\": \"bkcity-slim-refurbishment\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/BKCity Slim Refurbishment/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,65,1),(27,0,'2009-12-01 00:00:00.000000','{\"pk\": 67, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"the Rotterdam Collective\", \"draft_title\": \"the Rotterdam Collective\", \"slug\": \"the-rotterdam-collective\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/the Rotterdam Collective/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,67,1),(28,0,'2010-08-01 00:00:00.000000','{\"pk\": 69, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Netherlands CO2040\", \"draft_title\": \"Netherlands CO2040\", \"slug\": \"netherlands-co2040\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Netherlands CO2040/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,69,1),(29,0,'2006-06-01 00:00:00.000000','{\"pk\": 73, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"San Francisco Transbay Terminal\", \"draft_title\": \"San Francisco Transbay Terminal\", \"slug\": \"san-francisco-transbay-terminal\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/San Francisco Transbay Terminal/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,73,1),(30,0,'2008-07-01 00:00:00.000000','{\"pk\": 75, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Centrum: Spiritual Center\", \"draft_title\": \"Centrum: Spiritual Center\", \"slug\": \"centrum-spiritual-center\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Centrum: Spiritual Center/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,75,1),(31,0,'2001-06-10 00:00:00.000000','{\"pk\": 77, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Merredin Health Industries Spirulina Plant\", \"draft_title\": \"Merredin Health Industries Spirulina Plant\", \"slug\": \"merredin-health-industries-spirulina-pla\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Merredin Health Industries Spirulina Plant/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,77,1),(32,0,'2009-08-23 13:04:16.000000','{\"pk\": 78, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Portal to Venlo\", \"draft_title\": \"Portal to Venlo\", \"slug\": \"portal-to-venlo\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Portal to Venlo/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,78,1),(33,0,'2011-06-16 14:05:31.000000','{\"pk\": 95, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Greenprint Book\", \"draft_title\": \"Greenprint Book\", \"slug\": \"greenprint-book\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Greenprint Book/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,95,1),(34,0,'2012-05-08 00:00:00.000000','{\"pk\": 139, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Inspiration Book Sustainable Overschie\", \"draft_title\": \"Inspiration Book Sustainable Overschie\", \"slug\": \"inspiration-book-sustainable-overschie\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Inspiration Book Sustainable Overschie/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,139,1),(35,0,'2011-09-20 00:00:00.000000','{\"pk\": 154, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"House of Energy\", \"draft_title\": \"House of Energy\", \"slug\": \"house-of-energy\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/House of Energy/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,154,1),(36,0,'2012-06-16 22:59:46.000000','{\"pk\": 171, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"test project\", \"draft_title\": \"test project\", \"slug\": \"test-project\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/test project/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,171,1),(37,0,'2011-11-27 00:00:00.000000','{\"pk\": 172, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Exemplary Neighborhoods\", \"draft_title\": \"Exemplary Neighborhoods\", \"slug\": \"exemplary-neighborhoods\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Exemplary Neighborhoods/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,172,1),(38,0,'2012-07-02 14:21:41.000000','{\"pk\": 175, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"DNV Waste Water Chains \", \"draft_title\": \"DNV Waste Water Chains \", \"slug\": \"dnv-waste-water-chains\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/DNV Waste Water Chains /\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,175,1),(39,0,'1999-12-01 00:00:00.000000','{\"pk\": 176, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Investment Projects\", \"draft_title\": \"Investment Projects\", \"slug\": \"investment-projects\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Investment Projects/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,176,1),(40,0,'2012-07-10 00:00:00.000000','{\"pk\": 179, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"The Except Website\", \"draft_title\": \"The Except Website\", \"slug\": \"the-except-website\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/The Except Website/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,179,1),(41,0,'2012-02-15 00:00:00.000000','{\"pk\": 196, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Yale Carbon Calculator\", \"draft_title\": \"Yale Carbon Calculator\", \"slug\": \"yale-carbon-calculator\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Yale Carbon Calculator/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,196,1),(42,0,'2012-07-19 00:00:00.000000','{\"pk\": 199, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Flemish Metropolitan Dreams\", \"draft_title\": \"Flemish Metropolitan Dreams\", \"slug\": \"flemish-metropolitan-dreams\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Flemish Metropolitan Dreams/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,199,1),(43,0,'2012-08-28 18:24:30.000000','{\"pk\": 201, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Sustainable Water Innovation Game\", \"draft_title\": \"Sustainable Water Innovation Game\", \"slug\": \"sustainable-water-innovation-game\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Sustainable Water Innovation Game/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,201,1),(44,0,'2012-12-07 00:00:00.000000','{\"pk\": 219, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Miya\'s Sushi Fish Menu\", \"draft_title\": \"Miya\'s Sushi Fish Menu\", \"slug\": \"miyas-sushi-fish-menu\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Miya\'s Sushi Fish Menu/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,219,1),(45,0,'2013-04-08 00:00:00.000000','{\"pk\": 241, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Hortus Celestia\", \"draft_title\": \"Hortus Celestia\", \"slug\": \"hortus-celestia\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Hortus Celestia/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,241,1),(46,0,'2013-05-20 00:00:00.000000','{\"pk\": 253, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Crystal Forest Office\", \"draft_title\": \"Crystal Forest Office\", \"slug\": \"crystal-forest-office\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Crystal Forest Office/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,253,1),(47,0,'2013-05-31 00:00:00.000000','{\"pk\": 255, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"District heating vision Tilburg\", \"draft_title\": \"District heating vision Tilburg\", \"slug\": \"district-heating-vision-tilburg\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/District heating vision Tilburg/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,255,1),(48,0,'2013-12-10 00:00:00.000000','{\"pk\": 300, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Infographic: Wind and Local Economy\", \"draft_title\": \"Infographic: Wind and Local Economy\", \"slug\": \"infographic-wind-and-local-economy\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Infographic: Wind and Local Economy/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,300,1),(49,0,'2013-12-10 00:00:00.000000','{\"pk\": 303, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Kansenkaart Afvalwaterketen\", \"draft_title\": \"Kansenkaart Afvalwaterketen\", \"slug\": \"kansenkaart-afvalwaterketen\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Kansenkaart Afvalwaterketen/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,303,1),(50,0,'2014-03-28 00:00:00.000000','{\"pk\": 322, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Food for the Urbanite\", \"draft_title\": \"Food for the Urbanite\", \"slug\": \"food-for-the-urbanite\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Food for the Urbanite/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,322,1),(51,0,'2014-04-14 00:00:00.000000','{\"pk\": 325, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Carpet sector roadmap\", \"draft_title\": \"Carpet sector roadmap\", \"slug\": \"carpet-sector-roadmap\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Carpet sector roadmap/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,325,1),(52,0,'2014-04-29 00:00:00.000000','{\"pk\": 329, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Routekaart Vleesverwerkende Sector\", \"draft_title\": \"Routekaart Vleesverwerkende Sector\", \"slug\": \"routekaart-vleesverwerkende-sector\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Routekaart Vleesverwerkende Sector/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,329,1),(53,0,'2013-01-01 00:00:00.000000','{\"pk\": 333, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Symoto\", \"draft_title\": \"Symoto\", \"slug\": \"symoto\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/Symoto/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,333,1),(54,0,'2014-05-01 13:00:00.000000','{\"pk\": 368, \"path\": \"0001000100040001\", \"depth\": 4, \"numchild\": 0, \"title\": \"MWH Global wastewater\", \"draft_title\": \"MWH Global wastewater\", \"slug\": \"mwh-global-wastewater\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/MWH Global wastewater/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null}',NULL,368,1),(84,0,'2019-03-05 14:20:30.254713','{\"pk\": 3, \"path\": \"00010001\", \"depth\": 2, \"numchild\": 5, \"title\": \"Except\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/\", \"owner\": null, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-02-28T21:20:54.613Z\", \"last_published_at\": \"2019-03-05T12:10:05.839Z\", \"latest_revision_created_at\": \"2019-03-05T12:10:05.717Z\", \"live_revision\": 83, \"body\": \"<p>This is not a page but the root for all Except pages.</p>\"}',NULL,3,1),(95,0,'2019-03-05 16:49:46.362861','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-03-05T16:46:40.878Z\", \"latest_revision_created_at\": \"2019-03-05T16:46:40.819Z\", \"live_revision\": 94, \"hero_image\": \"hero-home.jpg\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\"}',NULL,7,1),(96,0,'2019-03-05 17:19:09.856411','{\"pk\": 374, \"path\": \"000100010009\", \"depth\": 3, \"numchild\": 0, \"title\": \"News\", \"draft_title\": \"News\", \"slug\": \"news\", \"content_type\": 28, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/news/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"intro\": \"<p>All our news will be shown here</p>\"}',NULL,374,1),(97,0,'2019-03-05 17:23:25.933003','{\"pk\": 375, \"path\": \"0001000100090001\", \"depth\": 4, \"numchild\": 0, \"title\": \"Test news item\", \"draft_title\": \"Test news item\", \"slug\": \"test-news-item\", \"content_type\": 29, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/news/test-news-item/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"date\": \"2019-03-05\", \"intro\": \"Just to see if it will show up!\", \"body\": \"<p>Not bad gringo. Let&#x27;s move on!</p>\"}',NULL,375,1),(100,0,'2019-03-05 17:33:53.534797','{\"pk\": 376, \"path\": \"00010001000A\", \"depth\": 3, \"numchild\": 0, \"title\": \"Projects\", \"draft_title\": \"Projects\", \"slug\": \"projects\", \"content_type\": 28, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/projects/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": null, \"last_published_at\": null, \"latest_revision_created_at\": null, \"live_revision\": null, \"intro\": \"<p>List of all the projects</p>\"}',NULL,376,1),(101,0,'2019-03-27 14:36:45.170205','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-03-05T16:49:46.431Z\", \"latest_revision_created_at\": \"2019-03-05T16:49:46.362Z\", \"live_revision\": 95, \"hero_image\": \"hero-home.jpg\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\", \"carousel_items\": [{\"pk\": null, \"sort_order\": 0, \"image\": 1, \"caption\": \"We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.\", \"page\": 7}]}',NULL,7,1),(102,0,'2019-03-27 14:49:11.935806','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-03-27T14:36:45.281Z\", \"latest_revision_created_at\": \"2019-03-27T14:36:45.170Z\", \"live_revision\": 101, \"hero_image\": \"hero-home.jpg\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\", \"carousel_items\": [{\"pk\": 1, \"sort_order\": 0, \"image\": 1, \"caption\": \"We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.\", \"page\": 7}, {\"pk\": null, \"sort_order\": 1, \"image\": 2, \"caption\": \"Test image of a dude playing piano\", \"page\": 7}]}',NULL,7,1),(103,0,'2019-04-03 10:49:02.617327','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-03-27T14:49:12.079Z\", \"latest_revision_created_at\": \"2019-03-27T14:49:11.935Z\", \"live_revision\": 102, \"hero_image\": \"hero-home.jpg\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\", \"carousel_items\": [{\"pk\": 1, \"sort_order\": 0, \"image\": 1, \"caption\": \"We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.\", \"page\": 7}, {\"pk\": 2, \"sort_order\": 1, \"image\": 2, \"caption\": \"Test image of a dude playing piano\", \"page\": 7}, {\"pk\": null, \"sort_order\": 2, \"image\": 3, \"caption\": \"\", \"page\": 7}]}',NULL,7,1),(104,0,'2019-04-03 10:50:35.320262','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-04-03T10:49:02.665Z\", \"latest_revision_created_at\": \"2019-04-03T10:49:02.617Z\", \"live_revision\": 103, \"hero_image\": \"hero-home.jpg\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\", \"carousel_items\": [{\"pk\": 1, \"sort_order\": 0, \"image\": 1, \"caption\": \"We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.\", \"page\": 7}, {\"pk\": 2, \"sort_order\": 1, \"image\": 2, \"caption\": \"Test image of a dude playing piano\", \"page\": 7}, {\"pk\": 3, \"sort_order\": 2, \"image\": 3, \"caption\": \"Some green stuff in a box!\", \"page\": 7}]}',NULL,7,1),(105,0,'2019-04-03 11:21:29.128423','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-04-03T10:50:35.434Z\", \"latest_revision_created_at\": \"2019-04-03T10:50:35.320Z\", \"live_revision\": 104, \"hero_image\": \"hero-home.jpg\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\", \"carousel_items\": [{\"pk\": 1, \"sort_order\": 0, \"image\": 1, \"link_page\": 6, \"title\": \"Innovation realized\", \"caption\": \"We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.\", \"link_title\": \"More about us\", \"page\": 7}, {\"pk\": 2, \"sort_order\": 1, \"image\": 2, \"link_page\": null, \"title\": \"Dude playing piano\", \"caption\": \"Test image of a dude playing piano\", \"link_title\": \"\", \"page\": 7}, {\"pk\": 3, \"sort_order\": 2, \"image\": 3, \"link_page\": null, \"title\": \"Some grass guy!\", \"caption\": \"Some green stuff in a box!\", \"link_title\": \"\", \"page\": 7}]}',NULL,7,1),(106,0,'2019-04-17 12:32:13.478914','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-04-03T11:21:29.183Z\", \"latest_revision_created_at\": \"2019-04-03T11:21:29.128Z\", \"live_revision\": 105, \"hero_image\": \"Training_1.png\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\", \"carousel_items\": [{\"pk\": 3, \"sort_order\": 0, \"image\": 3, \"link_page\": null, \"title\": \"Some grass guy!\", \"caption\": \"Some green stuff in a box!\", \"link_title\": \"\", \"page\": 7}, {\"pk\": 1, \"sort_order\": 1, \"image\": 1, \"link_page\": 6, \"title\": \"Innovation realized\", \"caption\": \"We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.\", \"link_title\": \"More about us\", \"page\": 7}, {\"pk\": 2, \"sort_order\": 2, \"image\": 2, \"link_page\": null, \"title\": \"Dude playing piano\", \"caption\": \"Test image of a dude playing piano\", \"link_title\": \"\", \"page\": 7}]}',NULL,7,1),(107,0,'2019-04-29 20:16:30.648230','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": false, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-04-17T12:32:13.758Z\", \"latest_revision_created_at\": \"2019-04-17T12:32:13.478Z\", \"live_revision\": 106, \"hero_image\": \"Training_1.png\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\", \"carousel_items\": [{\"pk\": 3, \"sort_order\": 0, \"image\": 3, \"link_page\": null, \"title\": \"Some grass guy!\", \"caption\": \"Some green stuff in a box!\", \"link_title\": \"\", \"page\": 7, \"scaling\": \"fill\"}, {\"pk\": 1, \"sort_order\": 1, \"image\": 1, \"link_page\": 6, \"title\": \"Innovation realized\", \"caption\": \"We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.\", \"link_title\": \"More about us\", \"page\": 7, \"scaling\": \"fit\"}, {\"pk\": 2, \"sort_order\": 2, \"image\": 2, \"link_page\": null, \"title\": \"Dude playing piano\", \"caption\": \"Test image of a dude playing piano\", \"link_title\": \"\", \"page\": 7, \"scaling\": \"fill\"}]}',NULL,7,1),(108,0,'2019-04-29 20:16:35.146739','{\"pk\": 7, \"path\": \"000100010003\", \"depth\": 3, \"numchild\": 0, \"title\": \"Home\", \"draft_title\": \"Home\", \"slug\": \"home\", \"content_type\": 2, \"live\": true, \"has_unpublished_changes\": true, \"url_path\": \"/home/home/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"first_published_at\": \"2019-03-04T20:38:11.847Z\", \"last_published_at\": \"2019-04-17T12:32:13.758Z\", \"latest_revision_created_at\": \"2019-04-29T20:16:30.648Z\", \"live_revision\": 106, \"hero_image\": \"Training_1.png\", \"hero_title\": \"WE MAKE NEW FUTURES POSSIBLE\", \"hero_subtitle\": \"LEADING SUSTAINABILITY CONSULTANTS & DESIGNERS\", \"body\": \"<p></p>\", \"carousel_items\": [{\"pk\": 3, \"sort_order\": 0, \"image\": 3, \"link_page\": null, \"title\": \"Some grass guy!\", \"caption\": \"Some green stuff in a box!\", \"link_title\": \"\", \"page\": null, \"scaling\": \"fill\"}, {\"pk\": 1, \"sort_order\": 1, \"image\": 1, \"link_page\": 6, \"title\": \"Innovation realized\", \"caption\": \"We inject projects with deep science, bespoke design, and empower them with a smart business strategy. With lean project management we deliver concrete results for now and for generations to come.\", \"link_title\": \"More about us\", \"page\": null, \"scaling\": \"fit\"}, {\"pk\": 2, \"sort_order\": 2, \"image\": 2, \"link_page\": null, \"title\": \"Dude playing piano\", \"caption\": \"Test image of a dude playing piano\", \"link_title\": \"\", \"page\": null, \"scaling\": \"fill\"}]}',NULL,7,1);
/*!40000 ALTER TABLE `wagtailcore_pagerevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_pageviewrestriction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `page_id` int(11) NOT NULL,
  `restriction_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction`
--

LOCK TABLES `wagtailcore_pageviewrestriction` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_pageviewrestriction_groups`
--

DROP TABLE IF EXISTS `wagtailcore_pageviewrestriction_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_pageviewrestriction_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageviewrestriction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq` (`pageviewrestriction_id`,`group_id`),
  KEY `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` (`group_id`),
  CONSTRAINT `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco` FOREIGN KEY (`pageviewrestriction_id`) REFERENCES `wagtailcore_pageviewrestriction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_pageviewrestriction_groups`
--

LOCK TABLES `wagtailcore_pageviewrestriction_groups` WRITE;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailcore_pageviewrestriction_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailcore_site`
--

DROP TABLE IF EXISTS `wagtailcore_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailcore_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `is_default_site` tinyint(1) NOT NULL,
  `root_page_id` int(11) NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailcore_site_hostname_port_2c626d70_uniq` (`hostname`,`port`),
  KEY `wagtailcore_site_hostname_96b20b46` (`hostname`),
  KEY `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` (`root_page_id`),
  CONSTRAINT `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` FOREIGN KEY (`root_page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailcore_site`
--

LOCK TABLES `wagtailcore_site` WRITE;
/*!40000 ALTER TABLE `wagtailcore_site` DISABLE KEYS */;
INSERT INTO `wagtailcore_site` VALUES (2,'localhost',8000,1,7,'Except'),(4,'except',3333,0,3,'Except Root');
/*!40000 ALTER TABLE `wagtailcore_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtaildocs_document`
--

DROP TABLE IF EXISTS `wagtaildocs_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtaildocs_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) NOT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `file_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtaildocs_document_collection_id_23881625_fk_wagtailco` (`collection_id`),
  KEY `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` (`uploaded_by_user_id`),
  CONSTRAINT `wagtaildocs_document_collection_id_23881625_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtaildocs_document`
--

LOCK TABLES `wagtaildocs_document` WRITE;
/*!40000 ALTER TABLE `wagtaildocs_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtaildocs_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailembeds_embed`
--

DROP TABLE IF EXISTS `wagtailembeds_embed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailembeds_embed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `max_width` smallint(6) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `html` longtext NOT NULL,
  `title` longtext NOT NULL,
  `author_name` longtext NOT NULL,
  `provider_name` longtext NOT NULL,
  `thumbnail_url` varchar(200) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailembeds_embed_url_max_width_8a2922d8_uniq` (`url`,`max_width`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailembeds_embed`
--

LOCK TABLES `wagtailembeds_embed` WRITE;
/*!40000 ALTER TABLE `wagtailembeds_embed` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailembeds_embed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailforms_formsubmission`
--

DROP TABLE IF EXISTS `wagtailforms_formsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailforms_formsubmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_data` longtext NOT NULL,
  `submit_time` datetime(6) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailforms_formsubmission`
--

LOCK TABLES `wagtailforms_formsubmission` WRITE;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailforms_formsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_image`
--

DROP TABLE IF EXISTS `wagtailimages_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailimages_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `focal_point_x` int(10) unsigned DEFAULT NULL,
  `focal_point_y` int(10) unsigned DEFAULT NULL,
  `focal_point_width` int(10) unsigned DEFAULT NULL,
  `focal_point_height` int(10) unsigned DEFAULT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `collection_id` int(11) NOT NULL,
  `file_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailimages_image_created_at_86fa6cd4` (`created_at`),
  KEY `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` (`uploaded_by_user_id`),
  KEY `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` (`collection_id`),
  CONSTRAINT `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  CONSTRAINT `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_image`
--

LOCK TABLES `wagtailimages_image` WRITE;
/*!40000 ALTER TABLE `wagtailimages_image` DISABLE KEYS */;
INSERT INTO `wagtailimages_image` VALUES (1,'circles-science-design-business-except','original_images/innovation-graphic.png',1588,996,'2019-03-05 15:26:50.527670',NULL,NULL,NULL,NULL,1,91905,1,'2d2720edc8e93be1a37e15cefdf0b0930ffc81d2'),(2,'adult-artist-band-1813192.jpg','original_images/adult-artist-band-1813192.jpg',2848,4272,'2019-03-27 14:49:00.609917',NULL,NULL,NULL,NULL,1,1788203,1,'51fb68c88038313241f563a03af7d7d04fe9ba83'),(3,'Greenhouse','original_images/greenhouse.jpg',1233,560,'2019-04-03 10:48:58.132561',NULL,NULL,NULL,NULL,1,155136,1,'87ce44627a2e63197e66cbd303995402f4bb3df7');
/*!40000 ALTER TABLE `wagtailimages_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailimages_rendition`
--

DROP TABLE IF EXISTS `wagtailimages_rendition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailimages_rendition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `focal_point_key` varchar(16) NOT NULL,
  `image_id` int(11) NOT NULL,
  `filter_spec` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq` (`image_id`,`filter_spec`,`focal_point_key`),
  KEY `wagtailimages_rendition_filter_spec_1cba3201` (`filter_spec`),
  KEY `wagtailimages_rendition_image_id_3e1fd774` (`image_id`),
  CONSTRAINT `wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim` FOREIGN KEY (`image_id`) REFERENCES `wagtailimages_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailimages_rendition`
--

LOCK TABLES `wagtailimages_rendition` WRITE;
/*!40000 ALTER TABLE `wagtailimages_rendition` DISABLE KEYS */;
INSERT INTO `wagtailimages_rendition` VALUES (1,'images/innovation-graphic.max-800x600.png',800,501,'',1,'max-800x600'),(2,'images/innovation-graphic.width-800.png',800,501,'',1,'width-800'),(3,'images/innovation-graphic.max-165x165.png',165,103,'',1,'max-165x165'),(4,'images/adult-artist-band-1813192.max-165x165.jpg',109,165,'',2,'max-165x165'),(5,'images/innovation-graphic.original.png',1588,996,'',1,'original'),(6,'images/innovation-graphic.width-1000.png',1000,627,'',1,'width-1000'),(7,'images/adult-artist-band-1813192.width-1000.jpg',1000,1500,'',2,'width-1000'),(8,'images/greenhouse.max-165x165.jpg',165,74,'',3,'max-165x165'),(9,'images/greenhouse.width-1000.jpg',1000,454,'',3,'width-1000');
/*!40000 ALTER TABLE `wagtailimages_rendition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailredirects_redirect`
--

DROP TABLE IF EXISTS `wagtailredirects_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailredirects_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_path` varchar(255) NOT NULL,
  `is_permanent` tinyint(1) NOT NULL,
  `redirect_link` varchar(255) NOT NULL,
  `redirect_page_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailredirects_redirect_old_path_site_id_783622d7_uniq` (`old_path`,`site_id`),
  KEY `wagtailredirects_redirect_old_path_bb35247b` (`old_path`),
  KEY `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` (`redirect_page_id`),
  KEY `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` (`site_id`),
  CONSTRAINT `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` FOREIGN KEY (`redirect_page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailredirects_redirect`
--

LOCK TABLES `wagtailredirects_redirect` WRITE;
/*!40000 ALTER TABLE `wagtailredirects_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailredirects_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_editorspick`
--

DROP TABLE IF EXISTS `wagtailsearch_editorspick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailsearch_editorspick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) DEFAULT NULL,
  `description` longtext NOT NULL,
  `page_id` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse` (`query_id`),
  KEY `wagtailsearch_editor_page_id_28cbc274_fk_wagtailco` (`page_id`),
  CONSTRAINT `wagtailsearch_editor_page_id_28cbc274_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  CONSTRAINT `wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse` FOREIGN KEY (`query_id`) REFERENCES `wagtailsearch_query` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_editorspick`
--

LOCK TABLES `wagtailsearch_editorspick` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_editorspick` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailsearch_editorspick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_query`
--

DROP TABLE IF EXISTS `wagtailsearch_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailsearch_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query_string` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `query_string` (`query_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_query`
--

LOCK TABLES `wagtailsearch_query` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailsearch_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailsearch_querydailyhits`
--

DROP TABLE IF EXISTS `wagtailsearch_querydailyhits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailsearch_querydailyhits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `hits` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq` (`query_id`,`date`),
  CONSTRAINT `wagtailsearch_queryd_query_id_2185994b_fk_wagtailse` FOREIGN KEY (`query_id`) REFERENCES `wagtailsearch_query` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailsearch_querydailyhits`
--

LOCK TABLES `wagtailsearch_querydailyhits` WRITE;
/*!40000 ALTER TABLE `wagtailsearch_querydailyhits` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailsearch_querydailyhits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagtailusers_userprofile`
--

DROP TABLE IF EXISTS `wagtailusers_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wagtailusers_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted_notifications` tinyint(1) NOT NULL,
  `approved_notifications` tinyint(1) NOT NULL,
  `rejected_notifications` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `preferred_language` varchar(10) NOT NULL,
  `current_time_zone` varchar(40) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagtailusers_userprofile`
--

LOCK TABLES `wagtailusers_userprofile` WRITE;
/*!40000 ALTER TABLE `wagtailusers_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `wagtailusers_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-30 10:11:52
