-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Task280202024
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
-- Table structure for table `StudentMaster`
--

DROP TABLE IF EXISTS `StudentMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentMaster` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Fees` int DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(10) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Semester` int DEFAULT NULL,
  `Date_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentMaster`
--

LOCK TABLES `StudentMaster` WRITE;
/*!40000 ALTER TABLE `StudentMaster` DISABLE KEYS */;
INSERT INTO `StudentMaster` VALUES (1,'Marinna','Payson','2013-06-16','Osaka','Cuba',31873,'Female','9568470578','sarette.thad@gmail.com',5,'2024-02-16 06:37:52'),(2,'Gabriellia','Georas','2007-07-30','Iloilo City','Lao People\"S Democratic Republic\"',99147,'Male','9304317831','vonny.kannry@gmail.com',1,'2024-02-16 06:37:52'),(3,'Larine','Sadowski','2008-09-18','Nanjing','Oman',29845,'Female','9705199313','collen.muriel@gmail.com',1,'2024-02-16 06:37:52'),(4,'Olwen','Tannie','2011-07-19','Adak','Belize',67080,'Female','9513044307','agnese.stilwell@gmail.com',5,'2024-02-16 06:37:52'),(5,'Ardenia','Valoniah','1995-09-07','Iqaluit','Gibraltar',78347,'Male','9555655908','atlanta.eachern@gmail.com',4,'2024-02-16 06:37:52'),(6,'Chloris','Adlare','2013-02-26','Nairobi','Antarctica',83614,'Male','9736221648','kassey.toffic@gmail.com',3,'2024-02-16 06:37:52'),(7,'Britte','Docilla','1991-07-28','Maputo','Korea, Democratic People\"S Republic of\"',18873,'Male','9456324683','oona.ariella@gmail.com',3,'2024-02-16 06:37:52'),(8,'Lila','Bearnard','1980-11-19','South Tarawa','Tonga',63881,'Male','9737522248','june.suanne@gmail.com',3,'2024-02-16 06:37:52'),(9,'Camile','Cosenza','2010-06-09','Bangalore','Svalbard and Jan Mayen',71422,'Female','9767180657','ursulina.nunci@gmail.com',5,'2024-02-16 06:37:52'),(10,'Candy','Abbot','1986-03-06','Austin','Wallis and Futuna',29579,'Female','9822728675','clo.carmena@gmail.com',2,'2024-02-16 06:37:52'),(11,'Steffane','Etom','2009-10-09','Bangkok','Japan',40686,'Male','9324152684','jan.susannah@gmail.com',2,'2024-02-16 06:37:52'),(12,'Sabina','Alice','1992-12-30','New Orleans','Belarus',95437,'Female','9556058416','kirbee.silvan@gmail.com',5,'2024-02-16 06:37:52'),(13,'Fayre','Kannry','2015-03-04','Semarang','Turkey',87646,'Female','9612388282','carlie.payson@gmail.com',3,'2024-02-16 06:37:52'),(14,'Frieda','Michella','1995-06-30','Harbin','Finland',29398,'Female','9774539995','vita.uird@gmail.com',3,'2024-02-16 06:37:52'),(15,'Bobinette','Sharl','1993-07-21','Lubumbashi','Saint Kitts and Nevis',44237,'Female','9745279525','jordan.pauly@gmail.com',6,'2024-02-16 06:37:52'),(16,'Arlina','Fax','1997-06-14','Faisalabad','Armenia',60349,'Female','9235978851','kathy.sophronia@gmail.com',6,'2024-02-16 06:37:52'),(17,'Aimil','Adore','2002-08-28','Zamboanga City','Singapore',20491,'Male','9686496438','sean.dannye@gmail.com',8,'2024-02-16 06:37:52'),(18,'Camile','Douglass','2015-05-06','Buenos Aires','Poland',44390,'Female','9779030338','marika.pierette@gmail.com',6,'2024-02-16 06:37:52'),(19,'Kaja','Burch','1996-05-07','Kathmandu','Trinidad and Tobago',54646,'Male','9460291164','asia.eliathas@gmail.com',6,'2024-02-16 06:37:52'),(20,'Philis','Lenny','2013-04-01','Jeddah','Niger',88969,'Male','9611557264','sharai.girardo@gmail.com',4,'2024-02-16 06:37:52'),(21,'Neila','Pyle','1990-10-22','Kaohsiung','Mexico',69007,'Male','9911962774','elise.nadia@gmail.com',1,'2024-02-16 06:37:52'),(22,'Mellicent','Nikaniki','2003-11-28','Francistown','Hong Kong',12394,'Female','9352020579','deane.zamora@gmail.com',2,'2024-02-16 06:37:52'),(23,'Florencia','Giule','1992-11-20','Naples','Kenya',73545,'Female','9327513130','dorthy.bevin@gmail.com',3,'2024-02-16 06:37:52'),(24,'Kirstin','Yuille','2007-10-13','Rabi Island','Mayotte',43355,'Male','9909386860','meghann.mccutcheon@gmail.com',7,'2024-02-16 06:37:52'),(25,'Gusella','Wyn','1988-02-20','Split (city)','Azerbaijan',31512,'Female','9729035501','sheree.guildroy@gmail.com',3,'2024-02-16 06:37:52'),(26,'Frieda','Daveta','1997-12-02','Kolkata','Greece',76943,'Female','9224974455','melisent.lewes@gmail.com',6,'2024-02-16 06:37:52'),(27,'Jessy','Damarra','1997-07-24','Kyoto','Costa Rica',60642,'Female','9723352056','karena.cleo@gmail.com',7,'2024-02-16 06:37:52'),(28,'Jenilee','Ephrem','1990-04-29','Multan','Sweden',38268,'Male','9528430880','iseabal.schroth@gmail.com',7,'2024-02-16 06:37:52'),(29,'Rivalee','Emmaline','2017-11-27','Kanpur','South Georgia and the South Sandwich Islands',22808,'Female','9840013624','kalina.goth@gmail.com',6,'2024-02-16 06:37:52'),(30,'Reeba','Macey','2015-03-07','Whitehorse','Mexico',56112,'Male','9795763380','britni.gualtiero@gmail.com',7,'2024-02-16 06:37:52'),(31,'Catrina','Verger','2003-03-12','Dakar','Tanzania, United Republic of',56467,'Female','9696724246','alleen.olin@gmail.com',2,'2024-02-16 06:37:52'),(32,'Lexine','Susannah','1991-05-01','Saint Petersburg','Ecuador',79702,'Female','9894540205','tiffie.leary@gmail.com',3,'2024-02-16 06:37:52'),(33,'Shirlee','My','1995-08-14','Charlottetown','Belize',55473,'Male','9906153385','camile.chinua@gmail.com',4,'2024-02-16 06:37:52'),(34,'Raina','Lattie','2013-04-14','Lobamba','Liberia',59638,'Female','9522699642','ann-marie.margarete@gmail.com',4,'2024-02-16 06:37:52'),(35,'Tobe','Sacken','1992-02-10','Iquique','San Marino',38973,'Male','9549780107','ruthe.sherfield@gmail.com',6,'2024-02-16 06:37:52'),(36,'Jordan','Telfer','2017-05-28','Milwaukee','Saint Lucia',55918,'Male','9277976126','clarice.bendick@gmail.com',2,'2024-02-16 06:37:52'),(37,'Misha','Goddard','2001-09-14','Pattaya','Cote D\"Ivoire\"',47004,'Female','9891334569','dorthy.ferrell@gmail.com',2,'2024-02-16 06:37:52'),(38,'Brana','Seagraves','1995-08-15','Cleveland','Jersey',30324,'Male','9325435689','althea.swanhildas@gmail.com',6,'2024-02-16 06:37:52'),(39,'Fayre','Grayce','1988-01-04','Zanzibar City','Chile',53862,'Male','9326173078','lita.erskine@gmail.com',5,'2024-02-16 06:37:52'),(40,'Winny','Ferrell','1997-06-02','Monterrey','Tonga',48650,'Female','9392058809','evaleen.seessel@gmail.com',3,'2024-02-16 06:37:52'),(41,'Paule','My','1992-03-19','Kuching','Slovakia',27396,'Male','9447346287','brynna.jillane@gmail.com',1,'2024-02-16 06:37:52'),(42,'Camile','Klemperer','2012-04-08','Split (city)','Germany',11290,'Male','9221705787','cristine.eldrid@gmail.com',4,'2024-02-16 06:37:52'),(43,'Clarice','Tayib','2013-06-25','Mersin','Kazakhstan',11565,'Male','9796475224','lexine.wilona@gmail.com',1,'2024-02-16 06:37:52'),(44,'Raf','Ortrude','1990-08-19','San Carlos de Bariloche','Serbia and Montenegro',78288,'Female','9651917609','wanda.pitt@gmail.com',8,'2024-02-16 06:37:52'),(45,'Annora','Hartnett','2009-05-16','St. John\'s','Antigua and Barbuda',77645,'Female','9892533148','valera.ricarda@gmail.com',1,'2024-02-16 06:37:52'),(46,'Ermengarde','Swigart','2004-06-11','Pago Pago','Solomon Islands',71576,'Male','9381405232','genovera.colyer@gmail.com',3,'2024-02-16 06:37:52'),(47,'Maye','O\'Neill','1985-10-28','Nukulaelae','Tanzania, United Republic of',95002,'Male','9689937900','monika.stacy@gmail.com',3,'2024-02-16 06:37:52'),(48,'Marnia','Shama','2015-01-17','Toronto','Tunisia',16695,'Male','9545984145','georgina.ellerey@gmail.com',8,'2024-02-16 06:37:52'),(49,'Chandra','Guildroy','2011-09-11','Juneau','Netherlands',51777,'Female','9365890369','hannis.drisko@gmail.com',8,'2024-02-16 06:37:52'),(50,'Addia','Brian','1986-05-15','Bogotá','Turkmenistan',58861,'Male','9551662727','lilith.carmena@gmail.com',2,'2024-02-16 06:37:52'),(51,'Vanessa','Leary','2009-01-02','Adak','Philippines',13180,'Male','9869372881','leia.havens@gmail.com',6,'2024-02-16 06:37:52'),(52,'Louella','Burnside','2009-06-07','Addis Ababa','Saint Helena',74373,'Female','9682585457','caressa.plato@gmail.com',4,'2024-02-16 06:37:52'),(53,'Ofilia','Trinetta','2002-10-30','Antananarivo','Senegal',21361,'Male','9407533474','alie.norvol@gmail.com',4,'2024-02-16 06:37:52'),(54,'Aigneis','Stevy','2011-09-01','Basra','Liechtenstein',10669,'Female','9336267240','elmira.bearnard@gmail.com',5,'2024-02-16 06:37:52'),(55,'Lusa','Melony','2005-09-18','Lahore','Senegal',80845,'Male','9499135347','sam.sinegold@gmail.com',5,'2024-02-16 06:37:52'),(56,'Ariela','Hilbert','2005-01-27','The Hague','Madagascar',47286,'Male','9638004043','augustine.stuart@gmail.com',4,'2024-02-16 06:37:52'),(57,'Nananne','Hartnett','1988-08-14','Lagos','Estonia',20082,'Female','9813134233','bettine.howlyn@gmail.com',7,'2024-02-16 06:37:52'),(58,'Jaime','Thunell','1995-11-02','Linz','Costa Rica',37872,'Female','9778823649','jemie.mott@gmail.com',7,'2024-02-16 06:37:52'),(59,'Etta','Sabella','1997-08-11','Strasbourg','French Southern Territories',21937,'Female','9755359421','kalina.mayeda@gmail.com',3,'2024-02-16 06:37:52'),(60,'Bibby','Colp','1987-01-13','Quebec City','Dominican Republic',51789,'Male','9350311253','viki.margret@gmail.com',2,'2024-02-16 06:37:52'),(61,'Dolli','Camden','1988-03-07','Kingston','Sweden',97755,'Female','9337270054','marti.fink@gmail.com',8,'2024-02-16 06:37:52'),(62,'Emma','Imelida','1994-09-30','Birkirkara','Italy',74765,'Male','9472240818','amalie.vernier@gmail.com',8,'2024-02-16 06:37:52'),(63,'Merle','Catie','1992-10-27','Los Angeles','Bhutan',40473,'Female','9268717727','marleah.pascia@gmail.com',5,'2024-02-16 06:37:52'),(64,'Janey','Yorick','1999-05-15','New York City','Tokelau',11498,'Female','9701806257','caryl.lay@gmail.com',3,'2024-02-16 06:37:52'),(65,'Jinny','Laurianne','1998-10-28','Split (city)','Grenada',12176,'Female','9765824163','fredericka.stacy@gmail.com',6,'2024-02-16 06:37:52'),(66,'Tonia','Dawkins','1997-01-28','St. George\'s','Iceland',72939,'Male','9389882254','mady.shaddock@gmail.com',7,'2024-02-16 06:37:52'),(67,'Latisha','Halsey','2010-01-18','Belfast','New Zealand',14763,'Female','9893691533','bernardine.kolnick@gmail.com',3,'2024-02-16 06:37:52'),(68,'Tybie','Iiette','1996-06-17','Nashville','Nepal',65323,'Female','9558854813','addia.ruvolo@gmail.com',7,'2024-02-16 06:37:52'),(69,'Cassondra','Karl','1981-02-22','New Orleans','Sweden',29852,'Male','9842306784','dode.melony@gmail.com',5,'2024-02-16 06:37:52'),(70,'Katuscha','Truc','1986-02-14','Bogor','Seychelles',77310,'Male','9393449362','elmira.sheedy@gmail.com',5,'2024-02-16 06:37:52'),(71,'Doro','Alisia','1980-12-25','Casablanca','Canada',78410,'Female','9830200250','kimmy.ball@gmail.com',7,'2024-02-16 06:37:52'),(72,'Raina','Barrus','2011-10-12','Kandy','Tajikistan',67752,'Female','9536634843','nessie.curren@gmail.com',2,'2024-02-16 06:37:52'),(73,'Blake','Howlyn','1983-09-28','Austin','Italy',57030,'Female','9535870373','leontine.brandice@gmail.com',7,'2024-02-16 06:37:52'),(74,'Adele','Pandolfi','1997-05-06','Nassau','Virgin Islands, U.S.',25805,'Female','9215525642','helsa.merna@gmail.com',5,'2024-02-16 06:37:52'),(75,'Sharlene','Wareing','1988-01-16','Punta Arenas','Angola',40801,'Male','9625013328','valli.kylander@gmail.com',7,'2024-02-16 06:37:52'),(76,'Elfreda','Pacorro','2010-11-23','Tegucigalpa','Mongolia',67683,'Female','9241493936','ronna.girardo@gmail.com',3,'2024-02-16 06:37:52'),(77,'Netty','Hurley','2016-05-17','Malabo','Liechtenstein',75713,'Female','9692308327','daune.euridice@gmail.com',1,'2024-02-16 06:37:52'),(78,'Debee','Greyson','2008-12-19','Melbourne','Jamaica',21063,'Male','9313485718','kimmy.arathorn@gmail.com',4,'2024-02-16 06:37:52'),(79,'Merle','Chaing','1994-08-28','Kraków','Yemen',79894,'Female','9255654001','dari.lasley@gmail.com',3,'2024-02-16 06:37:52'),(80,'Shandie','Fontana','1996-03-30','Hobart','Saint Pierre and Miquelon',71480,'Female','9366507933','catharine.zitvaa@gmail.com',1,'2024-02-16 06:37:52'),(81,'Lorenza','Jena','1994-10-08','Rio de Janeiro','Tokelau',65717,'Male','9578536527','averyl.hylan@gmail.com',7,'2024-02-16 06:37:52'),(82,'Allis','Chandler','1992-11-22','Valparaíso','Hong Kong',96568,'Male','9304302286','paulita.nunci@gmail.com',3,'2024-02-16 06:37:52'),(83,'Genevra','Hunfredo','1981-01-01','Bridgetown','India',57617,'Female','9302061099','ardeen.seagraves@gmail.com',7,'2024-02-16 06:37:52'),(84,'Constance','Gherardo','1991-08-20','Bogor','Israel',33438,'Female','9842933156','bettine.jess@gmail.com',1,'2024-02-16 06:37:52'),(85,'Brynna','Barbey','1980-09-10','Townsville','Ukraine',31823,'Female','9554028587','kirbee.silvan@gmail.com',4,'2024-02-16 06:37:52'),(86,'Zaria','Sikorski','2016-11-04','Kandahar','Cape Verde',45253,'Male','9421833099','norine.sidonius@gmail.com',6,'2024-02-16 06:37:52'),(87,'Kirbee','Johanna','1996-06-06','Wuhan','Saint Kitts and Nevis',60272,'Male','9376262863','melisent.jorgan@gmail.com',2,'2024-02-16 06:37:52'),(88,'Dode','August','2013-11-24','Nanning','Portugal',21471,'Female','9775269536','glenda.janene@gmail.com',1,'2024-02-16 06:37:52'),(89,'Jackie','Moseley','2001-09-08','Dunedin','United Arab Emirates',47513,'Female','9572620516','donnie.gale@gmail.com',1,'2024-02-16 06:37:52'),(90,'Amelia','Frodi','1998-09-06','Tbilisi','Dominican Republic',43523,'Female','9498541477','teddie.giule@gmail.com',8,'2024-02-16 06:37:52'),(91,'Deane','Yuille','1985-08-22','Ipoh','Bangladesh',44489,'Female','9328407785','maye.stilwell@gmail.com',7,'2024-02-16 06:37:52'),(92,'Edyth','Roumell','2005-05-09','Graz','Anguilla',95531,'Female','9557427817','violet.abram@gmail.com',8,'2024-02-16 06:37:52'),(93,'Madalyn','Craggie','2017-11-11','Charlotte Amalie','Belize',34334,'Female','9556102619','hannis.bashemeth@gmail.com',2,'2024-02-16 06:37:52'),(94,'Layla','Bethany','1987-04-19','Porto Velho','Ecuador',45805,'Female','9302526742','alia.mott@gmail.com',6,'2024-02-16 06:37:52'),(95,'Consuela','Azeria','2010-07-09','Nouméa','Gabon',98175,'Female','9676362893','lelah.tatianas@gmail.com',1,'2024-02-16 06:37:52'),(96,'Marcy','Travax','1999-05-10','Luanda','Palestinian Territory, Occupied',33052,'Male','9320932084','clementine.rocray@gmail.com',1,'2024-02-16 06:37:52'),(97,'Jacquetta','Mathilde','1981-10-13','Zapopan','Guam',45587,'Female','9347599125','louella.sheedy@gmail.com',1,'2024-02-16 06:37:52'),(98,'Glenda','Sheng','2008-06-27','Kinshasa','Mozambique',93646,'Male','9394729074','arabel.quinn@gmail.com',6,'2024-02-16 06:37:52'),(99,'Petronia','Zola','2009-11-01','Malabo','Korea, Democratic People\"S Republic of\"',67885,'Female','9621884075','jemie.mathilde@gmail.com',1,'2024-02-16 06:37:52'),(100,'Gusella','O\'Neill','1980-10-06','Porto Velho','Turks and Caicos Islands',29917,'Female','9771531099','jolyn.phi@gmail.com',4,'2024-02-16 06:37:52'),(101,'Ekaterina','Billye','2007-05-28','Liverpool','Lesotho',75813,'Female','9788903528','ekaterina.ellord@gmail.com',3,'2024-02-16 06:37:52'),(102,'Jinny','Rodmann','2002-05-15','Columbus','French Southern Territories',76322,'Female','9654014929','chandra.pandolfi@gmail.com',1,'2024-02-16 06:37:52'),(103,'Dolli','Wandie','1994-03-30','St. George\'s','Gabon',99884,'Male','9910522457','maisey.travax@gmail.com',6,'2024-02-16 06:37:52'),(104,'Mariele','Loleta','1998-07-29','Abuja','Antarctica',73140,'Female','9677923706','dale.soneson@gmail.com',2,'2024-02-16 06:37:52'),(105,'Sherrie','Greyson','1985-09-10','Roseau','South Georgia and the South Sandwich Islands',42389,'Male','9817638423','nanete.yate@gmail.com',1,'2024-02-16 06:37:52'),(106,'Lynnea','Kress','2007-02-22','Pattaya','Åland Islands',36465,'Male','9683086401','cindelyn.sallyann@gmail.com',1,'2024-02-16 06:37:52'),(107,'Cacilie','Mozelle','1997-02-18','Sukhumi','Belarus',74450,'Male','9417929515','madelle.ivens@gmail.com',3,'2024-02-16 06:37:52'),(108,'Livvyy','Jarib','1991-07-23','Bogotá','Malaysia',87980,'Male','9591893593','shirlee.mcclimans@gmail.com',8,'2024-02-16 06:37:52'),(109,'Elena','Colyer','1991-01-24','Hagåtña','Qatar',65197,'Male','9631406487','daune.liebermann@gmail.com',3,'2024-02-16 06:37:52'),(110,'Antonietta','Ferrell','2001-03-10','Albuquerque','Cyprus',65312,'Female','9455070036','luci.telfer@gmail.com',1,'2024-02-16 06:37:52'),(111,'Juliane','Codding','2016-12-11','Chongqing','Finland',92178,'Female','9514244847','lonnie.kunin@gmail.com',1,'2024-02-16 06:37:52'),(112,'Ingrid','Berne','2000-01-02','Melekeok','Cocos (Keeling) Islands',91659,'Male','9252008558','amii.ludewig@gmail.com',8,'2024-02-16 06:37:52'),(113,'Donetta','Pyle','2014-11-15','London','Western Sahara',82053,'Female','9720157617','edee.khorma@gmail.com',7,'2024-02-16 06:37:52'),(114,'Nita','Stephie','1993-08-13','Bandung','Lebanon',49777,'Male','9894158858','lolita.brodench@gmail.com',3,'2024-02-16 06:37:52'),(115,'Kristina','Nunci','1994-08-01','Chicago','Macedonia, The Former Yugoslav Republic of',72231,'Female','9568717474','stacey.brenn@gmail.com',6,'2024-02-16 06:37:52'),(116,'Florie','Jaylene','1998-07-11','Damascus','Grenada',25586,'Female','9666724854','gilda.daegal@gmail.com',8,'2024-02-16 06:37:52'),(117,'Georgina','Holbrook','1984-03-25','Khartoum','Pakistan',83774,'Male','9565016315','mary.pattin@gmail.com',8,'2024-02-16 06:37:52'),(118,'Joceline','Hertzfeld','2017-07-23','Leeds','Burkina Faso',55446,'Male','9616894637','vanessa.leonard@gmail.com',4,'2024-02-16 06:37:52'),(119,'Ileana','Tillford','1992-03-31','Guayaquil','Malta',39700,'Female','9340518238','karlee.riva@gmail.com',7,'2024-02-16 06:37:52'),(120,'Shirlee','Hanleigh','1996-09-10','Douglas','Jordan',88997,'Male','9554078456','mahalia.jacinda@gmail.com',7,'2024-02-16 06:37:52'),(121,'Lenna','Chrystel','1981-08-07','Dushanbe','Croatia',71860,'Male','9728308466','mignon.ade@gmail.com',6,'2024-02-16 06:37:52'),(122,'Estell','Zenas','2013-08-05','Tagbilaran','Malta',11918,'Male','9271658087','gerrie.regan@gmail.com',4,'2024-02-16 06:37:52'),(123,'Gloria','Dash','1981-01-31','Ottawa','Liechtenstein',19121,'Female','9439872729','benita.lunsford@gmail.com',3,'2024-02-16 06:37:52'),(124,'Hope','Nea','1983-12-09','Dammam','Mayotte',88207,'Male','9511431424','lacie.stacy@gmail.com',2,'2024-02-16 06:37:52'),(125,'Joeann','Edvard','1997-12-13','Udon Thani','French Southern Territories',63405,'Female','9748129848','heida.merna@gmail.com',7,'2024-02-16 06:37:52'),(126,'Liana','Tengdin','2007-05-18','San Francisco','Sri Lanka',35678,'Female','9302627983','adore.juan@gmail.com',1,'2024-02-16 06:37:52'),(127,'Sheelagh','Eiser','2002-03-07','Bangui','Turks and Caicos Islands',96049,'Female','9802625942','gloria.birdella@gmail.com',5,'2024-02-16 06:37:52'),(128,'Feliza','Leffen','2012-07-01','Kigali','Bahamas',93116,'Female','9475900970','hollie.sasnett@gmail.com',8,'2024-02-16 06:37:52'),(129,'Rochette','Lanita','2014-04-16','Ushuaia','Sweden',31117,'Female','9360399255','sybille.hachmin@gmail.com',6,'2024-02-16 06:37:52'),(130,'Quintina','Bonilla','1981-05-26','Sabha','Austria',20848,'Male','9891077522','kara-lynn.percy@gmail.com',2,'2024-02-16 06:37:52'),(131,'Dyann','Frodi','1987-05-20','Pontianak','Saint Kitts and Nevis',24308,'Male','9682441955','talya.catie@gmail.com',6,'2024-02-16 06:37:52'),(132,'Brietta','Leffen','2017-11-21','Tel Aviv','Bahamas',35001,'Female','9480448755','dominga.cath@gmail.com',7,'2024-02-16 06:37:52'),(133,'Ada','Kress','1983-01-05','Hangzhou','Chad',77295,'Male','9242901556','gwenneth.douglass@gmail.com',5,'2024-02-16 06:37:52'),(134,'Kylynn','Urania','1990-05-15','St. George\'s','Estonia',38799,'Female','9496891583','nelle.berne@gmail.com',2,'2024-02-16 06:37:52'),(135,'Nariko','Lay','2005-09-18','Perm','Kazakhstan',63074,'Male','9394486538','goldie.arley@gmail.com',4,'2024-02-16 06:37:52'),(136,'Marjie','Hamil','2001-09-27','Sofia','Turks and Caicos Islands',90668,'Male','9390536576','gloria.secrest@gmail.com',3,'2024-02-16 06:37:52'),(137,'Stacey','Montgomery','1986-09-15','Peshawar','Kazakhstan',34416,'Male','9464558641','shel.euridice@gmail.com',4,'2024-02-16 06:37:52'),(138,'Alameda','Gemini','2007-08-14','Kuwait City','Lesotho',60628,'Female','9407261094','ninnetta.tybald@gmail.com',6,'2024-02-16 06:37:52'),(139,'Frieda','Klemperer','1987-05-14','Memphis','Macedonia, The Former Yugoslav Republic of',72827,'Female','9359345684','britni.hieronymus@gmail.com',7,'2024-02-16 06:37:52'),(140,'Cassondra','Travax','1990-03-12','Guatemala City','Montserrat',56335,'Male','9729089779','emelina.bohlin@gmail.com',7,'2024-02-16 06:37:52'),(141,'Etta','Rudolph','1996-11-05','Da Nang','Belize',37602,'Female','9355461395','evaleen.margret@gmail.com',7,'2024-02-16 06:37:52'),(142,'Christy','Winnick','1983-07-05','Baghdad','Dominica',25958,'Female','9269000671','almeta.gilbertson@gmail.com',4,'2024-02-16 06:37:52'),(143,'Cathyleen','Oster','2014-05-29','Agartala','Puerto Rico',58219,'Male','9557317878','stephanie.obed@gmail.com',7,'2024-02-16 06:37:52'),(144,'Neila','Wilona','2009-11-17','Kota Bharu','Mexico',45005,'Female','9533173976','etta.amand@gmail.com',3,'2024-02-16 06:37:52'),(145,'Ketti','Deny','1986-07-04','Timbuktu','Bhutan',17887,'Female','9465157049','eadie.wooster@gmail.com',1,'2024-02-16 06:37:52'),(146,'Albertina','Lanita','2005-04-18','Kaesong','Panama',77275,'Male','9790822667','hildegaard.percy@gmail.com',7,'2024-02-16 06:37:52'),(147,'Cyndie','Gemini','1980-03-29','Darwin','Bouvet Island',42595,'Male','9629334220','alejandra.blake@gmail.com',5,'2024-02-16 06:37:52'),(148,'Dawn','Leonard','2013-04-03','Liverpool','Heard Island and Mcdonald Islands',29846,'Male','9855459058','rhea.ricki@gmail.com',1,'2024-02-16 06:37:52'),(149,'Ernesta','Chabot','2008-04-10','Pune','Guernsey',23467,'Male','9366130671','romona.loleta@gmail.com',6,'2024-02-16 06:37:52'),(150,'Janis','Earlie','2016-09-12','Houston','Iraq',98968,'Female','9219024291','nariko.keelia@gmail.com',5,'2024-02-16 06:37:52'),(151,'Krystle','Secrest','2003-11-14','St. George\'s','Viet Nam',72300,'Female','9479047751','elie.gillan@gmail.com',8,'2024-02-16 06:37:52'),(152,'Wendi','Whiffen','2005-02-01','Yangon','Belgium',21732,'Female','9259418421','florie.jethro@gmail.com',7,'2024-02-16 06:37:52'),(153,'Marsiella','Hilbert','1993-01-11','Nice','Tunisia',22474,'Male','9218506562','nadine.knowling@gmail.com',2,'2024-02-16 06:37:52'),(154,'Leia','Fadiman','1998-03-01','Boa Vista','China',53929,'Female','9359526009','elsie.juan@gmail.com',7,'2024-02-16 06:37:52'),(155,'Nonnah','Kylander','1983-10-06','Fairbanks','Tokelau',12724,'Female','9486429663','xylina.stacy@gmail.com',6,'2024-02-16 06:37:52'),(156,'Orsola','Prouty','1995-04-03','Omsk','Germany',99208,'Male','9756714600','hildegaard.hieronymus@gmail.com',1,'2024-02-16 06:37:52'),(157,'Maud','Demitria','2014-09-30','Antananarivo','Congo',21196,'Female','9308376902','benita.nikaniki@gmail.com',2,'2024-02-16 06:37:52'),(158,'Merle','Seligman','2011-11-05','Hobart','Saint Pierre and Miquelon',87591,'Male','9425592495','jorry.sasnett@gmail.com',2,'2024-02-16 06:37:52'),(159,'Margette','Lory','2008-09-13','Lusaka','Slovakia',14051,'Male','9259569729','charissa.dulciana@gmail.com',3,'2024-02-16 06:37:52'),(160,'Lacie','Dorcy','1989-02-10','Santa Cruz de Tenerife','Colombia',96147,'Female','9354561797','gwyneth.jena@gmail.com',1,'2024-02-16 06:37:52'),(161,'June','Nickola','2000-07-26','Charlotte','Falkland Islands (Malvinas)',56852,'Male','9376612263','jobi.sancho@gmail.com',6,'2024-02-16 06:37:52'),(162,'Chastity','Connelly','2001-07-10','Yaren District','American Samoa',92122,'Female','9417265923','lacie.loring@gmail.com',2,'2024-02-16 06:37:52'),(163,'Glynnis','Barney','1992-04-16','Blantyre','Taiwan, Province of China',37771,'Female','9907454517','ulrike.sherfield@gmail.com',6,'2024-02-16 06:37:52'),(164,'Aimil','Brandice','1983-10-27','City of Halifax','Saint Pierre and Miquelon',23428,'Male','9636366373','dotty.ambrosia@gmail.com',2,'2024-02-16 06:37:52'),(165,'Edith','Amand','2003-04-08','Pontianak','Guinea-Bissau',59105,'Female','9702405949','dale.phyllis@gmail.com',3,'2024-02-16 06:37:52'),(166,'Nessie','Hylan','1981-02-13','Split (city)','Faroe Islands',27306,'Male','9662422801','stacey.danby@gmail.com',1,'2024-02-16 06:37:52'),(167,'Myrtice','Brady','1983-07-19','Accra','Vanuatu',27115,'Male','9345464869','tonia.goldina@gmail.com',4,'2024-02-16 06:37:52'),(168,'Sallie','Roche','1997-03-24','Glasgow','Central African Republic',29955,'Male','9772058148','augustine.sparhawk@gmail.com',5,'2024-02-16 06:37:52'),(169,'Hope','Flyn','2009-01-30','Moroni','Aruba',52673,'Female','9684799540','jacquetta.arne@gmail.com',7,'2024-02-16 06:37:52'),(170,'Estell','Malanie','1996-04-22','Jersey City','Myanmar',64180,'Male','9786912785','riannon.ogren@gmail.com',7,'2024-02-16 06:37:52'),(171,'Miquela','Melleta','2006-03-03','Barranquilla','Luxembourg',25110,'Female','9700486741','lenna.vernier@gmail.com',1,'2024-02-16 06:37:52'),(172,'Cherrita','Fitzsimmons','2003-09-06','Puebla','Poland',80018,'Female','9223381247','natka.gerge@gmail.com',3,'2024-02-16 06:37:52'),(173,'Olivette','Guildroy','2000-10-04','Chaguanas','Trinidad and Tobago',67788,'Male','9531565869','demetris.weaks@gmail.com',1,'2024-02-16 06:37:52'),(174,'Nataline','Atcliffe','1982-03-11','Rockhampton','Guinea-Bissau',33172,'Male','9231722491','odessa.fancie@gmail.com',2,'2024-02-16 06:37:52'),(175,'Chrystel','Deegan','2006-10-17','Incheon','Denmark',90184,'Male','9792229870','tabbatha.ietta@gmail.com',8,'2024-02-16 06:37:52'),(176,'Agnese','Longfellow','1993-09-17','Mumbai','Japan',19257,'Female','9480119920','nyssa.docilla@gmail.com',2,'2024-02-16 06:37:52'),(177,'Vita','Bevin','2000-08-15','Niamey','Equatorial Guinea',43553,'Female','9735914047','jaime.maurine@gmail.com',5,'2024-02-16 06:37:52'),(178,'Gusty','Tyson','1997-04-30','Cork (city)','Guinea',42621,'Female','9740928651','lenna.poll@gmail.com',1,'2024-02-16 06:37:52'),(179,'Minda','Lattie','1986-10-11','St. Louis','Zimbabwe',95368,'Male','9431844660','anica.halsey@gmail.com',8,'2024-02-16 06:37:52'),(180,'Kate','Matthew','2003-12-29','St. George\'s','Algeria',28641,'Female','9228933793','doralynne.ricarda@gmail.com',1,'2024-02-16 06:37:52'),(181,'Helena','Dearborn','2015-12-18','Lviv','France',64769,'Male','9777762107','adele.croix@gmail.com',2,'2024-02-16 06:37:52'),(182,'Agathe','Bates','2003-03-19','Ahmedabad','Latvia',45408,'Male','9598207133','janenna.bari@gmail.com',6,'2024-02-16 06:37:52'),(183,'Jackie','Chick','2008-12-04','Moroni','Reunion',18391,'Male','9409962807','abbie.cornelia@gmail.com',4,'2024-02-16 06:37:52'),(184,'Fayre','Doig','1982-03-05','Tucson','Barbados',79724,'Female','9652011862','helena.ludewig@gmail.com',1,'2024-02-16 06:37:52'),(185,'Emmey','Esmaria','1993-12-28','Jacksonville','Georgia',45590,'Female','9460147866','keelia.ulphia@gmail.com',6,'2024-02-16 06:37:52'),(186,'Alyssa','Levey','2001-08-06','Damascus','Kyrgyzstan',99511,'Female','9339554271','meghann.henebry@gmail.com',2,'2024-02-16 06:37:52'),(187,'Willetta','Norrie','1988-10-15','Funafuti','Botswana',16544,'Female','9855988278','calla.keily@gmail.com',8,'2024-02-16 06:37:52'),(188,'Jere','Richers','1990-12-13','Kingstown','Turkmenistan',11037,'Female','9380684515','rosabelle.pascia@gmail.com',6,'2024-02-16 06:37:52'),(189,'Phylis','Idelia','1989-04-15','Kota Kinabalu','Sudan',72766,'Male','9499316993','malina.iphlgenia@gmail.com',2,'2024-02-16 06:37:52'),(190,'Bobinette','Marijo','2008-02-19','Bratislava','French Polynesia',75143,'Male','9356433321','alie.dulciana@gmail.com',8,'2024-02-16 06:37:52'),(191,'Monika','Corabella','2014-09-01','Libreville','New Zealand',56647,'Male','9856438502','clarice.posner@gmail.com',2,'2024-02-16 06:37:52'),(192,'Lucy','Breed','1982-04-03','Thimphu','Belarus',92467,'Male','9888129397','jessy.tamar@gmail.com',3,'2024-02-16 06:37:52'),(193,'Genevra','Rodmann','2010-04-27','Batticaloa','Pakistan',11122,'Male','9866972549','barbi.melan@gmail.com',3,'2024-02-16 06:37:52'),(194,'Nikki','Gherardo','2003-04-06','Cartagena','Algeria',44465,'Female','9678033645','camile.greyson@gmail.com',7,'2024-02-16 06:37:52'),(195,'Mellicent','Gladstone','1996-08-03','Buffalo','Kazakhstan',25455,'Female','9690453550','belinda.chandler@gmail.com',3,'2024-02-16 06:37:52'),(196,'Carmencita','Narton','2000-09-04','Montreal','Viet Nam',38732,'Male','9639549243','allyce.garlinda@gmail.com',3,'2024-02-16 06:37:52'),(197,'Doro','Swanhildas','1995-10-02','Pelotas','Switzerland',11802,'Female','9487421768','lenna.caitlin@gmail.com',1,'2024-02-16 06:37:52'),(198,'Anthia','Tiffa','1996-05-22','Nizhny Novgorod','Greenland',96771,'Female','9595890913','dawn.hurley@gmail.com',6,'2024-02-16 06:37:52'),(199,'Collen','Lewes','1983-03-20','Iquitos','Western Sahara',97755,'Male','9272399828','bertine.fiester@gmail.com',2,'2024-02-16 06:37:52'),(200,'Corly','Camden','1999-09-04','Blantyre','Germany',73152,'Female','9334820425','kayla.letsou@gmail.com',3,'2024-02-16 06:37:52');
/*!40000 ALTER TABLE `StudentMaster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 16:54:51