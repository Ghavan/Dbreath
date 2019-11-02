-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db1
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `drug_master`
--

DROP TABLE IF EXISTS `drug_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug_master` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(120) DEFAULT NULL,
  `d_description` varchar(120) DEFAULT NULL,
  `d_quantity` varchar(120) DEFAULT NULL,
  `d_duration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_master`
--

LOCK TABLES `drug_master` WRITE;
/*!40000 ALTER TABLE `drug_master` DISABLE KEYS */;
INSERT INTO `drug_master` VALUES (1,'Fenoterol','SABA','100-200 (MDI)','4-6'),(2,'Levalbuterol','SABA','45-90 (MDI)','6-8'),(3,'Salbutamol(albuterol)','SABA','90, 100, 200 (MDI & DPI)','4-6, 12(extended release)'),(4,'Terbutaline','SABA','500 (DPI)','4-6'),(5,'Arformoterol','LABA',NULL,'12'),(6,'Formoterol','LABA','4.5-9 (DPI)','12'),(7,'Indacaterol','LABA','75-300 (DPI)','24'),(8,'Olodaterol','LABA','2.5, 5 (SMI)','24'),(9,'Salmeterol','LABA','25-50 (MDI & DPI)','12'),(10,'Ipratropium bromide','SAMA','20, 40 (MDI)','6-8'),(11,'Oxitropium bromide','SAMA','100 (MDI)','7-9'),(12,'Aclidinium bromide ','LAMA','400( DPI), 400 (MDI)','12'),(13,'Glycopyrronium bromide','LAMA','15.56 & 50 (DPI)','12-24'),(14,'Tiotropium','LAMA','18 (DPI), 2.5 & 5 (SMI)','24'),(15,'Umeclidinium','LAMA','62.5 (DPI)','24'),(16,'Formoterol/ ipratropium','SABA + SAMA','50/20 (SMI)','6-8'),(17,'Salbuterol/ ipratropium','SABA + SAMA','100/20 (SMI), 75/15 (MDI)','6-8'),(18,'Formoterol/ aclidinium','LABA + LAMA','12/400 (DPI)','12'),(19,'Formoterol/ glycopyrronium','LABA + LAMA','9.6/14.4 (MDI)','12'),(20,'Indacaterol/ glycopyrronium','LABA + LAMA','27.5/15.6 & 110/50 (DPI)','12-24'),(21,'Vilanterol/ umeclidinium','LABA + LAMA','25/62.5 (DPI)','24'),(22,'Olodaterol/ tiotropium','LABA + LAMA','5/5 (SMI)','24'),(23,'Aminophylline','Methylxanthines',NULL,'variable, up to 24'),(24,'Theophylline (SR)','Methylxanthines',NULL,'variable, up to 24'),(25,'Formoterol/ beclomethasone','LABA + ICS','6/100 (MDI & DPI)',NULL),(26,'Formoterol/ budesonide','LABA + ICS','4.5/160 (MDI), 4.5/80 (MDI), 9/320 (DPI), 9/160 (DPI)',NULL),(27,'Formoterol/ mometasone','LABA + ICS','10/200, 10/400 (MDI)',NULL),(28,'salmeterol/ fluticasone','LABA + ICS','5/100, 50/250, 5/500 (DPI), 21/115, 21/230 (MDI)',NULL),(29,'vilanterol/ fluticasone furoate','LABA + ICS','25/100 (DPI)',NULL),(30,'Roflumilast','Phosphodiesterase-4 inhibitors',NULL,NULL),(31,'beclomethasone-dipropionate/formoterol/glycopyrronium (BDP/FF/G)','LAMA + LABA + ICS',NULL,''),(32,'fluticasone-furoate/vilanterol/umeclidinium (FLF/VI/UMEC)','LAMA + LABA + ICS',NULL,NULL),(33,'budesonide/glycopyrronium/formoterol (B/G/F)','LAMA + LABA + ICS',NULL,NULL);
/*!40000 ALTER TABLE `drug_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impr`
--

DROP TABLE IF EXISTS `impr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impr` (
  `tnx_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `improvement_date` date DEFAULT NULL,
  `percentage_improvement` float DEFAULT NULL,
  `reference_tnxid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tnx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impr`
--

LOCK TABLES `impr` WRITE;
/*!40000 ALTER TABLE `impr` DISABLE KEYS */;
INSERT INTO `impr` VALUES (6,1,'2019-10-05',66.67,67),(7,1,'2019-10-05',66.67,14),(8,1,'2019-10-05',0,15),(9,1,'2019-10-05',9900,10),(10,1,'2019-10-06',0,11),(11,1,'2019-10-19',0,12),(12,1,'2019-10-24',0,13),(13,1,'2019-10-24',0,13),(14,1,'2019-10-24',0,13),(15,1,'2019-10-24',23,13),(16,1,'2019-10-24',0,13),(17,1,'2019-10-24',0,13),(18,1,'2019-10-24',0,13),(19,1,'2019-10-24',0,13),(20,1,'2019-10-24',0,13),(21,1,'2019-10-24',0,13),(22,1,'2019-10-24',0,13),(23,1,'2019-10-24',0,13),(24,1,'2019-10-24',0,13),(25,1,'2019-10-24',0,13),(26,1,'2019-10-24',0,13),(27,1,'2019-10-24',0,13),(28,1,'2019-10-24',0,13),(29,1,'2019-10-24',0,13),(30,1,'2019-10-24',0,13),(31,1,'2019-10-24',0,13),(32,1,'2019-10-24',0,13),(33,1,'2019-10-24',0,13),(34,1,'2019-10-24',0,13),(35,1,'2019-10-24',0,13),(36,1,'2019-10-24',0,13),(37,1,'2019-10-24',0,13),(38,1,'2019-10-24',0,13);
/*!40000 ALTER TABLE `impr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_mst`
--

DROP TABLE IF EXISTS `patient_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_mst` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_fname` varchar(45) NOT NULL,
  `p_mname` varchar(45) NOT NULL,
  `p_lname` varchar(45) NOT NULL,
  `p_height` float NOT NULL,
  `p_weight` int(11) NOT NULL,
  `p_dob` date NOT NULL,
  `p_age` int(11) NOT NULL,
  `p_gender` varchar(45) NOT NULL,
  `p_smoker` varchar(45) NOT NULL,
  `p_registrationinfo` datetime NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_mst`
--

LOCK TABLES `patient_mst` WRITE;
/*!40000 ALTER TABLE `patient_mst` DISABLE KEYS */;
INSERT INTO `patient_mst` VALUES (1,'ghavan','vishnu','patel',167,65,'1999-12-22',20,'Male','No','2019-09-18 13:25:19'),(2,'asmita','vishnu','patel',160,45,'1997-07-18',22,'Female','No','2019-09-18 13:27:44'),(3,'ghavan','natwar','patel',168,65,'1975-12-25',44,'Male','Yes','2019-09-18 13:31:37'),(4,'ghavan','sangita','patel',167,63,'1996-03-04',23,'Male','No','2019-09-18 16:14:51'),(5,'dgad','adfd','fd',166,166,'1999-12-22',20,'Female','Yes','2019-09-18 13:17:00'),(6,'ghavan','vishnu','patel',165,65,'1999-12-22',20,'Male','Yes','2019-10-25 13:17:07');
/*!40000 ALTER TABLE `patient_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_trtmnt_map`
--

DROP TABLE IF EXISTS `stage_trtmnt_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_trtmnt_map` (
  `sttr_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `stage_id` int(11) DEFAULT NULL,
  `trtmnt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sttr_map_id`),
  KEY `trtmnt_id_idx` (`trtmnt_id`),
  CONSTRAINT `trtmnt_id` FOREIGN KEY (`trtmnt_id`) REFERENCES `treatment_mst` (`trtmnt_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_trtmnt_map`
--

LOCK TABLES `stage_trtmnt_map` WRITE;
/*!40000 ALTER TABLE `stage_trtmnt_map` DISABLE KEYS */;
INSERT INTO `stage_trtmnt_map` VALUES (1,0,1),(2,0,3),(3,0,4),(4,1,1),(5,1,2),(6,1,3),(7,1,4),(8,2,1),(9,2,2),(10,2,4),(11,3,1),(12,3,2),(13,3,4),(14,4,1),(15,4,2),(16,4,4),(17,4,5);
/*!40000 ALTER TABLE `stage_trtmnt_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sttr_drug_map`
--

DROP TABLE IF EXISTS `sttr_drug_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sttr_drug_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sttr_map_id` int(11) DEFAULT NULL,
  `drug_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drug_id_idx` (`drug_id`),
  KEY `map_id_idx` (`sttr_map_id`),
  CONSTRAINT `drug_id` FOREIGN KEY (`drug_id`) REFERENCES `drug_master` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `map_id` FOREIGN KEY (`sttr_map_id`) REFERENCES `stage_trtmnt_map` (`sttr_map_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sttr_drug_map`
--

LOCK TABLES `sttr_drug_map` WRITE;
/*!40000 ALTER TABLE `sttr_drug_map` DISABLE KEYS */;
INSERT INTO `sttr_drug_map` VALUES (1,5,1,1),(2,5,2,1),(3,5,3,1),(4,5,4,1),(5,5,10,1),(6,5,11,1),(7,5,16,1),(8,5,17,1),(9,5,12,2),(10,5,13,2),(11,5,14,2),(12,5,15,2),(13,9,5,1),(14,9,6,1),(15,9,7,1),(16,9,8,1),(17,9,9,1),(18,9,12,1),(19,9,13,1),(20,9,14,1),(21,9,15,1),(22,9,18,1),(23,9,19,1),(24,9,20,1),(25,9,21,1),(26,9,22,1),(27,12,12,1),(28,12,13,1),(29,12,14,1),(30,12,15,1),(31,12,18,1),(32,12,19,1),(33,12,20,1),(34,12,21,1),(35,12,22,1),(36,12,25,1),(37,12,26,1),(38,12,27,1),(39,12,28,1),(40,12,29,1),(41,15,12,1),(42,15,13,1),(43,15,14,1),(44,15,15,1),(45,15,18,1),(46,15,19,1),(47,15,20,1),(48,15,21,1),(49,15,22,1),(50,15,25,1),(51,15,26,1),(52,15,27,1),(53,15,28,1),(54,15,29,1),(55,9,31,2),(56,9,32,2),(57,9,33,2),(58,12,31,2),(59,12,32,2),(60,12,33,2),(61,15,31,2),(62,15,32,2),(63,15,33,2);
/*!40000 ALTER TABLE `sttr_drug_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tx`
--

DROP TABLE IF EXISTS `t_tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_tx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `p_registration` datetime DEFAULT NULL,
  `PRE_FEV1` int(11) DEFAULT NULL,
  `PRE_FVC` int(11) DEFAULT NULL,
  `PRE_FEV1_FVC` int(11) DEFAULT NULL,
  `PRE_FET` int(11) DEFAULT NULL,
  `PRE_PVF` int(11) DEFAULT NULL,
  `PRE_FEF25` int(11) DEFAULT NULL,
  `PRE_FEF50_75` int(11) DEFAULT NULL,
  `POST_FEV1` int(11) DEFAULT NULL,
  `POST_FVC` int(11) DEFAULT NULL,
  `POST_FEV1_FVC` int(11) DEFAULT NULL,
  `POST_FET` int(11) DEFAULT NULL,
  `POST_PVF` int(11) DEFAULT NULL,
  `POST_FEF25` int(11) DEFAULT NULL,
  `POST_FEF50_75` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tx`
--

LOCK TABLES `t_tx` WRITE;
/*!40000 ALTER TABLE `t_tx` DISABLE KEYS */;
INSERT INTO `t_tx` VALUES (1,1,'2019-10-03 16:03:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'2019-10-03 16:04:32',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,'2019-10-03 16:05:31',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,'2019-10-03 16:07:03',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,'2019-10-03 16:21:47',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,'2019-10-03 16:29:14',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,1,'2019-10-03 17:54:50',0,1,2,3,4,5,6,7,8,9,10,11,12,13),(8,1,'2019-10-03 17:54:52',1,1,2,3,4,5,6,7,8,9,10,11,12,13),(9,1,'2019-10-03 17:54:53',3,1,2,3,4,5,6,1,8,9,10,11,12,13),(10,2,'2019-10-04 14:09:52',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(11,1,'2019-10-05 12:57:00',5,2,3,1,1,2,3,1,2,4,3,2,2,1),(12,2,'2019-10-05 13:02:02',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(13,2,'2019-10-05 13:06:41',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(14,2,'2019-10-05 13:09:43',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(15,2,'2019-10-05 13:24:16',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(16,2,'2019-10-05 13:25:57',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(17,2,'2019-10-05 13:29:42',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(18,2,'2019-10-05 13:37:21',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(19,2,'2019-10-05 13:41:08',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(20,2,'2019-10-05 13:42:15',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(21,2,'2019-10-05 13:44:34',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(22,2,'2019-10-05 13:59:29',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(23,2,'2019-10-05 14:06:58',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(25,2,'2019-10-05 15:35:56',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(26,2,'2019-10-05 15:37:59',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(27,2,'2019-10-05 15:41:42',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(28,1,'2019-10-05 15:46:40',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(29,1,'2019-10-06 15:48:18',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(30,1,'2019-10-19 13:46:45',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(31,1,'2019-10-25 17:01:19',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777),(32,2,'2019-10-25 17:13:51',500,1111,2222,3333,5555,6666,7777,500,1111,2222,3333,5555,6666,7777);
/*!40000 ALTER TABLE `t_tx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_mst`
--

DROP TABLE IF EXISTS `treatment_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_mst` (
  `trtmnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `trtmnt_name` varchar(45) DEFAULT NULL,
  `trtmnt_description` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`trtmnt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_mst`
--

LOCK TABLES `treatment_mst` WRITE;
/*!40000 ALTER TABLE `treatment_mst` DISABLE KEYS */;
INSERT INTO `treatment_mst` VALUES (1,'vaccination',NULL),(2,'bronchodilator',NULL),(3,'pulmonary rehabilitation',NULL),(4,'smokingCessation',NULL),(5,'oxygenTherapy',NULL);
/*!40000 ALTER TABLE `treatment_mst` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-02 15:51:39
