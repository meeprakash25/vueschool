# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.29)
# Database: newschool
# Generation Time: 2020-11-18 2:19:51 AM +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table academic_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `academic_sessions`;

CREATE TABLE `academic_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `academic_sessions` WRITE;
/*!40000 ALTER TABLE `academic_sessions` DISABLE KEYS */;

INSERT INTO `academic_sessions` (`id`, `name`, `start_date`, `end_date`, `is_default`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'2020','2020-10-01','2021-02-12',1,NULL,'{\"transfer_certificate_format\":null,\"exam_report_analysis\":0,\"exam_report_analysis_student_token\":null,\"exam_report_analysis_staff_token\":null}','2020-10-06 20:23:58','2020-10-06 20:23:58');

/*!40000 ALTER TABLE `academic_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table account_transfers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_transfers`;

CREATE TABLE `account_transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_account_id` bigint(20) unsigned DEFAULT NULL,
  `to_account_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_account_transfer` date DEFAULT NULL,
  `amount` decimal(25,5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transfers_from_account_id_foreign` (`from_account_id`),
  KEY `account_transfers_to_account_id_foreign` (`to_account_id`),
  KEY `account_transfers_user_id_foreign` (`user_id`),
  CONSTRAINT `account_transfers_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_transfers_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_transfers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_identification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table activity_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity_log`;

CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'user_preference','created',1,'App\\UserPreference',NULL,NULL,'{\"attributes\":{\"color_theme\":null,\"sidebar\":null,\"locale\":null,\"direction\":null,\"academic_session_id\":null,\"options\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(2,'user_preference','updated',1,'App\\UserPreference',1,'App\\User','{\"attributes\":{\"color_theme\":\"blue\",\"sidebar\":\"mini\",\"locale\":\"en\",\"direction\":\"ltr\"},\"old\":{\"color_theme\":null,\"sidebar\":null,\"locale\":null,\"direction\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:22:26','2020-10-06 20:22:26'),
	(3,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:22:26','2020-10-06 20:22:26'),
	(4,'config','updated',66,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"institute_name\":\"thulung\"},\"old\":{\"institute_name\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:11','2020-10-06 20:23:11'),
	(5,'config','updated',67,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"institute_running_body\":\"2\"},\"old\":{\"institute_running_body\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:11','2020-10-06 20:23:11'),
	(6,'config','updated',70,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"institute_foundation_date\":\"2020-10-01T09:09:00.000Z\"},\"old\":{\"institute_foundation_date\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:11','2020-10-06 20:23:11'),
	(7,'config','updated',71,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"address_line_1\":\"solukhumbu\"},\"old\":{\"address_line_1\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:11','2020-10-06 20:23:11'),
	(8,'config','updated',76,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"country\":\"nepal\"},\"old\":{\"country\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:11','2020-10-06 20:23:11'),
	(9,'config','updated',79,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"email\":\"oshrestha361@gmail.com\"},\"old\":{\"email\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:11','2020-10-06 20:23:11'),
	(10,'config','updated',83,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"https\":\"0\"},\"old\":{\"https\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:20','2020-10-06 20:23:20'),
	(11,'config','updated',84,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"error_display\":\"0\"},\"old\":{\"error_display\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:20','2020-10-06 20:23:20'),
	(12,'config','updated',30,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"online_registration\":\"0\"},\"old\":{\"online_registration\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:20','2020-10-06 20:23:20'),
	(13,'config','updated',85,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"maintenance_mode\":\"0\"},\"old\":{\"maintenance_mode\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:23:20','2020-10-06 20:23:20'),
	(14,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:24:22','2020-10-06 20:24:22'),
	(15,'user_preference','updated',1,'App\\UserPreference',1,'App\\User','{\"attributes\":{\"academic_session_id\":1},\"old\":{\"academic_session_id\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:24:41','2020-10-06 20:24:41'),
	(16,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:24:41','2020-10-06 20:24:41'),
	(17,'logo','uploaded',17,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"logo\":\"storage\\/logo\\/2e1wP5x5sMjHcKqjauWjdLqQgdLEq2hRyLUdHIvr.jpeg\"},\"old\":{\"logo\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:26:54','2020-10-06 20:26:54'),
	(18,'icon','uploaded',18,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"icon\":\"storage\\/icon\\/63Cdyoysv0YkctJql5Q8d1sOGTZFy5OCeWxvDtxo.jpeg\"},\"old\":{\"icon\":null},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:26:57','2020-10-06 20:26:57'),
	(19,'frontend_page','created',1,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"company profile\",\"body\":\"<p>lorem\\u00a0 \\u00a0 kajshd aksidj apsdhdiah doiauhsfd oihaoifdud oaisuhfdo iuahsdfuih asodfihaosifd hoiauhfoiah fdoiuhasoifduh oasiudfh ouasfd osagdfouags fdouasfdod af afia sifddh iashfdioauhsfd doiuahsfd ihuasdffiuha ofiuh aofdiudh aishffisahfo is<\\/p>\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/HxTtc1y8nvG30aeQGYH8hPa74u7KMliTtdiStnHN.jpeg\",\"title\":\"thulung\",\"description\":\"jhbjhbj\"}]}},\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:33:29','2020-10-06 20:33:29'),
	(20,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"27.34.69.243\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 20:33:41','2020-10-06 20:33:41'),
	(21,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"27.34.20.63\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-06 22:12:55','2020-10-06 22:12:55'),
	(22,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:33:25','2020-10-08 02:33:25'),
	(23,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"120.89.103.67\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:34:13','2020-10-08 02:34:13'),
	(24,'frontend_menu','created',1,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Home\",\"slug\":null,\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(25,'frontend_menu','updated',1,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"slug\":\"home\",\"type\":\"header\",\"position\":0,\"options\":{\"is_default\":1}},\"old\":{\"slug\":null,\"type\":null,\"position\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(26,'frontend_page','created',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Home\",\"body\":null,\"is_draft\":0,\"options\":[]},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(27,'frontend_menu','updated',1,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"position\":0,\"frontend_page_id\":2},\"old\":{\"position\":null,\"frontend_page_id\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(28,'frontend_menu','created',2,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Contact\",\"slug\":null,\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(29,'frontend_menu','updated',2,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"slug\":\"contact\",\"type\":\"header\",\"position\":0,\"options\":{\"is_default\":1}},\"old\":{\"slug\":null,\"type\":null,\"position\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(30,'frontend_page','created',3,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Contact\",\"body\":null,\"is_draft\":0,\"options\":[]},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(31,'frontend_menu','updated',2,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"position\":0,\"frontend_page_id\":3},\"old\":{\"position\":null,\"frontend_page_id\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(32,'frontend_menu','created',3,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Events\",\"slug\":null,\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(33,'frontend_menu','updated',3,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"slug\":\"events\",\"type\":\"header\",\"position\":0,\"options\":{\"is_default\":1}},\"old\":{\"slug\":null,\"type\":null,\"position\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(34,'frontend_page','created',4,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Events\",\"body\":null,\"is_draft\":0,\"options\":[]},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(35,'frontend_menu','updated',3,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"position\":0,\"frontend_page_id\":4},\"old\":{\"position\":null,\"frontend_page_id\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(36,'frontend_menu','created',4,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Articles\",\"slug\":null,\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(37,'frontend_menu','updated',4,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"slug\":\"articles\",\"type\":\"header\",\"position\":0,\"options\":{\"is_default\":1}},\"old\":{\"slug\":null,\"type\":null,\"position\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(38,'frontend_page','created',5,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Articles\",\"body\":null,\"is_draft\":0,\"options\":[]},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(39,'frontend_menu','updated',4,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"position\":0,\"frontend_page_id\":5},\"old\":{\"position\":null,\"frontend_page_id\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(40,'frontend_menu','created',5,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Teachers\",\"slug\":null,\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(41,'frontend_menu','updated',5,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"slug\":\"teachers\",\"type\":\"header\",\"position\":0,\"options\":{\"is_default\":1}},\"old\":{\"slug\":null,\"type\":null,\"position\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(42,'frontend_page','created',6,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Teachers\",\"body\":null,\"is_draft\":0,\"options\":[]},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(43,'frontend_menu','updated',5,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"position\":0,\"frontend_page_id\":6},\"old\":{\"position\":null,\"frontend_page_id\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(44,'frontend_menu','created',6,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Calendar\",\"slug\":null,\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(45,'frontend_menu','updated',6,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"slug\":\"calendar\",\"type\":\"header\",\"position\":0,\"options\":{\"is_default\":1}},\"old\":{\"slug\":null,\"type\":null,\"position\":null,\"options\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(46,'frontend_page','created',7,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Calendar\",\"body\":null,\"is_draft\":0,\"options\":[]},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(47,'frontend_menu','updated',6,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"position\":0,\"frontend_page_id\":7},\"old\":{\"position\":null,\"frontend_page_id\":null},\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(48,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"27.34.18.183\",\"user_agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 02:59:14','2020-10-08 02:59:14'),
	(49,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"27.34.68.154\",\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 8.0.0; SC-02H) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.127 Mobile Safari\\/537.36\"}',NULL,'2020-10-08 03:02:27','2020-10-08 03:02:27'),
	(50,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:46:51','2020-10-08 21:46:51'),
	(51,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:51:01','2020-10-08 21:51:01'),
	(52,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:51:11','2020-10-08 21:51:11'),
	(53,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:54:24','2020-10-08 21:54:24'),
	(54,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:54:30','2020-10-08 21:54:30'),
	(55,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:56:22','2020-10-08 21:56:22'),
	(56,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:56:27','2020-10-08 21:56:27'),
	(57,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:56:52','2020-10-08 21:56:52'),
	(58,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 21:57:35','2020-10-08 21:57:35'),
	(59,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:05:15','2020-10-08 22:05:15'),
	(60,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:05:21','2020-10-08 22:05:21'),
	(61,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:09:46','2020-10-08 22:09:46'),
	(62,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:09:51','2020-10-08 22:09:51'),
	(63,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:10:11','2020-10-08 22:10:11'),
	(64,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:10:16','2020-10-08 22:10:16'),
	(65,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:20:54','2020-10-08 22:20:54'),
	(66,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:20:59','2020-10-08 22:20:59'),
	(67,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:23:07','2020-10-08 22:23:07'),
	(68,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:23:14','2020-10-08 22:23:14'),
	(69,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:25:03','2020-10-08 22:25:03'),
	(70,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:25:07','2020-10-08 22:25:07'),
	(71,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:27:30','2020-10-08 22:27:30'),
	(72,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:27:34','2020-10-08 22:27:34'),
	(73,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:28:24','2020-10-08 22:28:24'),
	(74,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:28:28','2020-10-08 22:28:28'),
	(75,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:36:43','2020-10-08 22:36:43'),
	(76,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 22:58:09','2020-10-08 22:58:09'),
	(77,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 23:08:37','2020-10-08 23:08:37'),
	(78,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 23:09:15','2020-10-08 23:09:15'),
	(79,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-08 23:56:05','2020-10-08 23:56:05'),
	(80,'frontend_page','updated',4,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"Event one\",\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"old\":{\"body\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:01:05','2020-10-09 00:01:05'),
	(81,'frontend_page','updated',5,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"heloo there\",\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"old\":{\"body\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:01:49','2020-10-09 00:01:49'),
	(82,'config','updated',3,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"color_theme\":\"default\"},\"old\":{\"color_theme\":\"blue\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:21','2020-10-09 00:05:21'),
	(83,'config','updated',83,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"https\":\"0\"},\"old\":{\"https\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:21','2020-10-09 00:05:21'),
	(84,'config','updated',84,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"error_display\":\"0\"},\"old\":{\"error_display\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:21','2020-10-09 00:05:21'),
	(85,'config','updated',30,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"online_registration\":\"0\"},\"old\":{\"online_registration\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:21','2020-10-09 00:05:21'),
	(86,'config','updated',85,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"maintenance_mode\":\"0\"},\"old\":{\"maintenance_mode\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:21','2020-10-09 00:05:21'),
	(87,'config','updated',3,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"color_theme\":\"green\"},\"old\":{\"color_theme\":\"default\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:26','2020-10-09 00:05:26'),
	(88,'config','updated',83,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"https\":\"0\"},\"old\":{\"https\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:26','2020-10-09 00:05:26'),
	(89,'config','updated',84,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"error_display\":\"0\"},\"old\":{\"error_display\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:26','2020-10-09 00:05:26'),
	(90,'config','updated',30,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"online_registration\":\"0\"},\"old\":{\"online_registration\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:26','2020-10-09 00:05:26'),
	(91,'config','updated',85,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"maintenance_mode\":\"0\"},\"old\":{\"maintenance_mode\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:26','2020-10-09 00:05:26'),
	(92,'config','updated',3,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"color_theme\":\"megna\"},\"old\":{\"color_theme\":\"green\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:30','2020-10-09 00:05:30'),
	(93,'config','updated',83,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"https\":\"0\"},\"old\":{\"https\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:30','2020-10-09 00:05:30'),
	(94,'config','updated',84,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"error_display\":\"0\"},\"old\":{\"error_display\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:30','2020-10-09 00:05:30'),
	(95,'config','updated',30,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"online_registration\":\"0\"},\"old\":{\"online_registration\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:30','2020-10-09 00:05:30'),
	(96,'config','updated',85,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"maintenance_mode\":\"0\"},\"old\":{\"maintenance_mode\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:30','2020-10-09 00:05:30'),
	(97,'config','updated',3,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"color_theme\":\"purple\"},\"old\":{\"color_theme\":\"megna\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:36','2020-10-09 00:05:36'),
	(98,'config','updated',83,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"https\":\"0\"},\"old\":{\"https\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:36','2020-10-09 00:05:36'),
	(99,'config','updated',84,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"error_display\":\"0\"},\"old\":{\"error_display\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:36','2020-10-09 00:05:36'),
	(100,'config','updated',30,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"online_registration\":\"0\"},\"old\":{\"online_registration\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:36','2020-10-09 00:05:36'),
	(101,'config','updated',85,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"maintenance_mode\":\"0\"},\"old\":{\"maintenance_mode\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:05:36','2020-10-09 00:05:36'),
	(102,'config','updated',102,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"facebook_link\":\"https:\\/\\/www.facebook.com\"},\"old\":{\"facebook_link\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:09:52','2020-10-09 00:09:52'),
	(103,'config','updated',103,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"twitter_link\":\"https:\\/\\/www.twitter.com\"},\"old\":{\"twitter_link\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:09:52','2020-10-09 00:09:52'),
	(104,'config','updated',104,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"linkedin_link\":\"https:\\/\\/www.linkedln.com\"},\"old\":{\"linkedin_link\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:09:52','2020-10-09 00:09:52'),
	(105,'config','updated',105,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"google_plus_link\":\"https:\\/\\/www.google.com\"},\"old\":{\"google_plus_link\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:09:52','2020-10-09 00:09:52'),
	(106,'config','updated',106,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"youtube_link\":\"https:\\/\\/www.youtube.com\"},\"old\":{\"youtube_link\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:09:52','2020-10-09 00:09:52'),
	(107,'article','created',1,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 1\",\"date_of_article\":\"2020-10-08T18:30:00.000000Z\",\"is_public\":1,\"description\":\"This is news one\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:11:21','2020-10-09 00:11:21'),
	(108,'article','created',2,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"My Blog\",\"date_of_article\":\"2020-10-08T18:30:00.000000Z\",\"is_public\":1,\"description\":\"My blog\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:12:21','2020-10-09 00:12:21'),
	(109,'config','updated',83,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"https\":\"0\"},\"old\":{\"https\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:14','2020-10-09 00:15:14'),
	(110,'config','updated',84,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"error_display\":\"1\"},\"old\":{\"error_display\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:14','2020-10-09 00:15:14'),
	(111,'config','updated',30,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"online_registration\":\"0\"},\"old\":{\"online_registration\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:14','2020-10-09 00:15:14'),
	(112,'config','updated',27,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"multilingual\":\"0\"},\"old\":{\"multilingual\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:14','2020-10-09 00:15:14'),
	(113,'config','updated',85,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"maintenance_mode\":\"0\"},\"old\":{\"maintenance_mode\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:14','2020-10-09 00:15:14'),
	(114,'config','updated',5,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"sidebar\":\"normal\"},\"old\":{\"sidebar\":\"mini\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:26','2020-10-09 00:15:26'),
	(115,'config','updated',83,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"https\":\"0\"},\"old\":{\"https\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:26','2020-10-09 00:15:26'),
	(116,'config','updated',30,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"online_registration\":\"0\"},\"old\":{\"online_registration\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:26','2020-10-09 00:15:26'),
	(117,'config','updated',27,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"multilingual\":\"0\"},\"old\":{\"multilingual\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:26','2020-10-09 00:15:26'),
	(118,'config','updated',85,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"maintenance_mode\":\"0\"},\"old\":{\"maintenance_mode\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:26','2020-10-09 00:15:26'),
	(119,'config','updated',8,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"first_day_of_week\":\"sunday\"},\"old\":{\"first_day_of_week\":\"monday\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:42','2020-10-09 00:15:42'),
	(120,'config','updated',83,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"https\":\"0\"},\"old\":{\"https\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:42','2020-10-09 00:15:42'),
	(121,'config','updated',30,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"online_registration\":\"0\"},\"old\":{\"online_registration\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:42','2020-10-09 00:15:42'),
	(122,'config','updated',27,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"multilingual\":\"0\"},\"old\":{\"multilingual\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:42','2020-10-09 00:15:42'),
	(123,'config','updated',85,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"maintenance_mode\":\"0\"},\"old\":{\"maintenance_mode\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:15:42','2020-10-09 00:15:42'),
	(124,'event','created',1,'App\\Models\\Calendar\\Event',1,'App\\User','{\"attributes\":{\"event_type_id\":2,\"title\":\"Inter school Basketball Competition\",\"description\":\"Hello, our school would like to inform you that there is a inter school basketball competition starting from 10th of october.\",\"start_date\":\"2020-10-09T18:30:00.000000Z\",\"start_time\":\"13:01:00\",\"end_date\":\"2020-10-14T18:30:00.000000Z\",\"end_time\":\"17:00:00\",\"venue\":\"Our Schoool\",\"audience\":\"everyone\",\"user_id\":1,\"upload_token\":\"2d18574f-37e1-4993-bf2a-1ac4a2b79a96\",\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:18:42','2020-10-09 00:18:42'),
	(125,'event','created',2,'App\\Models\\Calendar\\Event',1,'App\\User','{\"attributes\":{\"event_type_id\":4,\"title\":\"National Cricket Championship\",\"description\":\"<strong style=\\\"margin:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span>\",\"start_date\":\"2020-10-28T18:30:00.000000Z\",\"start_time\":\"13:01:00\",\"end_date\":\"2020-10-30T18:30:00.000000Z\",\"end_time\":\"17:00:00\",\"venue\":\"TU Cricket ground\",\"audience\":\"everyone\",\"user_id\":1,\"upload_token\":\"2972a5ba-0d7b-4569-b81e-0445e783f289\",\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:20:19','2020-10-09 00:20:19'),
	(126,'event','created',3,'App\\Models\\Calendar\\Event',1,'App\\User','{\"attributes\":{\"event_type_id\":2,\"title\":\"Inter school Volleyball Tournament\",\"description\":\"<strong style=\\\"margin:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span>\",\"start_date\":\"2020-11-10T18:30:00.000000Z\",\"start_time\":\"13:01:00\",\"end_date\":\"2020-11-29T18:30:00.000000Z\",\"end_time\":\"17:00:00\",\"venue\":\"School Sports Hall\",\"audience\":\"everyone\",\"user_id\":1,\"upload_token\":\"3dd24d1d-ff90-4282-9684-7546ede39486\",\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:27:04','2020-10-09 00:27:04'),
	(127,'article','created',3,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"Circular Article\",\"date_of_article\":\"2020-10-28T18:30:00.000000Z\",\"is_public\":1,\"description\":\"<p>\\u00a0\\u00a0\\u00a0\\u00a0<strong style=\\\"margin:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span><\\/p><p>\\u00a0\\u00a0\\u00a0\\u00a0<strong style=\\\"margin:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span><br \\/><\\/p>\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:28:12','2020-10-09 00:28:12'),
	(128,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><\\/div><div><br \\/><\\/div>\",\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":1,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}]}},\"old\":{\"body\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:34:51','2020-10-09 00:34:51'),
	(129,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"About Us\",\"body\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div><br \\/><\\/div>\"},\"old\":{\"title\":\"Home\",\"body\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:36:33','2020-10-09 00:36:33'),
	(130,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Message From Principal<\\/h1><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:42:01','2020-10-09 00:42:01'),
	(131,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h2 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Message From Principal<\\/h2><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><img src=\\\"\\/storage\\/editor-images\\/mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" style=\\\"width:217.844px;height:217.844px;\\\" alt=\\\"mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" \\/>\\u00a0 \\u00a0 \\u00a0<span style=\\\"background-color:rgb(255,255,0);\\\"><\\/span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/h1><\\/div><div><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Message From Principal<\\/h1><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:43:52','2020-10-09 00:43:52'),
	(132,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p style=\\\"text-align:center;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h2 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><span style=\\\"background-color:rgb(255,0,0);\\\">Message From Principal<\\/span><\\/h2><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><img src=\\\"\\/storage\\/editor-images\\/mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" style=\\\"width:217.844px;height:217.844px;\\\" alt=\\\"mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" \\/>\\u00a0 \\u00a0 \\u00a0<\\/h1><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><span style=\\\"background-color:rgb(255,255,0);\\\"><\\/span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/h1><\\/div><div><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h2 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">Message From Principal<\\/h2><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><img src=\\\"\\/storage\\/editor-images\\/mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" style=\\\"width:217.844px;height:217.844px;\\\" alt=\\\"mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" \\/>\\u00a0 \\u00a0 \\u00a0<span style=\\\"background-color:rgb(255,255,0);\\\"><\\/span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/h1><\\/div><div><br \\/><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:46:59','2020-10-09 00:46:59'),
	(133,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p style=\\\"text-align:center;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h2 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><span style=\\\"background-color:rgb(255,0,0);\\\">Message From Principal<\\/span><\\/h2><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><img src=\\\"\\/storage\\/editor-images\\/mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" style=\\\"width:217.844px;height:217.844px;\\\" alt=\\\"mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" \\/>\\u00a0 \\u00a0 \\u00a0<\\/h1><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><\\/div><div><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<p style=\\\"text-align:center;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h2 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><span style=\\\"background-color:rgb(255,0,0);\\\">Message From Principal<\\/span><\\/h2><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><img src=\\\"\\/storage\\/editor-images\\/mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" style=\\\"width:217.844px;height:217.844px;\\\" alt=\\\"mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" \\/>\\u00a0 \\u00a0 \\u00a0<\\/h1><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><span style=\\\"background-color:rgb(255,255,0);\\\"><\\/span>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/h1><\\/div><div><br \\/><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:47:52','2020-10-09 00:47:52'),
	(134,'frontend_page','deleted',1,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"company profile\",\"body\":\"<p>lorem\\u00a0 \\u00a0 kajshd aksidj apsdhdiah doiauhsfd oihaoifdud oaisuhfdo iuahsdfuih asodfihaosifd hoiauhfoiah fdoiuhasoifduh oasiudfh ouasfd osagdfouags fdouasfdod af afia sifddh iashfdioauhsfd doiuahsfd ihuasdffiuha ofiuh aofdiudh aishffisahfo is<\\/p>\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/HxTtc1y8nvG30aeQGYH8hPa74u7KMliTtdiStnHN.jpeg\",\"title\":\"thulung\",\"description\":\"jhbjhbj\"}]}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:49:20','2020-10-09 00:49:20'),
	(135,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p style=\\\"text-align:center;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h2 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><span style=\\\"background-color:rgb(255,0,0);\\\">Message From Principal<\\/span><\\/h2><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><img src=\\\"\\/storage\\/editor-images\\/mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" style=\\\"width:217.844px;height:217.844px;\\\" alt=\\\"mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" \\/>\\u00a0 \\u00a0 \\u00a0<\\/h1><p style=\\\"margin-right:0px;margin-bottom:15px;padding:0px;text-align:justify;font-size:14px;\\\"><font face=\\\"sans-serif\\\"><u><b>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/b><\\/u><\\/font><\\/p><\\/div><div style=\\\"text-align:justify;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<p style=\\\"text-align:center;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h2 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><span style=\\\"background-color:rgb(255,0,0);\\\">Message From Principal<\\/span><\\/h2><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><img src=\\\"\\/storage\\/editor-images\\/mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" style=\\\"width:217.844px;height:217.844px;\\\" alt=\\\"mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" \\/>\\u00a0 \\u00a0 \\u00a0<\\/h1><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><\\/div><div><br \\/><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:52:00','2020-10-09 00:52:00'),
	(136,'frontend_block','created',1,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Block 1\",\"body\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\",\"frontend_menu_id\":2,\"url\":null,\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 00:59:08','2020-10-09 00:59:08'),
	(137,'frontend_block','created',2,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature1\",\"body\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors.\",\"frontend_menu_id\":null,\"url\":\"#\",\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:00:09','2020-10-09 01:00:09'),
	(138,'frontend_block','updated',1,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Principle Message\",\"frontend_menu_id\":null,\"url\":\"#\"},\"old\":{\"title\":\"Block 1\",\"frontend_menu_id\":2,\"url\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:01:16','2020-10-09 01:01:16'),
	(139,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p style=\\\"text-align:center;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:justify;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<p style=\\\"text-align:center;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><br \\/><\\/p><h2 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><span style=\\\"background-color:rgb(255,0,0);\\\">Message From Principal<\\/span><\\/h2><h1 style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><img src=\\\"\\/storage\\/editor-images\\/mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" style=\\\"width:217.844px;height:217.844px;\\\" alt=\\\"mix7Xw7H2fwS3q7Xb2rO9piPJuNzQYPwwUR33sRG.jpeg\\\" \\/>\\u00a0 \\u00a0 \\u00a0<\\/h1><p style=\\\"margin-right:0px;margin-bottom:15px;padding:0px;text-align:justify;font-size:14px;\\\"><font face=\\\"sans-serif\\\"><u><b>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/b><\\/u><\\/font><\\/p><\\/div><div style=\\\"text-align:justify;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:02:47','2020-10-09 01:02:47'),
	(140,'frontend_block','created',3,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 2\",\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\",\"frontend_menu_id\":null,\"url\":null,\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:05:03','2020-10-09 01:05:03'),
	(141,'frontend_block','created',4,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 3\",\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\",\"frontend_menu_id\":null,\"url\":null,\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:05:33','2020-10-09 01:05:33'),
	(142,'frontend_block','created',5,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 4\",\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\",\"frontend_menu_id\":null,\"url\":null,\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:05:45','2020-10-09 01:05:45'),
	(143,'frontend_block','created',6,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 5\",\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\",\"frontend_menu_id\":null,\"url\":null,\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:08:18','2020-10-09 01:08:18'),
	(144,'frontend_block','updated',2,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"url\":null},\"old\":{\"url\":\"#\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:08:43','2020-10-09 01:08:43'),
	(145,'frontend_page','created',8,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"About Thulung School\",\"body\":\"<p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/p>\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:10:43','2020-10-09 01:10:43'),
	(146,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 01:11:05','2020-10-09 01:11:05'),
	(147,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 08:40:44','2020-10-09 08:40:44'),
	(148,'frontend_block','deleted',6,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 5\",\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\",\"frontend_menu_id\":null,\"url\":null,\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 08:41:13','2020-10-09 08:41:13'),
	(149,'frontend_block','updated',1,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is and a search for \'lorem ipsum\' will uncover many.\"},\"old\":{\"body\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 08:43:56','2020-10-09 08:43:56'),
	(150,'frontend_block','updated',2,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\"},\"old\":{\"body\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors.\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-09 08:45:01','2020-10-09 08:45:01'),
	(151,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 19:43:29','2020-10-10 19:43:29'),
	(152,'user_preference','updated',1,'App\\UserPreference',1,'App\\User','{\"attributes\":{\"color_theme\":\"green\"},\"old\":{\"color_theme\":\"blue\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 19:44:14','2020-10-10 19:44:14'),
	(153,'user_preference','updated',1,'App\\UserPreference',1,'App\\User','{\"attributes\":{\"sidebar\":\"normal\"},\"old\":{\"sidebar\":\"mini\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 19:44:19','2020-10-10 19:44:19'),
	(154,'frontend_block','updated',2,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Message From Chairman\",\"url\":\"#\",\"featured_image\":\"storage\\/frontend-block-featured-image\\/L21qstu18BwcHkl1RCySf8A4NQPzdDw8RT1f04xQ.jpeg\"},\"old\":{\"title\":\"Feature1\",\"url\":null,\"featured_image\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 19:45:23','2020-10-10 19:45:23'),
	(155,'frontend_block','updated',1,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"featured_image\":\"storage\\/frontend-block-featured-image\\/lbGwladhZx7CrNHN0f9UP0zPkEl4IQWDyhIGsf9e.jpeg\"},\"old\":{\"featured_image\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 19:46:37','2020-10-10 19:46:37'),
	(156,'frontend_menu','created',7,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Quick Links\",\"slug\":\"quick-links\",\"type\":\"footer\",\"parent_id\":null,\"position\":0,\"frontend_page_id\":2,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 22:51:42','2020-10-10 22:51:42'),
	(157,'frontend_menu','deleted',7,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Quick Links\",\"slug\":\"quick-links\",\"type\":\"footer\",\"parent_id\":null,\"position\":0,\"frontend_page_id\":2,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 22:55:47','2020-10-10 22:55:47'),
	(158,'frontend_menu','created',8,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Link 1\",\"slug\":\"link-1\",\"type\":\"footer\",\"parent_id\":null,\"position\":0,\"frontend_page_id\":2,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 22:56:09','2020-10-10 22:56:09'),
	(159,'frontend_menu','created',9,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Link 2\",\"slug\":\"link-2\",\"type\":\"footer\",\"parent_id\":null,\"position\":0,\"frontend_page_id\":5,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 22:56:18','2020-10-10 22:56:18'),
	(160,'frontend_menu','created',10,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Link 3\",\"slug\":\"link-3\",\"type\":\"footer\",\"parent_id\":null,\"position\":0,\"frontend_page_id\":3,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 22:56:31','2020-10-10 22:56:31'),
	(161,'frontend_menu','created',11,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Link 4\",\"slug\":\"link-4\",\"type\":\"footer\",\"parent_id\":null,\"position\":0,\"frontend_page_id\":4,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 22:56:41','2020-10-10 22:56:41'),
	(162,'frontend_menu','created',12,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Link 5\",\"slug\":\"link-5\",\"type\":\"footer\",\"parent_id\":null,\"position\":0,\"frontend_page_id\":6,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-10 22:58:48','2020-10-10 22:58:48'),
	(163,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Home About Us\"},\"old\":{\"title\":\"About Us\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 00:22:40','2020-10-11 00:22:40'),
	(164,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:left;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<p style=\\\"text-align:center;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:justify;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 09:20:26','2020-10-11 09:20:26'),
	(165,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}]}},\"old\":{\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":1,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}]}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 09:25:06','2020-10-11 09:25:06'),
	(166,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":1,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}]}},\"old\":{\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}]}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 09:25:45','2020-10-11 09:25:45'),
	(167,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":1,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/FLhhQMRd63MoBcG3f7BOcEkyAuei1nu64TxU5zPT.png\",\"title\":\"Test\",\"description\":\"Test\"}]}},\"old\":{\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":1,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}]}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 09:40:38','2020-10-11 09:40:38'),
	(168,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":1,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}]}},\"old\":{\"options\":{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":1,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/FLhhQMRd63MoBcG3f7BOcEkyAuei1nu64TxU5zPT.png\",\"title\":\"Test\",\"description\":\"Test\"}]}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 15:44:14','2020-10-11 15:44:14'),
	(169,'frontend_page','updated',6,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"Teachers\",\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"old\":{\"body\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 16:00:21','2020-10-11 16:00:21'),
	(170,'config','updated',71,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"address_line_1\":\"Balkot-6\"},\"old\":{\"address_line_1\":\"solukhumbu\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 17:49:18','2020-10-11 17:49:18'),
	(171,'config','updated',73,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"city\":\"Bhaktapur\"},\"old\":{\"city\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 17:49:18','2020-10-11 17:49:18'),
	(172,'config','updated',75,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"zipcode\":\"44811\"},\"old\":{\"zipcode\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 17:49:18','2020-10-11 17:49:18'),
	(173,'config','updated',76,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"country\":\"Nepal\"},\"old\":{\"country\":\"nepal\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 17:49:18','2020-10-11 17:49:18'),
	(174,'config','updated',77,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"phone\":\"9843650517\"},\"old\":{\"phone\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 17:49:18','2020-10-11 17:49:18'),
	(175,'config','updated',79,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"email\":\"mee.prakash25@gmail.com\"},\"old\":{\"email\":\"oshrestha361@gmail.com\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 17:49:18','2020-10-11 17:49:18'),
	(176,'config','updated',80,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"website\":\"www.asd.com\"},\"old\":{\"website\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 18:31:36','2020-10-11 18:31:36'),
	(177,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:03:41','2020-10-11 20:03:41'),
	(178,'frontend_page','created',9,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Message From Chairman\",\"body\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<br \\/><\\/p>\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:07:25','2020-10-11 20:07:25'),
	(179,'frontend_page','created',10,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Message From Principal\",\"body\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p><br \\/><\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<br \\/><\\/p>\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:07:53','2020-10-11 20:07:53'),
	(180,'frontend_menu','created',13,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"asd\",\"slug\":\"asd\",\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":10,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:09:48','2020-10-11 20:09:48'),
	(181,'frontend_menu','updated',13,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Message From Principal\",\"slug\":\"message-from-principal\"},\"old\":{\"name\":\"asd\",\"slug\":\"asd\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:10:22','2020-10-11 20:10:22'),
	(182,'frontend_menu','created',14,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Message From Chairman\",\"slug\":\"message-from-chairman\",\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":9,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:11:29','2020-10-11 20:11:29'),
	(183,'frontend_block','updated',1,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Message From Principal\",\"frontend_menu_id\":13,\"url\":null},\"old\":{\"title\":\"Principle Message\",\"frontend_menu_id\":null,\"url\":\"#\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:12:01','2020-10-11 20:12:01'),
	(184,'frontend_block','updated',2,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"frontend_menu_id\":14,\"url\":null},\"old\":{\"frontend_menu_id\":null,\"url\":\"#\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:12:08','2020-10-11 20:12:08'),
	(185,'frontend_block','created',7,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 5\",\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur\",\"frontend_menu_id\":null,\"url\":null,\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:13:26','2020-10-11 20:13:26'),
	(186,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"About TDTC\",\"body\":\"<h4 style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><b>It is a long<\\/b> established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/h4><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:left;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"title\":\"Home About Us\",\"body\":\"<p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:left;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:17:21','2020-10-11 20:17:21'),
	(187,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<h1 style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><b>It is a long<\\/b> established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/h1><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:left;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<h4 style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><b>It is a long<\\/b> established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/h4><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:left;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:17:57','2020-10-11 20:17:57'),
	(188,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<h4 style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><b>It is a long<\\/b> established fact that a <u><b>reader<\\/b><\\/u> will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like.<\\/h4><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:left;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"old\":{\"body\":\"<h1 style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><b>It is a long<\\/b> established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/h1><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.<\\/p><\\/div><div><p style=\\\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<\\/p><\\/div><div style=\\\"text-align:left;\\\"><br \\/><\\/div><div><br \\/><\\/div>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:19:59','2020-10-11 20:19:59'),
	(189,'frontend_block','updated',3,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal...\",\"featured_image\":\"storage\\/frontend-block-featured-image\\/mqtvG8j9zo0TT33Tpe2RWzg1pqlezlKw7sCbQXST.png\"},\"old\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\",\"featured_image\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:55:42','2020-10-11 20:55:42'),
	(190,'frontend_page','created',11,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Feature 2\",\"body\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<\\/p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<br \\/><\\/p>\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:56:43','2020-10-11 20:56:43'),
	(191,'frontend_menu','created',15,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Feature 2\",\"slug\":\"feature-2\",\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":11,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:57:02','2020-10-11 20:57:02'),
	(192,'frontend_block','updated',3,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"frontend_menu_id\":15},\"old\":{\"frontend_menu_id\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:57:23','2020-10-11 20:57:23'),
	(193,'frontend_page','created',12,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"feture 5\",\"body\":\"<p>sadasd<\\/p><p>asd<\\/p><p>asdas<\\/p><p>das<\\/p><p>das<\\/p><p>da<\\/p>\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:59:00','2020-10-11 20:59:00'),
	(194,'frontend_menu','created',16,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"f5\",\"slug\":\"f5\",\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":12,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:59:21','2020-10-11 20:59:21'),
	(195,'frontend_block','updated',7,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed\",\"frontend_menu_id\":16},\"old\":{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur\",\"frontend_menu_id\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 20:59:46','2020-10-11 20:59:46'),
	(196,'frontend_block','updated',7,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"featured_image\":\"storage\\/frontend-block-featured-image\\/qFUKNDzH6h8FkjaoXRuEVW276mky7aDzuQXlSDmN.png\"},\"old\":{\"featured_image\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/85.0.4183.121 Safari\\/537.36\"}',NULL,'2020-10-11 21:00:29','2020-10-11 21:00:29'),
	(197,'frontend_menu','updated',16,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Feature 5\",\"slug\":\"feature-5\"},\"old\":{\"name\":\"f5\",\"slug\":\"f5\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:26:23','2020-10-12 11:26:23'),
	(198,'frontend_page','updated',12,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"feature 5\"},\"old\":{\"title\":\"feture 5\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:28:11','2020-10-12 11:28:11'),
	(199,'frontend_page','created',13,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Feature 3\",\"body\":\"feature 3\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:28:39','2020-10-12 11:28:39'),
	(200,'frontend_page','created',14,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"Feature 4\",\"body\":\"Feature 4\",\"is_draft\":0,\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:28:50','2020-10-12 11:28:50'),
	(201,'frontend_menu','created',17,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Feature 3\",\"slug\":\"feature-3\",\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":13,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:29:09','2020-10-12 11:29:09'),
	(202,'frontend_menu','created',18,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"Feature 4\",\"slug\":\"feature-4\",\"type\":null,\"parent_id\":null,\"position\":0,\"frontend_page_id\":14,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:29:24','2020-10-12 11:29:24'),
	(203,'frontend_block','updated',4,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"frontend_menu_id\":17},\"old\":{\"frontend_menu_id\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:29:53','2020-10-12 11:29:53'),
	(204,'frontend_block','updated',4,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed ...\"},\"old\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:30:26','2020-10-12 11:30:26'),
	(205,'frontend_block','updated',5,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to ...\",\"frontend_menu_id\":18,\"featured_image\":\"storage\\/frontend-block-featured-image\\/83M1RU5soVb0axfVcnicNy8h0bmww3oCsvdzLssH.png\"},\"old\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.\",\"frontend_menu_id\":null,\"featured_image\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:30:57','2020-10-12 11:30:57'),
	(206,'frontend_block','updated',4,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"featured_image\":\"storage\\/frontend-block-featured-image\\/QJaJpBOGZQVc0eH7W4gj9FjWPpS7n4FIqomusStQ.jpeg\"},\"old\":{\"featured_image\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:31:10','2020-10-12 11:31:10'),
	(207,'frontend_block','updated',4,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of ...\"},\"old\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed ...\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:32:12','2020-10-12 11:32:12'),
	(208,'frontend_block','updated',5,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal as opposed to ...\"},\"old\":{\"body\":\"sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to ...\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:32:29','2020-10-12 11:32:29'),
	(209,'frontend_block','updated',7,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed asdd asd...\"},\"old\":{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 11:33:02','2020-10-12 11:33:02'),
	(210,'backup','created',1,'App\\Models\\Utility\\Backup',1,'App\\User','{\"attributes\":{\"file\":\"backup_2020_10_12_12_22_30.sql.gz\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 12:22:32','2020-10-12 12:22:32'),
	(211,'backup','downloaded',1,'App\\Models\\Utility\\Backup',1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 12:22:40','2020-10-12 12:22:40'),
	(212,'config','updated',66,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"institute_name\":\"TDTC\"},\"old\":{\"institute_name\":\"thulung\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 12:24:11','2020-10-12 12:24:11'),
	(213,'config','updated',74,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"state\":\"Bagmati\"},\"old\":{\"state\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 12:24:28','2020-10-12 12:24:28'),
	(214,'config','updated',78,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"fax\":\"9843650517\"},\"old\":{\"fax\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 12:24:33','2020-10-12 12:24:33'),
	(215,'article','created',4,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 2\",\"date_of_article\":\"2020-10-11T18:30:00.000000Z\",\"is_public\":1,\"description\":\"News content\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 13:05:27','2020-10-12 13:05:27'),
	(216,'article','created',5,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 3\",\"date_of_article\":\"2020-10-14T18:30:00.000000Z\",\"is_public\":1,\"description\":\"<h2>News Content<\\/h2><p>f9c210 asdasd asdhhbasd hasdb jasdjas djasnkdasd.<br \\/><\\/p>\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 13:06:03','2020-10-12 13:06:03'),
	(217,'article','created',6,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 4\",\"date_of_article\":\"2020-10-22T18:30:00.000000Z\",\"is_public\":0,\"description\":\"f9c210\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 13:06:25','2020-10-12 13:06:25'),
	(218,'article','created',7,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 5\",\"date_of_article\":\"2020-10-20T18:30:00.000000Z\",\"is_public\":0,\"description\":\"asdasd\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 13:06:37','2020-10-12 13:06:37'),
	(219,'article','created',8,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 6\",\"date_of_article\":\"2020-10-21T18:30:00.000000Z\",\"is_public\":0,\"description\":\"asdasd\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 13:06:54','2020-10-12 13:06:54'),
	(220,'article','updated',6,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"is_public\":1},\"old\":{\"is_public\":0},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 13:07:39','2020-10-12 13:07:39'),
	(221,'article','updated',8,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"is_public\":1},\"old\":{\"is_public\":0},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 13:07:54','2020-10-12 13:07:54'),
	(222,'article','updated',7,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"is_public\":1},\"old\":{\"is_public\":0},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 13:08:01','2020-10-12 13:08:01'),
	(223,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 16:44:03','2020-10-12 16:44:03'),
	(224,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-12 16:44:12','2020-10-12 16:44:12'),
	(225,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-13 15:44:29','2020-10-13 15:44:29'),
	(226,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-14 07:34:39','2020-10-14 07:34:39'),
	(227,'frontend_page','updated',6,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"is_draft\":1},\"old\":{\"is_draft\":0},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-14 07:35:05','2020-10-14 07:35:05'),
	(228,'frontend_menu','created',20,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"name\":\"About\",\"slug\":\"about\",\"type\":\"header\",\"parent_id\":null,\"position\":0,\"frontend_page_id\":2,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-14 08:40:04','2020-10-14 08:40:04'),
	(229,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 22:19:56','2020-10-21 22:19:56'),
	(230,'article','deleted',3,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"Notice: School Will remain close tomorrow\",\"date_of_article\":\"2020-10-28T18:30:00.000000Z\",\"is_public\":1,\"description\":\"<p>\\u00a0\\u00a0\\u00a0\\u00a0<strong style=\\\"margin:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span><\\/p><p>\\u00a0\\u00a0\\u00a0\\u00a0<strong style=\\\"margin:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span><br \\/><\\/p>\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 22:22:17','2020-10-21 22:22:17'),
	(231,'logo','uploaded',17,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"logo\":\"storage\\/logo\\/1vi2TneLuTAdXMNdDyf9MUuyFRzXdhdjpb5Cyjc6.png\"},\"old\":{\"logo\":\"storage\\/logo\\/2e1wP5x5sMjHcKqjauWjdLqQgdLEq2hRyLUdHIvr.jpeg\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 23:33:15','2020-10-21 23:33:15'),
	(232,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 23:46:42','2020-10-21 23:46:42'),
	(233,'communication','created',1,'App\\Models\\Communication\\Communication',1,'App\\User','{\"attributes\":{\"type\":\"sms\",\"subject\":\"cscdsdc\",\"body\":\"sdcsc\",\"recipient_numbers\":null,\"recipient_emails\":null,\"recipient_count\":null,\"included_numbers\":null,\"included_emails\":null,\"exclude_numbers\":null,\"exclude_emails\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 23:47:35','2020-10-21 23:47:35'),
	(234,'communication','updated',1,'App\\Models\\Communication\\Communication',1,'App\\User','{\"attributes\":{\"recipient_numbers\":\"xcxc\",\"recipient_emails\":\"\",\"recipient_count\":1,\"included_numbers\":\"xcxc\",\"included_emails\":\"\"},\"old\":{\"recipient_numbers\":null,\"recipient_emails\":null,\"recipient_count\":null,\"included_numbers\":null,\"included_emails\":null},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 23:47:35','2020-10-21 23:47:35'),
	(235,'communication','updated',1,'App\\Models\\Communication\\Communication',1,'App\\User','{\"attributes\":{\"options\":{\"individual_students\":[],\"individual_employees\":[]}},\"old\":{\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 23:47:35','2020-10-21 23:47:35'),
	(236,'user_preference','updated',1,'App\\UserPreference',1,'App\\User','{\"attributes\":{\"color_theme\":\"default\"},\"old\":{\"color_theme\":\"green\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 23:48:08','2020-10-21 23:48:08'),
	(237,'user_preference','updated',1,'App\\UserPreference',1,'App\\User','{\"attributes\":{\"color_theme\":\"red\"},\"old\":{\"color_theme\":\"default\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-10-21 23:48:15','2020-10-21 23:48:15'),
	(238,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:07:24','2020-11-01 21:07:24'),
	(239,'article','deleted',6,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 4\",\"date_of_article\":\"2020-10-22T18:30:00.000000Z\",\"is_public\":1,\"description\":\"f9c210\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:07:53','2020-11-01 21:07:53'),
	(240,'article','deleted',8,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 6\",\"date_of_article\":\"2020-10-21T18:30:00.000000Z\",\"is_public\":1,\"description\":\"asdasd\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:07:56','2020-11-01 21:07:56'),
	(241,'article','deleted',7,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 5\",\"date_of_article\":\"2020-10-20T18:30:00.000000Z\",\"is_public\":1,\"description\":\"asdasd\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:08:00','2020-11-01 21:08:00'),
	(242,'article','deleted',5,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 3\",\"date_of_article\":\"2020-10-14T18:30:00.000000Z\",\"is_public\":1,\"description\":\"<h2>News Content<\\/h2><p>f9c210 asdasd asdhhbasd hasdb jasdjas djasnkdasd.<br \\/><\\/p>\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:08:05','2020-11-01 21:08:05'),
	(243,'article','deleted',4,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 2\",\"date_of_article\":\"2020-10-11T18:30:00.000000Z\",\"is_public\":1,\"description\":\"News content\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:08:09','2020-11-01 21:08:09'),
	(244,'article','deleted',1,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News 1\",\"date_of_article\":\"2020-10-08T18:30:00.000000Z\",\"is_public\":1,\"description\":\"This is news one\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:08:12','2020-11-01 21:08:12'),
	(245,'article','deleted',2,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"My Blog\",\"date_of_article\":\"2020-10-08T18:30:00.000000Z\",\"is_public\":1,\"description\":\"My blog\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:08:14','2020-11-01 21:08:14'),
	(246,'event','deleted',3,'App\\Models\\Calendar\\Event',1,'App\\User','{\"attributes\":{\"event_type_id\":2,\"title\":\"Inter school Volleyball Tournament\",\"description\":\"<strong style=\\\"margin:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span>\",\"start_date\":\"2020-11-10T18:30:00.000000Z\",\"start_time\":\"13:01:00\",\"end_date\":\"2020-11-29T18:30:00.000000Z\",\"end_time\":\"17:00:00\",\"venue\":\"School Sports Hall\",\"audience\":\"everyone\",\"user_id\":1,\"upload_token\":\"3dd24d1d-ff90-4282-9684-7546ede39486\",\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:09:41','2020-11-01 21:09:41'),
	(247,'event','deleted',2,'App\\Models\\Calendar\\Event',1,'App\\User','{\"attributes\":{\"event_type_id\":4,\"title\":\"National Cricket Championship\",\"description\":\"<strong style=\\\"margin:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">\\u00a0is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span>\",\"start_date\":\"2020-10-28T18:30:00.000000Z\",\"start_time\":\"13:01:00\",\"end_date\":\"2020-10-30T18:30:00.000000Z\",\"end_time\":\"17:00:00\",\"venue\":\"TU Cricket ground\",\"audience\":\"everyone\",\"user_id\":1,\"upload_token\":\"2972a5ba-0d7b-4569-b81e-0445e783f289\",\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:09:44','2020-11-01 21:09:44'),
	(248,'event','deleted',1,'App\\Models\\Calendar\\Event',1,'App\\User','{\"attributes\":{\"event_type_id\":2,\"title\":\"Inter school Basketball Competition\",\"description\":\"Hello, our school would like to inform you that there is a inter school basketball competition starting from 10th of october.\",\"start_date\":\"2020-10-09T18:30:00.000000Z\",\"start_time\":\"13:01:00\",\"end_date\":\"2020-10-14T18:30:00.000000Z\",\"end_time\":\"17:00:00\",\"venue\":\"Our Schoool\",\"audience\":\"everyone\",\"user_id\":1,\"upload_token\":\"2d18574f-37e1-4993-bf2a-1ac4a2b79a96\",\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:09:48','2020-11-01 21:09:48'),
	(249,'frontend_page','updated',5,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"Latest Articles\"},\"old\":{\"body\":\"heloo there\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:14:40','2020-11-01 21:14:40'),
	(250,'frontend_page','updated',4,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"Latest Events\"},\"old\":{\"body\":\"Event one\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:15:24','2020-11-01 21:15:24'),
	(251,'frontend_page','updated',7,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"TDTC Calendar\",\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"old\":{\"body\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:36:39','2020-11-01 21:36:39'),
	(252,'frontend_page','updated',3,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"Drop A Message\",\"options\":{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}},\"old\":{\"body\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:57:37','2020-11-01 21:57:37'),
	(253,'frontend_page','updated',3,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"Contact Us\"},\"old\":{\"body\":\"Drop A Message\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:58:09','2020-11-01 21:58:09'),
	(254,'frontend_page','updated',3,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p>We love to hear from you. Please drop by a message<\\/p>\"},\"old\":{\"body\":\"Contact Us\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 21:59:32','2020-11-01 21:59:32'),
	(255,'frontend_page','updated',3,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<h4>We love to hear from you. Please drop by a message<\\/h4>\"},\"old\":{\"body\":\"<p>We love to hear from you. Please drop by a message<\\/p>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 22:00:15','2020-11-01 22:00:15'),
	(256,'frontend_page','updated',8,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"body\":\"<p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/p>\"},\"old\":{\"body\":\"<p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><\\/p><p><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.<\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><span style=\\\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\\\"><br \\/><\\/span><\\/p>\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 22:01:55','2020-11-01 22:01:55'),
	(257,'article_type','created',5,'App\\Models\\Configuration\\Post\\ArticleType',1,'App\\User','{\"attributes\":{\"name\":\"Temp\",\"description\":\"Temp\",\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 22:21:10','2020-11-01 22:21:10'),
	(258,'frontend_block','created',8,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 1\",\"body\":\"Feature 1\",\"frontend_menu_id\":null,\"url\":null,\"is_draft\":0,\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 23:34:26','2020-11-01 23:34:26'),
	(259,'frontend_block','updated',8,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"block_type\":\"1\"},\"old\":{\"block_type\":\"program\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 23:40:24','2020-11-01 23:40:24'),
	(260,'frontend_block','updated',8,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"block_type\":\"feature\"},\"old\":{\"block_type\":\"1\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-01 23:41:30','2020-11-01 23:41:30'),
	(261,'frontend_block','created',9,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 2\",\"body\":\"Feature 2\",\"frontend_menu_id\":15,\"url\":null,\"is_draft\":0,\"block_type\":\"feature\",\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-02 08:45:01','2020-11-02 08:45:01'),
	(262,'frontend_block','created',10,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Feature 3\",\"body\":\"Feeature 3\",\"frontend_menu_id\":17,\"url\":null,\"is_draft\":0,\"block_type\":\"feature\",\"featured_image\":null,\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-02 08:45:17','2020-11-02 08:45:17'),
	(263,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-03 11:25:20','2020-11-03 11:25:20'),
	(264,'frontend_menu','updated',12,'App\\Models\\Frontend\\Menu',1,'App\\User','{\"attributes\":{\"frontend_page_id\":7},\"old\":{\"frontend_page_id\":6},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-03 12:10:01','2020-11-03 12:10:01'),
	(265,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-06 06:05:36','2020-11-06 06:05:36'),
	(266,'article','created',1,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"Notice\",\"date_of_article\":\"2020-11-05T18:30:00.000000Z\",\"is_public\":1,\"description\":\"this a test notice\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-06 06:07:03','2020-11-06 06:07:03'),
	(267,'article','updated',1,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"description\":\"<h2>this a test <span style=\\\"background-color:rgb(255,0,0);\\\">notice<\\/span><\\/h2>\"},\"old\":{\"description\":\"this a test notice\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.75 Safari\\/537.36\"}',NULL,'2020-11-06 06:09:42','2020-11-06 06:09:42'),
	(268,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 12:49:38','2020-11-07 12:49:38'),
	(269,'logo','uploaded',17,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"logo\":\"storage\\/logo\\/5R9G7QaCTj7eClz6jwpAvlhQZHJAHetCrRUU06Pb.png\"},\"old\":{\"logo\":\"storage\\/logo\\/1vi2TneLuTAdXMNdDyf9MUuyFRzXdhdjpb5Cyjc6.png\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 12:50:06','2020-11-07 12:50:06'),
	(270,'icon','uploaded',18,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"icon\":\"storage\\/icon\\/7VMh6PcY14qPnZJgeorsYPJcg7ekTzg1yaLQjJ0T.png\"},\"old\":{\"icon\":\"storage\\/icon\\/63Cdyoysv0YkctJql5Q8d1sOGTZFy5OCeWxvDtxo.jpeg\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 12:50:14','2020-11-07 12:50:14'),
	(271,'logo','uploaded',17,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"logo\":\"storage\\/logo\\/4B3zeiBVudwIG1skP6CibHBgZDnkRI0xQaDbGvuh.png\"},\"old\":{\"logo\":\"storage\\/logo\\/5R9G7QaCTj7eClz6jwpAvlhQZHJAHetCrRUU06Pb.png\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 12:53:37','2020-11-07 12:53:37'),
	(272,'icon','uploaded',18,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"icon\":\"storage\\/icon\\/QRqmGs7vo7293EzHrJJNuvJ9VaPaVsyFk9A4Ya0x.png\"},\"old\":{\"icon\":\"storage\\/icon\\/7VMh6PcY14qPnZJgeorsYPJcg7ekTzg1yaLQjJ0T.png\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 12:53:43','2020-11-07 12:53:43'),
	(273,'icon','uploaded',18,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"icon\":\"storage\\/icon\\/mfNvmMyIonTNP4jMvRHkags67AnZPUViMLUst6Qw.png\"},\"old\":{\"icon\":\"storage\\/icon\\/QRqmGs7vo7293EzHrJJNuvJ9VaPaVsyFk9A4Ya0x.png\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 12:56:02','2020-11-07 12:56:02'),
	(274,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 13:48:59','2020-11-07 13:48:59'),
	(275,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 14:35:58','2020-11-07 14:35:58'),
	(276,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 14:56:26','2020-11-07 14:56:26'),
	(277,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 15:01:35','2020-11-07 15:01:35'),
	(278,'logo','uploaded',17,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"logo\":\"storage\\/logo\\/tiTXrURicZl5ZGjPuViQEGM4cBr5qzHaqfuk3g0D.jpeg\"},\"old\":{\"logo\":\"storage\\/logo\\/4B3zeiBVudwIG1skP6CibHBgZDnkRI0xQaDbGvuh.png\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 15:01:47','2020-11-07 15:01:47'),
	(279,'icon','uploaded',18,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"icon\":\"storage\\/icon\\/dmiTCNA9ZxZGuHf1d7q5lqXhyt8pv99RLfroBJzm.png\"},\"old\":{\"icon\":\"storage\\/icon\\/mfNvmMyIonTNP4jMvRHkags67AnZPUViMLUst6Qw.png\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 15:11:12','2020-11-07 15:11:12'),
	(280,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 15:21:33','2020-11-07 15:21:33'),
	(281,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 15:22:08','2020-11-07 15:22:08'),
	(282,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 15:22:17','2020-11-07 15:22:17'),
	(283,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 15:59:22','2020-11-07 15:59:22'),
	(284,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 15:59:38','2020-11-07 15:59:38'),
	(285,'frontend_page','updated',2,'App\\Models\\Frontend\\Page',1,'App\\User','{\"attributes\":{\"title\":\"About Us\"},\"old\":{\"title\":\"About TDTC\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 16:31:06','2020-11-07 16:31:06'),
	(286,'article','created',2,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"title\":\"News\",\"date_of_article\":\"2020-11-06T18:30:00.000000Z\",\"is_public\":0,\"description\":\"News 1\",\"options\":[],\"user_id\":1},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 17:48:43','2020-11-07 17:48:43'),
	(287,'article','updated',2,'App\\Models\\Post\\Article',1,'App\\User','{\"attributes\":{\"is_public\":1},\"old\":{\"is_public\":0},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 17:49:15','2020-11-07 17:49:15'),
	(288,'frontend_block','deleted',2,'App\\Models\\Frontend\\Block',1,'App\\User','{\"attributes\":{\"title\":\"Message From Chairman\",\"body\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\",\"frontend_menu_id\":14,\"url\":null,\"is_draft\":0,\"block_type\":\"program\",\"featured_image\":\"storage\\/frontend-block-featured-image\\/L21qstu18BwcHkl1RCySf8A4NQPzdDw8RT1f04xQ.jpeg\",\"icon\":null,\"options\":[]},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 19:25:29','2020-11-07 19:25:29'),
	(289,'logout','logout',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-07 22:47:38','2020-11-07 22:47:38'),
	(290,'login','login',NULL,NULL,1,'App\\User','{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-11 21:31:07','2020-11-11 21:31:07'),
	(291,'config','updated',66,'App\\Models\\Configuration\\Configuration',1,'App\\User','{\"attributes\":{\"institute_name\":\"BPI\"},\"old\":{\"institute_name\":\"TDTC\"},\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/86.0.4240.183 Safari\\/537.36\"}',NULL,'2020-11-11 21:32:12','2020-11-11 21:32:12');

/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admissions`;

CREATE TABLE `admissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `registration_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_admission` date DEFAULT NULL,
  `admission_remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admissions_registration_id_foreign` (`registration_id`),
  KEY `admissions_batch_id_foreign` (`batch_id`),
  CONSTRAINT `admissions_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admissions_registration_id_foreign` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table article_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_types`;

CREATE TABLE `article_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `article_types` WRITE;
/*!40000 ALTER TABLE `article_types` DISABLE KEYS */;

INSERT INTO `article_types` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Notice','','[]',NULL,NULL),
	(2,'News','','[]',NULL,NULL),
	(3,'Blog','','[]',NULL,NULL),
	(4,'Media','','[]',NULL,NULL),
	(5,'Result','Result','[]','2020-11-01 22:21:10','2020-11-01 22:21:10');

/*!40000 ALTER TABLE `article_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_type_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `date_of_article` date DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_article_type_id_foreign` (`article_type_id`),
  KEY `articles_user_id_foreign` (`user_id`),
  CONSTRAINT `articles_article_type_id_foreign` FOREIGN KEY (`article_type_id`) REFERENCES `article_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;

INSERT INTO `articles` (`id`, `uuid`, `article_type_id`, `title`, `description`, `date_of_article`, `is_public`, `upload_token`, `user_id`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'d0c08125-aa35-43e4-a564-13599cde1fa4',1,'Notice','<h2>this a test <span style=\"background-color:rgb(255,0,0);\">notice</span></h2>','2020-11-06',1,'50ff1177-5cfd-43ab-9254-6b9e694d5fa6',1,'[]','2020-11-06 06:07:03','2020-11-06 06:09:42'),
	(2,'18e8d9b0-fc87-4ae0-8b28-d54ae0fadb40',2,'News','News 1','2020-11-07',1,'f2f23f18-57ac-41d8-964e-7a2e129edf29',1,'[]','2020-11-07 17:48:43','2020-11-07 17:49:15');

/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assignments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assignments`;

CREATE TABLE `assignments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `date_of_assignment` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignments_subject_id_foreign` (`subject_id`),
  KEY `assignments_employee_id_foreign` (`employee_id`),
  CONSTRAINT `assignments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignments_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table backups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `backups`;

CREATE TABLE `backups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backups_user_id_foreign` (`user_id`),
  CONSTRAINT `backups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;

INSERT INTO `backups` (`id`, `user_id`, `file`, `options`, `created_at`, `updated_at`)
VALUES
	(1,1,'backup_2020_10_12_12_22_30.sql.gz',NULL,'2020-10-12 12:22:32','2020-10-12 12:22:32');

/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table batches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `batches`;

CREATE TABLE `batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_observation_id` bigint(20) unsigned DEFAULT NULL,
  `exam_grade_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batches_course_id_foreign` (`course_id`),
  KEY `batches_exam_grade_id_foreign` (`exam_grade_id`),
  KEY `batches_exam_observation_id_foreign` (`exam_observation_id`),
  CONSTRAINT `batches_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `batches_exam_grade_id_foreign` FOREIGN KEY (`exam_grade_id`) REFERENCES `exam_grades` (`id`) ON DELETE SET NULL,
  CONSTRAINT `batches_exam_observation_id_foreign` FOREIGN KEY (`exam_observation_id`) REFERENCES `exam_observations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table bill_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bill_items`;

CREATE TABLE `bill_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_id` bigint(20) unsigned DEFAULT NULL,
  `stock_item_id` bigint(20) unsigned DEFAULT NULL,
  `custom_item_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `unit_price` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `discount` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `tax` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `amount` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_items_bill_id_foreign` (`bill_id`),
  KEY `bill_items_stock_item_id_foreign` (`stock_item_id`),
  CONSTRAINT `bill_items_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bill_items_stock_item_id_foreign` FOREIGN KEY (`stock_item_id`) REFERENCES `stock_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table bills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bills`;

CREATE TABLE `bills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` bigint(20) unsigned DEFAULT NULL,
  `vehicle_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `next_service_date` date DEFAULT NULL,
  `reference_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `tnc` text COLLATE utf8mb4_unicode_ci,
  `memo` text COLLATE utf8mb4_unicode_ci,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `subtotal_discount` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `subtotal_tax` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `subtotal_handling` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `subtotal_total` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bills_vendor_id_foreign` (`vendor_id`),
  KEY `bills_vehicle_id_foreign` (`vehicle_id`),
  KEY `bills_employee_id_foreign` (`employee_id`),
  CONSTRAINT `bills_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bills_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bills_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table blood_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blood_groups`;

CREATE TABLE `blood_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blood_groups` WRITE;
/*!40000 ALTER TABLE `blood_groups` DISABLE KEYS */;

INSERT INTO `blood_groups` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'O-','','[]',NULL,NULL),
	(2,'O+','','[]',NULL,NULL),
	(3,'A-','','[]',NULL,NULL),
	(4,'A+','','[]',NULL,NULL),
	(5,'B-','','[]',NULL,NULL),
	(6,'B+','','[]',NULL,NULL),
	(7,'AB-','','[]',NULL,NULL),
	(8,'AB+','','[]',NULL,NULL);

/*!40000 ALTER TABLE `blood_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table book_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_authors`;

CREATE TABLE `book_authors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;

INSERT INTO `book_authors` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'William Shakespeare','','[]',NULL,NULL),
	(2,'J.D. Salinger','','[]',NULL,NULL),
	(3,'William Golding','','[]',NULL,NULL),
	(4,'John Steinbeck','','[]',NULL,NULL),
	(5,'Paulo Coelho','','[]',NULL,NULL);

/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table book_conditions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_conditions`;

CREATE TABLE `book_conditions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `book_conditions` WRITE;
/*!40000 ALTER TABLE `book_conditions` DISABLE KEYS */;

INSERT INTO `book_conditions` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'New','','[]',NULL,NULL),
	(2,'Good','','[]',NULL,NULL),
	(3,'Fair','','[]',NULL,NULL),
	(4,'Old','','[]',NULL,NULL),
	(5,'Poor','','[]',NULL,NULL);

/*!40000 ALTER TABLE `book_conditions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table book_languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_languages`;

CREATE TABLE `book_languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `book_languages` WRITE;
/*!40000 ALTER TABLE `book_languages` DISABLE KEYS */;

INSERT INTO `book_languages` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'English','','[]',NULL,NULL),
	(2,'Hindi','','[]',NULL,NULL),
	(3,'Urdu','','[]',NULL,NULL),
	(4,'French','','[]',NULL,NULL),
	(5,'German','','[]',NULL,NULL),
	(6,'Spanish','','[]',NULL,NULL),
	(7,'Sanskrit','','[]',NULL,NULL),
	(8,'Tamil','','[]',NULL,NULL);

/*!40000 ALTER TABLE `book_languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table book_log_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_log_details`;

CREATE TABLE `book_log_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_log_id` bigint(20) unsigned DEFAULT NULL,
  `book_post_detail_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_return` date DEFAULT NULL,
  `return_remarks` text COLLATE utf8mb4_unicode_ci,
  `is_non_returnable` tinyint(1) NOT NULL DEFAULT '0',
  `non_returnable_charge` text COLLATE utf8mb4_unicode_ci,
  `non_returnable_remarks` text COLLATE utf8mb4_unicode_ci,
  `non_returnable_at` datetime DEFAULT NULL,
  `late_fee` int(11) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_log_details_book_log_id_foreign` (`book_log_id`),
  KEY `book_log_details_book_post_detail_id_foreign` (`book_post_detail_id`),
  CONSTRAINT `book_log_details_book_log_id_foreign` FOREIGN KEY (`book_log_id`) REFERENCES `book_logs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `book_log_details_book_post_detail_id_foreign` FOREIGN KEY (`book_post_detail_id`) REFERENCES `book_post_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table book_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_logs`;

CREATE TABLE `book_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL,
  `issue_remarks` text COLLATE utf8mb4_unicode_ci,
  `due_date` date DEFAULT NULL,
  `late_fee_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `late_fee_frequency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee_charge` int(11) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_logs_student_record_id_foreign` (`student_record_id`),
  KEY `book_logs_employee_id_foreign` (`employee_id`),
  CONSTRAINT `book_logs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `book_logs_student_record_id_foreign` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table book_post_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_post_details`;

CREATE TABLE `book_post_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_post_id` bigint(20) unsigned DEFAULT NULL,
  `number` bigint(20) DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_not_available` tinyint(1) NOT NULL DEFAULT '0',
  `book_condition_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_post_details_book_post_id_foreign` (`book_post_id`),
  KEY `book_post_details_book_condition_id_foreign` (`book_condition_id`),
  CONSTRAINT `book_post_details_book_condition_id_foreign` FOREIGN KEY (`book_condition_id`) REFERENCES `book_conditions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `book_post_details_book_post_id_foreign` FOREIGN KEY (`book_post_id`) REFERENCES `book_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table book_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_posts`;

CREATE TABLE `book_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_addition` date DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_posts_book_id_foreign` (`book_id`),
  CONSTRAINT `book_posts_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table book_publishers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_publishers`;

CREATE TABLE `book_publishers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `book_publishers` WRITE;
/*!40000 ALTER TABLE `book_publishers` DISABLE KEYS */;

INSERT INTO `book_publishers` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Penguin Random House','','[]',NULL,NULL),
	(2,'Hachette Livre','','[]',NULL,NULL),
	(3,'HarperCollins','','[]',NULL,NULL),
	(4,'Pan Macmillan','','[]',NULL,NULL),
	(5,'Oxford University Press','','[]',NULL,NULL),
	(6,'Pearson Education','','[]',NULL,NULL);

/*!40000 ALTER TABLE `book_publishers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table book_topics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_topics`;

CREATE TABLE `book_topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `book_topics` WRITE;
/*!40000 ALTER TABLE `book_topics` DISABLE KEYS */;

INSERT INTO `book_topics` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Academic','','[]',NULL,NULL),
	(2,'Philosophy','','[]',NULL,NULL),
	(3,'Communication','','[]',NULL,NULL),
	(4,'History','','[]',NULL,NULL),
	(5,'Life Science','','[]',NULL,NULL),
	(6,'Science & Technology','','[]',NULL,NULL),
	(7,'Fiction','','[]',NULL,NULL),
	(8,'Mythological & Religious','','[]',NULL,NULL),
	(9,'Encyclopedia & Dictionary','','[]',NULL,NULL),
	(10,'Literature','','[]',NULL,NULL);

/*!40000 ALTER TABLE `book_topics` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isbn_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_author_id` bigint(20) unsigned DEFAULT NULL,
  `book_publisher_id` bigint(20) unsigned DEFAULT NULL,
  `book_topic_id` bigint(20) unsigned DEFAULT NULL,
  `book_language_id` bigint(20) unsigned DEFAULT NULL,
  `edition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `summary` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `books_book_author_id_foreign` (`book_author_id`),
  KEY `books_book_publisher_id_foreign` (`book_publisher_id`),
  KEY `books_book_topic_id_foreign` (`book_topic_id`),
  KEY `books_book_language_id_foreign` (`book_language_id`),
  CONSTRAINT `books_book_author_id_foreign` FOREIGN KEY (`book_author_id`) REFERENCES `book_authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `books_book_language_id_foreign` FOREIGN KEY (`book_language_id`) REFERENCES `book_languages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `books_book_publisher_id_foreign` FOREIGN KEY (`book_publisher_id`) REFERENCES `book_publishers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `books_book_topic_id_foreign` FOREIGN KEY (`book_topic_id`) REFERENCES `book_topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table buildings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `buildings`;

CREATE TABLE `buildings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table call_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `call_logs`;

CREATE TABLE `call_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calling_purpose_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `incoming_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outgoing_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `call_logs_calling_purpose_id_foreign` (`calling_purpose_id`),
  KEY `call_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `call_logs_calling_purpose_id_foreign` FOREIGN KEY (`calling_purpose_id`) REFERENCES `calling_purposes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `call_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table calling_purposes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `calling_purposes`;

CREATE TABLE `calling_purposes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `calling_purposes` WRITE;
/*!40000 ALTER TABLE `calling_purposes` DISABLE KEYS */;

INSERT INTO `calling_purposes` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Study','','[]',NULL,NULL),
	(2,'Fee Reminder','','[]',NULL,NULL),
	(3,'Trasport','','[]',NULL,NULL),
	(4,'Circular','','[]',NULL,NULL);

/*!40000 ALTER TABLE `calling_purposes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table castes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `castes`;

CREATE TABLE `castes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table certificate_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `certificate_templates`;

CREATE TABLE `certificate_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table certificates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate_template_id` bigint(20) unsigned DEFAULT NULL,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_certificate` date DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificates_certificate_template_id_foreign` (`certificate_template_id`),
  KEY `certificates_student_record_id_foreign` (`student_record_id`),
  KEY `certificates_employee_id_foreign` (`employee_id`),
  CONSTRAINT `certificates_certificate_template_id_foreign` FOREIGN KEY (`certificate_template_id`) REFERENCES `certificate_templates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificates_student_record_id_foreign` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table class_teachers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `class_teachers`;

CREATE TABLE `class_teachers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_teachers_batch_id_foreign` (`batch_id`),
  KEY `class_teachers_employee_id_foreign` (`employee_id`),
  CONSTRAINT `class_teachers_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_teachers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table class_timing_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `class_timing_sessions`;

CREATE TABLE `class_timing_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_timing_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  `is_a_break` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_timing_sessions_class_timing_id_foreign` (`class_timing_id`),
  CONSTRAINT `class_timing_sessions_class_timing_id_foreign` FOREIGN KEY (`class_timing_id`) REFERENCES `class_timings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table class_timings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `class_timings`;

CREATE TABLE `class_timings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_timings_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `class_timings_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table communication_batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `communication_batch`;

CREATE TABLE `communication_batch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `communication_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_batch_communication_id_foreign` (`communication_id`),
  KEY `communication_batch_batch_id_foreign` (`batch_id`),
  CONSTRAINT `communication_batch_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `communication_batch_communication_id_foreign` FOREIGN KEY (`communication_id`) REFERENCES `communications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table communication_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `communication_course`;

CREATE TABLE `communication_course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `communication_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_course_communication_id_foreign` (`communication_id`),
  KEY `communication_course_course_id_foreign` (`course_id`),
  CONSTRAINT `communication_course_communication_id_foreign` FOREIGN KEY (`communication_id`) REFERENCES `communications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `communication_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table communication_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `communication_department`;

CREATE TABLE `communication_department` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `communication_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_department_communication_id_foreign` (`communication_id`),
  KEY `communication_department_department_id_foreign` (`department_id`),
  CONSTRAINT `communication_department_communication_id_foreign` FOREIGN KEY (`communication_id`) REFERENCES `communications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `communication_department_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table communication_employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `communication_employee`;

CREATE TABLE `communication_employee` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `communication_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ce_communication_id` (`communication_id`),
  KEY `ce_employee_id` (`employee_id`),
  CONSTRAINT `ce_communication_id` FOREIGN KEY (`communication_id`) REFERENCES `communications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ce_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table communication_employee_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `communication_employee_category`;

CREATE TABLE `communication_employee_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `communication_id` bigint(20) unsigned DEFAULT NULL,
  `employee_category_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communication_employee_category_communication_id_foreign` (`communication_id`),
  KEY `communication_employee_category_employee_category_id_foreign` (`employee_category_id`),
  CONSTRAINT `communication_employee_category_communication_id_foreign` FOREIGN KEY (`communication_id`) REFERENCES `communications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `communication_employee_category_employee_category_id_foreign` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table communication_student_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `communication_student_record`;

CREATE TABLE `communication_student_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `communication_id` bigint(20) unsigned DEFAULT NULL,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `csr_communication_id` (`communication_id`),
  KEY `csr_student_record_id` (`student_record_id`),
  CONSTRAINT `csr_communication_id` FOREIGN KEY (`communication_id`) REFERENCES `communications` (`id`) ON DELETE CASCADE,
  CONSTRAINT `csr_student_record_id` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table communications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `communications`;

CREATE TABLE `communications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `recipient_numbers` longtext COLLATE utf8mb4_unicode_ci,
  `recipient_emails` longtext COLLATE utf8mb4_unicode_ci,
  `recipient_count` int(11) DEFAULT NULL,
  `audience` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `included_numbers` longtext COLLATE utf8mb4_unicode_ci,
  `included_emails` longtext COLLATE utf8mb4_unicode_ci,
  `excluded_numbers` longtext COLLATE utf8mb4_unicode_ci,
  `excluded_emails` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communications_user_id_foreign` (`user_id`),
  CONSTRAINT `communications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `communications` WRITE;
/*!40000 ALTER TABLE `communications` DISABLE KEYS */;

INSERT INTO `communications` (`id`, `uuid`, `type`, `subject`, `body`, `recipient_numbers`, `recipient_emails`, `recipient_count`, `audience`, `included_numbers`, `included_emails`, `excluded_numbers`, `excluded_emails`, `user_id`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'10ea12f9-b4ff-4a10-94cf-8e8539216fbe','sms','cscdsdc','sdcsc','xcxc','',1,'everyone','xcxc','','','',1,'{\"individual_students\":[],\"individual_employees\":[]}','2020-10-21 23:47:35','2020-10-21 23:47:35');

/*!40000 ALTER TABLE `communications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table complaint_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `complaint_types`;

CREATE TABLE `complaint_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `complaint_types` WRITE;
/*!40000 ALTER TABLE `complaint_types` DISABLE KEYS */;

INSERT INTO `complaint_types` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Study','','[]',NULL,NULL),
	(2,'Fee','','[]',NULL,NULL),
	(3,'Trasport','','[]',NULL,NULL),
	(4,'Uniform','','[]',NULL,NULL);

/*!40000 ALTER TABLE `complaint_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table complaints
# ------------------------------------------------------------

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complaint_type_id` bigint(20) unsigned DEFAULT NULL,
  `complainant_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complainant_contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complainant_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date_of_complaint` date DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `action` text COLLATE utf8mb4_unicode_ci,
  `date_of_resolution` date DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaints_complaint_type_id_foreign` (`complaint_type_id`),
  KEY `complaints_employee_id_foreign` (`employee_id`),
  KEY `complaints_user_id_foreign` (`user_id`),
  CONSTRAINT `complaints_complaint_type_id_foreign` FOREIGN KEY (`complaint_type_id`) REFERENCES `complaint_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaints_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numeric_value` bigint(20) DEFAULT NULL,
  `text_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;

INSERT INTO `config` (`id`, `name`, `numeric_value`, `text_value`, `is_private`)
VALUES
	(1,'menu',NULL,'institute_document,reception,enquiry,visitor_log,call_log,postal_record,complaint,gate_pass,visitor_message,academic,academic_session,course,batch,class_teacher,subject,subject_teacher,class_timing,timetable,certificate,student,student_import,registration,student_list,roll_number,student_id_card,student_image_upload,student_attendance,promotion,termination,student_parent,student_login,employee,employee_import,employee_list,employee_id_card,employee_attendance,employee_leave,employee_payroll,exam,exam_schedule,exam_record_mark,exam_report_card,exam_topper_report,online_exam,finance,fee_group,fee_head,transport_fee,fee_concession,fee_allocation,account,income,expense,account_transfer,finance_report,transport,transport_route,vehicle,vehicle_incharge,vehicle_document,vehicle_fuel,vehicle_log,vehicle_service_record,transport_report,calendar,holiday,event,celebration,resource,assignment,notes,lesson_plan,syllabus,library,book,issue_book,return_book,inventory,stock_category,stock_item,vendor,stock_purchase,stock_transfer,post,post_feed,article,communication,meeting,my_meeting,communication_history,my_notification,send_sms,send_email,send_push_notification,frontend,frontend_page,frontend_menu,frontend_block,utility,todo,backup,ip_filter',0),
	(2,'setup_wizard',0,NULL,0),
	(3,'color_theme',NULL,'purple',0),
	(4,'direction',NULL,'ltr',0),
	(5,'sidebar',NULL,'normal',0),
	(6,'locale',NULL,'en',0),
	(7,'timezone',NULL,'Asia/Kolkata',0),
	(8,'first_day_of_week',NULL,'sunday',0),
	(9,'notification_position',NULL,'toast-bottom-right',0),
	(10,'date_format',NULL,'DD-MM-YYYY',0),
	(11,'time_format',NULL,'H:mm',0),
	(12,'page_length',10,NULL,0),
	(13,'currency',NULL,'USD',0),
	(14,'driver',NULL,'log',0),
	(15,'from_address',NULL,'hello@example.com',0),
	(16,'from_name',NULL,'Hello',0),
	(17,'logo',NULL,'storage/logo/tiTXrURicZl5ZGjPuViQEGM4cBr5qzHaqfuk3g0D.jpeg',0),
	(18,'icon',NULL,'storage/icon/dmiTCNA9ZxZGuHf1d7q5lqXhyt8pv99RLfroBJzm.png',0),
	(19,'token_lifetime',1440,NULL,0),
	(20,'mobile_token_lifetime',43200,NULL,0),
	(21,'reset_password_token_lifetime',30,NULL,0),
	(22,'activity_log',1,NULL,0),
	(23,'email_log',1,NULL,0),
	(24,'reset_password',1,NULL,0),
	(25,'login_with_otp',0,NULL,0),
	(26,'footer_credit',NULL,'InstiKit by ScriptMint',0),
	(27,'multilingual',0,NULL,0),
	(28,'ip_filter',1,NULL,0),
	(29,'email_template',1,NULL,0),
	(30,'online_registration',0,NULL,0),
	(31,'message',1,NULL,0),
	(32,'backup',1,NULL,0),
	(33,'todo',1,NULL,0),
	(34,'frontend_website',1,NULL,0),
	(35,'designation_subordinate_level',1,NULL,0),
	(36,'default_attendance_type',NULL,'daily',0),
	(37,'student_late_attendance_time',NULL,'daily',0),
	(38,'enable_registration',0,NULL,0),
	(39,'enable_registration_fee',0,NULL,0),
	(40,'default_max_strength_per_batch',30,NULL,0),
	(41,'default_roll_number_prefix',NULL,NULL,0),
	(42,'system_admin_designation',NULL,'System Admin',0),
	(43,'system_admin_employee_category',NULL,'System Admin',0),
	(44,'employee_code_digit',3,NULL,0),
	(45,'transfer_certificate_digit',3,NULL,0),
	(46,'vehicle_fuel_quantity_decimal_place',2,NULL,0),
	(47,'library_max_book_issue_to_student',4,NULL,0),
	(48,'library_max_book_issue_to_employee',6,NULL,0),
	(49,'library_return_due_day_for_student',15,NULL,0),
	(50,'library_return_due_day_for_employee',30,NULL,0),
	(51,'library_late_fee_frequency_student',NULL,'daily',0),
	(52,'library_late_fee_frequency_employee',NULL,'daily',0),
	(53,'library_late_fee_applicable_student',0,NULL,0),
	(54,'library_late_fee_applicable_employee',0,NULL,0),
	(55,'library_late_fee_charge_student',5,NULL,0),
	(56,'library_late_fee_charge_employee',5,NULL,0),
	(57,'allow_to_modify_student_attendance',0,NULL,0),
	(58,'days_allowed_to_modify_student_attendance',0,NULL,0),
	(59,'allow_to_mark_student_advance_attendance',0,NULL,0),
	(60,'days_allowed_to_mark_student_advance_attendance',0,NULL,0),
	(61,'max_sms_per_chunk',100,NULL,0),
	(62,'max_push_notification_per_chunk',500,NULL,0),
	(63,'admission_number_digit',3,NULL,0),
	(64,'leave_holiday_calculation_mode',NULL,'ignore',0),
	(65,'per_day_salary_calculation_basis',NULL,'calendar_period',0),
	(66,'institute_name',NULL,'BPI',0),
	(67,'institute_running_body',2,NULL,0),
	(68,'institute_recognition_number',NULL,NULL,0),
	(69,'institute_recognition_body',NULL,NULL,0),
	(70,'institute_foundation_date',NULL,'2020-10-01T09:09:00.000Z',0),
	(71,'address_line_1',NULL,'Balkot-6',0),
	(72,'address_line_2',NULL,NULL,0),
	(73,'city',NULL,'Bhaktapur',0),
	(74,'state',NULL,'Bagmati',0),
	(75,'zipcode',44811,NULL,0),
	(76,'country',NULL,'Nepal',0),
	(77,'phone',9843650517,NULL,0),
	(78,'fax',9843650517,NULL,0),
	(79,'email',NULL,'mee.prakash25@gmail.com',0),
	(80,'website',NULL,'www.asd.com',0),
	(81,'biometric_auth_token',NULL,NULL,0),
	(82,'pusher_auth_token',NULL,NULL,0),
	(83,'https',0,NULL,0),
	(84,'error_display',1,NULL,0),
	(85,'maintenance_mode',0,NULL,0),
	(86,'maintenance_mode_message',NULL,NULL,0),
	(87,'online_registration_header',NULL,NULL,0),
	(88,'online_registration_success_message',NULL,NULL,0),
	(89,'smtp_host',NULL,NULL,0),
	(90,'smtp_port',NULL,NULL,0),
	(91,'smtp_username',NULL,NULL,1),
	(92,'smtp_password',NULL,NULL,1),
	(93,'smtp_encryption',NULL,NULL,0),
	(94,'mailgun_host',NULL,NULL,0),
	(95,'mailgun_port',NULL,NULL,0),
	(96,'mailgun_username',NULL,NULL,1),
	(97,'mailgun_password',NULL,NULL,1),
	(98,'mailgun_encryption',NULL,NULL,0),
	(99,'mailgun_domain',NULL,NULL,0),
	(100,'mailgun_secret',NULL,NULL,1),
	(101,'mandrill_secret',NULL,NULL,1),
	(102,'facebook_link',NULL,'https://www.facebook.com',0),
	(103,'twitter_link',NULL,'https://www.twitter.com',0),
	(104,'linkedin_link',NULL,'https://www.linkedln.com',0),
	(105,'google_plus_link',NULL,'https://www.google.com',0),
	(106,'youtube_link',NULL,'https://www.youtube.com',0);

/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table course_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_groups`;

CREATE TABLE `course_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_groups_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `course_groups_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table courses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `course_group_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_academic_session_id_foreign` (`academic_session_id`),
  KEY `courses_course_group_id_foreign` (`course_group_id`),
  CONSTRAINT `courses_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `courses_course_group_id_foreign` FOREIGN KEY (`course_group_id`) REFERENCES `course_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table custom_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_fields`;

CREATE TABLE `custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `values` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table departments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;

INSERT INTO `departments` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Administration Department','','[]',NULL,NULL),
	(2,'Academic Department','','[]',NULL,NULL),
	(3,'HR Department','','[]',NULL,NULL),
	(4,'IT & Networking Department','','[]',NULL,NULL);

/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table designations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `designations`;

CREATE TABLE `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_category_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_teaching_employee` tinyint(1) NOT NULL DEFAULT '0',
  `top_designation_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designations_employee_category_id_foreign` (`employee_category_id`),
  KEY `designations_top_designation_id_foreign` (`top_designation_id`),
  CONSTRAINT `designations_employee_category_id_foreign` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `designations_top_designation_id_foreign` FOREIGN KEY (`top_designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;

INSERT INTO `designations` (`id`, `employee_category_id`, `name`, `is_teaching_employee`, `top_designation_id`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,0,NULL,NULL,NULL,'2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(2,2,'Director',0,NULL,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(3,2,'Manager',0,2,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(4,2,'Principal',1,3,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(5,3,'School Coordinator',1,4,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(6,3,'Post Graduate Teacher',1,4,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(7,3,'Trained Graduate Teacher',1,4,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(8,3,'Primary Teacher',1,4,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(9,3,'Nursery Trained Teacher',1,4,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(10,4,'Account Manager',0,3,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(11,4,'Accountant',0,10,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(12,4,'Cashier',0,10,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(13,5,'Library Manager',0,3,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(14,5,'Librarian',0,13,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(15,6,'Hostel Manager',0,3,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(16,6,'Warden',0,15,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(17,7,'Transport Manager',0,3,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(18,7,'Driver',0,17,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(19,7,'Conductor',0,17,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(20,8,'Supervisor',0,3,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(21,8,'Security Guard',0,20,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(22,8,'Cleaning Staff',0,20,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(23,8,'Sweeper',0,20,NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41');

/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table email_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_logs`;

CREATE TABLE `email_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table email_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_templates`;

CREATE TABLE `email_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;

INSERT INTO `email_templates` (`id`, `is_default`, `name`, `slug`, `category`, `subject`, `body`, `options`, `created_at`, `updated_at`)
VALUES
	(1,1,'Welcome Email User','welcome-email-user','user','Welcome Email User | [COMPANY_NAME]','<div style=\"margin:0px; background: #f8f8f8; \">\n  <div width=\"100%\" style=\"background: #f8f8f8; padding: 0px 0px; font-family:arial; line-height:28px; height:100%;  width: 100%; color: #514d6a;\">\n    <div style=\"max-width: 700px; padding:50px 0;  margin: 0px auto; font-size: 14px\">\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin-bottom: 20px\">\n        <tbody>\n          <tr>\n            <td style=\"vertical-align: top; padding-bottom:30px;\" align=\"center\">[COMPANY_LOGO]</td>\n          </tr>\n          <tr>\n            <td><h5 style=\"text-align:center;\">Account Created</h5></td>\n          </tr>\n        </tbody>\n      </table>\n      <div style=\"padding: 40px; background: #fff;\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%;\">\n          <tbody>\n            <tr>\n              <td style=\"border-bottom:1px solid #f6f6f6;\"><h1 style=\"font-size:14px; font-family:arial; margin:0px; font-weight:bold;\">Dear [NAME],</h1>\n                <p style=\"margin-top:0px; color:#bbbbbb;\">Welcome to our company. Your account has been created. Please use below credentials to log into your account:</p><table class=\"table table-bordered\"><tbody><tr><td>Email</td><td>[EMAIL]</td></tr><tr><td>Password</td><td>[PASSWORD]</td></tr></tbody></table><p style=\"margin-top:0px; color:#bbbbbb;\"><br></p></td>\n            </tr>\n            <tr>\n              <td style=\"padding:10px 0 30px 0;\"><p>Have a Good Day!</p>\n                <b>- Best Wishes ([COMPANY_NAME])</b> </td>\n            </tr>\n          </tbody>\n        </table>\n      </div>\n      <div style=\"text-align: center; font-size: 12px; color: #b2b2b5; margin-top: 20px\">\n        <p> [COMPANY_NAME] <br>\n        [COMPANY_EMAIL] | [COMPANY_PHONE] | [COMPANY_WEBSITE]</p>\n      </div>\n    </div>\n  </div>\n</div>\n',NULL,NULL,NULL),
	(2,1,'Anniversary Email User','anniversary-email-user','user','Wish You a Very Happy Anniversary [NAME] | [COMPANY_NAME]','<div style=\"margin:0px; background: #f8f8f8; \">\n  <div width=\"100%\" style=\"background: #f8f8f8; padding: 0px 0px; font-family:arial; line-height:28px; height:100%;  width: 100%; color: #514d6a;\">\n    <div style=\"max-width: 700px; padding:50px 0;  margin: 0px auto; font-size: 14px\">\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin-bottom: 20px\">\n        <tbody>\n          <tr>\n            <td style=\"vertical-align: top; padding-bottom:30px;\" align=\"center\">[COMPANY_LOGO]</td>\n          </tr>\n          <tr>\n            <td><h5 style=\"text-align:center;\">Happy Anniversary</h5></td>\n          </tr>\n        </tbody>\n      </table>\n      <div style=\"padding: 40px; background: #fff;\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%;\">\n          <tbody>\n            <tr>\n              <td style=\"border-bottom:1px solid #f6f6f6;\"><h1 style=\"font-size:14px; font-family:arial; margin:0px; font-weight:bold;\">Dear [NAME],</h1>\n                <p style=\"margin-top:0px; color:#bbbbbb;\">We wish you a Very Happy Anniversary.</p></td>\n            </tr>\n            <tr>\n              <td style=\"padding:10px 0 30px 0;\"><p>Have a Good Day!</p>\n                <b>- Best Wishes ([COMPANY_NAME])</b> </td>\n            </tr>\n          </tbody>\n        </table>\n      </div>\n      <div style=\"text-align: center; font-size: 12px; color: #b2b2b5; margin-top: 20px\">\n        <p> [COMPANY_NAME] <br>\n        [COMPANY_EMAIL] | [COMPANY_PHONE] | [COMPANY_WEBSITE]</p>\n      </div>\n    </div>\n  </div>\n</div>\n',NULL,NULL,NULL),
	(3,1,'Birthday Email User','birthday-email-user','user','Happy Birthday [NAME] | [COMPANY_NAME]','<div style=\"margin:0px; background: #f8f8f8; \">\n  <div width=\"100%\" style=\"background: #f8f8f8; padding: 0px 0px; font-family:arial; line-height:28px; height:100%;  width: 100%; color: #514d6a;\">\n    <div style=\"max-width: 700px; padding:50px 0;  margin: 0px auto; font-size: 14px\">\n      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%; margin-bottom: 20px\">\n        <tbody>\n          <tr>\n            <td style=\"vertical-align: top; padding-bottom:30px;\" align=\"center\">[COMPANY_LOGO]</td>\n          </tr>\n          <tr>\n            <td><h5 style=\"text-align:center;\">Happy Birthday</h5></td>\n          </tr>\n        </tbody>\n      </table>\n      <div style=\"padding: 40px; background: #fff;\">\n        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100%;\">\n          <tbody>\n            <tr>\n              <td style=\"border-bottom:1px solid #f6f6f6;\"><h1 style=\"font-size:14px; font-family:arial; margin:0px; font-weight:bold;\">Dear [NAME],</h1>\n                <p style=\"margin-top:0px; color:#bbbbbb;\">We wish you a Very Happy Birthday.</p></td>\n            </tr>\n            <tr>\n              <td style=\"padding:10px 0 30px 0;\"><p>Have a Good Day!</p>\n                <b>- Best Wishes ([COMPANY_NAME])</b> </td>\n            </tr>\n          </tbody>\n        </table>\n      </div>\n      <div style=\"text-align: center; font-size: 12px; color: #b2b2b5; margin-top: 20px\">\n        <p> [COMPANY_NAME] <br>\n        [COMPANY_EMAIL] | [COMPANY_PHONE] | [COMPANY_WEBSITE]</p>\n      </div>\n    </div>\n  </div>\n</div>\n',NULL,NULL,NULL);

/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_accounts`;

CREATE TABLE `employee_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_identification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_accounts_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_accounts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_attendance_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_attendance_details`;

CREATE TABLE `employee_attendance_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_attendance_id` bigint(20) unsigned DEFAULT NULL,
  `employee_attendance_type_id` bigint(20) unsigned DEFAULT NULL,
  `value` decimal(25,5) DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ead_employee_attendance_id_foreign` (`employee_attendance_id`),
  KEY `ead_employee_attendance_type_id_foreign` (`employee_attendance_type_id`),
  CONSTRAINT `ead_employee_attendance_id_foreign` FOREIGN KEY (`employee_attendance_id`) REFERENCES `employee_attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ead_employee_attendance_type_id_foreign` FOREIGN KEY (`employee_attendance_type_id`) REFERENCES `employee_attendance_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_attendance_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_attendance_types`;

CREATE TABLE `employee_attendance_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_attendances
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_attendances`;

CREATE TABLE `employee_attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_attendance` date DEFAULT NULL,
  `employee_attendance_type_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ea_employee_id_foreign` (`employee_id`),
  KEY `ea_employee_attendance_type_id_foreign` (`employee_attendance_type_id`),
  CONSTRAINT `ea_employee_attendance_type_id_foreign` FOREIGN KEY (`employee_attendance_type_id`) REFERENCES `employee_attendance_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ea_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_categories`;

CREATE TABLE `employee_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `employee_categories` WRITE;
/*!40000 ALTER TABLE `employee_categories` DISABLE KEYS */;

INSERT INTO `employee_categories` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,NULL,NULL,NULL,'2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(2,'Administrative Staff',NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(3,'Teaching Staff',NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(4,'Accounting Staff',NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(5,'Library Staff',NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(6,'Hostel Staff',NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(7,'Transport Staff',NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41'),
	(8,'Non Teaching Staff',NULL,'[]','2020-10-06 14:50:41','2020-10-06 14:50:41');

/*!40000 ALTER TABLE `employee_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee_designations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_designations`;

CREATE TABLE `employee_designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `employee_term_id` bigint(20) unsigned DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_designations_employee_id_foreign` (`employee_id`),
  KEY `employee_designations_designation_id_foreign` (`designation_id`),
  KEY `employee_designations_employee_term_id_foreign` (`employee_term_id`),
  KEY `employee_designations_department_id_foreign` (`department_id`),
  CONSTRAINT `employee_designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_designations_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_designations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_designations_employee_term_id_foreign` FOREIGN KEY (`employee_term_id`) REFERENCES `employee_terms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_document_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_document_types`;

CREATE TABLE `employee_document_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `employee_document_types` WRITE;
/*!40000 ALTER TABLE `employee_document_types` DISABLE KEYS */;

INSERT INTO `employee_document_types` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Birth Certificate','','[]',NULL,NULL),
	(2,'Salary Certificate','','[]',NULL,NULL),
	(3,'Marksheet','','[]',NULL,NULL),
	(4,'Experience Certificate','','[]',NULL,NULL),
	(5,'Bank Documents','','[]',NULL,NULL),
	(6,'Passport','','[]',NULL,NULL),
	(7,'Driving License','','[]',NULL,NULL),
	(8,'Miscellaneous','','[]',NULL,NULL);

/*!40000 ALTER TABLE `employee_document_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_documents`;

CREATE TABLE `employee_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `employee_document_type_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_documents_employee_id_foreign` (`employee_id`),
  KEY `employee_documents_employee_document_type_id_foreign` (`employee_document_type_id`),
  CONSTRAINT `employee_documents_employee_document_type_id_foreign` FOREIGN KEY (`employee_document_type_id`) REFERENCES `employee_document_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_group_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_group_collection`;

CREATE TABLE `employee_group_collection` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `employee_group_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_group_collection_employee_id_foreign` (`employee_id`),
  KEY `employee_group_collection_employee_group_id_foreign` (`employee_group_id`),
  CONSTRAINT `employee_group_collection_employee_group_id_foreign` FOREIGN KEY (`employee_group_id`) REFERENCES `employee_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_group_collection_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_groups`;

CREATE TABLE `employee_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `employee_groups` WRITE;
/*!40000 ALTER TABLE `employee_groups` DISABLE KEYS */;

INSERT INTO `employee_groups` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Regular Employee','','[]',NULL,NULL),
	(2,'Adhoc Employee','','[]',NULL,NULL),
	(3,'Probation Employee','','[]',NULL,NULL);

/*!40000 ALTER TABLE `employee_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee_leave_allocation_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_leave_allocation_details`;

CREATE TABLE `employee_leave_allocation_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_leave_allocation_id` bigint(20) unsigned DEFAULT NULL,
  `employee_leave_type_id` bigint(20) unsigned DEFAULT NULL,
  `allotted` int(11) NOT NULL DEFAULT '0',
  `used` int(11) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `elad_employee_leave_allocation_id_foreign` (`employee_leave_allocation_id`),
  KEY `elad_employee_leave_type_id_foreign` (`employee_leave_type_id`),
  CONSTRAINT `elad_employee_leave_allocation_id_foreign` FOREIGN KEY (`employee_leave_allocation_id`) REFERENCES `employee_leave_allocations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elad_employee_leave_type_id_foreign` FOREIGN KEY (`employee_leave_type_id`) REFERENCES `employee_leave_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_leave_allocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_leave_allocations`;

CREATE TABLE `employee_leave_allocations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ela_employee_id_foreign` (`employee_id`),
  CONSTRAINT `ela_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_leave_request_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_leave_request_details`;

CREATE TABLE `employee_leave_request_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_leave_request_id` bigint(20) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_action` date DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `approver_user_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `elrd_employee_leave_request_id_foreign` (`employee_leave_request_id`),
  KEY `elrd_designation_id_foreign` (`designation_id`),
  KEY `elrd_approver_user_id_foreign` (`approver_user_id`),
  CONSTRAINT `elrd_approver_user_id_foreign` FOREIGN KEY (`approver_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elrd_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elrd_employee_leave_request_id_foreign` FOREIGN KEY (`employee_leave_request_id`) REFERENCES `employee_leave_requests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_leave_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_leave_requests`;

CREATE TABLE `employee_leave_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `employee_leave_type_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requester_user_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `elr_employee_id_foreign` (`employee_id`),
  KEY `elr_employee_leave_type_id_foreign` (`employee_leave_type_id`),
  KEY `elr_requester_user_id_foreign` (`requester_user_id`),
  CONSTRAINT `elr_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elr_employee_leave_type_id_foreign` FOREIGN KEY (`employee_leave_type_id`) REFERENCES `employee_leave_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elr_requester_user_id_foreign` FOREIGN KEY (`requester_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_leave_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_leave_types`;

CREATE TABLE `employee_leave_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_qualifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_qualifications`;

CREATE TABLE `employee_qualifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `standard` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institute_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_qualifications_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_qualifications_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_salaries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_salaries`;

CREATE TABLE `employee_salaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `payroll_template_id` bigint(20) unsigned DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `net_salary` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `es_employee_id_foreign` (`employee_id`),
  KEY `es_payroll_template_id_foreign` (`payroll_template_id`),
  CONSTRAINT `es_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `es_payroll_template_id_foreign` FOREIGN KEY (`payroll_template_id`) REFERENCES `payroll_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_salary_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_salary_details`;

CREATE TABLE `employee_salary_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_salary_id` bigint(20) unsigned DEFAULT NULL,
  `payroll_template_detail_id` bigint(20) unsigned DEFAULT NULL,
  `amount` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `esd_employee_salary_id_foreign` (`employee_salary_id`),
  KEY `esd_payroll_template_detail_id_foreign` (`payroll_template_detail_id`),
  CONSTRAINT `esd_employee_salary_id_foreign` FOREIGN KEY (`employee_salary_id`) REFERENCES `employee_salaries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `esd_payroll_template_detail_id_foreign` FOREIGN KEY (`payroll_template_detail_id`) REFERENCES `payroll_template_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employee_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee_terms`;

CREATE TABLE `employee_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `date_of_leaving` date DEFAULT NULL,
  `joining_remarks` text COLLATE utf8mb4_unicode_ci,
  `leaving_remarks` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_terms_employee_id_foreign` (`employee_id`),
  CONSTRAINT `employee_terms_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `code` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_anniversary` date DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_contact_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_email` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group_id` bigint(20) unsigned DEFAULT NULL,
  `religion_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `caste_id` bigint(20) unsigned DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_tongue` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_identification_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `same_as_present_address` tinyint(1) NOT NULL DEFAULT '0',
  `permanent_address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_user_id_foreign` (`user_id`),
  KEY `employees_blood_group_id_foreign` (`blood_group_id`),
  KEY `employees_religion_id_foreign` (`religion_id`),
  KEY `employees_category_id_foreign` (`category_id`),
  KEY `employees_caste_id_foreign` (`caste_id`),
  CONSTRAINT `employees_blood_group_id_foreign` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_caste_id_foreign` FOREIGN KEY (`caste_id`) REFERENCES `castes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_religion_id_foreign` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`id`, `uuid`, `prefix`, `user_id`, `code`, `first_name`, `middle_name`, `last_name`, `date_of_birth`, `date_of_anniversary`, `gender`, `marital_status`, `contact_number`, `alternate_contact_number`, `email`, `alternate_email`, `nationality`, `blood_group_id`, `religion_id`, `category_id`, `caste_id`, `photo`, `mother_tongue`, `unique_identification_number`, `father_name`, `mother_name`, `spouse_name`, `emergency_contact_name`, `emergency_contact_number`, `present_address_line_1`, `present_address_line_2`, `present_city`, `present_state`, `present_zipcode`, `present_country`, `same_as_present_address`, `permanent_address_line_1`, `permanent_address_line_2`, `permanent_city`, `permanent_state`, `permanent_zipcode`, `permanent_country`, `options`, `created_at`, `updated_at`)
VALUES
	(1,NULL,NULL,1,0,'newtech',NULL,'tech',NULL,NULL,NULL,NULL,'9849302047',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-06 14:50:41','2020-10-08 23:12:21');

/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table enquiries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enquiries`;

CREATE TABLE `enquiries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_guardian_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_contact_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_enquiry` date DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enquiry_type_id` bigint(20) unsigned DEFAULT NULL,
  `enquiry_source_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enquiries_enquiry_type_id_foreign` (`enquiry_type_id`),
  KEY `enquiries_enquiry_source_id_foreign` (`enquiry_source_id`),
  KEY `enquiries_user_id_foreign` (`user_id`),
  CONSTRAINT `enquiries_enquiry_source_id_foreign` FOREIGN KEY (`enquiry_source_id`) REFERENCES `enquiry_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enquiries_enquiry_type_id_foreign` FOREIGN KEY (`enquiry_type_id`) REFERENCES `enquiry_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enquiries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table enquiry_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enquiry_details`;

CREATE TABLE `enquiry_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enquiry_id` bigint(20) unsigned DEFAULT NULL,
  `student_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `institute_id` bigint(20) unsigned DEFAULT NULL,
  `is_admitted` tinyint(1) NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enquiry_details_enquiry_id_foreign` (`enquiry_id`),
  KEY `enquiry_details_course_id_foreign` (`course_id`),
  KEY `enquiry_details_institute_id_foreign` (`institute_id`),
  CONSTRAINT `enquiry_details_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `enquiry_details_enquiry_id_foreign` FOREIGN KEY (`enquiry_id`) REFERENCES `enquiries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enquiry_details_institute_id_foreign` FOREIGN KEY (`institute_id`) REFERENCES `institutes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table enquiry_follow_ups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enquiry_follow_ups`;

CREATE TABLE `enquiry_follow_ups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `enquiry_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_follow_up` date DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_next_follow_up` date DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enquiry_follow_ups_enquiry_id_foreign` (`enquiry_id`),
  KEY `enquiry_follow_ups_user_id_foreign` (`user_id`),
  CONSTRAINT `enquiry_follow_ups_enquiry_id_foreign` FOREIGN KEY (`enquiry_id`) REFERENCES `enquiries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enquiry_follow_ups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table enquiry_sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enquiry_sources`;

CREATE TABLE `enquiry_sources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `enquiry_sources` WRITE;
/*!40000 ALTER TABLE `enquiry_sources` DISABLE KEYS */;

INSERT INTO `enquiry_sources` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Parents','','[]',NULL,NULL),
	(2,'Social Media','','[]',NULL,NULL),
	(3,'Local Advertisement','','[]',NULL,NULL),
	(4,'Others','','[]',NULL,NULL);

/*!40000 ALTER TABLE `enquiry_sources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table enquiry_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `enquiry_types`;

CREATE TABLE `enquiry_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `enquiry_types` WRITE;
/*!40000 ALTER TABLE `enquiry_types` DISABLE KEYS */;

INSERT INTO `enquiry_types` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Self Enquiry','','[]',NULL,NULL),
	(2,'Force Enquiry','','[]',NULL,NULL);

/*!40000 ALTER TABLE `enquiry_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table event_batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_batch`;

CREATE TABLE `event_batch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_batch_event_id_foreign` (`event_id`),
  KEY `event_batch_batch_id_foreign` (`batch_id`),
  CONSTRAINT `event_batch_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_batch_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table event_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_course`;

CREATE TABLE `event_course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_course_event_id_foreign` (`event_id`),
  KEY `event_course_course_id_foreign` (`course_id`),
  CONSTRAINT `event_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_course_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table event_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_department`;

CREATE TABLE `event_department` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_department_event_id_foreign` (`event_id`),
  KEY `event_department_department_id_foreign` (`department_id`),
  CONSTRAINT `event_department_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_department_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table event_employee_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_employee_category`;

CREATE TABLE `event_employee_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) unsigned DEFAULT NULL,
  `employee_category_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_employee_category_event_id_foreign` (`event_id`),
  KEY `event_employee_category_employee_category_id_foreign` (`employee_category_id`),
  CONSTRAINT `event_employee_category_employee_category_id_foreign` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_employee_category_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table event_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_types`;

CREATE TABLE `event_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `event_types` WRITE;
/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;

INSERT INTO `event_types` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'In House Event','','[]',NULL,NULL),
	(2,'Inter School Events','','[]',NULL,NULL),
	(3,'State Level Events','','[]',NULL,NULL),
	(4,'National Level Events','','[]',NULL,NULL);

/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_type_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `venue` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audience` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_event_type_id_foreign` (`event_type_id`),
  KEY `events_user_id_foreign` (`user_id`),
  CONSTRAINT `events_event_type_id_foreign` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_assessment_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_assessment_details`;

CREATE TABLE `exam_assessment_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_assessment_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `max_mark` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `pass_percentage` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ead_exam_assessment_id_foreign` (`exam_assessment_id`),
  CONSTRAINT `ead_exam_assessment_id_foreign` FOREIGN KEY (`exam_assessment_id`) REFERENCES `exam_assessments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_assessments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_assessments`;

CREATE TABLE `exam_assessments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ea_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `ea_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_grade_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_grade_details`;

CREATE TABLE `exam_grade_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_grade_id` bigint(20) unsigned DEFAULT NULL,
  `min_percentage` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `max_percentage` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `egd_exam_grade_id_foreign` (`exam_grade_id`),
  CONSTRAINT `egd_exam_grade_id_foreign` FOREIGN KEY (`exam_grade_id`) REFERENCES `exam_grades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_grades
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_grades`;

CREATE TABLE `exam_grades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eg_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `eg_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_observation_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_observation_details`;

CREATE TABLE `exam_observation_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_observation_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `max_mark` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eod_exam_observation_id_foreign` (`exam_observation_id`),
  CONSTRAINT `eod_exam_observation_id_foreign` FOREIGN KEY (`exam_observation_id`) REFERENCES `exam_observations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_observations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_observations`;

CREATE TABLE `exam_observations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eo_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `eo_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_records`;

CREATE TABLE `exam_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_schedule_id` bigint(20) unsigned DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start` time DEFAULT NULL,
  `time` time DEFAULT NULL,
  `marks` longtext COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `er_exam_schedule_id_foreign` (`exam_schedule_id`),
  KEY `er_subject_id_foreign` (`subject_id`),
  CONSTRAINT `er_exam_schedule_id_foreign` FOREIGN KEY (`exam_schedule_id`) REFERENCES `exam_schedules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `er_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_schedules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_schedules`;

CREATE TABLE `exam_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `exam_grade_id` bigint(20) unsigned DEFAULT NULL,
  `exam_assessment_id` bigint(20) unsigned DEFAULT NULL,
  `observation_marks` longtext COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `es_exam_id_foreign` (`exam_id`),
  KEY `es_batch_id_foreign` (`batch_id`),
  KEY `es_exam_grade_id_foreign` (`exam_grade_id`),
  KEY `es_exam_assessment_id_foreign` (`exam_assessment_id`),
  CONSTRAINT `es_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `es_exam_assessment_id_foreign` FOREIGN KEY (`exam_assessment_id`) REFERENCES `exam_assessments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `es_exam_grade_id_foreign` FOREIGN KEY (`exam_grade_id`) REFERENCES `exam_grades` (`id`) ON DELETE SET NULL,
  CONSTRAINT `es_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_terms`;

CREATE TABLE `exam_terms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_group_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `et_academic_session_id_foreign` (`academic_session_id`),
  KEY `exam_terms_course_group_id_foreign` (`course_group_id`),
  CONSTRAINT `et_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_terms_course_group_id_foreign` FOREIGN KEY (`course_group_id`) REFERENCES `course_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `exam_term_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_academic_session_id_foreign` (`academic_session_id`),
  KEY `exams_exam_term_id_foreign` (`exam_term_id`),
  CONSTRAINT `exams_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exams_exam_term_id_foreign` FOREIGN KEY (`exam_term_id`) REFERENCES `exam_terms` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table expenses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_category_id` bigint(20) unsigned DEFAULT NULL,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `vendor_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_expense` date DEFAULT NULL,
  `amount` decimal(25,5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_transaction_category_id_foreign` (`transaction_category_id`),
  KEY `expenses_student_record_id_foreign` (`student_record_id`),
  KEY `expenses_employee_id_foreign` (`employee_id`),
  KEY `expenses_vendor_id_foreign` (`vendor_id`),
  KEY `expenses_user_id_foreign` (`user_id`),
  CONSTRAINT `expenses_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_student_record_id_foreign` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_transaction_category_id_foreign` FOREIGN KEY (`transaction_category_id`) REFERENCES `transaction_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fee_allocation_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_allocation_groups`;

CREATE TABLE `fee_allocation_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fee_allocation_id` bigint(20) unsigned DEFAULT NULL,
  `fee_group_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_allocation_groups_fee_allocation_id_foreign` (`fee_allocation_id`),
  KEY `fee_allocation_groups_fee_group_id_foreign` (`fee_group_id`),
  CONSTRAINT `fee_allocation_groups_fee_allocation_id_foreign` FOREIGN KEY (`fee_allocation_id`) REFERENCES `fee_allocations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_allocation_groups_fee_group_id_foreign` FOREIGN KEY (`fee_group_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fee_allocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_allocations`;

CREATE TABLE `fee_allocations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_allocations_batch_id_foreign` (`batch_id`),
  KEY `fee_allocations_course_id_foreign` (`course_id`),
  CONSTRAINT `fee_allocations_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_allocations_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fee_concession_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_concession_details`;

CREATE TABLE `fee_concession_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fee_concession_id` bigint(20) unsigned DEFAULT NULL,
  `fee_head_id` bigint(20) unsigned DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_concession_details_fee_concession_id_foreign` (`fee_concession_id`),
  KEY `fee_concession_details_fee_head_id_foreign` (`fee_head_id`),
  CONSTRAINT `fee_concession_details_fee_concession_id_foreign` FOREIGN KEY (`fee_concession_id`) REFERENCES `fee_concessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_concession_details_fee_head_id_foreign` FOREIGN KEY (`fee_head_id`) REFERENCES `fee_heads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fee_concessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_concessions`;

CREATE TABLE `fee_concessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_concessions_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `fee_concessions_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fee_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_groups`;

CREATE TABLE `fee_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_groups_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `fee_groups_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fee_heads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_heads`;

CREATE TABLE `fee_heads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee_group_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_heads_fee_group_id_foreign` (`fee_group_id`),
  CONSTRAINT `fee_heads_fee_group_id_foreign` FOREIGN KEY (`fee_group_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fee_installment_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_installment_details`;

CREATE TABLE `fee_installment_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fee_installment_id` bigint(20) unsigned DEFAULT NULL,
  `fee_head_id` bigint(20) unsigned DEFAULT NULL,
  `is_optional` tinyint(1) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_installment_details_fee_installment_id_foreign` (`fee_installment_id`),
  KEY `fee_installment_details_fee_head_id_foreign` (`fee_head_id`),
  CONSTRAINT `fee_installment_details_fee_head_id_foreign` FOREIGN KEY (`fee_head_id`) REFERENCES `fee_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_installment_details_fee_installment_id_foreign` FOREIGN KEY (`fee_installment_id`) REFERENCES `fee_installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fee_installments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_installments`;

CREATE TABLE `fee_installments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fee_allocation_group_id` bigint(20) unsigned DEFAULT NULL,
  `transport_fee_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `late_fee_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `late_fee_frequency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee` int(11) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_installments_fee_allocation_group_id_foreign` (`fee_allocation_group_id`),
  KEY `fee_installments_transport_fee_id_foreign` (`transport_fee_id`),
  CONSTRAINT `fee_installments_fee_allocation_group_id_foreign` FOREIGN KEY (`fee_allocation_group_id`) REFERENCES `fee_allocation_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_installments_transport_fee_id_foreign` FOREIGN KEY (`transport_fee_id`) REFERENCES `transport_fees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table frontend_blocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `frontend_blocks`;

CREATE TABLE `frontend_blocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_menu_id` bigint(20) unsigned DEFAULT NULL,
  `block_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'program',
  `position` int(11) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frontend_blocks_frontend_menu_id_foreign` (`frontend_menu_id`),
  CONSTRAINT `frontend_blocks_frontend_menu_id_foreign` FOREIGN KEY (`frontend_menu_id`) REFERENCES `frontend_menus` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `frontend_blocks` WRITE;
/*!40000 ALTER TABLE `frontend_blocks` DISABLE KEYS */;

INSERT INTO `frontend_blocks` (`id`, `uuid`, `frontend_menu_id`, `block_type`, `position`, `title`, `body`, `url`, `featured_image`, `featured_icon`, `is_draft`, `upload_token`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'0a56fa33-f8fc-4675-bff0-25d1010b3b7e',13,'program',0,'Message From Principal','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is and a search for \'lorem ipsum\' will uncover many.',NULL,'storage/frontend-block-featured-image/lbGwladhZx7CrNHN0f9UP0zPkEl4IQWDyhIGsf9e.jpeg',NULL,0,'9acf7eb5-0943-472e-80c3-f8b2fd79b100','[]','2020-10-09 00:59:08','2020-10-11 20:12:01'),
	(3,'3dabf28a-c5be-437e-a641-32d0706837ac',15,'program',0,'Program 1','sing Lorem Ipsum is that it has a more-or-less normal...',NULL,'storage/frontend-block-featured-image/mqtvG8j9zo0TT33Tpe2RWzg1pqlezlKw7sCbQXST.png',NULL,0,'24d7e844-3189-476d-b582-a2439fb7b68d','[]','2020-10-09 01:05:03','2020-10-11 20:57:23'),
	(4,'cdc57f21-0d72-4bfa-8348-0ddc4cfbafd5',17,'program',0,'Program 2','sing Lorem Ipsum is that it has a more-or-less normal distribution of ...',NULL,'storage/frontend-block-featured-image/QJaJpBOGZQVc0eH7W4gj9FjWPpS7n4FIqomusStQ.jpeg',NULL,0,'1816dfc5-b546-49a7-b619-01c2565502e0','[]','2020-10-09 01:05:33','2020-10-12 11:32:12'),
	(5,'7939a9d8-8a24-4e2b-b76c-a6e25fa0e385',18,'program',0,'Program 3','sing Lorem Ipsum is that it has a more-or-less normal as opposed to ...',NULL,'storage/frontend-block-featured-image/83M1RU5soVb0axfVcnicNy8h0bmww3oCsvdzLssH.png',NULL,0,'3a9e43ef-f411-4691-9bec-ee13946f7841','[]','2020-10-09 01:05:45','2020-10-12 11:32:29'),
	(7,'177b88bc-6499-493c-b02d-1b55e6c6896c',16,'program',0,'Program 4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed asdd asd...',NULL,'storage/frontend-block-featured-image/qFUKNDzH6h8FkjaoXRuEVW276mky7aDzuQXlSDmN.png',NULL,0,'ec8059f0-5237-4bab-8afe-417d14ac6495','[]','2020-10-11 20:13:26','2020-10-12 11:33:02'),
	(8,'c33a14b9-5adb-47f2-9dae-cd70905d48ab',NULL,'feature',0,'Feature 1','Feature 1',NULL,NULL,NULL,0,'98d05c8c-295c-4642-8477-9809d1926561','[]','2020-11-01 23:34:26','2020-11-01 23:41:30'),
	(9,'3ca1284d-1957-453b-80fa-a73ce1589fbc',15,'feature',0,'Feature 2','Feature 2',NULL,NULL,NULL,0,'9a941cfb-9311-469c-a208-580bf598ccc8','[]','2020-11-02 08:45:01','2020-11-02 08:45:01'),
	(10,'a806636e-8743-4812-843b-d059774810c7',17,'feature',0,'Feature 3','Feeature 3',NULL,NULL,NULL,0,'431eb6f8-32e3-45f0-b947-203123dfcce5','[]','2020-11-02 08:45:17','2020-11-02 08:45:17');

/*!40000 ALTER TABLE `frontend_blocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table frontend_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `frontend_menus`;

CREATE TABLE `frontend_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `frontend_page_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frontend_menus_parent_id_foreign` (`parent_id`),
  KEY `frontend_menus_frontend_page_id_foreign` (`frontend_page_id`),
  CONSTRAINT `frontend_menus_frontend_page_id_foreign` FOREIGN KEY (`frontend_page_id`) REFERENCES `frontend_pages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `frontend_menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `frontend_menus` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `frontend_menus` WRITE;
/*!40000 ALTER TABLE `frontend_menus` DISABLE KEYS */;

INSERT INTO `frontend_menus` (`id`, `name`, `slug`, `type`, `position`, `parent_id`, `frontend_page_id`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Home','home','header',0,NULL,2,'{\"is_default\":1}','2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(2,'Contact','contact','header',0,NULL,3,'{\"is_default\":1}','2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(3,'Events','events','header',0,NULL,4,'{\"is_default\":1}','2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(4,'Articles','articles','header',0,NULL,5,'{\"is_default\":1}','2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(5,'Teachers','teachers','header',0,NULL,6,'{\"is_default\":1}','2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(6,'Calendar','calendar','header',0,NULL,7,'{\"is_default\":1}','2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(8,'Link 1','link-1','footer',0,NULL,2,'[]','2020-10-10 22:56:09','2020-10-10 22:56:09'),
	(9,'Link 2','link-2','footer',0,NULL,5,'[]','2020-10-10 22:56:18','2020-10-10 22:56:18'),
	(10,'Link 3','link-3','footer',0,NULL,3,'[]','2020-10-10 22:56:31','2020-10-10 22:56:31'),
	(11,'Link 4','link-4','footer',0,NULL,4,'[]','2020-10-10 22:56:41','2020-10-10 22:56:41'),
	(12,'Link 5','link-5','footer',0,NULL,7,'[]','2020-10-10 22:58:48','2020-11-03 12:10:00'),
	(13,'Message From Principal','message-from-principal',NULL,0,NULL,10,'[]','2020-10-11 20:09:48','2020-10-11 20:10:22'),
	(14,'Message From Chairman','message-from-chairman',NULL,0,NULL,9,'[]','2020-10-11 20:11:29','2020-10-11 20:11:29'),
	(15,'Feature 2','feature-2',NULL,0,NULL,11,'[]','2020-10-11 20:57:02','2020-10-11 20:57:02'),
	(16,'Feature 5','feature-5',NULL,0,NULL,12,'[]','2020-10-11 20:59:21','2020-10-12 11:26:23'),
	(17,'Feature 3','feature-3',NULL,0,NULL,13,'[]','2020-10-12 11:29:09','2020-10-12 11:29:09'),
	(18,'Feature 4','feature-4',NULL,0,NULL,14,'[]','2020-10-12 11:29:24','2020-10-12 11:29:24'),
	(19,'Notices','notices','header',0,NULL,15,'{\"is_default\":1}','2020-10-08 02:36:17','2020-10-08 02:36:17'),
	(20,'About','about','header',0,NULL,2,'[]','2020-10-14 08:40:04','2020-10-14 08:40:04'),
	(21,'Results','results','header',0,NULL,16,'{\"is_default\":1}','2020-10-08 02:36:17','2020-10-08 02:36:17');

/*!40000 ALTER TABLE `frontend_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table frontend_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `frontend_pages`;

CREATE TABLE `frontend_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `frontend_pages` WRITE;
/*!40000 ALTER TABLE `frontend_pages` DISABLE KEYS */;

INSERT INTO `frontend_pages` (`id`, `uuid`, `title`, `body`, `is_draft`, `upload_token`, `options`, `created_at`, `updated_at`)
VALUES
	(2,'c81d8923-420f-451f-a844-9550a36a58b8','About Us','<h4 style=\"text-align:left;margin-right:0px;margin-bottom:15px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\"><b>It is a long</b> established fact that a <u><b>reader</b></u> will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like.</h4><div><p style=\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.</p></div><div><p style=\"text-align:left;margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p></div><div style=\"text-align:left;\"><br /></div><div><br /></div>',0,'b7769263-e87a-4f1d-846f-1b7bbed6c087','{\"show_blocks\":1,\"show_upcoming_events\":0,\"show_latest_articles\":1,\"has_slider\":1,\"sliders\":[{\"image\":\"storage\\/frontend-page-slider-image\\/BOxykXDL9gVdeoGhJKhx4J1nrmHtHmpyVHZxbznJ.png\",\"title\":\"Thulung School\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"},{\"image\":\"storage\\/frontend-page-slider-image\\/HdBbqECVEwnVS2VwxPyaSzII4zu0S4m6m9b54RFf.png\",\"title\":\"Towards Brightness\",\"description\":\"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout\"}]}','2020-10-08 02:36:17','2020-11-07 16:31:06'),
	(3,'63bcfcc8-0ad9-4d41-8865-9ded7752c893','Contact','<h4>We love to hear from you. Please drop by a message</h4>',0,'24bd149e-1184-443a-8aef-575dcfac5ec7','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-08 02:36:17','2020-11-01 22:00:15'),
	(4,'54f7ec73-6349-4ec9-bbbc-e8c809f56c97','Events','Latest Events',0,'db1fc652-3160-4594-b284-a3a133b43d35','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-08 02:36:17','2020-11-01 21:15:24'),
	(5,'45032acf-a287-4c80-841e-45bf834dede7','Articles','Latest Articles',0,'ff157f4c-efed-4e67-a436-d6db85564ced','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-08 02:36:17','2020-11-01 21:14:40'),
	(6,'a12215a3-0f45-4d48-ad9d-e3cc5a0ff1f0','Teachers','Teachers',1,'ddc1d2b7-0900-4639-941f-bf8f1a1759c0','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-08 02:36:17','2020-10-14 07:35:05'),
	(7,'2a385d58-bc3f-487d-9c84-49919614bd5a','Calendar','TDTC Calendar',0,'09031c53-bd3a-471b-aefa-10589f4e993a','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-08 02:36:17','2020-11-01 21:36:39'),
	(8,'e18907c9-39b1-4de6-ad57-6f33cfff4177','About Thulung School','<p><span style=\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.</span></p><p><span style=\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.</span></p><p><span style=\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.</span></p><p><span style=\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.</span></p><p><span style=\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\">sing Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy.</span><span style=\"font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;text-align:justify;\"><br /></span></p>',0,'f533d94d-642d-4ba0-aa80-91fd84255646','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-09 01:10:43','2020-11-01 22:01:55'),
	(9,'a46ff9d5-afc4-4b78-99a5-34f03657db9d','Message From Chairman','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<br /></p>',0,'e27149da-c906-4462-a5de-c963d82c9332','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-11 20:07:25','2020-10-11 20:07:25'),
	(10,'20b47108-e399-4b7e-9f4a-92556920be50','Message From Principal','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p><br /></p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<br /></p>',0,'e2f74feb-71ee-4ede-bead-dab4580e21c6','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-11 20:07:53','2020-10-11 20:07:53'),
	(11,'f98516e9-4bea-4555-917b-de4082e90101','Feature 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dui accumsan sit amet nulla facilisi morbi tempus iaculis. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Eu turpis egestas pretium aenean pharetra. Scelerisque fermentum dui faucibus in ornare quam viverra. Aliquet lectus proin nibh nisl condimentum id venenatis a. Curabitur gravida arcu ac tortor dignissim convallis. Lacus laoreet non curabitur<br /></p>',0,'d7fb0435-07bd-4134-95b0-e216a3c4c01e','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-11 20:56:43','2020-10-11 20:56:43'),
	(12,'b8b7526b-77f1-4896-8187-2dbbc1c70e90','feature 5','<p>sadasd</p><p>asd</p><p>asdas</p><p>das</p><p>das</p><p>da</p>',0,'4651e13a-a781-404e-a531-b76b1cbcd7a6','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-11 20:59:00','2020-10-12 11:28:11'),
	(13,'b4fc4538-be4d-4090-bc58-c8df28eb08b0','Feature 3','feature 3',0,'6fd90f8d-0674-4c41-ae56-d2163a592aa6','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-12 11:28:39','2020-10-12 11:28:39'),
	(14,'e6191206-5159-4e64-a635-08afe4fcd518','Feature 4','Feature 4',0,'bb85af69-b080-45fe-b017-16bef08ff2d3','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-12 11:28:50','2020-10-12 11:28:50'),
	(15,'54f7ec73-6349-4ed9-bbbc-e8c809f56c97','Notices','Latest Notices',0,'db1fc652-3160-4594-b284-a3a133b43d35','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-08 02:36:17','2020-10-09 00:01:05'),
	(16,'54f7ec73-6349-4ed9-bbbc-e8c809f56c32','Results','Latest Results',0,'db1fc652-3160-4594-b284-a3a133b43d35','{\"show_blocks\":0,\"show_upcoming_events\":0,\"show_latest_articles\":0,\"has_slider\":0}','2020-10-08 02:36:17','2020-10-09 00:01:05');

/*!40000 ALTER TABLE `frontend_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gate_passes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gate_passes`;

CREATE TABLE `gate_passes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gate_passes_student_id_foreign` (`student_id`),
  KEY `gate_passes_employee_id_foreign` (`employee_id`),
  KEY `gate_passes_user_id_foreign` (`user_id`),
  CONSTRAINT `gate_passes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gate_passes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gate_passes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table holidays
# ------------------------------------------------------------

DROP TABLE IF EXISTS `holidays`;

CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;

INSERT INTO `holidays` (`id`, `date`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'2020-10-15','Holiday',NULL,'2020-10-08 23:57:39',NULL),
	(2,'2020-10-25','School Silver Jublee',NULL,'2020-10-08 23:58:00',NULL);

/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table id_card_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `id_card_templates`;

CREATE TABLE `id_card_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table incomes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `incomes`;

CREATE TABLE `incomes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_category_id` bigint(20) unsigned DEFAULT NULL,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_income` date DEFAULT NULL,
  `amount` decimal(25,5) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incomes_transaction_category_id_foreign` (`transaction_category_id`),
  KEY `incomes_student_record_id_foreign` (`student_record_id`),
  KEY `incomes_employee_id_foreign` (`employee_id`),
  KEY `incomes_user_id_foreign` (`user_id`),
  CONSTRAINT `incomes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `incomes_student_record_id_foreign` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `incomes_transaction_category_id_foreign` FOREIGN KEY (`transaction_category_id`) REFERENCES `transaction_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `incomes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table institute_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `institute_documents`;

CREATE TABLE `institute_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_expiry` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table institutes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `institutes`;

CREATE TABLE `institutes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_contact_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `principal_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ip_filters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ip_filters`;

CREATE TABLE `ip_filters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`)
VALUES
	(1,'default','{\"uuid\":\"4b2e2959-e1e0-468f-9a17-aa1f758f39cf\",\"displayName\":\"App\\\\Jobs\\\\SendSMS\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendSMS\",\"command\":\"O:16:\\\"App\\\\Jobs\\\\SendSMS\\\":10:{s:10:\\\"\\u0000*\\u0000numbers\\\";O:29:\\\"Illuminate\\\\Support\\\\Collection\\\":1:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;s:4:\\\"xcxc\\\";}}s:6:\\\"\\u0000*\\u0000sms\\\";s:5:\\\"sdcsc\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1603304255,1603304255);

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table lesson_plan_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lesson_plan_details`;

CREATE TABLE `lesson_plan_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_plan_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_plan_details_lesson_plan_id_foreign` (`lesson_plan_id`),
  CONSTRAINT `lesson_plan_details_lesson_plan_id_foreign` FOREIGN KEY (`lesson_plan_id`) REFERENCES `lesson_plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table lesson_plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lesson_plans`;

CREATE TABLE `lesson_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `topic` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_plans_subject_id_foreign` (`subject_id`),
  KEY `lesson_plans_employee_id_foreign` (`employee_id`),
  CONSTRAINT `lesson_plans_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_plans_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locales`;

CREATE TABLE `locales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;

INSERT INTO `locales` (`id`, `name`, `locale`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'English','en',NULL,'2020-10-06 14:50:40','2020-10-06 14:50:40');

/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table meeting_batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting_batch`;

CREATE TABLE `meeting_batch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_batch_meeting_id_foreign` (`meeting_id`),
  KEY `meeting_batch_batch_id_foreign` (`batch_id`),
  CONSTRAINT `meeting_batch_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_batch_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table meeting_course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting_course`;

CREATE TABLE `meeting_course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_course_meeting_id_foreign` (`meeting_id`),
  KEY `meeting_course_course_id_foreign` (`course_id`),
  CONSTRAINT `meeting_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_course_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table meeting_department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting_department`;

CREATE TABLE `meeting_department` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_department_meeting_id_foreign` (`meeting_id`),
  KEY `meeting_department_department_id_foreign` (`department_id`),
  CONSTRAINT `meeting_department_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_department_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table meeting_employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting_employee`;

CREATE TABLE `meeting_employee` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `is_attendee` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `me_meeting_id` (`meeting_id`),
  KEY `me_employee_id` (`employee_id`),
  CONSTRAINT `me_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `me_meeting_id` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table meeting_employee_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting_employee_category`;

CREATE TABLE `meeting_employee_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint(20) unsigned DEFAULT NULL,
  `employee_category_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mec_meeting_id_foreign` (`meeting_id`),
  KEY `mec_employee_category_id_foreign` (`employee_category_id`),
  CONSTRAINT `mec_employee_category_id_foreign` FOREIGN KEY (`employee_category_id`) REFERENCES `employee_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mec_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table meeting_student_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meeting_student_record`;

CREATE TABLE `meeting_student_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` bigint(20) unsigned DEFAULT NULL,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `is_attendee` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `msr_meeting_id` (`meeting_id`),
  KEY `msr_student_record_id` (`student_record_id`),
  CONSTRAINT `msr_meeting_id` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `msr_student_record_id` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table meetings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `meetings`;

CREATE TABLE `meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `audience` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meetings_code_unique` (`code`),
  KEY `meetings_user_id_foreign` (`user_id`),
  CONSTRAINT `meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2017_10_27_053833_create_permission_tables',1),
	(4,'2017_10_27_074549_create_config_table',1),
	(5,'2017_10_27_074635_create_locales_table',1),
	(6,'2017_10_27_074811_create_backups_table',1),
	(7,'2017_10_27_110555_create_todos_table',1),
	(8,'2017_10_27_121507_create_email_logs_table',1),
	(9,'2017_10_27_121726_create_ip_filters_table',1),
	(10,'2017_10_27_122805_create_jobs_table',1),
	(11,'2017_11_03_035042_create_uploads_table',1),
	(12,'2017_11_13_100342_create_email_templates_table',1),
	(13,'2018_06_01_095756_create_academic_sessions_table',1),
	(14,'2018_06_01_096426_create_user_preferences_table',1),
	(15,'2018_06_01_100630_create_course_groups_table',1),
	(16,'2018_06_01_100638_create_courses_table',1),
	(17,'2018_06_01_101317_create_batches_table',1),
	(18,'2018_06_01_101320_create_subjects_table',1),
	(19,'2018_06_01_103214_create_categories_table',1),
	(20,'2018_06_01_103403_create_religions_table',1),
	(21,'2018_06_01_104450_create_castes_table',1),
	(22,'2018_06_01_104516_create_student_document_types_table',1),
	(23,'2018_06_01_104523_create_blood_groups_table',1),
	(24,'2018_06_01_104535_create_student_parents_table',1),
	(25,'2018_06_01_104540_create_institutes_table',1),
	(26,'2018_06_01_104540_create_students_table',1),
	(27,'2018_06_01_104545_create_registrations_table',1),
	(28,'2018_06_01_104550_create_admissions_table',1),
	(29,'2018_06_01_104619_create_student_accounts_table',1),
	(30,'2018_06_01_111051_create_student_qualifications_table',1),
	(31,'2018_06_01_111128_create_student_siblings_table',1),
	(32,'2018_06_01_111225_create_student_documents_table',1),
	(33,'2018_06_01_111230_create_student_groups_table',1),
	(34,'2018_06_01_111458_create_fee_groups_table',1),
	(35,'2018_06_01_111534_create_fee_heads_table',1),
	(36,'2018_06_01_111540_create_fee_allocations_table',1),
	(37,'2018_06_01_111550_create_fee_allocation_groups_table',1),
	(38,'2018_06_01_111550_create_transport_circles_table',1),
	(39,'2018_06_01_111555_create_student_records_table',1),
	(40,'2018_06_01_111560_create_transport_fees_table',1),
	(41,'2018_06_01_111570_create_transport_fee_details_table',1),
	(42,'2018_06_01_111633_create_fee_installments_table',1),
	(43,'2018_06_01_111653_create_fee_installment_details_table',1),
	(44,'2018_06_01_111660_create_fee_concessions_table',1),
	(45,'2018_06_01_111670_create_fee_concession_details_table',1),
	(46,'2018_06_01_111680_create_student_fee_records_table',1),
	(47,'2018_06_01_111685_create_student_fee_record_details_table',1),
	(48,'2018_06_01_111690_create_student_optional_fee_records_table',1),
	(49,'2018_06_01_190930_create_employee_categories_table',1),
	(50,'2018_06_01_190941_create_departments_table',1),
	(51,'2018_06_01_191227_create_designations_table',1),
	(52,'2018_06_04_160829_create_accounts_table',1),
	(53,'2018_06_04_161234_create_transaction_categories_table',1),
	(54,'2018_06_04_161910_create_employee_document_types_table',1),
	(55,'2018_06_04_161913_create_employee_groups_table',1),
	(56,'2018_06_04_161913_create_employees_table',1),
	(57,'2018_06_04_163850_create_employee_terms_table',1),
	(58,'2018_06_04_163852_create_employee_designations_table',1),
	(59,'2018_06_04_164045_create_employee_accounts_table',1),
	(60,'2018_06_04_164507_create_employee_qualifications_table',1),
	(61,'2018_06_04_164924_create_employee_documents_table',1),
	(62,'2018_06_05_162431_create_vendors_table',1),
	(63,'2018_06_05_163900_create_activity_log_table',1),
	(64,'2018_06_08_144700_create_incomes_table',1),
	(65,'2018_06_08_144710_create_expenses_table',1),
	(66,'2018_06_08_144715_create_account_transfers_table',1),
	(67,'2018_06_08_144720_create_payment_methods_table',1),
	(68,'2018_06_12_160857_create_vehicles_table',1),
	(69,'2018_06_12_161341_create_vehicle_document_types_table',1),
	(70,'2018_06_12_161453_create_vehicle_documents_table',1),
	(71,'2018_06_12_161928_create_vehicle_fuel_types_table',1),
	(72,'2018_06_12_162023_create_vehicle_fuels_table',1),
	(73,'2018_06_12_162700_create_vehicle_logs_table',1),
	(74,'2018_06_12_162710_create_vehicle_service_records_table',1),
	(75,'2018_06_12_170017_create_stock_categories_table',1),
	(76,'2018_06_12_170327_create_stock_items_table',1),
	(77,'2018_06_12_173008_create_bills_table',1),
	(78,'2018_06_12_173100_create_bill_items_table',1),
	(79,'2018_06_19_052554_create_student_attendances_table',1),
	(80,'2018_06_19_061401_create_book_authors_table',1),
	(81,'2018_06_19_061412_create_book_publishers_table',1),
	(82,'2018_06_19_061480_create_book_topics_table',1),
	(83,'2018_06_19_061490_create_book_conditions_table',1),
	(84,'2018_06_19_061490_create_book_languages_table',1),
	(85,'2018_06_19_061500_create_books_table',1),
	(86,'2018_06_19_061510_create_book_posts_table',1),
	(87,'2018_06_19_063813_create_book_post_details_table',1),
	(88,'2018_06_19_063850_create_book_logs_table',1),
	(89,'2018_06_19_063855_create_book_log_details_table',1),
	(90,'2018_06_19_070120_create_buildings_table',1),
	(91,'2018_06_19_070312_create_rooms_table',1),
	(92,'2018_06_19_071510_create_stock_transfers_table',1),
	(93,'2018_06_19_075353_create_vendor_accounts_table',1),
	(94,'2018_06_19_081803_create_stock_transfer_details_table',1),
	(95,'2018_06_19_093819_create_class_timings_table',1),
	(96,'2018_06_19_094044_create_class_timing_sessions_table',1),
	(97,'2018_06_19_112313_create_timetables_table',1),
	(98,'2018_06_19_112520_create_timetable_allocations_table',1),
	(99,'2018_06_19_112658_create_timetable_allocation_details_table',1),
	(100,'2018_06_19_115345_create_lesson_plans_table',1),
	(101,'2018_06_19_120002_create_lesson_plan_details_table',1),
	(102,'2018_06_19_122400_create_class_teachers_table',1),
	(103,'2018_06_19_144802_create_transactions_table',1),
	(104,'2018_06_24_141707_create_subject_teachers_table',1),
	(105,'2018_06_24_150000_create_holidays_table',1),
	(106,'2018_07_16_140751_create_visiting_purposes_table',1),
	(107,'2018_07_16_140846_create_visitor_logs_table',1),
	(108,'2018_07_16_143941_create_enquiry_types_table',1),
	(109,'2018_07_16_144006_create_enquiry_sources_table',1),
	(110,'2018_07_16_144014_create_enquiries_table',1),
	(111,'2018_07_16_144015_create_enquiry_details_table',1),
	(112,'2018_07_16_144020_create_enquiry_follow_ups_table',1),
	(113,'2018_07_16_144056_create_event_types_table',1),
	(114,'2018_07_16_144105_create_events_table',1),
	(115,'2018_07_16_144110_create_event_batch_table',1),
	(116,'2018_07_16_144110_create_event_course_table',1),
	(117,'2018_07_16_144110_create_event_department_table',1),
	(118,'2018_07_16_144110_create_event_employee_category_table',1),
	(119,'2018_07_18_113741_create_article_types_table',1),
	(120,'2018_07_18_113741_create_articles_table',1),
	(121,'2018_07_26_075729_create_student_group_collection_table',1),
	(122,'2018_07_26_075740_create_employee_group_collection_table',1),
	(123,'2018_08_08_100000_create_telescope_entries_table',1),
	(124,'2018_08_15_091623_create_frontend_pages_table',1),
	(125,'2018_08_15_120927_create_frontend_menus_table',1),
	(126,'2018_08_16_074537_create_frontend_blocks_table',1),
	(127,'2018_08_17_133859_create_visitor_messages_table',1),
	(128,'2018_08_30_131336_update_transactions_table_with_online_payment_column',1),
	(129,'2018_08_31_051120_update_student_fee_records_table_with_late_fee_column',1),
	(130,'2018_08_31_180936_update_student_fee_record_details_table_with_transaction',1),
	(131,'2018_09_05_072431_update_vehicles_table_with_fuel_type_column',1),
	(132,'2018_09_05_072514_create_vehicle_performance_criterias_table',1),
	(133,'2018_09_06_061309_create_certificate_templates_table',1),
	(134,'2018_09_06_062159_create_certificates_table',1),
	(135,'2018_09_06_131829_create_assignments_table',1),
	(136,'2018_09_06_133439_create_notes_table',1),
	(137,'2018_09_06_134800_update_lesson_plans_table',1),
	(138,'2018_09_06_134809_update_lesson_plan_details_table',1),
	(139,'2018_09_06_135801_create_syllabuses_table',1),
	(140,'2018_09_06_135814_create_syllabus_details_table',1),
	(141,'2018_09_06_140116_create_syllabus_topics_table',1),
	(142,'2018_09_16_070254_update_admissions_table_with_prefix_column',1),
	(143,'2018_09_20_092116_update_vehicle_fuel_table_with_log_column',1),
	(144,'2018_09_20_154644_update_employees_table_with_prefix_column',1),
	(145,'2018_09_21_093033_create_employee_leave_types_table',1),
	(146,'2018_09_21_093232_create_employee_leave_allocations_table',1),
	(147,'2018_09_21_093247_create_employee_leave_allocation_details_table',1),
	(148,'2018_09_21_095109_create_employee_leave_requests_table',1),
	(149,'2018_09_21_095612_create_employee_leave_request_details_table',1),
	(150,'2018_09_21_095848_create_employee_attendance_types_table',1),
	(151,'2018_09_21_150141_create_employee_attendances_table',1),
	(152,'2018_09_21_150817_create_employee_attendance_details_table',1),
	(153,'2018_09_21_151437_create_pay_heads_table',1),
	(154,'2018_09_21_152416_create_payroll_templates_table',1),
	(155,'2018_09_21_152429_create_payroll_template_details_table',1),
	(156,'2018_09_21_153042_create_employee_salaries_table',1),
	(157,'2018_09_21_153054_create_employee_salary_details_table',1),
	(158,'2018_09_21_154223_create_payrolls_table',1),
	(159,'2018_09_21_154839_create_payroll_details_table',1),
	(160,'2018_10_07_054747_update_transactions_table_with_payroll_column',1),
	(161,'2018_10_10_133527_update_users_table_with_username_column',1),
	(162,'2018_11_18_112445_update_subjects_table_with_position_column',1),
	(163,'2018_11_18_182433_create_exam_terms_table',1),
	(164,'2018_11_19_053609_create_exam_assessments_table',1),
	(165,'2018_11_19_053700_create_exam_observations_table',1),
	(166,'2018_11_19_053718_create_exam_assessment_details_table',1),
	(167,'2018_11_19_053735_create_exam_grades_table',1),
	(168,'2018_11_19_053800_create_exam_observation_details_table',1),
	(169,'2018_11_19_053930_create_exam_grade_details_table',1),
	(170,'2018_11_19_061843_create_exams_table',1),
	(171,'2018_11_19_075929_create_exam_schedules_table',1),
	(172,'2018_11_19_080256_create_exam_records_table',1),
	(173,'2018_11_25_165034_update_batch_table_with_exam_columns',1),
	(174,'2018_11_29_055927_update_subject_table_with_shortcode_column',1),
	(175,'2019_02_07_174144_update_book_post_details_table',1),
	(176,'2019_02_10_122103_create_transport_routes_table',1),
	(177,'2019_02_10_122139_create_transport_stoppages_table',1),
	(178,'2019_02_10_122150_create_transport_route_details_table',1),
	(179,'2019_02_10_122234_create_transport_route_students_table',1),
	(180,'2019_05_27_120924_update_vehicle_document_type_table_with_insurance_column',1),
	(181,'2019_05_27_141520_create_vehicle_incharges_table',1),
	(182,'2019_05_28_102641_create_transfer_certificates_table',1),
	(183,'2019_06_05_115802_create_vehicle_service_centers_table',1),
	(184,'2019_06_05_120503_update_service_records_with_service_center_column',1),
	(185,'2019_08_07_041647_update_employee_designations_table_with_correct_foreign_key',1),
	(186,'2019_09_23_173539_create_id_card_templates_table',1),
	(187,'2019_09_24_100632_update_registration_table_with_online_column',1),
	(188,'2019_09_24_110632_create_calling_purposes_table',1),
	(189,'2019_09_24_173038_create_call_logs_table',1),
	(190,'2019_09_25_091954_create_postal_records_table',1),
	(191,'2019_09_25_093007_create_complaint_types_table',1),
	(192,'2019_09_25_093055_create_complaints_table',1),
	(193,'2019_09_25_094116_create_gate_passes_table',1),
	(194,'2019_10_02_162232_update_stock_items_table_with_quantity_column',1),
	(195,'2019_10_04_101405_create_stock_purchases_table',1),
	(196,'2019_10_04_101621_create_stock_purchase_details_table',1),
	(197,'2019_10_05_042602_update_stock_transfer_table_with_user_column',1),
	(198,'2019_10_05_094706_create_stock_transfer_returns_table',1),
	(199,'2019_11_10_132707_create_custom_fields_table',1),
	(200,'2019_11_12_084551_create_communications_table',1),
	(201,'2019_11_12_084605_create_communication_batch_table',1),
	(202,'2019_11_12_084612_create_communication_course_table',1),
	(203,'2019_11_12_084621_create_communication_department_table',1),
	(204,'2019_11_12_084634_create_communication_employee_category_table',1),
	(205,'2019_11_13_165626_create_tags_table',1),
	(206,'2019_11_13_165654_create_taggables_table',1),
	(207,'2019_11_13_165942_create_institute_documents_table',1),
	(208,'2019_11_21_100148_update_student_attendance_table_with_session_column',1),
	(209,'2019_11_24_055745_create_online_exams_table',1),
	(210,'2019_11_24_055817_create_online_exam_questions_table',1),
	(211,'2019_11_25_171718_create_online_exam_records_table',1),
	(212,'2019_11_27_054829_update_exam_terms_with_course_group_column',1),
	(213,'2019_11_29_160215_update_student_records_with_upload_token',1),
	(214,'2019_11_29_160226_update_registrations_table_with_upload_token',1),
	(215,'2020_01_12_035115_update_relations_column',1),
	(216,'2020_03_29_030950_create_user_push_tokens_table',1),
	(217,'2020_03_29_103112_create_communication_student_record_table',1),
	(218,'2020_03_29_103119_create_communication_employee_table',1),
	(219,'2020_04_09_061541_create_failed_jobs_table',1),
	(220,'2020_04_24_054611_create_meetings_table',1),
	(221,'2020_04_24_074947_create_meeting_course_table',1),
	(222,'2020_04_24_075003_create_meeting_batch_table',1),
	(223,'2020_04_24_075014_create_meeting_department_table',1),
	(224,'2020_04_24_075027_create_meeting_employee_category_table',1),
	(225,'2020_04_24_075047_create_meeting_student_record_table',1),
	(226,'2020_04_24_075058_create_meeting_employee_table',1),
	(229,'2020_11_01_171308_add_columns_to_frontend_blocks_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\User',1);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_subject_id_foreign` (`subject_id`),
  KEY `notes_employee_id_foreign` (`employee_id`),
  CONSTRAINT `notes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notes_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table online_exam_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `online_exam_questions`;

CREATE TABLE `online_exam_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `online_exam_id` bigint(20) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `question` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mark` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `answers` longtext COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oeq_online_exam_id_foreign` (`online_exam_id`),
  CONSTRAINT `oeq_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table online_exam_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `online_exam_records`;

CREATE TABLE `online_exam_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `online_exam_id` bigint(20) unsigned DEFAULT NULL,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `answers` longtext COLLATE utf8mb4_unicode_ci,
  `obtained_mark` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oer_online_exam_id_foreign` (`online_exam_id`),
  KEY `oer_student_record_id_foreign` (`student_record_id`),
  CONSTRAINT `oer_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oer_student_record_id_foreign` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table online_exams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `online_exams`;

CREATE TABLE `online_exams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `exam_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `passing_percentage` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `max_mark` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `is_negative_mark_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `negative_mark_percentage_per_question` decimal(8,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oe_academic_session_id_foreign` (`academic_session_id`),
  KEY `oe_batch_id_foreign` (`batch_id`),
  KEY `oe_subject_id_foreign` (`subject_id`),
  CONSTRAINT `oe_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oe_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oe_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table pay_heads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pay_heads`;

CREATE TABLE `pay_heads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table payment_methods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_methods`;

CREATE TABLE `payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;

INSERT INTO `payment_methods` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Cash','','[]',NULL,NULL),
	(2,'Cheque','','{\"requires_instrument_number\": true,\"requires_instrument_date\": true,\"requires_instrument_clearing_date\": true,\"requires_instrument_bank_detail\": true,\"requires_reference_number\": false}',NULL,NULL),
	(3,'Internet Banking','','{\"requires_reference_number\": false}',NULL,NULL);

/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payroll_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payroll_details`;

CREATE TABLE `payroll_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payroll_id` bigint(20) unsigned DEFAULT NULL,
  `pay_head_id` bigint(20) unsigned DEFAULT NULL,
  `amount` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pd_payroll_id_foreign` (`payroll_id`),
  KEY `pd_pay_head_id_foreign` (`pay_head_id`),
  CONSTRAINT `pd_pay_head_id_foreign` FOREIGN KEY (`pay_head_id`) REFERENCES `pay_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pd_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payrolls` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table payroll_template_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payroll_template_details`;

CREATE TABLE `payroll_template_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payroll_template_id` bigint(20) unsigned DEFAULT NULL,
  `pay_head_id` bigint(20) unsigned DEFAULT NULL,
  `employee_attendance_type_id` bigint(20) unsigned DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `category` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `computation` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ptd_payroll_template_id_foreign` (`payroll_template_id`),
  KEY `ptd_pay_head_id_foreign` (`pay_head_id`),
  KEY `ptd_employee_attendance_type_id_foreign` (`employee_attendance_type_id`),
  CONSTRAINT `ptd_employee_attendance_type_id_foreign` FOREIGN KEY (`employee_attendance_type_id`) REFERENCES `employee_attendance_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ptd_pay_head_id_foreign` FOREIGN KEY (`pay_head_id`) REFERENCES `pay_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ptd_payroll_template_id_foreign` FOREIGN KEY (`payroll_template_id`) REFERENCES `payroll_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table payroll_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payroll_templates`;

CREATE TABLE `payroll_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table payrolls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payrolls`;

CREATE TABLE `payrolls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `employee_salary_id` bigint(20) unsigned DEFAULT NULL,
  `period` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `period_detail` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `per_day_calculation_basis` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_defined_days` int(11) NOT NULL DEFAULT '0',
  `total` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `paid` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `payment_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pr_employee_id_foreign` (`employee_id`),
  KEY `pr_employee_salary_id_foreign` (`employee_salary_id`),
  CONSTRAINT `pr_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pr_employee_salary_id_foreign` FOREIGN KEY (`employee_salary_id`) REFERENCES `employee_salaries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'access-configuration','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(2,'enable-login','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(3,'import-previous-session-data','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(4,'send-sms','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(5,'send-email','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(6,'send-push-notification','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(7,'delete-communication-history','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(8,'create-meeting','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(9,'list-meeting','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(10,'edit-meeting','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(11,'delete-meeting','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(12,'create-institute-document','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(13,'edit-institute-document','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(14,'list-institute-document','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(15,'delete-institute-document','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(16,'access-todo','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(17,'list-academic-session','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(18,'create-academic-session','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(19,'edit-academic-session','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(20,'change-academic-session','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(21,'delete-academic-session','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(22,'list-course','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(23,'create-course','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(24,'edit-course','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(25,'delete-course','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(26,'list-batch','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(27,'create-batch','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(28,'edit-batch','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(29,'delete-batch','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(30,'list-subject','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(31,'create-subject','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(32,'edit-subject','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(33,'delete-subject','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(34,'list-class-teacher','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(35,'store-class-teacher','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(36,'delete-class-teacher','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(37,'list-subject-teacher','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(38,'store-subject-teacher','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(39,'delete-subject-teacher','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(40,'list-class-timing','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(41,'create-class-timing','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(42,'edit-class-timing','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(43,'delete-class-timing','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(44,'list-timetable','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(45,'create-timetable','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(46,'edit-timetable','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(47,'delete-timetable','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(48,'list-certificate','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(49,'create-certificate','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(50,'edit-certificate','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(51,'delete-certificate','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(52,'new-registration','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(53,'edit-registration','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(54,'list-registration','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(55,'delete-registration','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(56,'list-student','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(57,'list-student-fee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(58,'list-class-teacher-wise-student','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(59,'edit-student','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(60,'promote-student','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(61,'terminate-student','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(62,'make-registration-fee-payment','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(63,'change-registration-status','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(64,'set-fee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(65,'make-fee-payment','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(66,'make-partial-fee-payment','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(67,'customize-fee-date','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(68,'customize-late-fee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(69,'cancel-fee-payment','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(70,'edit-roll-number','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(71,'generate-student-id-card','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(72,'list-student-attendance','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(73,'mark-student-attendance','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(74,'import-student','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(75,'mark-class-teacher-wise-student-attendance','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(76,'list-account','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(77,'create-account','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(78,'edit-account','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(79,'delete-account','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(80,'list-fee-group','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(81,'create-fee-group','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(82,'edit-fee-group','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(83,'delete-fee-group','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(84,'list-fee-concession','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(85,'create-fee-concession','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(86,'edit-fee-concession','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(87,'delete-fee-concession','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(88,'list-fee-head','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(89,'create-fee-head','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(90,'edit-fee-head','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(91,'delete-fee-head','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(92,'list-fee-allocation','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(93,'create-fee-allocation','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(94,'edit-fee-allocation','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(95,'delete-fee-allocation','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(96,'list-income','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(97,'create-income','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(98,'edit-income','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(99,'cancel-income','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(100,'list-expense','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(101,'create-expense','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(102,'edit-expense','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(103,'cancel-expense','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(104,'list-account-transfer','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(105,'create-account-transfer','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(106,'edit-account-transfer','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(107,'cancel-account-transfer','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(108,'access-fee-report','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(109,'access-transaction-report','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(110,'list-exam','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(111,'create-exam','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(112,'edit-exam','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(113,'delete-exam','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(114,'list-exam-schedule','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(115,'create-exam-schedule','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(116,'edit-exam-schedule','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(117,'delete-exam-schedule','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(118,'list-exam-mark','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(119,'store-exam-mark','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(120,'store-class-teacher-wise-exam-mark','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(121,'store-subject-teacher-wise-exam-mark','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(122,'access-exam-report','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(123,'access-class-teacher-wise-exam-report','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(124,'list-online-exam','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(125,'create-online-exam','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(126,'edit-online-exam','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(127,'delete-online-exam','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(128,'list-transport-circle','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(129,'create-transport-circle','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(130,'edit-transport-circle','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(131,'delete-transport-circle','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(132,'list-transport-fee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(133,'create-transport-fee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(134,'edit-transport-fee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(135,'delete-transport-fee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(136,'list-vehicle','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(137,'create-vehicle','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(138,'edit-vehicle','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(139,'delete-vehicle','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(140,'list-vehicle-fuel','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(141,'create-vehicle-fuel','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(142,'edit-vehicle-fuel','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(143,'delete-vehicle-fuel','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(144,'list-vehicle-document','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(145,'create-vehicle-document','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(146,'edit-vehicle-document','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(147,'delete-vehicle-document','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(148,'list-vehicle-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(149,'create-vehicle-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(150,'edit-vehicle-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(151,'delete-vehicle-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(152,'list-vehicle-service-record','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(153,'create-vehicle-service-record','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(154,'edit-vehicle-service-record','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(155,'delete-vehicle-service-record','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(156,'access-transport-report','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(157,'list-transport-stoppage','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(158,'create-transport-stoppage','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(159,'edit-transport-stoppage','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(160,'delete-transport-stoppage','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(161,'list-transport-route','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(162,'create-transport-route','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(163,'edit-transport-route','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(164,'delete-transport-route','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(165,'assign-transport-route','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(166,'list-vehicle-incharge','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(167,'store-vehicle-incharge','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(168,'delete-vehicle-incharge','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(169,'access-all-employee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(170,'access-subordinate-employee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(171,'create-employee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(172,'edit-employee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(173,'list-employee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(174,'delete-employee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(175,'manage-leave-allocation','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(176,'request-leave','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(177,'request-leave-for-other-employee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(178,'take-action-on-leave-request','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(179,'mark-employee-attendance','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(180,'list-employee-attendance','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(181,'manage-payroll-template','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(182,'define-employee-salary','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(183,'list-payroll','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(184,'generate-payroll','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(185,'edit-payroll-amount','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(186,'edit-payroll','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(187,'delete-payroll','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(188,'list-payroll-transaction','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(189,'create-payroll-transaction','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(190,'edit-payroll-transaction','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(191,'cancel-payroll-transaction','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(192,'generate-employee-id-card','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(193,'import-employee','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(194,'create-book','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(195,'edit-book','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(196,'list-book','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(197,'delete-book','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(198,'issue-book','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(199,'return-book','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(200,'create-holiday','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(201,'edit-holiday','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(202,'list-holiday','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(203,'delete-holiday','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(204,'create-event','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(205,'edit-event','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(206,'list-event','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(207,'delete-event','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(208,'list-birthday','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(209,'list-anniversary','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(210,'list-work-anniversary','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(211,'create-article','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(212,'edit-article','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(213,'list-article','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(214,'delete-article','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(215,'create-visitor-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(216,'edit-visitor-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(217,'list-visitor-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(218,'delete-visitor-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(219,'create-postal-record','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(220,'edit-postal-record','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(221,'list-postal-record','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(222,'delete-postal-record','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(223,'create-call-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(224,'edit-call-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(225,'list-call-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(226,'delete-call-log','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(227,'create-complaint','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(228,'edit-complaint','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(229,'list-complaint','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(230,'delete-complaint','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(231,'create-gate-pass','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(232,'edit-gate-pass','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(233,'list-gate-pass','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(234,'delete-gate-pass','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(235,'create-enquiry','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(236,'edit-enquiry','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(237,'list-enquiry','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(238,'delete-enquiry','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(239,'list-visitor-message','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(240,'delete-visitor-message','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(241,'configure-frontend','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(242,'list-assignment','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(243,'create-assignment','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(244,'edit-assignment','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(245,'delete-assignment','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(246,'list-notes','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(247,'create-notes','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(248,'edit-notes','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(249,'delete-notes','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(250,'list-lesson-plan','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(251,'create-lesson-plan','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(252,'edit-lesson-plan','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(253,'delete-lesson-plan','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(254,'list-syllabus','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(255,'create-syllabus','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(256,'edit-syllabus','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(257,'delete-syllabus','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(258,'list-vendor','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(259,'create-vendor','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(260,'edit-vendor','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(261,'delete-vendor','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(262,'list-stock-category','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(263,'create-stock-category','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(264,'edit-stock-category','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(265,'delete-stock-category','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(266,'list-stock-item','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(267,'create-stock-item','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(268,'edit-stock-item','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(269,'delete-stock-item','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(270,'list-stock-purchase','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(271,'create-stock-purchase','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(272,'edit-stock-purchase','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(273,'delete-stock-purchase','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(274,'list-stock-transfer','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(275,'create-stock-transfer','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(276,'edit-stock-transfer','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(277,'delete-stock-transfer','api','2020-10-06 14:50:40','2020-10-06 14:50:40');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table postal_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `postal_records`;

CREATE TABLE `postal_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_address` text COLLATE utf8mb4_unicode_ci,
  `receiver_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_address` text COLLATE utf8mb4_unicode_ci,
  `reference_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_confidential` tinyint(1) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postal_records_user_id_foreign` (`user_id`),
  CONSTRAINT `postal_records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table registrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `registrations`;

CREATE TABLE `registrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_registration` date DEFAULT NULL,
  `registration_remarks` text COLLATE utf8mb4_unicode_ci,
  `registration_fee` int(11) NOT NULL DEFAULT '0',
  `registration_fee_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_online` tinyint(1) NOT NULL DEFAULT '0',
  `registration_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejection_remarks` text COLLATE utf8mb4_unicode_ci,
  `previous_institute_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registrations_student_id_foreign` (`student_id`),
  KEY `registrations_course_id_foreign` (`course_id`),
  KEY `registrations_previous_institute_id_foreign` (`previous_institute_id`),
  CONSTRAINT `registrations_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `registrations_previous_institute_id_foreign` FOREIGN KEY (`previous_institute_id`) REFERENCES `institutes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `registrations_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table religions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `religions`;

CREATE TABLE `religions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;

INSERT INTO `religions` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Hindu','','[]',NULL,NULL),
	(2,'Christian','','[]',NULL,NULL),
	(3,'Muslim','','[]',NULL,NULL),
	(4,'Sikh','','[]',NULL,NULL),
	(5,'Buddhist','','[]',NULL,NULL),
	(6,'Jews','','[]',NULL,NULL),
	(7,'Jainism','','[]',NULL,NULL);

/*!40000 ALTER TABLE `religions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(41,1),
	(42,1),
	(43,1),
	(44,1),
	(45,1),
	(46,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1),
	(51,1),
	(52,1),
	(53,1),
	(54,1),
	(55,1),
	(56,1),
	(57,1),
	(58,1),
	(59,1),
	(60,1),
	(61,1),
	(62,1),
	(63,1),
	(64,1),
	(65,1),
	(66,1),
	(67,1),
	(68,1),
	(69,1),
	(70,1),
	(71,1),
	(72,1),
	(73,1),
	(74,1),
	(75,1),
	(76,1),
	(77,1),
	(78,1),
	(79,1),
	(80,1),
	(81,1),
	(82,1),
	(83,1),
	(84,1),
	(85,1),
	(86,1),
	(87,1),
	(88,1),
	(89,1),
	(90,1),
	(91,1),
	(92,1),
	(93,1),
	(94,1),
	(95,1),
	(96,1),
	(97,1),
	(98,1),
	(99,1),
	(100,1),
	(101,1),
	(102,1),
	(103,1),
	(104,1),
	(105,1),
	(106,1),
	(107,1),
	(108,1),
	(109,1),
	(110,1),
	(111,1),
	(112,1),
	(113,1),
	(114,1),
	(115,1),
	(116,1),
	(117,1),
	(118,1),
	(119,1),
	(120,1),
	(121,1),
	(122,1),
	(123,1),
	(124,1),
	(125,1),
	(126,1),
	(127,1),
	(128,1),
	(129,1),
	(130,1),
	(131,1),
	(132,1),
	(133,1),
	(134,1),
	(135,1),
	(136,1),
	(137,1),
	(138,1),
	(139,1),
	(140,1),
	(141,1),
	(142,1),
	(143,1),
	(144,1),
	(145,1),
	(146,1),
	(147,1),
	(148,1),
	(149,1),
	(150,1),
	(151,1),
	(152,1),
	(153,1),
	(154,1),
	(155,1),
	(156,1),
	(157,1),
	(158,1),
	(159,1),
	(160,1),
	(161,1),
	(162,1),
	(163,1),
	(164,1),
	(165,1),
	(166,1),
	(167,1),
	(168,1),
	(169,1),
	(170,1),
	(171,1),
	(172,1),
	(173,1),
	(174,1),
	(175,1),
	(176,1),
	(177,1),
	(178,1),
	(179,1),
	(180,1),
	(181,1),
	(182,1),
	(183,1),
	(184,1),
	(185,1),
	(186,1),
	(187,1),
	(188,1),
	(189,1),
	(190,1),
	(191,1),
	(192,1),
	(193,1),
	(194,1),
	(195,1),
	(196,1),
	(197,1),
	(198,1),
	(199,1),
	(200,1),
	(201,1),
	(202,1),
	(203,1),
	(204,1),
	(205,1),
	(206,1),
	(207,1),
	(208,1),
	(209,1),
	(210,1),
	(211,1),
	(212,1),
	(213,1),
	(214,1),
	(215,1),
	(216,1),
	(217,1),
	(218,1),
	(219,1),
	(220,1),
	(221,1),
	(222,1),
	(223,1),
	(224,1),
	(225,1),
	(226,1),
	(227,1),
	(228,1),
	(229,1),
	(230,1),
	(231,1),
	(232,1),
	(233,1),
	(234,1),
	(235,1),
	(236,1),
	(237,1),
	(238,1),
	(239,1),
	(240,1),
	(241,1),
	(242,1),
	(243,1),
	(244,1),
	(245,1),
	(246,1),
	(247,1),
	(248,1),
	(249,1),
	(250,1),
	(251,1),
	(252,1),
	(253,1),
	(254,1),
	(255,1),
	(256,1),
	(257,1),
	(258,1),
	(259,1),
	(260,1),
	(261,1),
	(262,1),
	(263,1),
	(264,1),
	(265,1),
	(266,1),
	(267,1),
	(268,1),
	(269,1),
	(270,1),
	(271,1),
	(272,1),
	(273,1),
	(274,1),
	(275,1),
	(276,1),
	(277,1),
	(2,2),
	(4,2),
	(5,2),
	(6,2),
	(7,2),
	(8,2),
	(9,2),
	(10,2),
	(11,2),
	(12,2),
	(13,2),
	(14,2),
	(15,2),
	(16,2),
	(20,2),
	(22,2),
	(23,2),
	(24,2),
	(26,2),
	(27,2),
	(28,2),
	(30,2),
	(31,2),
	(32,2),
	(34,2),
	(35,2),
	(36,2),
	(37,2),
	(38,2),
	(39,2),
	(40,2),
	(41,2),
	(42,2),
	(43,2),
	(44,2),
	(45,2),
	(46,2),
	(47,2),
	(48,2),
	(49,2),
	(50,2),
	(51,2),
	(52,2),
	(53,2),
	(54,2),
	(55,2),
	(56,2),
	(57,2),
	(59,2),
	(60,2),
	(61,2),
	(62,2),
	(63,2),
	(64,2),
	(65,2),
	(66,2),
	(67,2),
	(68,2),
	(69,2),
	(70,2),
	(71,2),
	(72,2),
	(73,2),
	(74,2),
	(76,2),
	(77,2),
	(78,2),
	(80,2),
	(81,2),
	(82,2),
	(84,2),
	(85,2),
	(86,2),
	(88,2),
	(89,2),
	(90,2),
	(92,2),
	(93,2),
	(94,2),
	(96,2),
	(97,2),
	(98,2),
	(99,2),
	(100,2),
	(101,2),
	(102,2),
	(103,2),
	(104,2),
	(105,2),
	(106,2),
	(107,2),
	(108,2),
	(109,2),
	(110,2),
	(111,2),
	(112,2),
	(113,2),
	(114,2),
	(115,2),
	(116,2),
	(117,2),
	(118,2),
	(119,2),
	(122,2),
	(123,2),
	(124,2),
	(125,2),
	(126,2),
	(127,2),
	(128,2),
	(129,2),
	(130,2),
	(132,2),
	(133,2),
	(134,2),
	(136,2),
	(137,2),
	(138,2),
	(140,2),
	(141,2),
	(142,2),
	(143,2),
	(144,2),
	(145,2),
	(146,2),
	(147,2),
	(148,2),
	(149,2),
	(150,2),
	(151,2),
	(152,2),
	(153,2),
	(154,2),
	(155,2),
	(156,2),
	(157,2),
	(158,2),
	(159,2),
	(161,2),
	(162,2),
	(163,2),
	(165,2),
	(166,2),
	(167,2),
	(168,2),
	(170,2),
	(171,2),
	(172,2),
	(173,2),
	(175,2),
	(176,2),
	(177,2),
	(178,2),
	(179,2),
	(180,2),
	(181,2),
	(182,2),
	(183,2),
	(184,2),
	(185,2),
	(186,2),
	(187,2),
	(188,2),
	(189,2),
	(190,2),
	(191,2),
	(192,2),
	(193,2),
	(194,2),
	(195,2),
	(196,2),
	(198,2),
	(199,2),
	(200,2),
	(201,2),
	(202,2),
	(203,2),
	(204,2),
	(205,2),
	(206,2),
	(207,2),
	(208,2),
	(209,2),
	(210,2),
	(211,2),
	(212,2),
	(213,2),
	(214,2),
	(215,2),
	(216,2),
	(217,2),
	(218,2),
	(219,2),
	(220,2),
	(221,2),
	(222,2),
	(223,2),
	(224,2),
	(225,2),
	(226,2),
	(227,2),
	(228,2),
	(229,2),
	(230,2),
	(231,2),
	(232,2),
	(233,2),
	(234,2),
	(235,2),
	(236,2),
	(237,2),
	(238,2),
	(239,2),
	(240,2),
	(241,2),
	(242,2),
	(243,2),
	(244,2),
	(245,2),
	(246,2),
	(247,2),
	(248,2),
	(249,2),
	(250,2),
	(251,2),
	(252,2),
	(253,2),
	(254,2),
	(255,2),
	(256,2),
	(257,2),
	(258,2),
	(259,2),
	(260,2),
	(261,2),
	(262,2),
	(263,2),
	(264,2),
	(265,2),
	(266,2),
	(267,2),
	(268,2),
	(269,2),
	(270,2),
	(271,2),
	(272,2),
	(273,2),
	(274,2),
	(275,2),
	(276,2),
	(277,2),
	(2,3),
	(4,3),
	(5,3),
	(6,3),
	(8,3),
	(9,3),
	(10,3),
	(11,3),
	(16,3),
	(20,3),
	(22,3),
	(26,3),
	(30,3),
	(34,3),
	(35,3),
	(36,3),
	(37,3),
	(38,3),
	(39,3),
	(40,3),
	(41,3),
	(42,3),
	(44,3),
	(45,3),
	(46,3),
	(48,3),
	(49,3),
	(50,3),
	(52,3),
	(53,3),
	(54,3),
	(56,3),
	(57,3),
	(59,3),
	(60,3),
	(63,3),
	(70,3),
	(71,3),
	(72,3),
	(73,3),
	(108,3),
	(110,3),
	(111,3),
	(114,3),
	(115,3),
	(118,3),
	(119,3),
	(122,3),
	(123,3),
	(124,3),
	(125,3),
	(156,3),
	(170,3),
	(171,3),
	(172,3),
	(173,3),
	(176,3),
	(178,3),
	(179,3),
	(180,3),
	(182,3),
	(183,3),
	(184,3),
	(188,3),
	(189,3),
	(192,3),
	(200,3),
	(201,3),
	(202,3),
	(203,3),
	(204,3),
	(205,3),
	(206,3),
	(208,3),
	(209,3),
	(210,3),
	(211,3),
	(212,3),
	(213,3),
	(219,3),
	(220,3),
	(221,3),
	(222,3),
	(223,3),
	(224,3),
	(225,3),
	(226,3),
	(231,3),
	(232,3),
	(233,3),
	(234,3),
	(235,3),
	(236,3),
	(237,3),
	(239,3),
	(240,3),
	(242,3),
	(243,3),
	(244,3),
	(245,3),
	(246,3),
	(247,3),
	(248,3),
	(249,3),
	(250,3),
	(251,3),
	(252,3),
	(253,3),
	(254,3),
	(255,3),
	(256,3),
	(257,3),
	(258,3),
	(259,3),
	(260,3),
	(262,3),
	(263,3),
	(264,3),
	(266,3),
	(267,3),
	(268,3),
	(270,3),
	(271,3),
	(272,3),
	(274,3),
	(275,3),
	(276,3),
	(2,4),
	(9,4),
	(16,4),
	(20,4),
	(34,4),
	(37,4),
	(58,4),
	(70,4),
	(71,4),
	(72,4),
	(73,4),
	(75,4),
	(114,4),
	(118,4),
	(123,4),
	(170,4),
	(173,4),
	(176,4),
	(180,4),
	(183,4),
	(188,4),
	(202,4),
	(206,4),
	(208,4),
	(209,4),
	(210,4),
	(213,4),
	(242,4),
	(243,4),
	(244,4),
	(245,4),
	(246,4),
	(247,4),
	(248,4),
	(249,4),
	(250,4),
	(251,4),
	(252,4),
	(253,4),
	(254,4),
	(255,4),
	(256,4),
	(257,4),
	(2,5),
	(9,5),
	(16,5),
	(20,5),
	(176,5),
	(180,5),
	(183,5),
	(188,5),
	(194,5),
	(195,5),
	(196,5),
	(198,5),
	(199,5),
	(202,5),
	(206,5),
	(208,5),
	(209,5),
	(210,5),
	(213,5),
	(2,6),
	(4,6),
	(5,6),
	(6,6),
	(9,6),
	(16,6),
	(20,6),
	(56,6),
	(57,6),
	(62,6),
	(65,6),
	(69,6),
	(96,6),
	(97,6),
	(98,6),
	(99,6),
	(100,6),
	(101,6),
	(102,6),
	(103,6),
	(104,6),
	(105,6),
	(106,6),
	(107,6),
	(108,6),
	(109,6),
	(176,6),
	(180,6),
	(183,6),
	(188,6),
	(202,6),
	(206,6),
	(208,6),
	(209,6),
	(210,6),
	(213,6),
	(2,7),
	(9,7),
	(16,7),
	(56,7),
	(57,7),
	(114,7),
	(122,7),
	(202,7),
	(206,7),
	(213,7),
	(242,7),
	(246,7),
	(250,7),
	(254,7),
	(2,8),
	(9,8),
	(16,8),
	(56,8),
	(57,8),
	(114,8),
	(122,8),
	(202,8),
	(206,8),
	(213,8),
	(242,8),
	(246,8),
	(250,8),
	(254,8);

/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(2,'manager','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(3,'principal','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(4,'staff','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(5,'librarian','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(6,'accountant','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(7,'student','api','2020-10-06 14:50:40','2020-10-06 14:50:40'),
	(8,'parent','api','2020-10-06 14:50:40','2020-10-06 14:50:40');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rooms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `building_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor_number` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_building_id_foreign` (`building_id`),
  CONSTRAINT `rooms_building_id_foreign` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table stock_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_categories`;

CREATE TABLE `stock_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table stock_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_items`;

CREATE TABLE `stock_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_quantity` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `stock_category_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_items_stock_category_id_foreign` (`stock_category_id`),
  CONSTRAINT `stock_items_stock_category_id_foreign` FOREIGN KEY (`stock_category_id`) REFERENCES `stock_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table stock_purchase_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_purchase_details`;

CREATE TABLE `stock_purchase_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stock_purchase_id` bigint(20) unsigned DEFAULT NULL,
  `stock_item_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `unit_price` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_purchase_details_stock_purchase_id_foreign` (`stock_purchase_id`),
  KEY `stock_purchase_details_stock_item_id_foreign` (`stock_item_id`),
  CONSTRAINT `stock_purchase_details_stock_item_id_foreign` FOREIGN KEY (`stock_item_id`) REFERENCES `stock_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_purchase_details_stock_purchase_id_foreign` FOREIGN KEY (`stock_purchase_id`) REFERENCES `stock_purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table stock_purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_purchases`;

CREATE TABLE `stock_purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_purchases_vendor_id_foreign` (`vendor_id`),
  KEY `stock_purchases_user_id_foreign` (`user_id`),
  CONSTRAINT `stock_purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_purchases_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table stock_transfer_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_transfer_details`;

CREATE TABLE `stock_transfer_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stock_transfer_id` bigint(20) unsigned DEFAULT NULL,
  `stock_item_id` bigint(20) unsigned DEFAULT NULL,
  `custom_item_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_consumable` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `return_quantity` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_transfer_details_stock_transfer_id_foreign` (`stock_transfer_id`),
  KEY `stock_transfer_details_stock_item_id_foreign` (`stock_item_id`),
  CONSTRAINT `stock_transfer_details_stock_item_id_foreign` FOREIGN KEY (`stock_item_id`) REFERENCES `stock_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_transfer_details_stock_transfer_id_foreign` FOREIGN KEY (`stock_transfer_id`) REFERENCES `stock_transfers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table stock_transfer_returns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_transfer_returns`;

CREATE TABLE `stock_transfer_returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `stock_transfer_id` bigint(20) unsigned DEFAULT NULL,
  `stock_item_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `quantity` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_transfer_returns_stock_transfer_id_foreign` (`stock_transfer_id`),
  KEY `stock_transfer_returns_stock_item_id_foreign` (`stock_item_id`),
  KEY `stock_transfer_returns_user_id_foreign` (`user_id`),
  CONSTRAINT `stock_transfer_returns_stock_item_id_foreign` FOREIGN KEY (`stock_item_id`) REFERENCES `stock_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_transfer_returns_stock_transfer_id_foreign` FOREIGN KEY (`stock_transfer_id`) REFERENCES `stock_transfers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_transfer_returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table stock_transfers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_transfers`;

CREATE TABLE `stock_transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` bigint(20) unsigned DEFAULT NULL,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `return_due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `return_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `return_description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_transfers_room_id_foreign` (`room_id`),
  KEY `stock_transfers_employee_id_foreign` (`employee_id`),
  KEY `stock_transfers_student_id_foreign` (`student_id`),
  KEY `stock_transfers_user_id_foreign` (`user_id`),
  CONSTRAINT `stock_transfers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_transfers_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_transfers_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_transfers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_accounts`;

CREATE TABLE `student_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_identification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_accounts_student_id_foreign` (`student_id`),
  CONSTRAINT `student_accounts_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_attendances
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_attendances`;

CREATE TABLE `student_attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `session` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date_of_attendance` date DEFAULT NULL,
  `attendance` longtext COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_attendances_batch_id_foreign` (`batch_id`),
  KEY `student_attendances_subject_id_foreign` (`subject_id`),
  CONSTRAINT `student_attendances_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_attendances_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_document_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_document_types`;

CREATE TABLE `student_document_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `student_document_types` WRITE;
/*!40000 ALTER TABLE `student_document_types` DISABLE KEYS */;

INSERT INTO `student_document_types` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Birth Certificate','','[]',NULL,NULL),
	(2,'Transfer Certificate','','[]',NULL,NULL),
	(3,'Marksheet','','[]',NULL,NULL),
	(4,'Miscellaneous','','[]',NULL,NULL);

/*!40000 ALTER TABLE `student_document_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_documents`;

CREATE TABLE `student_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `student_document_type_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_documents_student_id_foreign` (`student_id`),
  KEY `student_documents_student_document_type_id_foreign` (`student_document_type_id`),
  CONSTRAINT `student_documents_student_document_type_id_foreign` FOREIGN KEY (`student_document_type_id`) REFERENCES `student_document_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_documents_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_fee_record_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_fee_record_details`;

CREATE TABLE `student_fee_record_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_fee_record_id` bigint(20) unsigned DEFAULT NULL,
  `fee_head_id` bigint(20) unsigned DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `transaction_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_fee_record_details_student_fee_record_id_foreign` (`student_fee_record_id`),
  KEY `student_fee_record_details_fee_head_id_foreign` (`fee_head_id`),
  KEY `student_fee_record_details_transaction_id_foreign` (`transaction_id`),
  CONSTRAINT `student_fee_record_details_fee_head_id_foreign` FOREIGN KEY (`fee_head_id`) REFERENCES `fee_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fee_record_details_student_fee_record_id_foreign` FOREIGN KEY (`student_fee_record_id`) REFERENCES `student_fee_records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fee_record_details_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_fee_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_fee_records`;

CREATE TABLE `student_fee_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `fee_installment_id` bigint(20) unsigned DEFAULT NULL,
  `transport_circle_id` bigint(20) unsigned DEFAULT NULL,
  `transport_fee` int(11) NOT NULL DEFAULT '0',
  `fee_concession_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `late_fee_applicable` int(11) DEFAULT NULL,
  `late_fee_frequency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_fee` int(11) NOT NULL DEFAULT '0',
  `late_fee_charged` int(11) NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_fee_records_student_record_id_foreign` (`student_record_id`),
  KEY `student_fee_records_fee_installment_id_foreign` (`fee_installment_id`),
  KEY `student_fee_records_transport_circle_id_foreign` (`transport_circle_id`),
  KEY `student_fee_records_fee_concession_id_foreign` (`fee_concession_id`),
  CONSTRAINT `student_fee_records_fee_concession_id_foreign` FOREIGN KEY (`fee_concession_id`) REFERENCES `fee_concessions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `student_fee_records_fee_installment_id_foreign` FOREIGN KEY (`fee_installment_id`) REFERENCES `fee_installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fee_records_student_record_id_foreign` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_fee_records_transport_circle_id_foreign` FOREIGN KEY (`transport_circle_id`) REFERENCES `transport_circles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_group_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_group_collection`;

CREATE TABLE `student_group_collection` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `student_group_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_group_collection_student_id_foreign` (`student_id`),
  KEY `student_group_collection_student_group_id_foreign` (`student_group_id`),
  CONSTRAINT `student_group_collection_student_group_id_foreign` FOREIGN KEY (`student_group_id`) REFERENCES `student_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_group_collection_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_groups`;

CREATE TABLE `student_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `student_groups` WRITE;
/*!40000 ALTER TABLE `student_groups` DISABLE KEYS */;

INSERT INTO `student_groups` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Staff Child','','[]',NULL,NULL),
	(2,'Student w/o Transport','','[]',NULL,NULL);

/*!40000 ALTER TABLE `student_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student_optional_fee_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_optional_fee_records`;

CREATE TABLE `student_optional_fee_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_fee_record_id` bigint(20) unsigned DEFAULT NULL,
  `fee_head_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_optional_fee_records_student_fee_record_id_foreign` (`student_fee_record_id`),
  KEY `student_optional_fee_records_fee_head_id_foreign` (`fee_head_id`),
  CONSTRAINT `student_optional_fee_records_fee_head_id_foreign` FOREIGN KEY (`fee_head_id`) REFERENCES `fee_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_optional_fee_records_student_fee_record_id_foreign` FOREIGN KEY (`student_fee_record_id`) REFERENCES `student_fee_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_parents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_parents`;

CREATE TABLE `student_parents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `first_guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_date_of_birth` date DEFAULT NULL,
  `first_guardian_qualification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_annual_income` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_contact_number_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_contact_number_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_guardian_unique_identification_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_date_of_birth` date DEFAULT NULL,
  `second_guardian_qualification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_annual_income` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_contact_number_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_contact_number_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `second_guardian_unique_identification_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_guardian_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_parents_user_id_foreign` (`user_id`),
  CONSTRAINT `student_parents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_qualifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_qualifications`;

CREATE TABLE `student_qualifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `standard` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institute_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `board_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_qualifications_student_id_foreign` (`student_id`),
  CONSTRAINT `student_qualifications_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_records`;

CREATE TABLE `student_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `admission_id` bigint(20) unsigned DEFAULT NULL,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `is_promoted` tinyint(1) NOT NULL DEFAULT '0',
  `fee_allocation_id` bigint(20) unsigned DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `roll_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_entry` date DEFAULT NULL,
  `entry_remarks` text COLLATE utf8mb4_unicode_ci,
  `date_of_exit` date DEFAULT NULL,
  `exit_remarks` text COLLATE utf8mb4_unicode_ci,
  `termination_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_records_academic_session_id_foreign` (`academic_session_id`),
  KEY `student_records_admission_id_foreign` (`admission_id`),
  KEY `student_records_student_id_foreign` (`student_id`),
  KEY `student_records_fee_allocation_id_foreign` (`fee_allocation_id`),
  KEY `student_records_batch_id_foreign` (`batch_id`),
  CONSTRAINT `student_records_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_records_admission_id_foreign` FOREIGN KEY (`admission_id`) REFERENCES `admissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_records_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_records_fee_allocation_id_foreign` FOREIGN KEY (`fee_allocation_id`) REFERENCES `fee_allocations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_records_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table student_siblings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_siblings`;

CREATE TABLE `student_siblings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `sibling_student_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_siblings_student_id_foreign` (`student_id`),
  KEY `student_siblings_sibling_student_id_foreign` (`sibling_student_id`),
  CONSTRAINT `student_siblings_sibling_student_id_foreign` FOREIGN KEY (`sibling_student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_siblings_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `student_parent_id` bigint(20) unsigned DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `birth_place` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group_id` bigint(20) unsigned DEFAULT NULL,
  `religion_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `caste_id` bigint(20) unsigned DEFAULT NULL,
  `student_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_tongue` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_identification_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `same_as_present_address` tinyint(1) NOT NULL DEFAULT '0',
  `permanent_address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_user_id_foreign` (`user_id`),
  KEY `students_student_parent_id_foreign` (`student_parent_id`),
  KEY `students_blood_group_id_foreign` (`blood_group_id`),
  KEY `students_religion_id_foreign` (`religion_id`),
  KEY `students_category_id_foreign` (`category_id`),
  KEY `students_caste_id_foreign` (`caste_id`),
  CONSTRAINT `students_blood_group_id_foreign` FOREIGN KEY (`blood_group_id`) REFERENCES `blood_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `students_caste_id_foreign` FOREIGN KEY (`caste_id`) REFERENCES `castes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `students_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `students_religion_id_foreign` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `students_student_parent_id_foreign` FOREIGN KEY (`student_parent_id`) REFERENCES `student_parents` (`id`) ON DELETE SET NULL,
  CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table subject_teachers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subject_teachers`;

CREATE TABLE `subject_teachers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_teachers_subject_id_foreign` (`subject_id`),
  KEY `subject_teachers_employee_id_foreign` (`employee_id`),
  CONSTRAINT `subject_teachers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_teachers_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table subjects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `is_elective` tinyint(1) NOT NULL DEFAULT '0',
  `has_no_exam` tinyint(1) NOT NULL DEFAULT '0',
  `max_class_per_week` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subjects_batch_id_foreign` (`batch_id`),
  CONSTRAINT `subjects_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table syllabus_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `syllabus_details`;

CREATE TABLE `syllabus_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `syllabus_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `syllabus_details_syllabus_id_foreign` (`syllabus_id`),
  CONSTRAINT `syllabus_details_syllabus_id_foreign` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table syllabus_topics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `syllabus_topics`;

CREATE TABLE `syllabus_topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `syllabus_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `syllabus_topics_syllabus_id_foreign` (`syllabus_id`),
  CONSTRAINT `syllabus_topics_syllabus_id_foreign` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table syllabuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `syllabuses`;

CREATE TABLE `syllabuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `syllabuses_subject_id_foreign` (`subject_id`),
  KEY `syllabuses_employee_id_foreign` (`employee_id`),
  CONSTRAINT `syllabuses_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `syllabuses_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table taggables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggables`;

CREATE TABLE `taggables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `taggables_tag_id_foreign` (`tag_id`),
  CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table telescope_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `telescope_entries`;

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  KEY `telescope_entries_family_hash_index` (`family_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table telescope_entries_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `telescope_entries_tags`;

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table telescope_monitoring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `telescope_monitoring`;

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table timetable_allocation_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timetable_allocation_details`;

CREATE TABLE `timetable_allocation_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timetable_allocation_id` bigint(20) unsigned DEFAULT NULL,
  `class_timing_session_id` bigint(20) unsigned DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_allocation_details_timetable_allocation_id_foreign` (`timetable_allocation_id`),
  KEY `timetable_allocation_details_class_timing_session_id_foreign` (`class_timing_session_id`),
  KEY `timetable_allocation_details_subject_id_foreign` (`subject_id`),
  CONSTRAINT `timetable_allocation_details_class_timing_session_id_foreign` FOREIGN KEY (`class_timing_session_id`) REFERENCES `class_timing_sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timetable_allocation_details_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `timetable_allocation_details_timetable_allocation_id_foreign` FOREIGN KEY (`timetable_allocation_id`) REFERENCES `timetable_allocations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table timetable_allocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timetable_allocations`;

CREATE TABLE `timetable_allocations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timetable_id` bigint(20) unsigned DEFAULT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_timing_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_allocations_timetable_id_foreign` (`timetable_id`),
  KEY `timetable_allocations_class_timing_id_foreign` (`class_timing_id`),
  CONSTRAINT `timetable_allocations_class_timing_id_foreign` FOREIGN KEY (`class_timing_id`) REFERENCES `class_timings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timetable_allocations_timetable_id_foreign` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table timetables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timetables`;

CREATE TABLE `timetables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_id` bigint(20) unsigned DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timetables_batch_id_foreign` (`batch_id`),
  CONSTRAINT `timetables_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table todos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `todos`;

CREATE TABLE `todos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `todos_user_id_foreign` (`user_id`),
  CONSTRAINT `todos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transaction_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transaction_categories`;

CREATE TABLE `transaction_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `transaction_categories` WRITE;
/*!40000 ALTER TABLE `transaction_categories` DISABLE KEYS */;

INSERT INTO `transaction_categories` (`id`, `name`, `type`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Donation','income','','[]',NULL,NULL),
	(2,'Loan','income','','[]',NULL,NULL),
	(3,'Others','income','','[]',NULL,NULL),
	(4,'Stationary','expense','','[]',NULL,NULL),
	(5,'Transportation','expense','','[]',NULL,NULL),
	(6,'Others','expense','','[]',NULL,NULL);

/*!40000 ALTER TABLE `transaction_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `bill_id` bigint(20) unsigned DEFAULT NULL,
  `income_id` bigint(20) unsigned DEFAULT NULL,
  `expense_id` bigint(20) unsigned DEFAULT NULL,
  `account_transfer_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `amount` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `account_id` bigint(20) unsigned DEFAULT NULL,
  `head` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_id` bigint(20) unsigned DEFAULT NULL,
  `student_fee_record_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `payroll_id` bigint(20) unsigned DEFAULT NULL,
  `is_advance_salary` tinyint(1) NOT NULL DEFAULT '0',
  `book_log_detail_id` bigint(20) unsigned DEFAULT NULL,
  `transaction_group_id` bigint(20) unsigned DEFAULT NULL,
  `instrument_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instrument_bank_detail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_online_payment` tinyint(1) NOT NULL DEFAULT '0',
  `source` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_detail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handling_fee` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `instrument_date` date DEFAULT NULL,
  `instrument_clearing_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `date_of_reconciliation` date DEFAULT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `cancellation_remarks` text COLLATE utf8mb4_unicode_ci,
  `cancelled_at` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_bill_id_foreign` (`bill_id`),
  KEY `transactions_income_id_foreign` (`income_id`),
  KEY `transactions_expense_id_foreign` (`expense_id`),
  KEY `transactions_account_transfer_id_foreign` (`account_transfer_id`),
  KEY `transactions_payment_method_id_foreign` (`payment_method_id`),
  KEY `transactions_account_id_foreign` (`account_id`),
  KEY `transactions_registration_id_foreign` (`registration_id`),
  KEY `transactions_student_fee_record_id_foreign` (`student_fee_record_id`),
  KEY `transactions_book_log_detail_id_foreign` (`book_log_detail_id`),
  KEY `transactions_transaction_group_id_foreign` (`transaction_group_id`),
  KEY `transactions_employee_id_foreign` (`employee_id`),
  KEY `transactions_payroll_id_foreign` (`payroll_id`),
  CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_account_transfer_id_foreign` FOREIGN KEY (`account_transfer_id`) REFERENCES `account_transfers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_book_log_detail_id_foreign` FOREIGN KEY (`book_log_detail_id`) REFERENCES `book_log_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_income_id_foreign` FOREIGN KEY (`income_id`) REFERENCES `incomes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_payroll_id_foreign` FOREIGN KEY (`payroll_id`) REFERENCES `payrolls` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_registration_id_foreign` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_student_fee_record_id_foreign` FOREIGN KEY (`student_fee_record_id`) REFERENCES `student_fee_records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_transaction_group_id_foreign` FOREIGN KEY (`transaction_group_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transfer_certificates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transfer_certificates`;

CREATE TABLE `transfer_certificates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_application` date DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL,
  `format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memo` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_certificates_student_record_id_foreign` (`student_record_id`),
  CONSTRAINT `transfer_certificates_student_record_id_foreign` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transport_circles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_circles`;

CREATE TABLE `transport_circles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transport_circles_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `transport_circles_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transport_fee_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_fee_details`;

CREATE TABLE `transport_fee_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transport_fee_id` bigint(20) unsigned DEFAULT NULL,
  `transport_circle_id` bigint(20) unsigned DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transport_fee_details_transport_fee_id_foreign` (`transport_fee_id`),
  KEY `transport_fee_details_transport_circle_id_foreign` (`transport_circle_id`),
  CONSTRAINT `transport_fee_details_transport_circle_id_foreign` FOREIGN KEY (`transport_circle_id`) REFERENCES `transport_circles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transport_fee_details_transport_fee_id_foreign` FOREIGN KEY (`transport_fee_id`) REFERENCES `transport_fees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transport_fees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_fees`;

CREATE TABLE `transport_fees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transport_fees_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `transport_fees_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transport_route_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_route_details`;

CREATE TABLE `transport_route_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `transport_route_id` bigint(20) unsigned DEFAULT NULL,
  `transport_stoppage_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_transport_route_id_foreign` (`transport_route_id`),
  KEY `trd_transport_stoppage_id_foreign` (`transport_stoppage_id`),
  CONSTRAINT `tr_transport_route_id_foreign` FOREIGN KEY (`transport_route_id`) REFERENCES `transport_routes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trd_transport_stoppage_id_foreign` FOREIGN KEY (`transport_stoppage_id`) REFERENCES `transport_stoppages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transport_route_students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_route_students`;

CREATE TABLE `transport_route_students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transport_route_detail_id` bigint(20) unsigned DEFAULT NULL,
  `student_record_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trs_transport_route_detail_id_foreign` (`transport_route_detail_id`),
  KEY `trs_student_record_id_foreign` (`student_record_id`),
  CONSTRAINT `trs_student_record_id_foreign` FOREIGN KEY (`student_record_id`) REFERENCES `student_records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trs_transport_route_detail_id_foreign` FOREIGN KEY (`transport_route_detail_id`) REFERENCES `transport_route_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transport_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_routes`;

CREATE TABLE `transport_routes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tr_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `tr_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transport_stoppages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transport_stoppages`;

CREATE TABLE `transport_stoppages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ts_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `ts_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table uploads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uploads`;

CREATE TABLE `uploads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_temp_delete` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`),
  CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;

INSERT INTO `uploads` (`id`, `uuid`, `user_id`, `module`, `module_id`, `upload_token`, `user_filename`, `filename`, `is_temp_delete`, `status`, `options`, `created_at`, `updated_at`)
VALUES
	(57,'d66112d4-c0c0-4d65-ae85-8d29cc20a9f2',1,'article',1,'50ff1177-5cfd-43ab-9254-6b9e694d5fa6','Diploma in Civil Engineering Full Paying Entrance Result 2077.pdf','uploads/article/SyF1NyQ32U3rp96W5GHRqhv8G1tRRz5S3ygDUgtk.pdf',0,1,NULL,'2020-11-07 13:25:03','2020-11-07 17:48:16');

/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_preferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_preferences`;

CREATE TABLE `user_preferences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_theme` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_session_id` bigint(20) unsigned DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_preferences_user_id_foreign` (`user_id`),
  KEY `user_preferences_academic_session_id_foreign` (`academic_session_id`),
  CONSTRAINT `user_preferences_academic_session_id_foreign` FOREIGN KEY (`academic_session_id`) REFERENCES `academic_sessions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;

INSERT INTO `user_preferences` (`id`, `user_id`, `locale`, `sidebar`, `direction`, `color_theme`, `academic_session_id`, `options`, `created_at`, `updated_at`)
VALUES
	(1,1,'en','normal','ltr','red',1,NULL,'2020-10-06 14:50:41','2020-10-21 23:48:15');

/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_push_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_push_tokens`;

CREATE TABLE `user_push_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `device_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `options` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_push_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `user_push_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `uuid`, `email`, `username`, `password`, `activation_token`, `status`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'e97c4e26-779c-40c3-bfaf-76b52e4c269b','oshrestha361@gmail.com','newtech','$2y$12$j2Hh97VvlutbXmJPhBabYOMH0/LZ6wwSde04K/US/9t1yfd2Lwfx2','a75f86e0-bdf9-4f72-8e03-38fe3cf96f57','activated',NULL,'2020-10-06 14:50:41','2020-10-06 14:50:41');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vehicle_document_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_document_types`;

CREATE TABLE `vehicle_document_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `has_expiry_date` tinyint(1) NOT NULL DEFAULT '0',
  `is_insurance_document` tinyint(1) DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `vehicle_document_types` WRITE;
/*!40000 ALTER TABLE `vehicle_document_types` DISABLE KEYS */;

INSERT INTO `vehicle_document_types` (`id`, `name`, `description`, `has_expiry_date`, `is_insurance_document`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Registration Certificate','',0,NULL,'[]',NULL,NULL),
	(2,'Fitness Certificate','',0,NULL,'[]',NULL,NULL),
	(3,'Insurance Certificate','',0,NULL,'[]',NULL,NULL),
	(4,'Others','',0,NULL,'[]',NULL,NULL);

/*!40000 ALTER TABLE `vehicle_document_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vehicle_documents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_documents`;

CREATE TABLE `vehicle_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_document_type_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_expiry` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_documents_vehicle_id_foreign` (`vehicle_id`),
  KEY `vehicle_documents_vehicle_document_type_id_foreign` (`vehicle_document_type_id`),
  CONSTRAINT `vehicle_documents_vehicle_document_type_id_foreign` FOREIGN KEY (`vehicle_document_type_id`) REFERENCES `vehicle_document_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_documents_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vehicle_fuel_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_fuel_types`;

CREATE TABLE `vehicle_fuel_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `vehicle_fuel_types` WRITE;
/*!40000 ALTER TABLE `vehicle_fuel_types` DISABLE KEYS */;

INSERT INTO `vehicle_fuel_types` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Diesel','','[]',NULL,NULL),
	(2,'Petrol','','[]',NULL,NULL),
	(3,'CNG','','[]',NULL,NULL);

/*!40000 ALTER TABLE `vehicle_fuel_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vehicle_fuels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_fuels`;

CREATE TABLE `vehicle_fuels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `price_per_unit` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `vehicle_fuel_type_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_fueling` date DEFAULT NULL,
  `log` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_fuels_vehicle_id_foreign` (`vehicle_id`),
  KEY `vehicle_fuels_vehicle_fuel_type_id_foreign` (`vehicle_fuel_type_id`),
  CONSTRAINT `vehicle_fuels_vehicle_fuel_type_id_foreign` FOREIGN KEY (`vehicle_fuel_type_id`) REFERENCES `vehicle_fuel_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_fuels_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vehicle_incharges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_incharges`;

CREATE TABLE `vehicle_incharges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_incharges_vehicle_id_foreign` (`vehicle_id`),
  KEY `vehicle_incharges_employee_id_foreign` (`employee_id`),
  CONSTRAINT `vehicle_incharges_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_incharges_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vehicle_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_logs`;

CREATE TABLE `vehicle_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint(20) unsigned DEFAULT NULL,
  `log` int(11) NOT NULL DEFAULT '0',
  `date_of_log` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_logs_vehicle_id_foreign` (`vehicle_id`),
  CONSTRAINT `vehicle_logs_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vehicle_performance_criterias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_performance_criterias`;

CREATE TABLE `vehicle_performance_criterias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint(20) unsigned DEFAULT NULL,
  `date_effective` date DEFAULT NULL,
  `min_mileage` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `max_mileage` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `min_service_charge` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `max_service_charge` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `min_run` int(11) NOT NULL DEFAULT '0',
  `max_run` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_performance_criterias_vehicle_id_foreign` (`vehicle_id`),
  CONSTRAINT `vehicle_performance_criterias_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vehicle_service_centers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_service_centers`;

CREATE TABLE `vehicle_service_centers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vehicle_service_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_service_records`;

CREATE TABLE `vehicle_service_records` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint(20) unsigned DEFAULT NULL,
  `vehicle_service_center_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_service` date DEFAULT NULL,
  `amount` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `log` int(11) NOT NULL DEFAULT '0',
  `next_due_date` date DEFAULT NULL,
  `next_due_log` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_service_records_vehicle_id_foreign` (`vehicle_id`),
  KEY `vehicle_service_records_employee_id_foreign` (`employee_id`),
  KEY `vsr_vehicle_service_center_id_foreign` (`vehicle_service_center_id`),
  CONSTRAINT `vehicle_service_records_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_service_records_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vsr_vehicle_service_center_id_foreign` FOREIGN KEY (`vehicle_service_center_id`) REFERENCES `vehicle_service_centers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vehicles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `make` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_seating_capacity` int(11) NOT NULL DEFAULT '0',
  `max_allowed` int(11) NOT NULL DEFAULT '0',
  `is_owned` tinyint(1) NOT NULL DEFAULT '0',
  `owner_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_fuel_type_id` bigint(20) unsigned DEFAULT NULL,
  `max_fuel_capacity` decimal(25,5) NOT NULL DEFAULT '0.00000',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicles_vehicle_fuel_type_id_foreign` (`vehicle_fuel_type_id`),
  CONSTRAINT `vehicles_vehicle_fuel_type_id_foreign` FOREIGN KEY (`vehicle_fuel_type_id`) REFERENCES `vehicle_fuel_types` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vendor_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vendor_accounts`;

CREATE TABLE `vendor_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_identification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_accounts_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `vendor_accounts_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table vendors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table visiting_purposes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `visiting_purposes`;

CREATE TABLE `visiting_purposes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `visiting_purposes` WRITE;
/*!40000 ALTER TABLE `visiting_purposes` DISABLE KEYS */;

INSERT INTO `visiting_purposes` (`id`, `name`, `description`, `options`, `created_at`, `updated_at`)
VALUES
	(1,'Enquiry','','[]',NULL,NULL),
	(2,'Admission','','[]',NULL,NULL),
	(3,'Transfer Certificate','','[]',NULL,NULL),
	(4,'Fee Payment','','[]',NULL,NULL),
	(5,'Parents Meeting','','[]',NULL,NULL),
	(6,'Complaint','','[]',NULL,NULL),
	(7,'Business','','[]',NULL,NULL),
	(8,'Others','','[]',NULL,NULL);

/*!40000 ALTER TABLE `visiting_purposes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table visitor_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `visitor_logs`;

CREATE TABLE `visitor_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visiting_purpose_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_with_student` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `visitor_count` int(11) DEFAULT NULL,
  `date_of_visit` date DEFAULT NULL,
  `entry_time` time DEFAULT NULL,
  `exit_time` time DEFAULT NULL,
  `student_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `upload_token` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visitor_logs_visiting_purpose_id_foreign` (`visiting_purpose_id`),
  KEY `visitor_logs_student_id_foreign` (`student_id`),
  KEY `visitor_logs_employee_id_foreign` (`employee_id`),
  CONSTRAINT `visitor_logs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `visitor_logs_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `visitor_logs_visiting_purpose_id_foreign` FOREIGN KEY (`visiting_purpose_id`) REFERENCES `visiting_purposes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table visitor_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `visitor_messages`;

CREATE TABLE `visitor_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `message` text COLLATE utf8mb4_unicode_ci,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
