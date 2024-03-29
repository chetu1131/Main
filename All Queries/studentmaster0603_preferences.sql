-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: studentmaster0603
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.20.04.1

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
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `candidate_id` int DEFAULT NULL,
  `prefered_location` varchar(255) NOT NULL,
  `notice_period` varchar(255) DEFAULT NULL,
  `department` varchar(255) NOT NULL,
  `expected_ctc` varchar(255) DEFAULT NULL,
  `current_ctc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `basic_details` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,109,'Surat,Ahmedabad','4 month','Developmnet','70000','400000'),(2,110,'Surat,Ahmedabad,Baroda','4 month','Developmnet','90000','400000'),(3,115,'Ahmedabad','4 month','Developmnet','70000','400000'),(4,121,'Ahmedabad','4 month','Developmnet','70000','400000'),(5,122,'Ahmedabad','4 month','Developmnet','70000','400000'),(6,123,'Ahmedabad','4 month','Developmnet','70000','400000'),(7,124,'Ahmedabad','4 month','Developmnet','70000','400000'),(8,125,'Ahmedabad','4 month','Developmnet','70000','400000'),(9,126,'Ahmedabad','4 month','Developmnet','70000','400000'),(10,127,'Ahmedabad','4 month','Developmnet','70000','400000'),(11,128,'Ahmedabad','4 month','Developmnet','70000','400000'),(12,129,'Ahmedabad','4 month','Developmnet','70000','400000'),(13,130,'Ahmedabad','4 month','Developmnet','70000','400000'),(14,131,'Ahmedabad','4 month','Developmnet','70000','400000'),(15,132,'Ahmedabad','4 month','Developmnet','70000','400000'),(16,133,'Ahmedabad','4 month','Developmnet','70000','400000'),(17,134,'Ahmedabad','4 month','Developmnet','70000','400000'),(18,135,'Ahmedabad','4 month','Developmnet','70000','400000'),(19,136,'Ahmedabad','4 month','Developmnet','70000','400000'),(20,137,'Ahmedabad','4 month','Developmnet','70000','400000'),(21,138,'Ahmedabad','4 month','Developmnet','70000','400000'),(22,139,'Ahmedabad','4 month','Developmnet','70000','400000'),(23,140,'Ahmedabad','4 month','Developmnet','70000','400000'),(24,141,'Ahmedabad','4 month','Developmnet','70000','400000'),(25,142,'Ahmedabad','4 month','Developmnet','70000','400000'),(26,143,'Ahmedabad','4 month','Developmnet','70000','400000'),(27,144,'Ahmedabad','4 month','Developmnet','70000','400000'),(28,145,'Ahmedabad','4 month','Developmnet','70000','400000'),(29,146,'Ahmedabad','4 month','Developmnet','70000','400000'),(30,147,'Ahmedabad','4 month','Developmnet','70000','400000'),(31,148,'Ahmedabad','4 month','Developmnet','70000','400000'),(32,149,'Ahmedabad','4 month','Developmnet','70000','400000'),(33,150,'Ahmedabad','4 month','Developmnet','70000','400000'),(34,151,'Ahmedabad','4 month','Developmnet','70000','400000'),(35,152,'Ahmedabad','4 month','Developmnet','70000','400000'),(36,153,'Ahmedabad','4 month','Developmnet','70000','400000'),(37,154,'Ahmedabad','4 month','Developmnet','70000','400000'),(38,155,'Ahmedabad','4 month','Developmnet','70000','400000'),(39,156,'Ahmedabad','4 month','Developmnet','70000','400000'),(40,157,'Ahmedabad','4 month','Developmnet','70000','400000'),(41,158,'Ahmedabad','4 month','Developmnet','70000','400000'),(42,159,'Ahmedabad','4 month','Developmnet','70000','400000'),(43,160,'Ahmedabad','4 month','Developmnet','70000','400000'),(44,161,'Ahmedabad','4 month','Developmnet','70000','400000'),(45,162,'Ahmedabad','4 month','Developmnet','70000','400000'),(46,163,'Ahmedabad','4 month','Developmnet','70000','400000'),(47,164,'Ahmedabad','4 month','Developmnet','70000','400000'),(48,165,'Ahmedabad','4 month','Developmnet','700000','400000'),(49,166,'Ahmedabad','4 month','Developmnet','700000','400000'),(50,167,'Ahmedabad','4 month','Developmnet','700000','400000'),(51,168,'Surat','4 month','Developmnet','700000','400000'),(52,169,'Ahmedabad','4 month','Developmnet','700000','400000'),(53,170,'Ahmedabad','4 month','Developmnet','700000','400000'),(54,171,'Ahmedabad','','Developmnet','700000',''),(55,172,'Ahmedabad','','Developmnet','700000',''),(56,173,'Ahmedabad','4 month','Developmnet','700000','400000'),(57,174,'Ahmedabad','','Developmnet','2000000',''),(58,175,'Ahmedabad','4 month','Developmnet','2000000','400000'),(59,176,'Surat,Ahmedabad','4 month','Developmnet','2000000','400000'),(60,187,'Ahmedabad','undefined','Developmnet','2000000','undefined'),(61,210,'Ahmedabad','4 month','Developmnet','7405805322','400000'),(62,211,'Ahmedabad','2 month','Developmnet','40000000','6000000'),(63,212,'Surat','','Developmnet','2000000',''),(64,213,'Baroda','4 month','Developmnet','70000','400000'),(65,214,'Ahmedabad','4 month','Developmnet','70000','400000'),(66,215,'Ahmedabad','4 month','Developmnet','7405805','4000000'),(67,216,'Ahmedabad','4 month','Developmnet','7000055','400000'),(68,217,'Ahmedabad','4 month','Developmnet','700000','400000'),(69,218,'Ahmedabad','2 month','Developmnet','700000','400000'),(70,219,'Ahmedabad','2 month','Developmnet','700000','400000'),(71,226,'Ahmedabad','4 month','Developmnet','2000000','400000'),(72,227,'Ahmedabad','4 month','Developmnet','700000','400000'),(73,228,'Baroda','4 month','design','2000000','4000000'),(74,229,'Baroda','4 month','design','2000000','4000000'),(75,230,'Ahmedabad','4','Developmnet','700000','4000000'),(76,231,'Ahmedabad','4','Developmnet','700000','4000000'),(77,232,'Ahmedabad','4','Developmnet','700000','4000000'),(78,233,'Ahmedabad','4 month','Developmnet','2000000','400000'),(79,234,'Ahmedabad','4 month','Developmnet','2000000','400000'),(80,235,'Ahmedabad','4 month','Developmnet','2000000','400000'),(81,236,'Ahmedabad','2 month','design','700000','6536566354'),(82,237,'Ahmedabad','4 month','design','700000','400000'),(83,239,'Ahmedabad','','Developmnet','700000',''),(84,240,'Baroda','','Developmnet','700000',''),(85,241,'Ahmedabad','4 month','Developmnet','7000055','400000'),(86,242,'Ahmedabad','4 month','Developmnet','7000055','400000'),(87,243,'Ahmedabad','4 month','design','7000055','400000'),(88,244,'Ahmedabad','4 month','design','7000055','400000'),(89,246,'Ahmedabad','','Developmnet','70000',''),(90,247,'Surat','2 month','Developmnet','70000','400000'),(91,248,'Ahmedabad','','Developmnet','70000',''),(92,249,'Baroda','2 month','Developmnet','1300000','700000'),(93,251,'0','','Developmnet','70000',''),(94,252,'Ahmedabad','4 month','Developmnet','7000076','4000000');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 16:54:52
