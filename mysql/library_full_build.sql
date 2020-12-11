DROP TABLE IF EXISTS `tbl_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_author` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `authorName` varchar(45) NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_author` WRITE;
INSERT INTO `tbl_author` VALUES (1,'Robert C. Martin'),(2,'Edwidge Danticat'),(3,'Ernest Hemingway'),(4,'J.R.R. Tolkien'),(5,'Herodotus'),(6,'Saul Bellow'),(7,'Sidney Sheldon'),(8,'Franz Kafka'),(9,'Marguerite Duras'),(10,'Mark Twain'),(11,'Fannie Flagg'),(12,'Iceberg Slim'),(13,'Camille Paglia'),(14,'Rainer Maria Rilke'),(15,'Baroness Orczy'),(20,'Stephen King'),(21,'Jane Austen'),(22,'William Faulkner'),(24,'George Orwell'),(25,'test'),(26,'json test author'),(27,'json test author'),(28,'Kurt Vonnegut'),(29,'James Joyce');
UNLOCK TABLES;

DROP TABLE IF EXISTS `tbl_book`;
CREATE TABLE `tbl_book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `pubId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `fk_publisher` (`pubId`),
  CONSTRAINT `fk_publisher` FOREIGN KEY (`pubId`) REFERENCES `tbl_publisher` (`publisherId`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
INSERT INTO `tbl_book` VALUES (15,'A Handbook of Agile Software Craftsmanship',4),(27,'mySQL',8),(28,'Hadoop',10),(29,'C++',8),(30,'Python',9),(32,'C#',8),(40,'Spring',1),(41,'samay the boy',3),(42,'Java & mySQL',3),(43,'Testing Book',2),(44,'December Fun',2),(45,'Laptop',1);
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 16:53:55

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `tbl_book_authors`
--

DROP TABLE IF EXISTS `tbl_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_authors` (
  `bookId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`bookId`,`authorId`),
  KEY `fk_tbl_book_authors_tbl_author1_idx` (`authorId`),
  CONSTRAINT `fk_tbl_book_authors_tbl_author1` FOREIGN KEY (`authorId`) REFERENCES `tbl_author` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_book_authors_tbl_book1` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_authors`
--

LOCK TABLES `tbl_book_authors` WRITE;
/*!40000 ALTER TABLE `tbl_book_authors` DISABLE KEYS */;
INSERT INTO `tbl_book_authors` VALUES (32,1),(40,1),(45,1),(15,2),(40,2),(15,3),(40,3),(40,4),(27,5),(40,5),(41,5),(43,5),(27,6),(44,11),(42,20);
/*!40000 ALTER TABLE `tbl_book_authors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 16:53:55
DROP TABLE IF EXISTS `tbl_book_copies`;
CREATE TABLE `tbl_book_copies` (
  `bookId` int(11) NOT NULL,
  `libraryBranchId` int(11) NOT NULL,
  `noOfCopies` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`,`libraryBranchId`),
  KEY `fk_bc_book` (`bookId`),
  KEY `fk_bc_branch` (`libraryBranchId`),
  CONSTRAINT `fk_bc_book` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bc_branch` FOREIGN KEY (`libraryBranchId`) REFERENCES `tbl_library_branch` (`libraryBranchId`) ON DELETE CASCADE ON UPDATE CASCADE
);


LOCK TABLES `tbl_book_copies` WRITE;
INSERT INTO `tbl_book_copies` VALUES (15,1,5),(15,2,3),(15,3,5),(15,4,5),(15,5,5),(15,6,5),(15,7,5),(15,8,5),(15,9,5),(15,10,4),(27,1,5),(28,1,6),(29,1,1),(30,1,6),(30,39,5),(32,1,7),(32,39,5),(40,1,10),(41,1,0),(41,2,2),(41,3,0),(41,4,0),(41,5,0),(41,6,0),(41,7,0),(41,8,0),(41,9,0),(41,10,0),(41,11,0),(41,12,0),(41,13,0),(41,14,0),(41,15,0),(41,20,0),(41,39,0),(42,1,0),(42,2,0),(42,3,0),(42,4,0),(42,5,0),(42,6,0),(42,7,0),(42,8,0),(42,9,0),(42,10,0),(42,11,0),(42,12,0),(42,13,0),(42,14,0),(42,15,0),(42,20,0),(42,39,0),(43,1,0),(43,2,1),(43,3,0),(43,4,0),(43,5,0),(43,6,0),(43,7,0),(43,8,0),(43,9,0),(43,10,0),(43,11,0),(43,12,0),(43,13,0),(43,14,0),(43,15,0),(43,20,0),(43,39,0),(44,1,0),(44,2,0),(44,3,0),(44,4,0),(44,5,0),(44,6,0),(44,7,0),(44,8,0),(44,9,0),(44,10,0),(44,11,0),(44,12,0),(44,13,0),(44,14,0),(44,15,0),(44,20,0),(44,39,0),(45,1,0),(45,2,0),(45,3,0),(45,4,0),(45,5,0),(45,6,0),(45,7,0),(45,8,0),(45,9,0),(45,10,0),(45,11,0),(45,12,0),(45,13,0),(45,14,0),(45,15,0),(45,20,0),(45,39,0);
UNLOCK TABLES;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `tbl_book_genres`
--

DROP TABLE IF EXISTS `tbl_book_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_genres` (
  `genre_id` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  PRIMARY KEY (`genre_id`,`bookId`),
  KEY `fk_tbl_book_genres_tbl_book1_idx` (`bookId`),
  CONSTRAINT `fk_tbl_book_genres_tbl_book1` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_book_genres_tbl_genre1` FOREIGN KEY (`genre_id`) REFERENCES `tbl_genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_genres`
--

LOCK TABLES `tbl_book_genres` WRITE;
/*!40000 ALTER TABLE `tbl_book_genres` DISABLE KEYS */;
INSERT INTO `tbl_book_genres` VALUES (9,27),(4,40),(5,40),(6,40),(7,40),(5,41),(4,42),(1,43),(8,44),(1,45);
/*!40000 ALTER TABLE `tbl_book_genres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 16:53:54
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `tbl_book_loans`
--

DROP TABLE IF EXISTS `tbl_book_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_loans` (
  `bookId` int(11) NOT NULL,
  `libraryBranchId` int(11) NOT NULL,
  `cardNo` int(11) NOT NULL,
  `dateOut` datetime NOT NULL,
  `dueDate` datetime DEFAULT NULL,
  `dateIn` datetime DEFAULT NULL,
  PRIMARY KEY (`bookId`,`libraryBranchId`,`cardNo`,`dateOut`),
  KEY `fk_bl_book` (`bookId`),
  KEY `fk_bl_branch` (`libraryBranchId`),
  KEY `fk_bl_borrower` (`cardNo`),
  CONSTRAINT `fk_bl_book` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_borrower` FOREIGN KEY (`cardNo`) REFERENCES `tbl_borrower` (`cardNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_branch` FOREIGN KEY (`libraryBranchId`) REFERENCES `tbl_library_branch` (`libraryBranchId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_loans`
--

LOCK TABLES `tbl_book_loans` WRITE;
/*!40000 ALTER TABLE `tbl_book_loans` DISABLE KEYS */;
INSERT INTO `tbl_book_loans` VALUES (15,1,11,'2018-03-05 00:00:00','2018-04-04 00:00:00',NULL),(15,3,11,'2018-03-03 00:00:00','2018-04-02 00:00:00','2018-03-03 00:00:00'),(15,10,1,'2018-03-03 00:00:00','2018-07-01 01:11:02',NULL),(15,10,2,'2011-01-01 01:31:21','2011-01-01 01:31:21','2011-01-01 01:31:21'),(40,1,1,'2017-10-10 02:59:38','2017-10-17 02:59:38','2017-10-10 03:00:22'),(43,2,11,'2018-03-05 00:00:00','2018-04-04 00:00:00','2018-03-05 00:00:00');
/*!40000 ALTER TABLE `tbl_book_loans` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 16:53:53
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `tbl_borrower`
--

DROP TABLE IF EXISTS `tbl_borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_borrower` (
  `cardNo` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_borrower`
--

LOCK TABLES `tbl_borrower` WRITE;
/*!40000 ALTER TABLE `tbl_borrower` DISABLE KEYS */;
INSERT INTO `tbl_borrower` VALUES (1,'Charles','8135 St Louis Ave.','(192) 980-2502'),(2,'Monica','66 Olive St.','(606) 437-1217'),(3,'Loki','7339 Mill Drive','(419) 346-4308'),(4,'Nia','138 Tailwater Dr.','(798) 485-6161'),(5,'Alexis','974A NW. Tailwater St.','(390) 404-9386'),(6,'Jaret','789 Dogwood St.','(905) 760-0736'),(7,'Jevan','51 Hanover St.','(473) 980-1919'),(8,'Adriana','298 Smith Store Drive','(839) 662-6163'),(9,'Ayrton','526 Penn Street','(586) 467-4044'),(10,'Evelyn','38 W. Park Street','(237) 606-5815'),(11,'Elle','16 Hall Rd.','(834) 281-2037'),(12,'Elmer','62 Redwood Dr.','(167) 106-9008'),(13,'Sapphire','79 Beacon Street','(900) 987-6662'),(14,'Reilly','97 NE. High Ridge Street','(483) 824-2706'),(15,'Anson','187 Hamilton St.','(478) 599-5291'),(16,'Tim','512 Lincoln Lane','(202) 555-0145'),(18,'stuart','dsafasdasdf','4353453trgerg');
/*!40000 ALTER TABLE `tbl_borrower` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 16:53:54
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `tbl_genre`
--

DROP TABLE IF EXISTS `tbl_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genre`
--

LOCK TABLES `tbl_genre` WRITE;
/*!40000 ALTER TABLE `tbl_genre` DISABLE KEYS */;
INSERT INTO `tbl_genre` VALUES (1,'fiction'),(3,'non-fiction'),(4,'Science fiction'),(5,'Drama'),(6,'Romance'),(7,'Mystery'),(8,'Horror'),(9,'Health'),(10,'Travel'),(11,'Religion'),(12,'Math'),(13,'Anthology'),(14,'Poetry'),(15,'Encyclopedias'),(20,'test genre'),(21,'Funny');
/*!40000 ALTER TABLE `tbl_genre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 16:53:54
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `tbl_library_branch`
--

DROP TABLE IF EXISTS `tbl_library_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_library_branch` (
  `libraryBranchId` int(11) NOT NULL AUTO_INCREMENT,
  `libraryBranchName` varchar(45) DEFAULT NULL,
  `libraryBranchAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`libraryBranchId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_library_branch`
--

LOCK TABLES `tbl_library_branch` WRITE;
/*!40000 ALTER TABLE `tbl_library_branch` DISABLE KEYS */;
INSERT INTO `tbl_library_branch` VALUES (1,'New York Library','NY'),(2,'New Name ','222 Rockwook,Mo'),(3,'Portland Library','Oregon'),(4,'Toledo Library','Ohio'),(5,'Long Beach','California'),(6,'San Francisco','California'),(7,'Detroit','Michigan'),(8,'Las Vegas','Space'),(9,'Boston','Massachusetts'),(10,'Williamsburg','Virginia'),(11,'Chicago','Illinois'),(12,'San Antonio','Texas'),(13,'Asheville','North Carolina'),(14,'Austin','Texas'),(15,'Honolulu Library','Hawaii'),(20,'San Francisco','California'),(39,'add branch without book test','');
/*!40000 ALTER TABLE `tbl_library_branch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 16:53:55
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.21-log

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

--
-- Table structure for table `tbl_publisher`
--

DROP TABLE IF EXISTS `tbl_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_publisher` (
  `publisherId` int(11) NOT NULL AUTO_INCREMENT,
  `publisherName` varchar(45) NOT NULL,
  `publisherAddress` varchar(45) DEFAULT NULL,
  `publisherPhone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_publisher`
--

LOCK TABLES `tbl_publisher` WRITE;
/*!40000 ALTER TABLE `tbl_publisher` DISABLE KEYS */;
INSERT INTO `tbl_publisher` VALUES (1,'Penguin Random House','NY','11111'),(2,'HarperCollins','DC','22222'),(3,'Simon & Schuster','VA','33333'),(4,'Hachette Book Group','LA','44444'),(5,'Macmillan','MO','55555'),(6,'Scholastic','IL','66666'),(7,'Disney Publishing Worldwide','TN','77777'),(8,'Houghton Mifflin Harcourt','NC','88888'),(9,'Workman','NJ','99999'),(10,'Sterling','AL','10000'),(11,'John Wiley and Sons','HA','10001'),(12,'Abrams','FL','10002'),(13,'Dover','95 Ramblewood Road','(202) 555-0107'),(14,'Candlewick','MO','123456'),(15,'W.W. Norton','NV','20202020'),(17,'Bonnier','88 East Pulaski Street','(202) 555-0115'),(18,'Seidu','Las Vegas','(573) 333 5555'),(20,'kemi','LA','22222222'),(21,'kemi','LA','22222222');
/*!40000 ALTER TABLE `tbl_publisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-08 16:53:54
