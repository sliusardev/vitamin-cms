/*!999999\- enable the sandbox mode */ 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `adm_form_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_form_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adm_form_id` bigint(20) unsigned NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `status` varchar(255) NOT NULL DEFAULT 'not sent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adm_form_id` (`adm_form_id`),
  CONSTRAINT `adm_form_id` FOREIGN KEY (`adm_form_id`) REFERENCES `adm_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `adm_form_items` WRITE;
/*!40000 ALTER TABLE `adm_form_items` DISABLE KEYS */;
INSERT INTO `adm_form_items` VALUES
(1,2,'{\"name\":\"Nadine Watkins\",\"email\":\"nibujiz@mailinator.com\",\"phone\":\"+1 (428) 773-6867\",\"subject\":\"Et officia irure ass\",\"message\":\"Eum officia enim exp\"}','sent','2024-05-18 13:00:16','2024-05-18 13:29:17'),
(2,1,'{\"name\":\"admin\",\"email\":\"admin@admin.test\",\"phone\":\"+1 (405) 661-9466\",\"datetime\":\"2024-05-26T14:57\",\"message\":\"zxfbvzfgsdfgsdfg\"}','sent','2024-05-25 09:52:15','2024-05-25 09:52:15'),
(3,1,'{\"name\":null,\"email\":null,\"phone\":null,\"datetime\":null,\"message\":null}','sent','2024-05-25 09:57:00','2024-05-25 09:57:01');
/*!40000 ALTER TABLE `adm_form_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `adm_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_forms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `to` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `link_hash` varchar(255) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `send_notify` tinyint(1) NOT NULL DEFAULT 0,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`fields`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adm_forms_link_hash_unique` (`link_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `adm_forms` WRITE;
/*!40000 ALTER TABLE `adm_forms` DISABLE KEYS */;
INSERT INTO `adm_forms` VALUES
(1,1,'Book An Appointment','book-an-appointment',NULL,NULL,NULL,NULL,'Fnf4COJFrPbWlyZ',1,1,'[{\"field_name\":\"name\"},{\"field_name\":\"email\"},{\"field_name\":\"phone\"},{\"field_name\":\"datetime\"},{\"field_name\":\"message\"}]','2024-05-18 12:06:30','2024-05-25 09:49:20'),
(2,1,'Contact us form','contact-us-form','sliusardev@gmail.com','test',NULL,NULL,'VaBhbighBQUKVBb',1,1,'[{\"field_name\":\"name\"},{\"field_name\":\"email\"},{\"field_name\":\"phone\"},{\"field_name\":\"subject\"},{\"field_name\":\"message\"}]','2024-05-18 12:09:26','2024-05-18 12:59:57');
/*!40000 ALTER TABLE `adm_forms` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_text_keys` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `chunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chunks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `body` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `position` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `locale` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chunks_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `chunks` WRITE;
/*!40000 ALTER TABLE `chunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `chunks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `content` text DEFAULT NULL,
  `commentable_id` bigint(20) NOT NULL,
  `commentable_type` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  `is_enabled` tinyint(1) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  KEY `menu_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES
(1,1,NULL,0,'Home','/',1,'2024-05-18 11:57:21','2024-05-18 11:57:21'),
(2,1,NULL,1,'About','/about',1,'2024-05-18 11:57:37','2024-05-18 11:57:37'),
(3,1,NULL,2,'Services','/services',1,'2024-05-18 11:58:07','2024-05-18 11:58:07'),
(4,1,NULL,3,'Doctors','/doctors',1,'2024-05-18 11:58:29','2024-05-18 11:58:29'),
(5,1,NULL,4,'News','/posts',1,'2024-05-18 11:58:55','2024-05-18 11:58:55'),
(6,1,NULL,5,'Contact Us','/contact-us',1,'2024-05-18 11:59:26','2024-05-18 11:59:26'),
(9,1,3,0,'Skin Care','/services/skin-care',1,'2024-05-26 19:34:27','2024-05-26 19:34:27'),
(10,1,3,1,'Needle Mesotherapy','/services/needle-mesotherapy',1,'2024-05-26 19:35:03','2024-05-26 19:35:03'),
(11,1,3,2,'Hair Removal','/services/hair-removal',1,'2024-05-27 14:04:49','2024-05-27 14:04:49'),
(12,1,3,3,'Laser Treatments','/services/laser-treatments',1,'2024-05-27 14:05:50','2024-05-27 14:05:50'),
(13,1,3,4,'Skin Resurfacing','/services/skin-resurfacing',1,'2024-05-27 14:06:48','2024-05-27 14:06:48'),
(14,1,3,5,'Plastic Surgery','/services/plastic-surgery',1,'2024-05-27 14:07:39','2024-05-27 14:07:39');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`links`)),
  `position` varchar(255) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `locale` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES
(1,'tom menu','zzz6o50n6l7zF4q','[{\"text\":null,\"url\":null,\"blank\":true,\"is_enabled\":true}]','top',1,NULL,'2024-05-18 11:55:35','2024-05-18 13:39:43'),
(2,'Useful Links','FMK5wdKCgmzjRLy','[{\"text\":\"About Us\",\"url\":\"\\/about-us\",\"blank\":false,\"is_enabled\":true},{\"text\":\"Our services\",\"url\":\"\\/services\",\"blank\":false,\"is_enabled\":true},{\"text\":\"News\",\"url\":\"\\/posts\",\"blank\":false,\"is_enabled\":true},{\"text\":\"Privacy Policy\",\"url\":\"\\/privacy-policy\",\"blank\":false,\"is_enabled\":true},{\"text\":\"Contact Us\",\"url\":\"\\/contact-us\",\"blank\":false,\"is_enabled\":true}]','footer_useful_links',1,NULL,'2024-05-25 10:37:52','2024-05-27 15:46:52'),
(3,'Our Services','XmWXfBz1kL5rB9t','[{\"text\":\"Skin Care\",\"url\":\"\\/services\\/skin-care\",\"blank\":false,\"is_enabled\":true},{\"text\":\"Needle Mesotherapy\",\"url\":\"\\/services\\/needle-mesotherapy\",\"blank\":false,\"is_enabled\":true},{\"text\":\"Laser Treatments\",\"url\":\"\\/services\\/laser-treatments\",\"blank\":false,\"is_enabled\":true},{\"text\":\"Skin Resurfacing\",\"url\":\"\\/services\\/skin-resurfacing\",\"blank\":false,\"is_enabled\":true},{\"text\":\"Plastic Surgery\",\"url\":\"\\/services\\/plastic-surgery\",\"blank\":false,\"is_enabled\":true},{\"text\":\"Hair Removal\",\"url\":\"\\/services\\/hair-removal\",\"blank\":false,\"is_enabled\":true}]','footer_our_services',1,NULL,'2024-05-25 10:42:10','2024-05-27 14:44:28');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(31,'2024_01_01_162151_add_position_to_menus',1),
(36,'2014_10_12_000000_create_users_table',2),
(37,'2014_10_12_100000_create_password_reset_tokens_table',2),
(38,'2019_08_19_000000_create_failed_jobs_table',2),
(39,'2019_12_14_000001_create_personal_access_tokens_table',2),
(40,'2023_07_07_150141_create_adm_forms_table',2),
(41,'2023_07_07_150148_create_adm_form_items_table',2),
(42,'2023_07_17_192403_create_comments_table',2),
(43,'2023_10_16_195645_create_posts_table',2),
(44,'2023_10_16_195714_create_pages_table',2),
(45,'2023_10_16_195752_create_tags_table',2),
(46,'2023_10_16_195759_create_categories_table',2),
(47,'2023_10_17_160844_create_taggables_table',2),
(48,'2023_11_04_215652_create_menus_table',2),
(49,'2024_03_20_135916_create_chunks_table',2),
(50,'2024_03_24_144556_create_permission_tables',2),
(51,'2024_03_26_134338_create_galleries_table',2),
(52,'2024_05_16_142124_create_menu_items_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES
(2,'App\\Models\\User',1),
(2,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_fields`)),
  `thumb` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `template` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_text_keys` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `views` bigint(20) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_user_id_foreign` (`user_id`),
  KEY `pages_parent_id_foreign` (`parent_id`),
  CONSTRAINT `pages_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES
(1,1,NULL,'Services','services',NULL,NULL,'{\"fields_set\":null}',NULL,'[]','services',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-18 12:00:58','2024-08-12 07:40:35'),
(4,1,NULL,'About','about',NULL,NULL,'{\"fields_set\":null}',NULL,'[]','about',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-18 12:02:02','2024-08-12 07:40:38'),
(5,1,NULL,'Contact Us','contact-us',NULL,NULL,'{\"fields_set\":null}',NULL,'[]','contact',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-18 12:02:20','2024-08-12 07:40:40'),
(6,1,NULL,'Doctors','doctors',NULL,NULL,'{\"fields_set\":\"doctors\"}',NULL,'[]','doctors',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-20 19:35:58','2024-08-12 07:40:39'),
(7,1,1,' Skin Care','skin-care','<p>Proin eget tortor risus vivamus suscipit tortor eget felis porttitor volutpat cras ultricies ligula sed magna dictum porta.</p>','<h3>Dental <span style=\"font-size: 18pt;\">Filling</span></h3>\n<p><span style=\"font-size: 12pt;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\n<ul>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Cosmetic Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">General Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Dental Implants</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Orthodontics</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Whitening</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Cleaning</span></li>\n</ul>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><img src=\"/storage/images/CaLFQDTT6PNKQbnz24LkzJHN2W0tSRKXP9uat31F.jpg\" alt=\"\" width=\"416\" height=\"416\" /><img src=\"/storage/images/xTopAwc7ulRLD5nDolGwkvoRdWmkNDODrvdrO0Gv.jpg\" alt=\"\" width=\"416\" height=\"416\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><span style=\"font-size: 18pt;\">How To Take Care During Dental</span>:&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">When To Visit your Doctor?</span>&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">Dental Options</span>:&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>','{\"fields_set\":null}','images/01HYQPFFCP5E1AE35GJQ607FHG.jpg','[]','service',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-25 10:59:22','2024-08-12 07:40:41'),
(8,1,1,' Needle Mesotherapy','needle-mesotherapy','<p>Proin eget tortor risus vivamus suscipit tortor eget felis porttitor volutpat cras ultricies ligula sed magna dictum porta.</p>','<h3>Dental&nbsp;<span style=\"font-size: 18pt;\">Filling</span></h3>\n<p><span style=\"font-size: 12pt;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\n<ul>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Cosmetic Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">General Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Dental Implants</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Orthodontics</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Whitening</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Cleaning</span></li>\n</ul>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><img src=\"/storage/images/CaLFQDTT6PNKQbnz24LkzJHN2W0tSRKXP9uat31F.jpg\" alt=\"\" width=\"416\" height=\"416\" /><img src=\"/storage/images/xTopAwc7ulRLD5nDolGwkvoRdWmkNDODrvdrO0Gv.jpg\" alt=\"\" width=\"416\" height=\"416\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><span style=\"font-size: 18pt;\">How To Take Care During Dental</span>:&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">When To Visit your Doctor?</span>&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">Dental Options</span>: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>','{\"fields_set\":null}','images/01HYQQ30RTWT2F1Y61B8D1GWS9.jpg','[]','service',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-25 11:10:03','2024-07-28 17:01:42'),
(9,1,1,'Hair Removal','hair-removal','<p>Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</p>','<h3>Dental&nbsp;<span style=\"font-size: 18pt;\">Filling</span></h3>\n<p><span style=\"font-size: 12pt;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\n<ul>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Cosmetic Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">General Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Dental Implants</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Orthodontics</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Whitening</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Cleaning</span></li>\n</ul>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><img src=\"/storage/images/CaLFQDTT6PNKQbnz24LkzJHN2W0tSRKXP9uat31F.jpg\" alt=\"\" width=\"416\" height=\"416\" /><img src=\"/storage/images/xTopAwc7ulRLD5nDolGwkvoRdWmkNDODrvdrO0Gv.jpg\" alt=\"\" width=\"416\" height=\"416\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><span style=\"font-size: 18pt;\">How To Take Care During Dental</span>:&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">When To Visit your Doctor?</span>&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">Dental Options</span>: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>','{\"fields_set\":null}','images/01HYX5AC1N44JD5F48X34F0GF3.jpg','[]','service',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-27 13:54:56','2024-07-28 17:01:43'),
(10,1,1,'Laser Treatments','laser-treatments','<p>Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</p>','<h3>Dental&nbsp;<span style=\"font-size: 18pt;\">Filling</span></h3>\n<p><span style=\"font-size: 12pt;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\n<ul>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Cosmetic Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">General Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Dental Implants</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Orthodontics</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Whitening</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Cleaning</span></li>\n</ul>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><img src=\"/storage/images/CaLFQDTT6PNKQbnz24LkzJHN2W0tSRKXP9uat31F.jpg\" alt=\"\" width=\"416\" height=\"416\" /><img src=\"/storage/images/xTopAwc7ulRLD5nDolGwkvoRdWmkNDODrvdrO0Gv.jpg\" alt=\"\" width=\"416\" height=\"416\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><span style=\"font-size: 18pt;\">How To Take Care During Dental</span>:&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">When To Visit your Doctor?</span>&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">Dental Options</span>: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>','{\"fields_set\":null}','images/01HYX5HGARVNY4KAP9AMFQ2P8B.jpg','[]','service',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-27 13:57:50','2024-08-12 07:40:43'),
(11,1,1,'Skin Resurfacing','skin-resurfacing','<p>Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</p>','<h3>Dental&nbsp;<span style=\"font-size: 18pt;\">Filling</span></h3>\n<p><span style=\"font-size: 12pt;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\n<ul>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Cosmetic Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">General Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Dental Implants</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Orthodontics</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Whitening</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Cleaning</span></li>\n</ul>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><img src=\"/storage/images/CaLFQDTT6PNKQbnz24LkzJHN2W0tSRKXP9uat31F.jpg\" alt=\"\" width=\"416\" height=\"416\" /><img src=\"/storage/images/xTopAwc7ulRLD5nDolGwkvoRdWmkNDODrvdrO0Gv.jpg\" alt=\"\" width=\"416\" height=\"416\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><span style=\"font-size: 18pt;\">How To Take Care During Dental</span>:&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">When To Visit your Doctor?</span>&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">Dental Options</span>: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>','{\"fields_set\":null}','images/01HYX5MMZN36N6AF68KMYDZKXQ.jpg','[]','service',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-27 14:00:33','2024-05-27 15:49:57'),
(12,1,1,'Plastic Surgery','plastic-surgery','<p>Vivamus magna justo lacinia eget consectetur sed convallis at tellus. Nulla quis lorem ut libero malesuada feugiat.</p>','<h3>Dental&nbsp;<span style=\"font-size: 18pt;\">Filling</span></h3>\n<p><span style=\"font-size: 12pt;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\n<ul>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Cosmetic Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">General Dentistry</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Dental Implants</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Orthodontics</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Whitening</span></li>\n<li><span style=\"color: #212529; font-family: Poppins, sans-serif; font-size: 16px; background-color: #ffffff;\">Teeth Cleaning</span></li>\n</ul>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><img src=\"/storage/images/CaLFQDTT6PNKQbnz24LkzJHN2W0tSRKXP9uat31F.jpg\" alt=\"\" width=\"416\" height=\"416\" /><img src=\"/storage/images/xTopAwc7ulRLD5nDolGwkvoRdWmkNDODrvdrO0Gv.jpg\" alt=\"\" width=\"416\" height=\"416\" /></p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p><span style=\"font-size: 18pt;\">How To Take Care During Dental</span>:&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">When To Visit your Doctor?</span>&nbsp;It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>\n<p><span style=\"font-size: 18pt;\">Dental Options</span>: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of psum is that it has a more or-less normal distribution of letters, as opposed to using.</p>','{\"fields_set\":null}','images/01HYX5QVBVJQQZ55F93HE0RY3B.jpg','[]','service',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-27 14:02:17','2024-05-27 16:30:36'),
(13,1,NULL,'Safety & Technology','safety-technology',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','{\"fields_set\":null}','images/01HYX9VNE2RBSAJDH8YH6ER74Z.jpg','[]','page',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-27 15:02:12','2024-05-27 15:59:14'),
(14,1,NULL,'Experienced Team','experienced-team','<p>Proin eget tortor risus vivamus suscipit tortor eget felis porttitor volutpat cras ultricies ligula sed magna dictum porta.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','{\"fields_set\":null}',NULL,'[]','page',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-27 15:09:20','2024-07-28 17:01:38'),
(15,1,NULL,'Modern Equipment','modern-equipment','<p>Proin eget tortor risus vivamus suscipit tortor eget felis porttitor volutpat cras ultricies ligula sed magna dictum porta.</p>','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>','{\"fields_set\":null}',NULL,'[]','page',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-27 15:10:25','2024-05-27 15:59:20'),
(16,1,NULL,'Privacy policy ','privacy-policy',NULL,'<p>Effective Date: [Date]</p>\n<p>1. Introduction</p>\n<p>Welcome to [Your Company Name] (\"we\", \"our\", \"us\")! We are committed to protecting and respecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website [your website URL], use our services, or interact with us in other ways. Please read this policy carefully to understand our views and practices regarding your personal data and how we will treat it.</p>\n<p>2. Information We Collect</p>\n<p>We may collect and process the following data about you:</p>\n<ul>\n<li>Personal Identification Information: Name, email address, phone number, etc.</li>\n<li>Technical Data: IP address, browser type, operating system, and other technical data collected through cookies and similar technologies.</li>\n<li>Usage Data: Information about how you use our website, products, and services.</li>\n<li>Marketing and Communications Data: Your preferences in receiving marketing from us and your communication preferences.</li>\n</ul>\n<p>3. How We Use Your Information</p>\n<p>We use the information we collect in various ways, including to:</p>\n<ul>\n<li>Provide, operate, and maintain our website and services.</li>\n<li>Improve, personalize, and expand our website and services.</li>\n<li>Understand and analyze how you use our website and services.</li>\n<li>Develop new products, services, features, and functionality.</li>\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes.</li>\n<li>Process your transactions and manage your orders.</li>\n<li>Send you emails.</li>\n<li>Find and prevent fraud.</li>\n</ul>\n<p>4. Sharing Your Information</p>\n<p>We may share your information with third parties in the following situations:</p>\n<ul>\n<li>With Service Providers: We may share your information with third-party vendors, service providers, contractors, or agents who perform services on our behalf.</li>\n<li>For Business Transfers: We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.</li>\n<li>With Affiliates: We may share your information with our affiliates, in which case we will require those affiliates to honor this Privacy Policy.</li>\n<li>With Business Partners: We may share your information with our business partners to offer you certain products, services, or promotions.</li>\n<li>With Your Consent: We may disclose your personal information for any other purpose with your consent.</li>\n<li>As Required by Law: We may disclose your information if we are required to do so by law or if we believe that such action is necessary to comply with the law and the reasonable requests of law enforcement.</li>\n</ul>\n<p>5. Security of Your Information</p>\n<p>We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against any interception or other type of misuse.</p>\n<p>6. Your Data Protection Rights</p>\n<p>Depending on your location, you may have the following rights regarding your personal data:</p>\n<ul>\n<li>The right to access &ndash; You have the right to request copies of your personal data.</li>\n<li>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate or complete information you believe is incomplete.</li>\n<li>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.</li>\n<li>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.</li>\n<li>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.</li>\n<li>The right to data portability &ndash; You have the right to request that we transfer the data organization, or directly to you, under certain conditions.&nbsp;\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us at our contact information provided below.</p>\n</li>\n</ul>\n<p>7. Cookies and Tracking Technologies</p>\n<p>We use cookies and similar tracking technologies to track the activity on our website and hold certain information. Cookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Tracking technologies also used are beacons, tags, and scripts to collect and track information and to improve and analyze our service.</p>\n<p>You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our service.</p>\n<p>8. Third-Party Links</p>\n<p>Our website may contain links to third-party websites, plug-ins, and applications. Clicking on those links or enabling those connections may allow third parties to collect or share data about you. We do not control these third-party websites and are not responsible for their privacy statements. When you leave our website, we encourage you to read the privacy policy of every website you visit.</p>\n<p>9. Children\'s Privacy</p>\n<p>Our services are not intended for children under the age of 13. We do not knowingly collect personally identifiable information from children under 13. If we become aware that we have collected personal data from a child under the age of 13 without verification of parental consent, we take steps to remove that information from our servers.</p>\n<p>10. Changes to This Privacy Policy</p>\n<p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the \"Effective Date\" at the top of this Privacy Policy. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\n<p>11. Contact Us</p>\n<p>If you have any questions about this Privacy Policy, please contact us:</p>\n<ul>\n<li>By email: [Your Email Address]</li>\n<li>By visiting this page on our website: [Your Contact Page URL]</li>\n<li>By mail: [Your Physical Address]</li>\n</ul>\n<p>Thank you for reading our Privacy Policy. Your privacy is important to us, and we are committed to protecting your personal data.</p>\n<hr />\n<p>This template covers common aspects of a Privacy Policy. However, it is advisable to consult with a legal professional to ensure that your Privacy Policy complies with applicable laws and regulations specific to your business and jurisdiction.</p>\n<p>&nbsp;</p>\n<p>@dd(11)</p>','{\"fields_set\":null}',NULL,'[]','page',NULL,1,NULL,NULL,NULL,NULL,NULL,'2024-05-27 15:43:09','2024-07-28 17:01:37');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_fields`)),
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_text_keys` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES
(1,1,NULL,'Discover The Confidence Of Your Skin Treatment ','discover-the-confidence-of-your-skin-treatment',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>','images/01HY1AE0WGH42H16ENMXACR7X7.jpg','[]',NULL,1,NULL,NULL,NULL,NULL,16,NULL,'2024-05-16 18:23:57','2024-05-27 16:30:02'),
(2,1,NULL,'Everyone Needs To Know The Tips To Get Rid Of Acne Face','everyone-needs-to-know-the-tips-to-get-rid-of-acne-face',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>','images/01HY1AFGGWQV6CXNH10XMMTDYY.jpg','[]',NULL,1,NULL,NULL,NULL,NULL,24,NULL,'2024-05-16 18:25:44','2024-06-06 04:35:25'),
(3,1,NULL,'Can You Solve Any Skin Damage Problem?','can-you-solve-any-skin-damage-problem',NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>','images/01HY1AGK9A5H4SWNETCXBFXNTF.jpg','[]',NULL,1,NULL,NULL,NULL,NULL,58,NULL,'2024-05-16 18:26:28','2024-06-12 09:35:48');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'user','web','2024-05-16 15:32:19','2024-05-16 15:32:19'),
(2,'admin','web','2024-05-16 15:32:19','2024-05-16 15:32:19'),
(3,'writer','web','2024-05-16 15:32:19','2024-05-16 15:32:19'),
(4,'moderator','web','2024-05-16 15:32:19','2024-05-16 15:32:19');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `taggables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `taggables` WRITE;
/*!40000 ALTER TABLE `taggables` DISABLE KEYS */;
INSERT INTO `taggables` VALUES
(1,1,3,'App\\Models\\Post',NULL,NULL),
(2,2,3,'App\\Models\\Post',NULL,NULL),
(3,3,3,'App\\Models\\Post',NULL,NULL),
(4,4,3,'App\\Models\\Post',NULL,NULL),
(5,5,3,'App\\Models\\Post',NULL,NULL),
(6,6,3,'App\\Models\\Post',NULL,NULL),
(7,4,2,'App\\Models\\Post',NULL,NULL),
(8,6,2,'App\\Models\\Post',NULL,NULL),
(9,3,2,'App\\Models\\Post',NULL,NULL),
(10,5,1,'App\\Models\\Post',NULL,NULL),
(11,2,1,'App\\Models\\Post',NULL,NULL),
(12,1,1,'App\\Models\\Post',NULL,NULL);
/*!40000 ALTER TABLE `taggables` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(1,'memdical','memdical',NULL,'2024-05-27 15:49:40','2024-05-27 15:49:40'),
(2,'stomatology','stomatology',NULL,'2024-05-27 15:49:56','2024-05-27 15:49:56'),
(3,'problem','problem',NULL,'2024-05-27 15:50:49','2024-05-27 15:50:49'),
(4,'cms','cms',NULL,'2024-05-27 15:51:10','2024-05-27 15:51:10'),
(5,'skin','skin',NULL,'2024-05-27 15:51:45','2024-05-27 15:51:45'),
(6,'news','news',NULL,'2024-05-27 15:52:00','2024-05-27 15:52:00');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin','admin@admin.com','2024-05-16 15:32:19','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','hIW6gflZ5tDN6dZ7HOt83o74R4deO5QFuEXQo5EaWghs4OKLPtWwDSFOq1WK','2024-05-16 15:32:19','2024-05-16 15:32:19'),
(2,'Vitalii','slusarsu@gmail.com',NULL,'$2y$10$G2xfWJyqXqm/42ZAtibQ9uUDKYiggyMUBeeKYbUyjkmmh3o7jDhM.',NULL,'2024-05-17 07:39:21','2024-05-17 07:39:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

