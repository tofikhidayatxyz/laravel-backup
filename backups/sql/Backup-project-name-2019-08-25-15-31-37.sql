
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES (1,'Wemos D1-R1/R2','This board has several ports','2019-08-21 04:02:06','2019-08-21 04:02:06');
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `conditional_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditional_lists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `sensor_server_id` bigint(20) unsigned NOT NULL,
  `conditional_id` bigint(20) NOT NULL,
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `oprator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'and',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sensor_server_id` (`sensor_server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `conditional_lists` WRITE;
/*!40000 ALTER TABLE `conditional_lists` DISABLE KEYS */;
INSERT INTO `conditional_lists` VALUES (19,0,5,11,'greater-than',30,'and','2019-08-21 04:22:19','2019-08-21 04:22:19'),(20,1,4,11,'greater-than',20,'and','2019-08-21 04:22:19','2019-08-21 04:22:19'),(21,2,3,11,'greater-than',20,'and','2019-08-21 04:22:19','2019-08-21 04:22:19'),(22,3,2,11,'equal',50,'and','2019-08-21 04:22:19','2019-08-21 04:22:19'),(23,4,1,11,'greater-than',20,'and','2019-08-21 04:22:19','2019-08-21 04:22:19');
/*!40000 ALTER TABLE `conditional_lists` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `conditionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditionals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `server_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_server_id` bigint(20) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `conditionals` WRITE;
/*!40000 ALTER TABLE `conditionals` DISABLE KEYS */;
INSERT INTO `conditionals` VALUES (11,'on','a8ef69f7-9051-44e3-a99e-873f7c7459a0',1,'off','2019-08-21 04:22:19','2019-08-24 19:46:26');
/*!40000 ALTER TABLE `conditionals` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `day_repeats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_repeats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `day_repeats` WRITE;
/*!40000 ALTER TABLE `day_repeats` DISABLE KEYS */;
INSERT INTO `day_repeats` VALUES (1,1,'sunday','2019-08-19 08:10:02','2019-08-19 08:10:02'),(2,1,'monday','2019-08-19 08:10:02','2019-08-19 08:10:02'),(3,1,'tuesday','2019-08-19 08:10:02','2019-08-19 08:10:02'),(4,1,'wednesday','2019-08-19 08:10:02','2019-08-19 08:10:02'),(5,1,'thursday','2019-08-19 08:10:02','2019-08-19 08:10:02'),(6,1,'friday','2019-08-19 08:10:02','2019-08-19 08:10:02'),(7,1,'saturday','2019-08-19 08:10:02','2019-08-19 08:10:02'),(8,2,'sunday','2019-08-19 08:10:20','2019-08-19 08:10:20'),(9,2,'monday','2019-08-19 08:10:20','2019-08-19 08:10:20'),(10,2,'tuesday','2019-08-19 08:10:20','2019-08-19 08:10:20'),(11,2,'wednesday','2019-08-19 08:10:20','2019-08-19 08:10:20'),(12,2,'thursday','2019-08-19 08:10:20','2019-08-19 08:10:20'),(13,2,'friday','2019-08-19 08:10:20','2019-08-19 08:10:20'),(14,2,'saturday','2019-08-19 08:10:20','2019-08-19 08:10:20'),(15,3,'sunday','2019-08-22 20:06:44','2019-08-22 20:06:44'),(16,3,'monday','2019-08-22 20:06:44','2019-08-22 20:06:44'),(17,3,'tuesday','2019-08-22 20:06:44','2019-08-22 20:06:44'),(18,3,'wednesday','2019-08-22 20:06:44','2019-08-22 20:06:44'),(19,3,'thursday','2019-08-22 20:06:44','2019-08-22 20:06:44'),(20,3,'friday','2019-08-22 20:06:44','2019-08-22 20:06:44'),(21,3,'saturday','2019-08-22 20:06:44','2019-08-22 20:06:44'),(22,4,'sunday','2019-08-22 20:10:00','2019-08-22 20:10:00'),(23,4,'monday','2019-08-22 20:10:00','2019-08-22 20:10:00'),(24,4,'tuesday','2019-08-22 20:10:00','2019-08-22 20:10:00'),(25,4,'wednesday','2019-08-22 20:10:00','2019-08-22 20:10:00'),(26,4,'thursday','2019-08-22 20:10:00','2019-08-22 20:10:00'),(27,4,'friday','2019-08-22 20:10:00','2019-08-22 20:10:00'),(28,4,'saturday','2019-08-22 20:10:00','2019-08-22 20:10:00');
/*!40000 ALTER TABLE `day_repeats` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (297,'2014_10_12_000000_create_users_table',1),(298,'2014_10_12_100000_create_password_resets_table',1),(299,'2019_07_31_112717_create_servers_table',1),(300,'2019_08_05_015107_create_roles_table',1),(301,'2019_08_05_015435_create_role_user_table',1),(302,'2019_08_05_090014_create_boards_table',1),(303,'2019_08_06_040058_create_sensors_table',1),(304,'2019_08_06_043736_create_pin_boards_table',1),(305,'2019_08_06_043749_create_pin_sensors_table',1),(306,'2019_08_12_005546_create_pin_servers_table',1),(307,'2019_08_12_005733_create_sensor_servers_table',1),(308,'2019_08_12_005748_create_pin_sensor_servers_table',1),(309,'2019_08_14_025801_create_schedules_table',1),(310,'2019_08_14_130242_create_day_repeats_table',1),(311,'2019_08_16_211222_create_sub_sensors_table',1),(312,'2019_08_16_223409_create_telegram_ids_table',1),(313,'2019_08_20_032223_create_conditionals_table',2),(314,'2019_08_20_032456_create_conditional_lists_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pin_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin_boards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `board_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `function` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pin_boards` WRITE;
/*!40000 ALTER TABLE `pin_boards` DISABLE KEYS */;
INSERT INTO `pin_boards` VALUES (1,1,'5v','power',NULL,'5v','2019-08-19 08:01:01','2019-08-19 08:01:01'),(2,1,'reset','reset',NULL,'reset','2019-08-19 08:01:01','2019-08-19 08:01:01'),(3,1,'3.3v','power',NULL,'3.4v','2019-08-19 08:01:01','2019-08-19 08:01:01'),(4,1,'gnd','power',NULL,'gnd','2019-08-19 08:01:01','2019-08-19 08:01:01'),(5,1,'gnd','power',NULL,'gnd','2019-08-19 08:01:01','2019-08-19 08:01:01'),(6,1,'vin','power',NULL,'vin','2019-08-19 08:01:01','2019-08-19 08:01:01'),(7,1,'A0','analog',NULL,'A0','2019-08-19 08:01:01','2019-08-19 08:01:01'),(8,1,'D0','digital','RX','D0','2019-08-19 08:01:01','2019-08-19 08:01:01'),(9,1,'D1','digital','TX','D1','2019-08-19 08:01:01','2019-08-19 08:01:01'),(10,1,'D2','digital',NULL,'D2','2019-08-19 08:01:01','2019-08-19 08:01:01'),(11,1,'D3','digital','SCL','D3','2019-08-19 08:01:01','2019-08-19 08:01:01'),(12,1,'D4','digital','SDA','D4','2019-08-19 08:01:01','2019-08-19 08:01:01'),(13,1,'D5','digital','SCK','D5','2019-08-19 08:01:01','2019-08-19 08:01:01'),(14,1,'D6','digital','MISO','D6','2019-08-19 08:01:01','2019-08-19 08:01:01'),(15,1,'D7','digital','MOSI','D7','2019-08-19 08:01:01','2019-08-19 08:01:01'),(16,1,'D8','digital',NULL,'D7','2019-08-19 08:01:01','2019-08-19 08:01:01'),(17,1,'D9','digital','MISO','D7','2019-08-19 08:01:01','2019-08-19 08:01:01'),(18,1,'D10','digital','SS','D10','2019-08-19 08:01:01','2019-08-19 08:01:01'),(19,1,'D11','digital','MOSI','D11','2019-08-19 08:01:01','2019-08-19 08:01:01'),(20,1,'D12','digital','MISO','D12','2019-08-19 08:01:01','2019-08-19 08:01:01'),(21,1,'D13','digital','SCK','D13','2019-08-19 08:01:01','2019-08-19 08:01:01'),(22,1,'D14','digital','SDA','D14','2019-08-19 08:01:01','2019-08-19 08:01:01'),(23,1,'D15','digital','SCL','D15','2019-08-19 08:01:01','2019-08-19 08:01:01');
/*!40000 ALTER TABLE `pin_boards` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pin_sensor_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin_sensor_servers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sensor_server_id` bigint(20) NOT NULL,
  `pin_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pin_sensor_servers` WRITE;
/*!40000 ALTER TABLE `pin_sensor_servers` DISABLE KEYS */;
INSERT INTO `pin_sensor_servers` VALUES (1,1,10,'2019-08-19 08:06:06','2019-08-19 08:06:06'),(2,2,9,'2019-08-19 08:06:06','2019-08-19 08:06:06'),(3,3,8,'2019-08-19 08:06:06','2019-08-19 08:06:06'),(4,4,8,'2019-08-19 08:06:06','2019-08-19 08:06:06'),(5,5,8,'2019-08-19 08:06:06','2019-08-19 08:06:06');
/*!40000 ALTER TABLE `pin_sensor_servers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pin_sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin_sensors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sensor_id` bigint(20) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pin_sensors` WRITE;
/*!40000 ALTER TABLE `pin_sensors` DISABLE KEYS */;
INSERT INTO `pin_sensors` VALUES (1,1,'5v','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(2,1,'data','digital','2019-08-19 08:01:01','2019-08-19 08:01:01'),(3,1,'gnd','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(4,2,'5v','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(5,2,'data','digital','2019-08-19 08:01:01','2019-08-19 08:01:01'),(6,2,'gnd','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(7,3,'5v','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(8,3,'data','digital','2019-08-19 08:01:01','2019-08-19 08:01:01'),(9,3,'gnd','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(10,4,'5v','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(11,4,'data','digital','2019-08-19 08:01:01','2019-08-19 08:01:01'),(12,4,'gnd','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(13,5,'5v','power','2019-08-19 08:01:01','2019-08-19 08:01:01'),(14,5,'data','digital','2019-08-19 08:01:01','2019-08-19 08:01:01'),(15,5,'gnd','power','2019-08-19 08:01:01','2019-08-19 08:01:01');
/*!40000 ALTER TABLE `pin_sensors` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pin_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pin_servers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_board_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pin_servers` WRITE;
/*!40000 ALTER TABLE `pin_servers` DISABLE KEYS */;
INSERT INTO `pin_servers` VALUES (1,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','Lampu kamar','15','lamp.svg','off','2019-08-19 08:06:06','2019-08-24 19:46:31'),(2,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','Mesin cuci','11','washing-machine.svg','off','2019-08-19 08:06:06','2019-08-24 02:02:29'),(3,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','Pendingin udara','12','air-conditioner.svg','off','2019-08-19 08:06:06','2019-08-24 02:02:30'),(4,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','Kulkas','13','fridge.svg','off','2019-08-19 08:06:06','2019-08-24 02:02:32'),(5,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','Lampu taman','14','lamp.svg','off','2019-08-19 08:06:06','2019-08-24 02:02:33'),(6,'794ae4f1-5d3a-4a2b-ba28-1cd624acecb2','qwertghyjukio','22','house.svg','off','2019-08-21 20:01:48','2019-08-21 20:01:48');
/*!40000 ALTER TABLE `pin_servers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,NULL,NULL),(2,2,2,NULL,NULL),(3,3,2,NULL,NULL);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','the god of the entire system','2019-08-19 08:01:00','2019-08-19 08:01:00'),(2,'user','They`ll only have limited access','2019-08-19 08:01:00','2019-08-19 08:01:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin_server_id` bigint(20) NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (4,'a8ef69f7-9051-44e3-a99e-873f7c7459a0',1,'10:49','on','off','2019-08-22 20:10:00','2019-08-24 02:02:36');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sensor_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_servers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sensor_servers` WRITE;
/*!40000 ALTER TABLE `sensor_servers` DISABLE KEYS */;
INSERT INTO `sensor_servers` VALUES (1,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','ic-light','Cahaya',4,400,'2019-08-19 08:06:06','2019-08-23 20:55:41'),(2,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','ic-air','Air',5,50,'2019-08-19 08:06:06','2019-08-24 19:34:14'),(3,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','ic-light','kejernihan',3,30,'2019-08-19 08:06:06','2019-08-24 19:35:37'),(4,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','ic-thermometer','Kelembaban',2,50,'2019-08-19 08:06:06','2019-08-22 21:54:07'),(5,'a8ef69f7-9051-44e3-a99e-873f7c7459a0','ic-thermometer','Suhu udara',1,32,'2019-08-19 08:06:06','2019-08-24 19:33:33');
/*!40000 ALTER TABLE `sensor_servers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sensors` WRITE;
/*!40000 ALTER TABLE `sensors` DISABLE KEYS */;
INSERT INTO `sensors` VALUES (1,'Temperature - DHT11','temperature','DHT11','c','This sensor for geting ait themeprature','2019-08-19 08:01:01','2019-08-19 08:01:01'),(2,'Humidity - DHT11','humidity','DHT11','%','This sensor for geting air humidity','2019-08-19 08:01:01','2019-08-19 08:01:01'),(3,'Kejernihan - DHT11','core','DHT11','%','This sensor for geting air humidity','2019-08-19 08:01:01','2019-08-19 08:01:01'),(4,'Light sensor - Ldr','Lighting','LDR','lumen','This sensor module for getting light intensity','2019-08-19 08:01:01','2019-08-19 08:01:01'),(5,'Water sensor - Wdr','Water','WDR','bct','This sensor module for getting light intensity','2019-08-19 08:01:01','2019-08-19 08:01:01');
/*!40000 ALTER TABLE `sensors` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `board_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ssid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suspend` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Jakarta',
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2019-08-19 15:00:59',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES ('a8ef69f7-9051-44e3-a99e-873f7c7459a0',3,'Rumah tofik','1','demo.web.me','demokedprkuy',0,'Asia/Jakarta','house.svg','2019-08-19 15:00:59','2019-08-19 08:06:06','2019-08-19 08:06:06','2226270a3f00d3b3ebf3c525a93c9b0e6d4d5750');
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sub_sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_sensors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sub_sensors` WRITE;
/*!40000 ALTER TABLE `sub_sensors` DISABLE KEYS */;
INSERT INTO `sub_sensors` VALUES (1,1,2,'2019-08-19 08:01:01','2019-08-19 08:01:01'),(2,1,3,'2019-08-19 08:01:01','2019-08-19 08:01:01');
/*!40000 ALTER TABLE `sub_sensors` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `telegram_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telegram_ids` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `telegram_ids` WRITE;
/*!40000 ALTER TABLE `telegram_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegram_ids` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator Sample','admin@test.app','2019-08-19 08:01:00','08982548374','idr','$2y$10$3vhYErDsg9AKg2ucAHJWbueNu0PUtYkttEU0d984b.Q.MKeBkdsc6','free',NULL,'2019-08-19 08:01:00','2019-08-19 08:01:00'),(2,'User Sample','user@test.app','2019-08-19 08:01:00','08982548374','idr','$2y$10$CkfAsez7ZK1Xs0XEsCzZxOuebbiIK7oNiDsokBLZ7KVU2XJ9o6i4.','free',NULL,'2019-08-19 08:01:00','2019-08-19 08:01:00'),(3,'Tofikhidayat','thidayat@mail.ccsf.edu','2019-08-19 08:01:00','08982548374','idr','$2y$10$K.wPl1WSSuRZYtAf3YGwxO/TBx5bTbzRjIvQGIQC/2N9DmydT0wvi','free','GrPxF3Mx8y3Mb6bQzXZtqjFAMmDy8NgodwA5adPqq0FIiP7wItSIdFQ6OJAt','2019-08-19 08:01:00','2019-08-19 08:01:00');
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

