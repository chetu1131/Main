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
-- Table structure for table `technologies`
--
DROP TABLE IF EXISTS `technologies`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `technologies` (
    `id` int NOT NULL AUTO_INCREMENT,
    `candidate_id` int DEFAULT NULL,
    `language_name` varchar(255) DEFAULT NULL,
    `ability`
    set
      (
        'beginer',
        'mideator',
        'expert',
        'not_selected',
        'not_know'
      ) DEFAULT NULL,
      PRIMARY KEY (`id`),
      KEY `candidate_id` (`candidate_id`),
      CONSTRAINT `technologies_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `basic_details` (`candidate_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 65 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technologies`
--
LOCK TABLES `technologies` WRITE;

/*!40000 ALTER TABLE `technologies` DISABLE KEYS */;

INSERT INTO
  `technologies`
VALUES
  (1, 185, 'php', 'beginer'),
  (2, 185, 'mysql', 'beginer'),
  (3, 186, 'php', 'beginer'),
  (4, 186, 'mysql', 'beginer'),
  (5, 187, 'php', 'beginer'),
  (6, 187, 'mysql', 'beginer'),
  (7, 203, 'php', 'mideator'),
  (8, 203, 'mysql', 'mideator'),
  (9, 203, 'laravel', 'beginer'),
  (10, 203, 'oracle', 'mideator'),
  (11, 204, 'php', 'mideator'),
  (12, 204, 'mysql', 'mideator'),
  (13, 204, 'laravel', 'beginer'),
  (14, 204, 'oracle', 'mideator'),
  (15, 205, 'php', 'mideator'),
  (16, 205, 'mysql', 'mideator'),
  (17, 205, 'laravel', 'beginer'),
  (18, 205, 'oracle', 'mideator'),
  (19, 206, 'php', 'mideator'),
  (20, 206, 'mysql', 'mideator'),
  (21, 206, 'laravel', 'beginer'),
  (22, 206, 'oracle', 'mideator'),
  (23, 207, 'php', 'mideator'),
  (24, 207, 'mysql', 'mideator'),
  (25, 207, 'laravel', 'beginer'),
  (26, 207, 'oracle', 'mideator'),
  (27, 209, 'php', 'mideator'),
  (28, 209, 'mysql', 'mideator'),
  (29, 209, 'laravel', 'beginer'),
  (30, 209, 'oracle', 'mideator'),
  (31, 210, 'php', 'mideator'),
  (32, 210, 'mysql', 'mideator'),
  (33, 210, 'laravel', 'beginer'),
  (34, 210, 'oracle', 'mideator'),
  (35, 211, 'php', 'beginer'),
  (36, 211, 'mysql', 'beginer'),
  (37, 211, 'laravel', 'beginer'),
  (38, 211, 'oracle', 'beginer'),
  (39, 215, 'mysql', 'beginer'),
  (40, 215, 'mysql', 'beginer'),
  (41, 216, 'php', 'beginer'),
  (42, 216, 'mysql', 'mideator'),
  (43, 217, 'php', 'mideator'),
  (44, 217, 'mysql', 'expert'),
  (45, 226, 'php', 'mideator'),
  (46, 226, 'mysql', 'expert'),
  (47, 227, 'php', 'mideator'),
  (48, 227, 'mysql', 'expert'),
  (49, 228, 'php', 'beginer'),
  (50, 228, 'mysql', 'beginer'),
  (51, 229, 'php', 'beginer'),
  (52, 229, 'mysql', 'beginer'),
  (53, 241, 'php', 'beginer'),
  (54, 241, 'mysql', 'mideator'),
  (55, 242, 'php', 'beginer'),
  (56, 242, 'mysql', 'mideator'),
  (57, 243, 'php', 'beginer'),
  (58, 243, 'mysql', 'mideator'),
  (59, 244, 'php', 'beginer'),
  (60, 244, 'mysql', 'mideator'),
  (61, 249, 'php', 'mideator'),
  (62, 249, 'mysql', 'mideator'),
  (63, 252, 'php', 'mideator'),
  (64, 252, 'mysql', 'mideator');

/*!40000 ALTER TABLE `technologies` ENABLE KEYS */;

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