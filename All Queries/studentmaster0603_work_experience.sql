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
-- Table structure for table `work_experience`
--
DROP TABLE IF EXISTS `work_experience`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `work_experience` (
    `id` int NOT NULL AUTO_INCREMENT,
    `candidate_id` int DEFAULT NULL,
    `company_name` varchar(255) DEFAULT NULL,
    `designation` varchar(255) DEFAULT NULL,
    `from_date` varchar(255) DEFAULT NULL,
    `to_date` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `candidate_id` (`candidate_id`),
    CONSTRAINT `work_experience_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `basic_details` (`candidate_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 638 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_experience`
--
LOCK TABLES `work_experience` WRITE;

/*!40000 ALTER TABLE `work_experience` DISABLE KEYS */;

INSERT INTO
  `work_experience`
VALUES
  (
    1,
    3,
    'EsparkBiz',
    'software engineering',
    '2024',
    '2029'
  ),
  (2, 3, '', '', '', ''),
  (3, 3, '', '', '', ''),
  (
    4,
    4,
    'EsparkBiz',
    'software engineering',
    '2024',
    '2029'
  ),
  (5, 4, '', '', '', ''),
  (6, 4, '', '', '', ''),
  (
    7,
    5,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (8, 5, 'xyz', 'xyz', '2029', '2030'),
  (9, 5, 'xyz', 'xyz', '2030', '2035'),
  (
    10,
    6,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (11, 6, 'xyz', 'xyz', '2029', '2030'),
  (12, 6, 'xyz', 'xyz', '2030', '2035'),
  (
    13,
    7,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (14, 7, 'xyz', 'xyz', '2029', '2030'),
  (15, 7, 'xyz', 'xyz', '2030', '2035'),
  (
    16,
    8,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (17, 8, 'xyz', 'xyz', '2029', '2030'),
  (18, 8, 'xyz', 'xyz', '2030', '2035'),
  (
    19,
    9,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (20, 9, 'xyz', 'xyz', '2029', '2030'),
  (21, 9, 'xyz', 'xyz', '2030', '2035'),
  (
    22,
    10,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (23, 10, 'xyz', 'xyz', '2029', '2030'),
  (24, 10, 'xyz', 'xyz', '2030', '2035'),
  (
    25,
    11,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (26, 11, 'xyz', 'xyz', '2029', '2030'),
  (27, 11, 'xyz', 'xyz', '2030', '2035'),
  (
    28,
    12,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (29, 12, 'xyz', 'xyz', '2029', '2030'),
  (30, 12, 'xyz', 'xyz', '2030', '2035'),
  (
    31,
    13,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (32, 13, 'xyz', 'xyz', '2029', '2030'),
  (33, 13, 'xyz', 'xyz', '2030', '2035'),
  (
    34,
    14,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (35, 14, 'xyz', 'xyz', '2029', '2030'),
  (36, 14, 'xyz', 'xyz', '2030', '2035'),
  (
    37,
    15,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (38, 15, 'xyz', 'xyz', '2029', '2030'),
  (39, 15, 'xyz', 'xyz', '2030', '2035'),
  (
    40,
    16,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (41, 16, 'xyz', 'xyz', '2029', '2030'),
  (42, 16, 'xyz', 'xyz', '2030', '2035'),
  (43, 17, '', '', '', ''),
  (44, 17, '', '', '', ''),
  (45, 17, '', '', '', ''),
  (46, 18, '', '', '', ''),
  (47, 18, '', '', '', ''),
  (48, 18, '', '', '', ''),
  (49, 19, '', '', '', ''),
  (50, 19, '', '', '', ''),
  (51, 19, '', '', '', ''),
  (52, 20, '', '', '', ''),
  (53, 20, '', '', '', ''),
  (54, 20, '', '', '', ''),
  (55, 21, '', '', '', ''),
  (56, 21, '', '', '', ''),
  (57, 21, '', '', '', ''),
  (58, 22, '', '', '', ''),
  (59, 22, '', '', '', ''),
  (60, 22, '', '', '', ''),
  (61, 23, '', '', '', ''),
  (62, 23, '', '', '', ''),
  (63, 23, '', '', '', ''),
  (64, 24, '', '', '', ''),
  (65, 24, '', '', '', ''),
  (66, 24, '', '', '', ''),
  (67, 25, '', '', '', ''),
  (68, 25, '', '', '', ''),
  (69, 25, '', '', '', ''),
  (70, 26, '', '', '', ''),
  (71, 26, '', '', '', ''),
  (72, 26, '', '', '', ''),
  (73, 27, '', '', '', ''),
  (74, 27, '', '', '', ''),
  (75, 27, '', '', '', ''),
  (76, 28, 'EsparkBiz', '', '20-01-2024', '2029'),
  (77, 28, '', '', '', ''),
  (78, 28, '', '', '', ''),
  (79, 29, 'EsparkBiz', '', '20-01-2024', '2029'),
  (80, 29, '', '', '', ''),
  (81, 29, '', '', '', ''),
  (82, 30, 'EsparkBiz', '', '20-01-2024', '2029'),
  (83, 30, '', '', '', ''),
  (84, 30, '', '', '', ''),
  (85, 31, 'EsparkBiz', '', '20-01-2024', '2029'),
  (86, 31, '', '', '', ''),
  (87, 31, '', '', '', ''),
  (88, 32, 'EsparkBiz', '', '20-01-2024', '2029'),
  (89, 32, '', '', '', ''),
  (90, 32, '', '', '', ''),
  (91, 33, 'EsparkBiz', '', '20-01-2024', '2029'),
  (92, 33, '', '', '', ''),
  (93, 33, '', '', '', ''),
  (94, 34, 'EsparkBiz', '', '20-01-2024', '2029'),
  (95, 34, '', '', '', ''),
  (96, 34, '', '', '', ''),
  (97, 35, 'EsparkBiz', '', '20-01-2024', '2029'),
  (98, 35, '', '', '', ''),
  (99, 35, '', '', '', ''),
  (100, 36, '', '', '20-01-2024', '2029'),
  (101, 36, '', '', '', ''),
  (102, 36, '', '', '', ''),
  (103, 37, '', '', '20-01-2024', '2029'),
  (104, 37, '', '', '', ''),
  (105, 37, '', '', '', ''),
  (106, 38, '', '', '20-01-2024', '2029'),
  (107, 38, '', '', '', ''),
  (108, 38, '', '', '', ''),
  (109, 39, '', '', '20-01-2024', '2029'),
  (110, 39, '', '', '', ''),
  (111, 39, '', '', '', ''),
  (112, 40, '', '', '20-01-2024', '2029'),
  (113, 40, '', '', '', ''),
  (114, 40, '', '', '', ''),
  (115, 41, '', '', '20-01-2024', '2029'),
  (116, 41, '', '', '', ''),
  (117, 41, '', '', '', ''),
  (118, 42, '', '', '20-01-2024', '2029'),
  (119, 42, '', '', '', ''),
  (120, 42, '', '', '', ''),
  (
    121,
    43,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (122, 43, '', '', '', ''),
  (123, 43, '', '', '', ''),
  (
    124,
    44,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (125, 44, '', '', '', ''),
  (126, 44, '', '', '', ''),
  (
    127,
    45,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (128, 45, '', '', '', ''),
  (129, 45, '', '', '', ''),
  (
    130,
    46,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (131, 46, '', '', '', ''),
  (132, 46, '', '', '', ''),
  (
    133,
    47,
    '8.8',
    '',
    'EsparkBiz',
    'software engineering'
  ),
  (134, 47, '20-01-2024', '2029', '', ''),
  (135, 47, '', '', '', ''),
  (
    136,
    48,
    '8.8',
    '',
    'EsparkBiz',
    'software engineering'
  ),
  (137, 48, '20-01-2024', '2029', '', ''),
  (138, 48, '', '', '', ''),
  (
    139,
    49,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (140, 49, '', '', '', ''),
  (141, 49, '', '', '', ''),
  (
    142,
    50,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (143, 50, '', '', '', ''),
  (144, 50, '', '', '', ''),
  (
    145,
    51,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (146, 51, '', '', '', ''),
  (147, 51, '', '', '', ''),
  (
    148,
    52,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (149, 52, '', '', '', ''),
  (150, 52, '', '', '', ''),
  (
    151,
    53,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (152, 53, '', '', '', ''),
  (153, 53, '', '', '', ''),
  (
    154,
    54,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (155, 54, '', '', '', ''),
  (156, 54, '', '', '', ''),
  (
    157,
    55,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (158, 55, '', '', '', ''),
  (159, 55, '', '', '', ''),
  (
    160,
    56,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (161, 56, '', '', '', ''),
  (162, 56, '', '', '', ''),
  (
    163,
    57,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (164, 57, '', '', '', ''),
  (165, 57, '', '', '', ''),
  (
    166,
    58,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (167, 58, '', '', '', ''),
  (168, 58, '', '', '', ''),
  (
    169,
    59,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (170, 59, '', '', '', ''),
  (171, 59, '', '', '', ''),
  (
    172,
    60,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (173, 60, '', '', '', ''),
  (174, 60, '', '', '', ''),
  (
    175,
    61,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (176, 61, '', '', '', ''),
  (177, 61, '', '', '', ''),
  (
    178,
    62,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (179, 62, '', '', '', ''),
  (180, 62, '', '', '', ''),
  (
    181,
    63,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (182, 63, '', '', '', ''),
  (183, 63, '', '', '', ''),
  (
    184,
    64,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (185, 64, '', '', '', ''),
  (186, 64, '', '', '', ''),
  (
    187,
    65,
    '',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (188, 65, '', '', '', ''),
  (189, 65, '', '', '', ''),
  (
    190,
    66,
    '',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (191, 66, '', '', '', ''),
  (192, 66, '', '', '', ''),
  (
    193,
    67,
    '',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (194, 67, '', '', '', ''),
  (195, 67, '', '', '', ''),
  (
    196,
    68,
    '',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (197, 68, '', '', '', ''),
  (198, 68, '', '', '', ''),
  (
    199,
    69,
    '',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (200, 69, '', '', '', ''),
  (201, 69, '', '', '', ''),
  (
    202,
    70,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (203, 70, '', '', '', ''),
  (204, 70, '', '', '', ''),
  (
    205,
    71,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (206, 71, '', '', '', ''),
  (207, 71, '', '', '', ''),
  (
    208,
    72,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (209, 72, '', '', '', ''),
  (210, 72, '', '', '', ''),
  (
    211,
    73,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (212, 73, '', '', '', ''),
  (213, 73, '', '', '', ''),
  (
    214,
    74,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (215, 74, '', '', '', ''),
  (216, 74, '', '', '', ''),
  (
    217,
    75,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (218, 75, '', '', '', ''),
  (219, 75, '', '', '', ''),
  (
    220,
    76,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (221, 76, '', '', '', ''),
  (222, 76, '', '', '', ''),
  (
    223,
    77,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (224, 77, '', '', '', ''),
  (225, 77, '', '', '', ''),
  (
    226,
    78,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (227, 78, '', '', '', ''),
  (228, 78, '', '', '', ''),
  (
    229,
    79,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (230, 79, '', '', '', ''),
  (231, 79, '', '', '', ''),
  (
    232,
    80,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (233, 80, '', '', '', ''),
  (234, 80, '', '', '', ''),
  (
    235,
    81,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (236, 81, '', '', '', ''),
  (237, 81, '', '', '', ''),
  (
    238,
    82,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (239, 82, '', '', '', ''),
  (240, 82, '', '', '', ''),
  (
    241,
    83,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (242, 83, '', '', '', ''),
  (243, 83, '', '', '', ''),
  (
    244,
    93,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (245, 93, '', '', '', ''),
  (246, 93, '', '', '', ''),
  (
    247,
    94,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (248, 94, 'No experience', '', '', ''),
  (249, 94, 'No experience', '', '', ''),
  (
    250,
    95,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (251, 95, 'No experience', '', '', ''),
  (252, 95, 'No experience', '', '', ''),
  (
    253,
    96,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (254, 96, 'No experience', '', '', ''),
  (255, 96, 'No experience', '', '', ''),
  (
    256,
    97,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (257, 97, 'No experience', '', '', ''),
  (258, 97, 'No experience', '', '', ''),
  (
    259,
    98,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (260, 98, 'No experience', '', '', ''),
  (261, 98, 'No experience', '', '', ''),
  (
    262,
    99,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (263, 99, 'No experience', '', '', ''),
  (264, 99, 'No experience', '', '', ''),
  (
    265,
    100,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (266, 100, 'No experience', '', '', ''),
  (267, 100, 'No experience', '', '', ''),
  (
    268,
    101,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (269, 101, 'No experience', '', '', ''),
  (270, 101, 'No experience', '', '', ''),
  (
    271,
    102,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (272, 102, 'No experience', '', '', ''),
  (273, 102, 'No experience', '', '', ''),
  (
    274,
    103,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (275, 103, 'No experience', '', '', ''),
  (276, 103, 'No experience', '', '', ''),
  (
    277,
    104,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (278, 104, 'No experience', '', '', ''),
  (279, 104, 'No experience', '', '', ''),
  (
    280,
    105,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (281, 105, 'No experience', '', '', ''),
  (282, 105, 'No experience', '', '', ''),
  (
    283,
    106,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (284, 106, 'No experience', '', '', ''),
  (285, 106, 'No experience', '', '', ''),
  (
    286,
    107,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (287, 107, 'No experience', '', '', ''),
  (288, 107, 'No experience', '', '', ''),
  (
    289,
    108,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (290, 108, 'No experience', '', '', ''),
  (291, 108, 'No experience', '', '', ''),
  (
    292,
    109,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (293, 109, 'No experience', '', '', ''),
  (294, 109, 'No experience', '', '', ''),
  (
    295,
    110,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    296,
    110,
    'xyz',
    'software engineering',
    '2029',
    '2035'
  ),
  (297, 110, 'No experience', '', '', ''),
  (298, 111, 'E', 's', '2', '2'),
  (299, 111, 's', 'o', '0', '0'),
  (300, 111, 'p', 'f', '-', '2'),
  (301, 112, 'E', 's', '2', '2'),
  (302, 112, 's', 'o', '0', '0'),
  (303, 112, 'p', 'f', '-', '2'),
  (304, 113, 'E', 's', '2', '2'),
  (305, 113, 's', 'o', '0', '0'),
  (306, 113, 'p', 'f', '-', '2'),
  (307, 114, 'E', 's', '2', '2'),
  (308, 114, 's', 'o', '0', '0'),
  (309, 114, 'p', 'f', '-', '2'),
  (310, 115, 'E', 's', '2', '2'),
  (311, 115, 's', 'o', '0', '0'),
  (312, 115, 'p', 'f', '-', '2'),
  (313, 116, 'E', 's', '2', '2'),
  (314, 116, 's', 'o', '0', '0'),
  (315, 116, 'p', 'f', '-', '2'),
  (316, 117, 'E', 's', '2', '2'),
  (317, 117, 's', 'o', '0', '0'),
  (318, 117, 'p', 'f', '-', '2'),
  (319, 118, 'E', 's', '2', '2'),
  (320, 118, 's', 'o', '0', '0'),
  (321, 118, 'p', 'f', '-', '2'),
  (322, 119, 'E', 's', '2', '2'),
  (323, 119, 's', 'o', '0', '0'),
  (324, 119, 'p', 'f', '-', '2'),
  (325, 120, 'E', 's', '2', '2'),
  (326, 120, 's', 'o', '0', '0'),
  (327, 120, 'p', 'f', '-', '2'),
  (328, 121, 'E', 's', '2', '2'),
  (329, 121, 's', 'o', '0', '0'),
  (330, 121, 'p', 'f', '-', '2'),
  (331, 122, 'E', 's', '2', '2'),
  (332, 122, 's', 'o', '0', '0'),
  (333, 122, 'p', 'f', '-', '2'),
  (334, 123, 'E', 's', '2', '2'),
  (335, 123, 's', 'o', '0', '0'),
  (336, 123, 'p', 'f', '-', '2'),
  (337, 124, 'E', 's', '2', '2'),
  (338, 124, 's', 'o', '0', '0'),
  (339, 124, 'p', 'f', '-', '2'),
  (340, 125, 'E', 's', '2', '2'),
  (341, 125, 's', 'o', '0', '0'),
  (342, 125, 'p', 'f', '-', '2'),
  (343, 126, 'E', 's', '2', '2'),
  (344, 126, 's', 'o', '0', '0'),
  (345, 126, 'p', 'f', '-', '2'),
  (346, 127, 'E', 's', '2', '2'),
  (347, 127, 's', 'o', '0', '0'),
  (348, 127, 'p', 'f', '-', '2'),
  (
    349,
    128,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    350,
    128,
    'No experience',
    'software engineering',
    '',
    ''
  ),
  (
    351,
    128,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    352,
    129,
    'No experience',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    353,
    129,
    'No experience',
    'software engineering',
    '',
    ''
  ),
  (
    354,
    129,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (355, 130, 'No experience', 's', '2', '2'),
  (356, 130, 'No experience', 'o', '0', '0'),
  (357, 130, 'No experience', 'f', '-', '2'),
  (358, 131, 'No experience', 's', '2', '2'),
  (359, 131, 'No experience', 'o', '0', '0'),
  (360, 131, 'No experience', 'f', '-', '2'),
  (361, 132, 'No experience', 's', '2', '2'),
  (362, 132, 'No experience', 'o', '0', '0'),
  (363, 132, 'No experience', 'f', '-', '2'),
  (364, 133, 'No experience', 's', '2', '2'),
  (365, 133, 'No experience', 'o', '0', '0'),
  (366, 133, 'No experience', 'f', '-', '2'),
  (367, 134, 'No experience', 's', '2', '2'),
  (368, 134, 'No experience', 'o', '0', '0'),
  (369, 134, 'No experience', 'f', '-', '2'),
  (370, 135, 'No experience', 's', '2', '2'),
  (371, 135, 'No experience', 'o', '0', '0'),
  (372, 135, 'No experience', 'f', '-', '2'),
  (373, 136, 'No experience', 's', '2', '2'),
  (374, 136, 'No experience', 'o', '0', '0'),
  (375, 136, 'No experience', 'f', '-', '2'),
  (376, 137, 'No experience', 's', '2', '2'),
  (377, 137, 'No experience', 'o', '0', '0'),
  (378, 137, 'No experience', 'f', '-', '2'),
  (379, 138, 'No experience', 's', '2', '2'),
  (380, 138, 'No experience', 'o', '0', '0'),
  (381, 138, 'No experience', 'f', '-', '2'),
  (382, 139, 'No experience', 's', '2', '2'),
  (383, 139, 'No experience', 'o', '0', '0'),
  (384, 139, 'No experience', 'f', '-', '2'),
  (385, 140, 'No experience', 's', '2', '2'),
  (386, 140, 'No experience', 'o', '0', '0'),
  (387, 140, 'No experience', 'f', '-', '2'),
  (388, 141, 'No experience', 's', '2', '2'),
  (389, 141, 'No experience', 'o', '0', '0'),
  (390, 141, 'No experience', 'f', '-', '2'),
  (391, 142, 'No experience', 's', '2', '2'),
  (392, 142, 'No experience', 'o', '0', '0'),
  (393, 142, 'No experience', 'f', '-', '2'),
  (394, 143, 'No experience', 's', '2', '2'),
  (395, 143, 'No experience', 'o', '0', '0'),
  (396, 143, 'No experience', 'f', '-', '2'),
  (397, 144, 'No experience', 's', '2', '2'),
  (398, 144, 'No experience', 'o', '0', '0'),
  (399, 144, 'No experience', 'f', '-', '2'),
  (400, 145, 'No experience', 's', '2', '2'),
  (401, 145, 'No experience', 'o', '0', '0'),
  (402, 145, 'No experience', 'f', '-', '2'),
  (403, 146, 'No experience', 's', '2', '2'),
  (404, 146, 'No experience', 'o', '0', '0'),
  (405, 146, 'No experience', 'f', '-', '2'),
  (406, 147, 'No experience', 's', '2', '2'),
  (407, 147, 'No experience', 'o', '0', '0'),
  (408, 147, 'No experience', 'f', '-', '2'),
  (
    409,
    148,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (410, 148, 'No experience', '', '', ''),
  (
    411,
    148,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    412,
    149,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    413,
    149,
    'EsparkBiz',
    'software engineering',
    '2020',
    '2029'
  ),
  (
    414,
    149,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    415,
    150,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    416,
    150,
    'EsparkBiz',
    'software engineering',
    '2020',
    '2029'
  ),
  (
    417,
    150,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (418, 151, 'E', 's', '2', '2'),
  (419, 151, 's', 'o', '0', '0'),
  (420, 151, 'p', 'f', '-', '2'),
  (421, 152, 'E', 's', '2', '2'),
  (422, 152, 's', 'o', '0', '0'),
  (423, 152, 'p', 'f', '-', '2'),
  (424, 153, 'E', 's', '2', '2'),
  (425, 153, 's', 'o', '0', '0'),
  (426, 153, 'p', 'f', '-', '2'),
  (427, 154, 'E', 's', '2', '2'),
  (428, 154, 's', 'o', '0', '0'),
  (429, 154, 'p', 'f', '-', '2'),
  (430, 155, 'E', 's', '2', '2'),
  (431, 155, 's', 'o', '0', '0'),
  (432, 155, 'p', 'f', '-', '2'),
  (433, 156, 'E', 's', '2', '2'),
  (434, 156, 's', 'o', '0', '0'),
  (435, 156, 'p', 'f', '-', '2'),
  (436, 157, 'E', 's', '2', '2'),
  (437, 157, 's', 'o', '0', '0'),
  (438, 157, 'p', 'f', '-', '2'),
  (439, 158, 'E', 's', '2', '2'),
  (440, 158, 's', 'o', '0', '0'),
  (441, 158, 'p', 'f', '-', '2'),
  (442, 159, 'E', 's', '2', '2'),
  (443, 159, 's', 'o', '0', '0'),
  (444, 159, 'p', 'f', '-', '2'),
  (445, 160, 'E', 's', '2', '2'),
  (446, 160, 's', 'o', '0', '0'),
  (447, 160, 'p', 'f', '-', '2'),
  (448, 161, 'E', 's', '2', '2'),
  (449, 161, 's', 'o', '0', '0'),
  (450, 161, 'p', 'f', '-', '2'),
  (451, 162, 'E', 's', '2', '2'),
  (452, 162, 's', 'o', '0', '0'),
  (453, 162, 'p', 'f', '-', '2'),
  (
    454,
    163,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    455,
    163,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    456,
    163,
    'EsparkBiz',
    'software engineering',
    '2029',
    '2035'
  ),
  (457, 164, 'E', 's', '2', '2'),
  (458, 164, 's', 'o', '0', '0'),
  (459, 164, 'p', 'f', '-', '2'),
  (460, 165, 'E', 's', '2', '2'),
  (461, 165, 's', 'o', '0', '0'),
  (462, 165, 'p', 'f', '-', '2'),
  (463, 166, 'E', 's', '2', '2'),
  (464, 166, 's', 'o', '0', '0'),
  (465, 166, 'p', 'f', '-', '2'),
  (466, 167, 'E', 's', '2', '2'),
  (467, 167, 's', 'o', '0', '0'),
  (468, 167, 'p', 'f', '-', '2'),
  (469, 168, 'E', 's', '2', '2'),
  (470, 168, 's', 'o', '0', '0'),
  (471, 168, 'p', 'f', '-', '2'),
  (472, 169, 'E', 's', '2', '2'),
  (473, 169, 's', 'o', '0', '0'),
  (474, 169, 'p', 'f', '-', '2'),
  (475, 170, 'E', 's', '2', '2'),
  (476, 170, 's', 'o', '0', '0'),
  (477, 170, 'p', 'f', '-', '2'),
  (
    478,
    171,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    479,
    171,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    480,
    171,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    481,
    172,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    482,
    172,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    483,
    172,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (484, 173, 'E', 's', '2', '2'),
  (485, 173, 's', 'o', '0', '0'),
  (486, 173, 'p', 'f', '-', '3'),
  (
    487,
    174,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    488,
    174,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    489,
    174,
    'No experience',
    'undefined',
    'undefined',
    'undefined'
  ),
  (
    490,
    175,
    'Esparkbiz',
    'sde',
    '21-01-2024',
    '2029'
  ),
  (
    491,
    175,
    'Esparkbiz',
    'sde',
    '21-01-2024',
    '2029'
  ),
  (
    492,
    175,
    'Esparkbiz',
    'sde',
    '21-01-2024',
    '2029'
  ),
  (
    493,
    176,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (494, 176, 'EsparkBiz', 'sde', '2029', '2035'),
  (495, 176, 'xyz', 'sde', '2029', '2035'),
  (
    496,
    185,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    497,
    186,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    498,
    187,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    499,
    188,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (500, 188, 'EsparkBiz', 'sde', '2029', '2035'),
  (
    501,
    189,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (502, 189, 'EsparkBiz', 'sde', '2029', '2035'),
  (
    503,
    192,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    504,
    193,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    505,
    194,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    506,
    195,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    507,
    196,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    508,
    197,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    509,
    198,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    510,
    199,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    511,
    200,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    512,
    201,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    513,
    202,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    514,
    203,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    515,
    204,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    516,
    205,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    517,
    206,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    518,
    207,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    519,
    209,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (520, 209, 'xyz', 'sde', '20-01-2024', '2035'),
  (
    521,
    210,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (
    522,
    211,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (523, 211, 'xyz', 'xyz', '2029', '2035'),
  (524, 211, 'xyz', 'sde', '2035', '2037'),
  (
    525,
    212,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2035'
  ),
  (
    526,
    213,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (527, 213, '', '', '', ''),
  (528, 213, '', '', '', ''),
  (
    529,
    214,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (530, 214, '', '', '', ''),
  (531, 214, '', '', '', ''),
  (
    532,
    215,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (533, 215, '', '', '', ''),
  (534, 215, '', '', '', ''),
  (
    535,
    216,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (536, 216, '', '', '', ''),
  (537, 216, '', '', '', ''),
  (
    538,
    217,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (539, 217, '', '', '', ''),
  (540, 217, '', '', '', ''),
  (
    541,
    218,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (542, 218, '', '', '', ''),
  (543, 218, '', '', '', ''),
  (
    544,
    219,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (545, 219, '', '', '', ''),
  (546, 219, '', '', '', ''),
  (547, 220, '', '', '', ''),
  (548, 220, '', '', '', ''),
  (549, 220, '', '', '', ''),
  (
    550,
    221,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (551, 221, '', '', '', ''),
  (552, 221, '', '', '', ''),
  (
    553,
    222,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (554, 222, '', '', '', ''),
  (555, 222, '', '', '', ''),
  (
    556,
    223,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (557, 223, '', '', '', ''),
  (558, 223, '', '', '', ''),
  (
    559,
    224,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (560, 224, '', '', '', ''),
  (561, 224, '', '', '', ''),
  (
    562,
    226,
    'EsparkBiz',
    'sde',
    '20-01-2024',
    '2029'
  ),
  (563, 226, '', '', '', ''),
  (564, 226, '', '', '', ''),
  (
    565,
    227,
    'EsparkBiz',
    'sde',
    '20-01-2024',
    '2029'
  ),
  (566, 227, '', '', '', ''),
  (567, 227, '', '', '', ''),
  (
    568,
    228,
    'xyz chimcals',
    'super manager',
    '20-01-2025',
    '2035'
  ),
  (569, 228, '', '', '', ''),
  (570, 228, '', '', '', ''),
  (
    571,
    229,
    'xyz chimcals',
    'super manager',
    '20-01-2025',
    '2035'
  ),
  (572, 229, '', '', '', ''),
  (573, 229, '', '', '', ''),
  (574, 230, '', '', '', ''),
  (575, 230, '', '', '', ''),
  (576, 230, '', '', '', ''),
  (577, 231, '', '', '', ''),
  (578, 231, '', '', '', ''),
  (579, 231, '', '', '', ''),
  (580, 232, '', '', '', ''),
  (581, 232, '', '', '', ''),
  (582, 232, '', '', '', ''),
  (
    583,
    233,
    'EsparkBiz',
    'sde',
    '20-01-2024',
    '2029'
  ),
  (584, 233, '', '', '', ''),
  (585, 233, '', '', '', ''),
  (
    586,
    234,
    'EsparkBiz',
    'sde',
    '20-01-2024',
    '2029'
  ),
  (587, 234, '', '', '', ''),
  (588, 234, '', '', '', ''),
  (
    589,
    235,
    'EsparkBiz',
    'sde',
    '20-01-2024',
    '2029'
  ),
  (590, 235, '', '', '', ''),
  (591, 235, '', '', '', ''),
  (592, 236, '', '', '', ''),
  (593, 236, '', '', '', ''),
  (594, 236, '', '', '', ''),
  (595, 237, '', '', '', ''),
  (596, 237, '', '', '', ''),
  (597, 237, '', '', '', ''),
  (598, 239, '', '', '', ''),
  (599, 239, '', '', '', ''),
  (600, 239, '', '', '', ''),
  (601, 240, '', '', '', ''),
  (602, 240, '', '', '', ''),
  (603, 240, '', '', '', ''),
  (
    604,
    241,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (605, 241, '', '', '', ''),
  (606, 241, '', '', '', ''),
  (
    607,
    242,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (608, 242, '', '', '', ''),
  (609, 242, '', '', '', ''),
  (
    610,
    243,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (611, 243, '', '', '', ''),
  (612, 243, '', '', '', ''),
  (
    613,
    244,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  ),
  (614, 244, '', '', '', ''),
  (615, 244, '', '', '', ''),
  (
    616,
    245,
    'EsparkBiz',
    'super manager',
    '20-01-2024',
    '2029'
  ),
  (617, 245, '', '', '', ''),
  (618, 245, '', '', '', ''),
  (619, 246, '', '', '', ''),
  (620, 246, '', '', '', ''),
  (621, 246, '', '', '', ''),
  (
    622,
    247,
    'EsparkBiz',
    'super manager',
    '20-01-2024',
    '2035'
  ),
  (623, 247, '', '', '', ''),
  (624, 247, '', '', '', ''),
  (625, 248, '', '', '', ''),
  (626, 248, '', '', '', ''),
  (627, 248, '', '', '', ''),
  (
    628,
    249,
    'EsparkBiz',
    'sde',
    '20-01-2024',
    '2029'
  ),
  (629, 249, 'xyz', ' manager', '2029', '2035'),
  (
    630,
    249,
    'xyz chimcals',
    'super manager',
    '2035',
    '2040'
  ),
  (631, 250, '', '', '', ''),
  (632, 250, '', '', '', ''),
  (633, 250, '', '', '', ''),
  (634, 251, '', '', '', ''),
  (635, 251, '', '', '', ''),
  (636, 251, '', '', '', ''),
  (
    637,
    252,
    'EsparkBiz',
    'software engineering',
    '20-01-2024',
    '2029'
  );

/*!40000 ALTER TABLE `work_experience` ENABLE KEYS */;

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