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
-- Table structure for table `reference_contacts`
--
DROP TABLE IF EXISTS `reference_contacts`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `reference_contacts` (
    `id` int NOT NULL AUTO_INCREMENT,
    `candidate_id` int DEFAULT NULL,
    `contact_name` varchar(255) DEFAULT NULL,
    `contact_number` varchar(255) DEFAULT NULL,
    `contact_relation` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `candidate_id` (`candidate_id`),
    CONSTRAINT `reference_contacts_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `basic_details` (`candidate_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 209 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_contacts`
--
LOCK TABLES `reference_contacts` WRITE;

/*!40000 ALTER TABLE `reference_contacts` DISABLE KEYS */;

INSERT INTO
  `reference_contacts`
VALUES
  (1, 108, 'Parasiddh', '9909579072', 'Brother'),
  (2, 108, 'Harsh', '7405805322', 'Brother'),
  (3, 109, 'Parasiddh', '9909579072', 'Brother'),
  (4, 109, 'Harsh', '7405805322', 'Brother'),
  (5, 110, 'Parasiddh', '9909579072', 'Brother'),
  (6, 110, 'Harsh', '7405805322', 'Brother'),
  (7, 115, 'Parasiddh', '9909579072', 'Brother'),
  (8, 115, 'Harsh', '7405805322', 'Brother'),
  (9, 121, 'Parasiddh', '9909579072', 'Brother'),
  (10, 121, 'Harsh', '7405805322', 'Brother'),
  (11, 122, 'Parasiddh', '9909579072', 'Brother'),
  (12, 122, 'Harsh', '7405805322', 'Brother'),
  (13, 123, 'Parasiddh', '9909579072', 'Brother'),
  (14, 123, 'Harsh', '7405805322', 'Brother'),
  (15, 124, 'Parasiddh', '9909579072', 'Brother'),
  (16, 124, 'Harsh', '7405805322', 'Brother'),
  (17, 125, 'Parasiddh', '9909579072', 'Brother'),
  (18, 125, 'Harsh', '7405805322', 'Brother'),
  (19, 126, 'Parasiddh', '9909579072', 'Brother'),
  (20, 126, 'Harsh', '7405805322', 'Brother'),
  (21, 127, 'Parasiddh', '9909579072', 'Brother'),
  (22, 127, 'Harsh', '7405805322', 'Brother'),
  (23, 128, '7405805322', '9909579072', 'Brother'),
  (24, 128, '', '', ''),
  (25, 129, '7405805322', '9909579072', 'Brother'),
  (26, 129, '', '', ''),
  (27, 130, '7405805322', '9909579072', 'Brother'),
  (28, 130, '', '', ''),
  (29, 131, '7405805322', '9909579072', 'Brother'),
  (30, 131, '', '', ''),
  (31, 132, '7405805322', '9909579072', 'Brother'),
  (32, 132, '', '', ''),
  (33, 133, '7405805322', '9909579072', 'Brother'),
  (34, 133, '', '', ''),
  (35, 134, '7405805322', '9909579072', 'Brother'),
  (36, 134, '', '', ''),
  (37, 135, '7405805322', '9909579072', 'Brother'),
  (38, 135, '', '', ''),
  (39, 136, '7405805322', '9909579072', 'Brother'),
  (40, 136, '', '', ''),
  (41, 137, '7405805322', '9909579072', 'Brother'),
  (42, 137, '', '', ''),
  (43, 138, '7405805322', '9909579072', 'Brother'),
  (44, 138, '', '', ''),
  (45, 139, '7405805322', '9909579072', 'Brother'),
  (46, 139, '', '', ''),
  (47, 140, '7405805322', '9909579072', 'Brother'),
  (48, 140, '', '', ''),
  (49, 141, '7405805322', '9909579072', 'Brother'),
  (50, 141, '', '', ''),
  (51, 142, '7405805322', '9909579072', 'Brother'),
  (52, 142, '', '', ''),
  (53, 143, '7405805322', '9909579072', 'Brother'),
  (54, 143, '', '', ''),
  (55, 144, '7405805322', '9909579072', 'Brother'),
  (56, 144, '', '', ''),
  (57, 145, '7405805322', '9909579072', 'Brother'),
  (58, 145, '', '', ''),
  (59, 146, '7405805322', '9909579072', 'Brother'),
  (60, 146, '', '', ''),
  (61, 147, '7405805322', '9909579072', 'Brother'),
  (62, 147, '', '', ''),
  (63, 148, '7405805322', '9909579072', 'Brother'),
  (64, 148, '', '', ''),
  (65, 149, '7405805322', '9909579072', 'Brother'),
  (66, 149, '', '', ''),
  (67, 150, '7405805322', '9909579072', 'Brother'),
  (68, 150, '', '', ''),
  (69, 151, '7405805322', '9909579072', 'Brother'),
  (70, 151, '', '', ''),
  (71, 152, '7405805322', '9909579072', 'Brother'),
  (72, 152, '', '', ''),
  (73, 153, '7405805322', '9909579072', 'Brother'),
  (74, 153, '', '', ''),
  (75, 154, '7405805322', '9909579072', 'Brother'),
  (76, 154, '', '', ''),
  (77, 155, '7405805322', '9909579072', 'Brother'),
  (78, 155, '', '', ''),
  (79, 156, '7405805322', '9909579072', 'Brother'),
  (80, 156, '', '', ''),
  (81, 157, '7405805322', '9909579072', 'Brother'),
  (82, 157, '', '', ''),
  (83, 158, '7405805322', '9909579072', 'Brother'),
  (84, 158, '', '', ''),
  (85, 159, '7405805322', '9909579072', 'Brother'),
  (86, 159, '', '', ''),
  (87, 160, 'Parasiddh', '9909579072', 'Brother'),
  (88, 160, '', '9909579072', ''),
  (89, 161, 'Parasiddh', '9909579072', 'Brother'),
  (90, 161, '', '9909579072', ''),
  (91, 162, 'Parasiddh', '9909579072', 'Brother'),
  (92, 162, '', '9909579072', ''),
  (93, 163, 'Parasiddh', '9909579072', 'Brother'),
  (94, 163, 'Harsh', '7405805322', 'Brother'),
  (95, 164, 'Parasiddh', '9909579072', 'Brother'),
  (96, 164, 'Harsh', '7405805322', 'Brother'),
  (97, 165, 'Parasiddh', '9909579072', 'Brother'),
  (98, 165, 'Harsh', '7405805322', 'Brother'),
  (99, 166, 'Parasiddh', '9909579072', 'Brother'),
  (100, 166, 'Harsh', '7405805322', 'Brother'),
  (101, 167, 'Parasiddh', '9909579072', 'Brother'),
  (102, 167, 'Harsh', '7405805322', 'Brother'),
  (103, 168, 'Parasiddh', '9909579072', 'Brother'),
  (104, 168, 'Harsh', '7405805322', 'Brother'),
  (105, 169, 'Parasiddh', '9909579072', 'Brother'),
  (106, 169, 'Harsh', '7405805322', 'Brother'),
  (107, 170, 'Parasiddh', '9909579072', 'Brother'),
  (108, 170, 'Harsh', '7405805322', 'Brother'),
  (109, 171, '', '', ''),
  (110, 171, '', '', ''),
  (111, 172, '', '', ''),
  (112, 172, '', '', ''),
  (113, 173, 'Parasiddh', '7405805322', 'Brother'),
  (114, 173, '', '', ''),
  (115, 174, '', '', ''),
  (116, 174, '', '', ''),
  (117, 175, 'Parasiddh', '9909579072', 'Brother'),
  (118, 175, 'Harsh', '7405805322', 'Brother'),
  (119, 176, 'Parasiddh', '9909579072', 'Brother'),
  (120, 176, 'Harsh', '7405805322', 'Brother'),
  (121, 187, '', '', ''),
  (122, 187, '', '', ''),
  (123, 206, 'Parasiddh', '9909579072', 'Brother'),
  (124, 207, 'Parasiddh', '9909579072', 'Brother'),
  (125, 209, 'Parasiddh', '9909579072', 'Brother'),
  (126, 209, 'Harsh', '7405805322', 'Brother'),
  (127, 210, 'Parasiddh', '9909579072', 'Brother'),
  (128, 210, 'Harsh', '7405805322', 'Brother'),
  (129, 211, 'Parasiddh', '9909579072', 'Brother'),
  (
    130,
    211,
    'Harsh',
    '7405805322',
    'Brother from Another mother'
  ),
  (131, 212, '', '', ''),
  (132, 212, '', '', ''),
  (133, 213, 'Brother', '9909579072', 'Brother'),
  (134, 213, '', '', ''),
  (135, 214, '', '', ''),
  (136, 214, '', '', ''),
  (137, 215, 'Parasiddh', '9909579072', 'Brother'),
  (138, 215, '', '', ''),
  (139, 216, 'Parasiddh', '9909579072', 'Brother'),
  (140, 216, '', '', ''),
  (141, 217, 'Parasiddh', '9909579072', 'Brother'),
  (142, 217, '', '', ''),
  (143, 218, 'Parasiddh', '9909579072', 'Parasiddh'),
  (144, 218, '', '', ''),
  (145, 219, 'Parasiddh', '9909579072', 'Parasiddh'),
  (146, 219, '', '', ''),
  (147, 220, '', '', ''),
  (148, 220, '', '', ''),
  (149, 221, 'Parasiddh', '9909579072', 'Parasiddh'),
  (150, 221, '', '', ''),
  (151, 222, 'Parasiddh', '9909579072', 'Parasiddh'),
  (152, 222, '', '', ''),
  (153, 223, 'Parasiddh', '9909579072', 'Parasiddh'),
  (154, 223, '', '', ''),
  (155, 224, 'Parasiddh', '9909579072', 'Parasiddh'),
  (156, 224, '', '', ''),
  (157, 226, 'Parasiddh', '9909579072', 'Brother'),
  (158, 226, '', '', ''),
  (159, 227, 'Parasiddh', '9909579072', 'Brother'),
  (160, 227, '', '', ''),
  (
    161,
    228,
    'Parasiddh',
    '9909579072',
    'Friends brother'
  ),
  (162, 228, '', '', ''),
  (
    163,
    229,
    'Parasiddh',
    '9909579072',
    'Friends brother'
  ),
  (164, 229, '', '', ''),
  (165, 230, '', '', ''),
  (166, 230, '', '', ''),
  (167, 231, '', '', ''),
  (168, 231, '', '', ''),
  (169, 232, '', '', ''),
  (170, 232, '', '', ''),
  (171, 233, 'Parasiddh', '9909579072', 'Brother'),
  (172, 233, '', '', ''),
  (173, 234, 'Parasiddh', '9909579072', 'Brother'),
  (174, 234, '', '', ''),
  (175, 235, 'Parasiddh', '9909579072', 'Brother'),
  (176, 235, '', '', ''),
  (177, 236, '', '', ''),
  (178, 236, '', '', ''),
  (179, 237, '', '', ''),
  (180, 237, '', '', ''),
  (181, 239, '', '', ''),
  (182, 239, '', '', ''),
  (183, 240, '', '', ''),
  (184, 240, '', '', ''),
  (185, 241, 'Parasiddh', '9909579072', 'Brother'),
  (186, 241, '', '', ''),
  (187, 242, 'Parasiddh', '9909579072', 'Brother'),
  (188, 242, '', '', ''),
  (189, 243, 'Parasiddh', '9909579072', 'Brother'),
  (190, 243, '', '', ''),
  (191, 244, 'Parasiddh', '9909579072', 'Brother'),
  (192, 244, '', '', ''),
  (193, 245, 'Parasiddh', '9909579072', 'Brother'),
  (194, 245, '', '', ''),
  (195, 246, '', '', ''),
  (196, 246, '', '', ''),
  (197, 247, 'Harsh', '7405805322', 'Brother'),
  (198, 247, '', '', ''),
  (199, 248, '', '', ''),
  (200, 248, '', '', ''),
  (201, 249, 'Parasiddh', '9909579072', 'Brother'),
  (
    202,
    249,
    'Harsh',
    '7405805322',
    'Brother from Another mother'
  ),
  (203, 250, '', '', ''),
  (204, 250, '', '', ''),
  (205, 251, '', '', ''),
  (206, 251, '', '', ''),
  (207, 252, 'Parasiddh', '9909579072', 'Brother'),
  (208, 252, '', '', '');

/*!40000 ALTER TABLE `reference_contacts` ENABLE KEYS */;

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