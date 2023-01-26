-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version       10.6.5-MariaDB

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

--
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktura` (
  `kundnamn` varchar(45) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `pris` int(11) NOT NULL,
  `produkt_namn` varchar(45) DEFAULT NULL,
  `antal` bigint(20) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `kund_id` int(11) NOT NULL,
  PRIMARY KEY (`kund_id`,`produkt_id`),
  KEY `produkt_idx` (`pris`),
  KEY `produkt_info_idx` (`produkt_namn`,`antal`),
  KEY `kund_idx` (`kundnamn`,`kund_id`),
  KEY `produkt` (`produkt_id`),
  CONSTRAINT `kund` FOREIGN KEY (`kund_id`) REFERENCES `kund_register` (`Kund_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `produkt` FOREIGN KEY (`produkt_id`) REFERENCES `plocklista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaffe`
--

DROP TABLE IF EXISTS `kaffe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaffe` (
  `idkaffe` int(11) NOT NULL AUTO_INCREMENT,
  `produktKod` bigint(20) NOT NULL,
  `pris` bigint(20) NOT NULL,
  `namn` varchar(45) DEFAULT NULL,
  `kort_beskrivning` varchar(500) DEFAULT NULL,
  `antal` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idkaffe`),
  CONSTRAINT `kaffe_ibfk_1` FOREIGN KEY (`idkaffe`) REFERENCES `produktregister` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaffe`
--

LOCK TABLES `kaffe` WRITE;
/*!40000 ALTER TABLE `kaffe` DISABLE KEYS */;
INSERT INTO `kaffe` VALUES (1,123,90,'Zoega mild rost','Fruity with notes of lemon and blackberry',12),(2,706,34,'Zoega Intenzo','Flowery with fragrant coriander seeds',234),(3,364,56,'Zoega Espresso','Chocolaty with aromas of Swiss chocolate',530),(4,23443,99,'Zoega ECO','expensive, and delicious',32),(5,4568,68,'Gevalia','Earthy taste with notes of wet soil',120),(6,577,123,'Gevalia Hole beens','Sweaty with soapy notes',376),(7,642,123,'G','Horsey taste with notes of cooked beef and gamey',250),(8,545,123,'Gevalia ruogh grit','Woody with notes of wet cardboard',200),(9,2323,54,'Brew cofey','expensive, and delicious',150),(10,64,60,'Brew cofey intense','Earthy taste with notes of wet soil',50),(11,567,60,'Zero Coffe','Non cofinated brew coffie',30);
/*!40000 ALTER TABLE `kaffe` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_kaffe_insert
AFTER INSERT
ON `eshop`.`kaffe` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.namn, ', pris: ', NEW.pris)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_kaffe_update
AFTER UPDATE
ON `eshop`.`kaffe` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Product updated, on the id: ',
            OLD.produktKod,
            ', ',
            OLD.namn,
            ', ',
            OLD.pris,
            ', ',
            OLD.antal,
            ', ',
            ' After: ',
            ', ',
            NEW.namn,
            ', ',
            NEW.pris,
             ', ',
            NEW.antal

)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_kaffe_delete
AFTER DELETE
ON `eshop`.`kaffe` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.namn)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kaffe_mugg`
--

DROP TABLE IF EXISTS `kaffe_mugg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaffe_mugg` (
  `idMugg` int(11) NOT NULL AUTO_INCREMENT,
  `produktKod` bigint(20) NOT NULL,
  `pris` bigint(20) NOT NULL,
  `namn` varchar(45) DEFAULT NULL,
  `kort_beskrivning` varchar(500) DEFAULT NULL,
  `antal` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idMugg`),
  UNIQUE KEY `produktKod_UNIQUE` (`produktKod`),
  KEY `idMugg_idx` (`idMugg`,`produktKod`,`pris`),
  CONSTRAINT `idMugg` FOREIGN KEY (`idMugg`) REFERENCES `produktregister` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaffe_mugg`
--

LOCK TABLES `kaffe_mugg` WRITE;
/*!40000 ALTER TABLE `kaffe_mugg` DISABLE KEYS */;
INSERT INTO `kaffe_mugg` VALUES (1,122,78,'Mumin',' A coffee mug depicting the Mumins',12),(2,234,98,'Cat','A Cat mug',73),(4,3476,123,'Black Mug','A Black mug',50),(5,765,200,'Blue Mug','A blue mug',87),(6,434,45,'Green Mug','A Green mug',120);
/*!40000 ALTER TABLE `kaffe_mugg` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_misc_insert
AFTER INSERT
ON `eshop`.`kaffe_mugg` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.namn, ', pris: ', NEW.pris)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_misc_update
AFTER UPDATE
ON `eshop`.`kaffe_mugg` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Product updated, on the id: ',
            OLD.produktKod,
            ', ',
            OLD.namn,
            ', ',
            OLD.pris,
            ', ',
            OLD.antal,
            ', ',
            ' After: ',
            ', ',
            NEW.namn,
            ', ',
            NEW.pris,
             ', ',
            NEW.antal

)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_misc_delete
AFTER DELETE
ON `eshop`.`kaffe_mugg` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.namn)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kund_register`
--

DROP TABLE IF EXISTS `kund_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kund_register` (
  `Kund_id` int(11) NOT NULL,
  `namn` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `tel` int(11) NOT NULL,
  `mail` varchar(45) NOT NULL,
  PRIMARY KEY (`Kund_id`),
  UNIQUE KEY `Kund_id_UNIQUE` (`Kund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund_register`
--

LOCK TABLES `kund_register` WRITE;
/*!40000 ALTER TABLE `kund_register` DISABLE KEYS */;
INSERT INTO `kund_register` VALUES (1,'Stefan','storgatan 19b',768834571,'Setan.anders@gmail.com'),(2,'Begitta','Drottningsgatan 27c',768876586,'KattΓö£├▒lskare@hotmail.com'),(3,'torsten','andeholmensgatan 76',446589261,'tols19@student.bth.se'),(4,'Anton','Stumholmen gΓö£Γòósters vΓö£├▒g3',793365832,'Anton@gmail.com'),(5,'Felix','MinnervavΓö£├▒gen 20A',764458123,'Felix2216@gmail.com');
/*!40000 ALTER TABLE `kund_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lager` (
  `produktkod` int(11) NOT NULL AUTO_INCREMENT,
  `namn` varchar(45) DEFAULT NULL,
  `antal` bigint(20) DEFAULT NULL,
  `lagerhylla` varchar(45) NOT NULL,
  PRIMARY KEY (`lagerhylla`),
  UNIQUE KEY `produktkod_UNIQUE` (`produktkod`)
) ENGINE=InnoDB AUTO_INCREMENT=23444 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES (434,'Green Mug',120,'10d'),(543,'filter',150,'16a'),(346,'filter',200,'17b'),(568,'ketle',30,'18a'),(246,'Vertuo Next D Dark Grey',230,'19a'),(423,'Vertuo Ice Coffee Selection',300,'19b'),(123,'Zoega mild rost',12,'19c'),(545,'Gevalia ruogh grit',200,'1a'),(642,'Gevalia Fine grit',256,'1b'),(2323,'Brew cofey',150,'1c'),(706,'Zoega Intenzo',234,'21a'),(364,'Zoega Espresso',530,'21b'),(23443,'Zoega ECO',32,'21c'),(567,'Zero Coffe',30,'32a'),(64,'Brew cofey intense',50,'32b'),(577,'Gevalia Hole beens',376,'3c'),(4568,'Gevalia',120,'65c'),(122,'Mumin',12,'6c'),(234,'Cat',73,'8a'),(765,'Blue Mug',87,'9a'),(3476,'Black Mug',50,'9b'),(457,'white Mug',43,'9c');
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_lager_insert
AFTER INSERT
ON `eshop`.`lager` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.`produktkod`, ', amount: ', NEW.antal)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_lager_update
AFTER UPDATE
ON `eshop`.`lager` FOR EACH ROW
    INSERT INTO logg(`handelse`)
        VALUES (CONCAT(
            'Product updated, on the id: ',
            OLD.produktKod,
            ', ',
            OLD.`lagerhylla`,
            ', ',
            OLD.antal,
            ', ',
            ' After: ',
            NEW.`lagerhylla`,
             ', ',
            NEW.antal
)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_lager_delete
AFTER DELETE
ON `eshop`.`lager` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.`produktkod`)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logg`
--

DROP TABLE IF EXISTS `logg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` timestamp NOT NULL DEFAULT current_timestamp(),
  `handelse` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg`
--

LOCK TABLES `logg` WRITE;
/*!40000 ALTER TABLE `logg` DISABLE KEYS */;
INSERT INTO `logg` VALUES (1,'2022-09-17 11:37:14','Product inserted: filter, pris: 32'),(2,'2022-09-17 11:37:14','Product inserted: filter, pris: 234'),(3,'2022-09-17 11:37:14','Product inserted: ketle, pris: 234'),(4,'2022-09-17 11:37:14','Product inserted: Vertuo Next D Dark Grey, pris: 700'),(5,'2022-09-17 11:37:14','Product inserted: Vertuo Ice Coffee Selection, pris: 123'),(6,'2022-09-17 11:37:14','Product inserted: Zoega mild rost, pris: 90'),(7,'2022-09-17 11:37:14','Product inserted: Zoega Intenzo, pris: 34'),(8,'2022-09-17 11:37:14','Product inserted: Zoega Espresso, pris: 56'),(9,'2022-09-17 11:37:14','Product inserted: Zoega ECO, pris: 99'),(10,'2022-09-17 11:37:14','Product inserted: Gevalia, pris: 68'),(11,'2022-09-17 11:37:14','Product inserted: Gevalia Hole beens, pris: 123'),(12,'2022-09-17 11:37:14','Product inserted: Gevalia Fine grit, pris: 123'),(13,'2022-09-17 11:37:14','Product inserted: Gevalia ruogh grit, pris: 123'),(14,'2022-09-17 11:37:14','Product inserted: Brew cofey, pris: 54'),(15,'2022-09-17 11:37:14','Product inserted: Brew cofey intense, pris: 60'),(16,'2022-09-17 11:37:14','Product inserted: Zero Coffe, pris: 60'),(17,'2022-09-17 11:37:14','Product inserted: Mumin, pris: 78'),(18,'2022-09-17 11:37:14','Product inserted: Cat, pris: 98'),(19,'2022-09-17 11:37:14','Product inserted: white Mug, pris: 43'),(20,'2022-09-17 11:37:14','Product inserted: Black Mug, pris: 123'),(21,'2022-09-17 11:37:14','Product inserted: Blue Mug, pris: 200'),(22,'2022-09-17 11:37:14','Product inserted: Green Mug, pris: 45'),(23,'2022-09-17 11:37:14','Product inserted: 122, amount: 12'),(24,'2022-09-17 11:37:14','Product inserted: 234, amount: 73'),(25,'2022-09-17 11:37:14','Product inserted: 457, amount: 43'),(26,'2022-09-17 11:37:14','Product inserted: 3476, amount: 50'),(27,'2022-09-17 11:37:14','Product inserted: 765, amount: 87'),(28,'2022-09-17 11:37:14','Product inserted: 434, amount: 120'),(29,'2022-09-17 11:37:14','Product inserted: 543, amount: 150'),(30,'2022-09-17 11:37:14','Product inserted: 346, amount: 200'),(31,'2022-09-17 11:37:14','Product inserted: 568, amount: 30'),(32,'2022-09-17 11:37:14','Product inserted: 246, amount: 230'),(33,'2022-09-17 11:37:14','Product inserted: 423, amount: 300'),(34,'2022-09-17 11:37:14','Product inserted: 123, amount: 12'),(35,'2022-09-17 11:37:14','Product inserted: 706, amount: 234'),(36,'2022-09-17 11:37:14','Product inserted: 364, amount: 530'),(37,'2022-09-17 11:37:14','Product inserted: 23443, amount: 32'),(38,'2022-09-17 11:37:14','Product inserted: 4568, amount: 120'),(39,'2022-09-17 11:37:14','Product inserted: 577, amount: 376'),(40,'2022-09-17 11:37:14','Product inserted: 642, amount: 256'),(41,'2022-09-17 11:37:14','Product inserted: 545, amount: 200'),(42,'2022-09-17 11:37:14','Product inserted: 2323, amount: 150'),(43,'2022-09-17 11:37:14','Product inserted: 64, amount: 50'),(44,'2022-09-17 11:37:14','Product inserted: 567, amount: 30'),(45,'2022-09-17 11:40:17','Product updated, on the id: 642, Gevalia Fine grit, 123, 256,  After: , G, 123, 250'),(46,'2022-11-30 20:09:20','Product deleted: white Mug');
/*!40000 ALTER TABLE `logg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc`
--

DROP TABLE IF EXISTS `misc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc` (
  `idmisc` int(11) NOT NULL AUTO_INCREMENT,
  `produktKod` bigint(20) NOT NULL,
  `pris` bigint(20) NOT NULL,
  `namn` varchar(45) DEFAULT NULL,
  `kort_beskrivning` varchar(500) DEFAULT NULL,
  `antal` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idmisc`),
  UNIQUE KEY `produktKod_UNIQUE` (`produktKod`),
  KEY `idmisc_idx` (`idmisc`,`produktKod`,`pris`),
  CONSTRAINT `idmisc` FOREIGN KEY (`idmisc`) REFERENCES `produktregister` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc`
--

LOCK TABLES `misc` WRITE;
/*!40000 ALTER TABLE `misc` DISABLE KEYS */;
INSERT INTO `misc` VALUES (1,543,32,'filter','filter 50 pices',150),(2,346,234,'filter','paper filter 500 pices',200),(3,568,234,'ketle','an eletric cetle',30),(4,246,700,'Vertuo Next D Dark Grey','Nespresso machin',230),(5,423,123,'Vertuo Ice Coffee Selection','Boldly intense, delicately fruity',300);
/*!40000 ALTER TABLE `misc` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_kaffe_mugg_insert
AFTER INSERT
ON `eshop`.`misc` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.namn, ', pris: ', NEW.pris)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_kaffe_mugg_update
AFTER UPDATE
ON `eshop`.`misc` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Product updated, on the id: ',
            OLD.produktKod,
            ', ',
            OLD.namn,
            ', ',
            OLD.pris,
            ', ',
            OLD.antal,
            ', ',
            ' After: ',
            ', ',
            NEW.namn,
            ', ',
            NEW.pris,
             ', ',
            NEW.antal

)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`maria`@`localhost`*/ /*!50003 TRIGGER log_kaffe_mugg_delete
AFTER DELETE
ON `eshop`.`misc` FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.namn)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `Namn` varchar(45) DEFAULT NULL,
  `produktkod` bigint(20) NOT NULL,
  `antal` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `produktkod_UNIQUE` (`produktkod`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `produktregister` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plocklista`
--

DROP TABLE IF EXISTS `plocklista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plocklista` (
  `id` int(11) NOT NULL,
  `Namn` varchar(45) NOT NULL,
  `produktkod` bigint(20) NOT NULL,
  `antal` bigint(20) NOT NULL,
  `lagerhylla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `produktkod_UNIQUE` (`produktkod`),
  KEY `lager_idx` (`lagerhylla`),
  CONSTRAINT `id0` FOREIGN KEY (`id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lager` FOREIGN KEY (`lagerhylla`) REFERENCES `lager` (`lagerhylla`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plocklista`
--

LOCK TABLES `plocklista` WRITE;
/*!40000 ALTER TABLE `plocklista` DISABLE KEYS */;
/*!40000 ALTER TABLE `plocklista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produktregister`
--

DROP TABLE IF EXISTS `produktregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produktregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produkt_kategori` varchar(45) NOT NULL,
  `produktKod` bigint(20) NOT NULL,
  `pris` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`produkt_kategori`,`produktKod`,`pris`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produktregister`
--

LOCK TABLES `produktregister` WRITE;
/*!40000 ALTER TABLE `produktregister` DISABLE KEYS */;
INSERT INTO `produktregister` VALUES (1,'kaffe_mugg',122,78),(2,'kaffe_mugg',234,98),(3,'kaffe_mugg',457,43),(4,'kaffe_mugg',3476,123),(5,'kaffe_mugg',765,200),(6,'kaffe_mugg',434,45),(7,'misc',543,32),(8,'misc',346,234),(9,'misc',568,234),(10,'misc',246,700),(11,'misc',423,123),(12,'\nkaffe',123,90),(13,'kaffe',706,34),(14,'kaffe',364,56),(15,'kaffe',23443,99),(16,'kaffe',4568,68),(17,'kaffe',577,123),(18,'kaffe',642,123),(19,'kaffe',545,123),(20,'kaffe',2323,54),(21,'kaffe',64,60),(22,'kaffe',567,60);
/*!40000 ALTER TABLE `produktregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `kΓö£Γòóp_id` int(11) NOT NULL AUTO_INCREMENT,
  `kundnamn` varchar(45) NOT NULL,
  `pris` bigint(20) DEFAULT NULL,
  `produkt_namn` varchar(45) DEFAULT NULL,
  `antal` bigint(20) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `kund_id` int(11) NOT NULL,
  PRIMARY KEY (`kΓö£Γòóp_id`),
  UNIQUE KEY `kΓö£Γòóp_id_UNIQUE` (`kΓö£Γòóp_id`),
  UNIQUE KEY `kund_id_UNIQUE` (`kund_id`),
  KEY `Faktura_kopy_idx` (`kundnamn`,`pris`,`kund_id`),
  CONSTRAINT `Faktura_kopy` FOREIGN KEY (`kund_id`) REFERENCES `faktura` (`kund_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eshop'
--
/*!50003 DROP PROCEDURE IF EXISTS `addInv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `addInv`(
    _id INT,
    _hylla VARCHAR(45),
    _antal BIGINT)
BEGIN
    IF (
        SELECT `antal`
        FROM `eshop`.`lager`
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla)

        THEN
        UPDATE `eshop`.`lager`
        SET `antal` = `antal` + _antal
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla;

        ELSE
        INSERT INTO `eshop`.`lager`(`produktkod`, `antal`, `lagerhylla`)
        VALUES(_id, _antal, _hylla);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_object` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `delete_object`(
_the_name VARCHAR(45),
_id INT
)
BEGIN
        IF _the_name = 'kaffe' THEN
                DELETE FROM  `eshop`.`kaffe` WHERE `produktkod` = _id;
        ELSEIF _the_name = 'kaffe_mugg' THEN
                DELETE FROM  `eshop`.`kaffe_mugg` WHERE `produktkod` = _id;
        ELSE
                DELETE FROM  `eshop`.`misc` WHERE `produktkod` = _id;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delInv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `delInv`(
    _id INT,
    _hylla VARCHAR(45),
    _antal BIGINT)
BEGIN
    IF (
        (SELECT `antal`
        FROM `eshop`.`lager`
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla) - _antal <= 0)

        THEN
        DELETE FROM `eshop`.`lager`
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla;

        ELSE
        UPDATE `eshop`.`lager`
        SET `antal`  = `antal` - _antal
        WHERE `produktkod` = _id AND `lagerhylla` = _hylla;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertInto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `insertInto`(
        `f_produkt_kategori`  VARCHAR(45),
        `f_produktKod` BIGINT,
    `f_pris` BIGINT,
    `f_namn` VARCHAR(45),
    `f_kort_beskrivning` VARCHAR(500) ,
    `f_antal` BIGINT
)
BEGIN
        IF `f_produkt_kategori` = 'misc' THEN
                INSERT INTO `eshop`.`misc` (`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
                values(`f_produktKod`, `f_pris`, `f_namn`, `f_kort_beskrivning`, `f_antal`);

    ELSEIF `f_produkt_kategori` = 'kaffe' THEN
                INSERT INTO `eshop`.`kaffe` (`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
                values(`f_produktKod`, `f_pris`, `f_namn`, `f_kort_beskrivning`, `f_antal`);

    ELSEIF `f_produkt_kategori` = 'kaffe_mugg' THEN
                INSERT INTO `eshop`.`kaffe_mugg` (`produktKod`, `pris`, `namn`, `kort_beskrivning`, `antal`)
                values(`f_produktKod`, `f_pris`, `f_namn`, `f_kort_beskrivning`, `f_antal`);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_ALL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `SELECT_ALL`(
  _the_name varchar(45)
)
BEGIN
        IF _the_name = 'eshop.kaffe' THEN
                SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM `eshop`.`kaffe`;
        ELSEIF _the_name = 'eshop.kaffe_mugg' THEN
                SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM `eshop`.`kaffe_mugg`;
        ELSE
                SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM `eshop`.`misc`;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_ALL_where` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `SELECT_ALL_where`(
_the_name VARCHAR(45),
_id INT
)
BEGIN
        IF _the_name = 'kaffe' THEN
                SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM  `eshop`.`kaffe` WHERE `produktkod` = _id;
        ELSEIF _the_name = 'kaffe_mugg' THEN
                SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM  `eshop`.`kaffe_mugg` WHERE `produktkod` = _id;
        ELSE
                SELECT `namn`, `kort_beskrivning`, `antal`, `pris`, `produktKod` FROM  `eshop`.`misc` WHERE `produktkod` = _id;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `serch_sorage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `serch_sorage`(_fltr VARCHAR(45))
BEGIN
    SELECT *
    FROM `eshop`.`lager`
    WHERE `produktkod` = _fltr OR `namn` LIKE CONCAT('%',_fltr,'%')  OR `lagerhylla` = _fltr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_log`(_num INT)
BEGIN
    SELECT id, DATE_FORMAT(tid, '%Y-%m-%d %H:%i:%s') AS 'Time', handelse FROM logg
    ORDER BY id DESC
    LIMIT _num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_storage_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_storage_1`()
BEGIN
    SELECT * FROM `eshop`.`lager`
    ORDER BY `lagerhylla` DESC
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_storage_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `show_storage_2`()
BEGIN
    SELECT `lagerhylla` FROM `eshop`.`lager`
    ORDER BY `lagerhylla` DESC
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uppdate_objekt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`maria`@`localhost` PROCEDURE `uppdate_objekt`(
_the_name VARCHAR(45),
_pris INT,
_namn VARCHAR(45),
_kort_beskrivning VARCHAR(500),
_antal INT,
_id INT
)
BEGIN
        IF _the_name = 'kaffe' THEN
                UPDATE `eshop`.`kaffe` SET `pris` = _pris, `namn` = _namn, `kort_beskrivning` = _kort_beskrivning, `antal` = _antal WHERE `produktKod` = _id;
        ELSEIF _the_name = 'kaffe_mugg' THEN
                UPDATE `eshop`.`kaffe_mugg` SET `pris` = _pris, `namn` = _namn, `kort_beskrivning` = _kort_beskrivning, `antal` = _antal WHERE `produktKod` = _id;
        ELSE
                UPDATE `eshop`.`misc` SET `pris` = _pris, `namn` = _namn, `kort_beskrivning` = _kort_beskrivning, `antal` = _antal WHERE `produktKod` = _id;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30 21:21:04