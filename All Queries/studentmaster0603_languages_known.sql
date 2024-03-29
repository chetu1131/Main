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
-- Table structure for table `languages_known`
--
DROP TABLE IF EXISTS `languages_known`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `languages_known` (
    `id` int NOT NULL AUTO_INCREMENT,
    `candidate_id` int DEFAULT NULL,
    `language_name` varchar(255) DEFAULT NULL,
    `lang_check` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `candidate_id` (`candidate_id`),
    CONSTRAINT `languages_known_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `basic_details` (`candidate_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 84 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages_known`
--
LOCK TABLES `languages_known` WRITE;

/*!40000 ALTER TABLE `languages_known` DISABLE KEYS */;

INSERT INTO
  `languages_known`
VALUES
  (1, 191, 'undefined', 'undefined'),
  (2, 194, 'undefined', 'undefined'),
  (3, 195, 'undefined', 'undefined'),
  (4, 196, 'undefined', 'undefined'),
  (5, 197, 'undefined', 'undefined'),
  (6, 198, 'hindi', 'undefined'),
  (7, 199, 'hindi', 'undefined'),
  (8, 200, 'hindi', 'read,write,speak'),
  (9, 200, 'english', 'read,write,speak'),
  (10, 200, 'gujrati', 'read,write,speak'),
  (11, 202, 'hindi', 'read,write,speak'),
  (12, 202, 'english', 'read,write,speak'),
  (13, 202, 'gujrati', 'read,write,speak'),
  (14, 203, 'hindi', 'read,write'),
  (15, 203, 'english', 'write,speak'),
  (16, 203, 'gujrati', 'read,speak'),
  (17, 204, 'hindi', 'read,write'),
  (18, 204, 'english', 'write,speak'),
  (19, 204, 'gujrati', 'read,speak'),
  (20, 205, 'hindi', 'read,write'),
  (21, 205, 'english', 'write,speak'),
  (22, 205, 'gujrati', 'read,speak'),
  (23, 206, 'hindi', 'read,write'),
  (24, 206, 'english', 'write,speak'),
  (25, 206, 'gujrati', 'read,speak'),
  (26, 207, 'hindi', 'read,write'),
  (27, 207, 'english', 'write,speak'),
  (28, 207, 'gujrati', 'read,speak'),
  (29, 209, 'hindi', 'read,write'),
  (30, 209, 'english', 'write,speak'),
  (31, 209, 'gujrati', 'read,speak'),
  (32, 210, 'hindi', 'read,write'),
  (33, 210, 'english', 'write,speak'),
  (34, 210, 'gujrati', 'speak'),
  (35, 211, 'hindi', 'read,write,speak'),
  (36, 211, 'english', 'read,write'),
  (37, 211, 'undefined', 'undefined'),
  (38, 212, 'hindi', 'read,speak'),
  (39, 212, 'gujrati', 'read'),
  (40, 213, 'hindi', 'read,write,speak'),
  (41, 214, 'hindi', 'undefined'),
  (42, 215, 'hindi', 'read'),
  (43, 215, 'english', 'write'),
  (44, NULL, NULL, NULL),
  (45, 216, 'hindi', 'read,speak'),
  (46, 216, 'english', 'read,write'),
  (47, 216, 'gujrati', 'read,write,speak'),
  (48, 217, 'hindi', 'speak'),
  (49, 217, 'english', 'read'),
  (50, 217, 'gujrati', 'write,speak'),
  (51, 226, 'hindi', 'write'),
  (52, 226, 'english', 'write'),
  (53, 226, 'gujrati', 'speak'),
  (54, 227, 'hindi', 'write'),
  (55, 227, 'english', 'write'),
  (56, 227, 'gujrati', 'speak'),
  (57, 228, 'hindi', 'undefined'),
  (58, 228, 'english', 'read,write'),
  (59, 228, 'gujrati', 'read,write,speak'),
  (60, 229, 'hindi', 'undefined'),
  (61, 229, 'english', 'read,write'),
  (62, 229, 'gujrati', 'read,write,speak'),
  (63, 241, 'hindi', 'read,speak'),
  (64, 241, 'english', 'read,write'),
  (65, 241, 'gujrati', 'read,write,speak'),
  (66, 242, 'hindi', 'read,speak'),
  (67, 242, 'english', 'read,write'),
  (68, 242, 'gujrati', 'read,write,speak'),
  (69, 243, 'hindi', 'read,speak'),
  (70, 243, 'english', 'read,write'),
  (71, 243, 'gujrati', 'read,write,speak'),
  (72, 244, 'hindi', 'read,speak'),
  (73, 244, 'english', 'read,write'),
  (74, 244, 'gujrati', 'read,write,speak'),
  (75, 245, 'hindi', 'write'),
  (76, 245, 'english', 'read'),
  (77, 245, 'gujrati', 'write,speak'),
  (78, 249, 'hindi', 'read,speak'),
  (79, 249, 'english', 'read,write,speak'),
  (80, 249, 'gujrati', 'read,speak'),
  (81, 252, 'hindi', 'read'),
  (82, 252, 'english', 'write'),
  (83, 252, 'gujrati', 'write');

/*!40000 ALTER TABLE `languages_known` ENABLE KEYS */;

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