-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: library_management_system
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `accessing_no`
--

DROP TABLE IF EXISTS `accessing_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessing_no` (
  `dept` varchar(20) DEFAULT NULL,
  `accessing_no` varchar(20) DEFAULT NULL,
  `book_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessing_no`
--

LOCK TABLES `accessing_no` WRITE;
/*!40000 ALTER TABLE `accessing_no` DISABLE KEYS */;
INSERT INTO `accessing_no` VALUES ('BCA','BCA1','3'),('BCA','BCA2','3'),('BCA','BCA3','3'),('BCA','BCA4','3'),('BCA','BCA5','3'),('BCA','BCA1','3'),('BCA','BCA2','3'),('BCA','BCA3','3'),('BCA','BCA4','3'),('BCA','BCA5','3'),('BCA','BCA1','3'),('BCA','BCA2','3'),('BCA','BCA3','3'),('BCA','BCA4','3'),('BCA','BCA5','3'),('BCA','BCA2','3'),('BCA','BCA3','3'),('BCA','BCA4','3'),('BCA','BCA5','3'),('BCA','BCA6','3'),('BCA','BCA21','3'),('BCA','BCA22','3'),('BCA','BCA23','3'),('BCA','BCA24','3'),('BCA','BCA25','3'),('BBA','BBA1','3'),('BBA','BBA2','3'),('BBA','BBA3','3'),('BBA','BBA4','3'),('BBA','BBA5','3'),('BCA','BCA26','3'),('BCA','BCA27','3'),('BCA','BCA28','3'),('BCA','BCA29','3'),('BCA','BCA30','3');
/*!40000 ALTER TABLE `accessing_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `add_book`
--

DROP TABLE IF EXISTS `add_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_book` (
  `b_date_of_entry` varchar(20) DEFAULT NULL,
  `b_department` varchar(30) DEFAULT NULL,
  `b_acc_no` varchar(50) DEFAULT NULL,
  `b_category` varchar(50) DEFAULT NULL,
  `b_classificationcode` varchar(20) DEFAULT NULL,
  `b_title` varchar(200) DEFAULT NULL,
  `b_subtitle` varchar(200) DEFAULT NULL,
  `b_subject` varchar(200) DEFAULT NULL,
  `b_edition` varchar(20) DEFAULT NULL,
  `b_copies` varchar(10) DEFAULT NULL,
  `author_1` varchar(200) DEFAULT NULL,
  `author_2` varchar(200) DEFAULT NULL,
  `author_3` varchar(200) DEFAULT NULL,
  `author_4` varchar(200) DEFAULT NULL,
  `b_publishername` varchar(200) DEFAULT NULL,
  `b_publishingyear` varchar(10) DEFAULT NULL,
  `b_vendorname` varchar(200) DEFAULT NULL,
  `b_pages` varchar(10) DEFAULT NULL,
  `b_price` varchar(10) DEFAULT NULL,
  `b_rackno` varchar(10) DEFAULT NULL,
  `b_language` varchar(20) DEFAULT NULL,
  `b_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_book`
--

LOCK TABLES `add_book` WRITE;
/*!40000 ALTER TABLE `add_book` DISABLE KEYS */;
INSERT INTO `add_book` VALUES ('2023-06-03','BBA','BBA1','Textbook','547','Principal Of Management','Essential Concepts and Application','Management ','15th Edition','4','Stephen P. Robbins','Mary Coulter','-','-','Aditya Sapate ','2015','Aditya Pvt Ltd','528','650','D4','English','Issued'),('2023-06-03','BBA','BBA2','Textbook','547','Principal Of Management','Essential Concepts and Application','Management ','15th Edition','4','Stephen P. Robbins','Mary Coulter','-','-','Aditya Sapate ','2015','Aditya Pvt Ltd','528','650','D4','English','Returned'),('2023-06-03','BBA','BBA3','Textbook','547','Principal Of Management','Essential Concepts and Application','Management ','15th Edition','4','Stephen P. Robbins','Mary Coulter','-','-','Aditya Sapate ','2015','Aditya Pvt Ltd','528','650','D4','English','Returned'),('2023-06-03','BBA','BBA4','Textbook','547','Principal Of Management','Essential Concepts and Application','Management ','15th Edition','4','Stephen P. Robbins','Mary Coulter','-','-','Aditya Sapate ','2015','Aditya Pvt Ltd','528','650','D4','English','Returned'),('2023-06-03','BSC','BSC1','Textbook','254','Microbiology: An Introduction','Microbiology Introduction','Microbiology','12th Edition ','3','Gerard J. Tortora','Berdell R. Funke','Christine L. Case','-','Vaishnavi Patil','2013','Vaishnavi Pvt Ltd','250','278','S4','English','Returned'),('2023-06-03','BSC','BSC2','Textbook','254','Microbiology: An Introduction','Microbiology Introduction','Microbiology','12th Edition ','3','Gerard J. Tortora','Berdell R. Funke','Christine L. Case','-','Vaishnavi Patil','2013','Vaishnavi Pvt Ltd','250','278','S4','English','Returned'),('2023-06-03','BSC','BSC3','Textbook','254','Microbiology: An Introduction','Microbiology Introduction','Microbiology','12th Edition ','3','Gerard J. Tortora','Berdell R. Funke','Christine L. Case','-','Vaishnavi Patil','2013','Vaishnavi Pvt Ltd','250','278','S4','English','Returned'),('2023-06-03','M.Com','M.Com1','Textbook','158','Business ','Business ','Business','14th Edition ','4','Wiley','-','-','-','Sangram Patil','2013','Sangram Pvt Ltd','214','250','E4','Marathi','Returned'),('2023-06-03','M.Com','M.Com2','Textbook','158','Business ','Business ','Business','14th Edition ','4','Wiley','-','-','-','Sangram Patil','2013','Sangram Pvt Ltd','214','250','E4','Marathi','Returned'),('2023-06-03','M.Com','M.Com3','Textbook','158','Business ','Business ','Business','14th Edition ','4','Wiley','-','-','-','Sangram Patil','2013','Sangram Pvt Ltd','214','250','E4','Marathi','Returned'),('2023-06-03','M.Com','M.Com4','Textbook','158','Business ','Business ','Business','14th Edition ','4','Wiley','-','-','-','Sangram Patil','2013','Sangram Pvt Ltd','214','250','E4','Marathi','Returned'),('2023-06-10','BCA','BCA1','Textbook','486','Operating System Concepts','Essentials','Operating System','10th Edition','5','Abraham Silberschatz','Peter B Galvin','Greg Gagne','-','Sangram Patil','2012','Sangram Pvt Ltd','254','300','A5','English','Issued'),('2023-06-10','BCA','BCA2','Textbook','486','Operating System Concepts','Essentials','Operating System','10th Edition','5','Abraham Silberschatz','Peter B Galvin','Greg Gagne','-','Sangram Patil','2012','Sangram Pvt Ltd','254','300','A5','English','Issued'),('2023-06-10','BCA','BCA3','Textbook','486','Operating System Concepts','Essentials','Operating System','10th Edition','5','Abraham Silberschatz','Peter B Galvin','Greg Gagne','-','Sangram Patil','2012','Sangram Pvt Ltd','254','300','A5','English','Returned'),('2023-06-10','BCA','BCA4','Textbook','486','Operating System Concepts','Essentials','Operating System','10th Edition','5','Abraham Silberschatz','Peter B Galvin','Greg Gagne','-','Sangram Patil','2012','Sangram Pvt Ltd','254','300','A5','English','Returned'),('2023-06-10','BCA','BCA5','Textbook','486','Operating System Concepts','Essentials','Operating System','10th Edition','5','Abraham Silberschatz','Peter B Galvin','Greg Gagne','-','Sangram Patil','2012','Sangram Pvt Ltd','254','300','A5','English','Returned'),('2023-06-19','MA','MA1','Reference Book','65','fsufu','fwnfw','nwnw','72jfwj','2','jwfnw','uidnw','-','-','Sangram Patil','8565','Sangram Pvt Ltd','525','566','w5','Marathi','Returned'),('2023-06-19','MA','MA2','Reference Book','65','fsufu','fwnfw','nwnw','72jfwj','2','jwfnw','uidnw','-','-','Sangram Patil','8565','Sangram Pvt Ltd','525','566','w5','Marathi','lost'),('2023-06-20','MA','MA3','Textbook','387','ndrhh','dgdg','vdvdfv','dvf','3','dvdv','vdvdv-','-','-','Sangram Patil','2296','Sangram Pvt Ltd','56','516','d5','Marathi','Returned'),('2023-06-20','MA','MA4','Textbook','387','ndrhh','dgdg','vdvdfv','dvf','3','dvdv','vdvdv-','-','-','Sangram Patil','2296','Sangram Pvt Ltd','56','516','d5','Marathi','Returned'),('2023-06-20','MA','MA5','Textbook','387','ndrhh','dgdg','vdvdfv','dvf','3','dvdv','vdvdv-','-','-','Sangram Patil','2296','Sangram Pvt Ltd','56','516','d5','Marathi','Returned');
/*!40000 ALTER TABLE `add_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binder`
--

DROP TABLE IF EXISTS `binder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binder` (
  `bi_id` bigint(20) NOT NULL,
  `bi_name` varchar(100) DEFAULT NULL,
  `bi_company` varchar(100) DEFAULT NULL,
  `bi_phone` varchar(12) DEFAULT NULL,
  `bi_email` varchar(70) DEFAULT NULL,
  `bi_address` varchar(300) DEFAULT NULL,
  `bi_taluka` varchar(50) DEFAULT NULL,
  `bi_district` varchar(50) DEFAULT NULL,
  `bi_state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binder`
--

LOCK TABLES `binder` WRITE;
/*!40000 ALTER TABLE `binder` DISABLE KEYS */;
INSERT INTO `binder` VALUES (1,'Sangram Patil','ABCD','9579480968','sangrampatil07live@gmail.com','Islampur','Walwa ','Sangli','Maharashtra'),(2,'Aditya Sapate ','PQRS','7796709392','adityasapate2002@gmail.com','Takari','Walwa ','Sangli','Maharashtra'),(3,'Vaishnavi Patil','LMNO','9322181415','vaishnavipatil9484@gmail.com','Kapari','Shirala','Sangli','Maharashtra');
/*!40000 ALTER TABLE `binder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` bigint(10) DEFAULT NULL,
  `category_type` varchar(100) DEFAULT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (10,'Book','Textbook'),(11,'Book','Reference Book'),(12,'Journal','Biological Science'),(13,'Magazine','National'),(14,'Magazine','International'),(15,'Journal','Accounting and Finance'),(16,'Journal','Programming');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `create_user`
--

DROP TABLE IF EXISTS `create_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `create_user` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `image` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `create_user`
--

LOCK TABLES `create_user` WRITE;
/*!40000 ALTER TABLE `create_user` DISABLE KEYS */;
INSERT INTO `create_user` VALUES ('admin','123','admin','ID_Photo.jpg'),('principal','123','principal','IMG_20230424_140051.jpg'),('20202020','sang20202020','student','ID_Photo.jpg'),('20202021','vais20202021','student','Vaishnavi ID Photo .jpg'),('assistant','123','assistant','aditya.jpg'),('secretary','123','secretary','aditya.jpg'),('20202020','sang20202020','staff','ID_Photo.jpg'),('20202023','pran20202023','student','id.jpg'),('20202025','adit20202025','student','aditya.jpg'),('3028433','praj3028433','student','prajwal photo.jpg');
/*!40000 ALTER TABLE `create_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `d_id` bigint(10) DEFAULT NULL,
  `d_name` varchar(200) DEFAULT NULL,
  `course_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1000,'BCA','3'),(1001,'BSC','3'),(1002,'BBA','3'),(1003,'M.Com','2'),(1004,'B.Com','3'),(1005,'MA','2'),(1006,'BA','3'),(1007,'BCS','3');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `order_no` varchar(25) DEFAULT NULL,
  `invoice_no` varchar(25) DEFAULT NULL,
  `vendor_name` varchar(50) DEFAULT NULL,
  `invoice_date` varchar(12) DEFAULT NULL,
  `order_date` varchar(12) DEFAULT NULL,
  `amount` varchar(15) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `payment_date` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('1','123N','Sangram ','2023-02-25','2023-02-20','50000','10','Net Banking','2023-03-05'),('2','27872990','Aditya Pvt Ltd','2023-06-03','2023-06-01','40000','10','NEFT','2023-06-05'),('3','678900','Vaishnavi Pvt Ltd','2023-06-03','2023-06-01','112000','12','Cash','2023-06-07');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal` (
  `j_date_of_entry` varchar(20) DEFAULT NULL,
  `j_department` varchar(30) DEFAULT NULL,
  `j_acc_no` varchar(50) DEFAULT NULL,
  `j_category` varchar(200) DEFAULT NULL,
  `j_language` varchar(20) DEFAULT NULL,
  `j_title` varchar(300) DEFAULT NULL,
  `j_subtitle` varchar(300) DEFAULT NULL,
  `j_subject` varchar(300) DEFAULT NULL,
  `j_pages` varchar(10) DEFAULT NULL,
  `j_copies` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES ('2023-06-21','B.Com','B.Com1','Accounting and Finance','English','Advance in accounting research','Exploring Contemporary issues in financial year','Accounting Principal','248','4','Returned'),('2023-06-21','B.Com','B.Com2','Accounting and Finance','English','Advance in accounting research','Exploring Contemporary issues in financial year','Accounting Principal','248','4','Returned'),('2023-06-21','B.Com','B.Com3','Accounting and Finance','English','Advance in accounting research','Exploring Contemporary issues in financial year','Accounting Principal','248','4','Returned'),('2023-06-21','BSC','BSC1','Biological Science','English','Journal of microbiological research ','Advance in microbial studies and application','Biotechnology','425','3','Returned'),('2023-06-21','BSC','BSC2','Biological Science','English','Journal of microbiological research ','Advance in microbial studies and application','Biotechnology','425','3','Returned'),('2023-06-21','BSC','BSC3','Biological Science','English','Journal of microbiological research ','Advance in microbial studies and application','Biotechnology','425','3','Returned'),('2023-06-21','BCA','BCA1','Programming','English','Basics of programming ','Computer Language','Programming','401','3','lost'),('2023-06-21','BCA','BCA2','Programming','English','Basics of programming ','Computer Language','Programming','401','3','Returned'),('2023-06-21','BCA','BCA3','Programming','English','Basics of programming ','Computer Language','Programming','401','3','Returned');
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `language_id` bigint(20) NOT NULL,
  `language_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Marathi'),(2,'Hindi'),(3,'English'),(4,'Sanskrit');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lost_book`
--

DROP TABLE IF EXISTS `lost_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lost_book` (
  `accessing_no` varchar(20) DEFAULT NULL,
  `book_title` varchar(50) DEFAULT NULL,
  `department` varchar(15) DEFAULT NULL,
  `category` varchar(15) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `lost_disposal` varchar(10) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lost_book`
--

LOCK TABLES `lost_book` WRITE;
/*!40000 ALTER TABLE `lost_book` DISABLE KEYS */;
INSERT INTO `lost_book` VALUES ('lwg5419','svsvsiu','M.Com1003','10','2023-05-12','Missing','inw'),('ignwg9219','fwbyf','BSC1001','10','2023-05-13','Lost','wfnwi'),('BCA100010','cyuswcunw','M.Com1003','10','2023-05-19','Missing','wjwifwfjwfw'),('MA1','gggee','MA','Reference Book','2023-06-19','Missing','dde'),('MA2','fsufu','MA','Reference Book','2023-06-20','Lost','rjr');
/*!40000 ALTER TABLE `lost_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lost_journal`
--

DROP TABLE IF EXISTS `lost_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lost_journal` (
  `accessing_no` varchar(50) DEFAULT NULL,
  `journal_title` varchar(200) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `date` varchar(12) DEFAULT NULL,
  `lost_disposal` varchar(20) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lost_journal`
--

LOCK TABLES `lost_journal` WRITE;
/*!40000 ALTER TABLE `lost_journal` DISABLE KEYS */;
INSERT INTO `lost_journal` VALUES ('BCA1','Basics of programming ','BCA','Programming','2023-06-21','Lost','djfusf');
/*!40000 ALTER TABLE `lost_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lost_magazine`
--

DROP TABLE IF EXISTS `lost_magazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lost_magazine` (
  `accessing_no` varchar(20) DEFAULT NULL,
  `magazine_title` varchar(50) DEFAULT NULL,
  `category` varchar(15) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `lost_disposal` varchar(10) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lost_magazine`
--

LOCK TABLES `lost_magazine` WRITE;
/*!40000 ALTER TABLE `lost_magazine` DISABLE KEYS */;
INSERT INTO `lost_magazine` VALUES ('sbsy14448','fnwfw','13','2023-05-13','Lost','gegege'),('BBA1','BBA Journal ','International','2023-06-21','Lost','By Student'),('BBA9','BBA Journal ','International','2023-06-23','Lost','By Student');
/*!40000 ALTER TABLE `lost_magazine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magzine`
--

DROP TABLE IF EXISTS `magzine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magzine` (
  `m_date_of_entry` varchar(20) DEFAULT NULL,
  `m_department` varchar(30) DEFAULT NULL,
  `m_acc_no` varchar(50) DEFAULT NULL,
  `m_category` varchar(20) DEFAULT NULL,
  `m_language` varchar(20) DEFAULT NULL,
  `m_title` varchar(200) DEFAULT NULL,
  `m_subtitle` varchar(200) DEFAULT NULL,
  `m_subject` varchar(200) DEFAULT NULL,
  `m_pages` varchar(10) DEFAULT NULL,
  `m_copies` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magzine`
--

LOCK TABLES `magzine` WRITE;
/*!40000 ALTER TABLE `magzine` DISABLE KEYS */;
INSERT INTO `magzine` VALUES ('2023-06-21','BSC','BSC1','National','English','Exploring the Microbial World : Unvelling the Secreat','Microbiology','Environmental ','245','5','Returned'),('2023-06-21','BSC','BSC2','National','English','Exploring the Microbial World : Unvelling the Secreat','Microbiology','Environmental ','245','5','Returned'),('2023-06-21','BSC','BSC3','National','English','Exploring the Microbial World : Unvelling the Secreat','Microbiology','Environmental ','245','5','Returned'),('2023-06-21','BSC','BSC4','National','English','Exploring the Microbial World : Unvelling the Secreat','Microbiology','Environmental ','245','5','Returned'),('2023-06-21','BSC','BSC5','National','English','Exploring the Microbial World : Unvelling the Secreat','Microbiology','Environmental ','245','5','Returned'),('2023-06-21','BSC','BSC6','National','English','Microbial World','Microbiology','Environmental Studies','300','4','Returned'),('2023-06-21','BSC','BSC7','National','English','Microbial World','Microbiology','Environmental Studies','300','4','Returned'),('2023-06-21','BSC','BSC8','National','English','Microbial World','Microbiology','Environmental Studies','300','4','Returned'),('2023-06-21','BSC','BSC9','National','English','Microbial World','Microbiology','Environmental Studies','300','4','Returned'),('2023-06-21','BBA','BBA1','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','null'),('2023-06-21','BBA','BBA2','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','Returned'),('2023-06-21','BBA','BBA3','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','Returned'),('2023-06-21','BBA','BBA4','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','Returned'),('2023-06-21','BBA','BBA5','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','Returned'),('2023-06-21','BBA','BBA6','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','Returned'),('2023-06-21','BBA','BBA7','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','Returned'),('2023-06-21','BBA','BBA8','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','Returned'),('2023-06-21','BBA','BBA9','International','English','BBA Journal ','evmwi','iwilcjwoiwf','250','3','lost');
/*!40000 ALTER TABLE `magzine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper` (
  `news_id` bigint(100) NOT NULL,
  `news_name` varchar(100) DEFAULT NULL,
  `no_of_copies` varchar(5) DEFAULT NULL,
  `news_language` varchar(50) DEFAULT NULL,
  `news_frequency` varchar(20) DEFAULT NULL,
  `news_vendor` varchar(100) DEFAULT NULL,
  `news_price` varchar(5) DEFAULT NULL,
  `monday` varchar(5) DEFAULT '0',
  `tuesday` varchar(5) DEFAULT '0',
  `wednesday` varchar(5) DEFAULT '0',
  `thursday` varchar(5) DEFAULT '0',
  `friday` varchar(5) DEFAULT '0',
  `saturday` varchar(5) DEFAULT '0',
  `sunday` varchar(5) DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper`
--

LOCK TABLES `newspaper` WRITE;
/*!40000 ALTER TABLE `newspaper` DISABLE KEYS */;
INSERT INTO `newspaper` VALUES (1,'Loksatta','1','Marathi','Weekly','Aditya','5','','','','','','',''),(2,'Pudhari','2','Marathi','Daily','ABCD','','5','5','5','5','5','6','6'),(3,'Times Of India','1','English','Weekly','ABCD','8','0','','','','','','');
/*!40000 ALTER TABLE `newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `publisher_id` bigint(10) DEFAULT NULL,
  `publisher_name` varchar(100) DEFAULT NULL,
  `publisher_address` varchar(100) DEFAULT NULL,
  `publisher_state` varchar(50) DEFAULT NULL,
  `publisher_district` varchar(50) DEFAULT NULL,
  `publisher_taluka` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Sangram Patil','Islampur','Maharashtra','Sangli','Walwa'),(2,'Aditya Sapate ','Islampur','Maharashtra','Sangli','Walwa'),(3,'Vaishnavi Patil','Kapari','Maharashtra','Sangli','Shirala');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `registration_no` bigint(10) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `dob` varchar(12) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `taluka` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `staff_photo` blob,
  `sign` blob,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (20202020,'BCA','Sangram Subhash Patil','2002-11-09','9579480968','sangrampatil07live@gmail.com','Tiranga Chowk','Islampur','Maharashtra','Sangli','Walwa','Male','ID_Photo.jpg','Sign.jpg','sang20202020','staff');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_fine`
--

DROP TABLE IF EXISTS `staff_fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_fine` (
  `t_id` bigint(20) NOT NULL,
  `book_accessing_no` varchar(10) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `issue_date` varchar(12) DEFAULT NULL,
  `expected_return_date` varchar(12) DEFAULT NULL,
  `return_date` varchar(12) DEFAULT NULL,
  `total_days` varchar(5) DEFAULT NULL,
  `fine` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_fine`
--

LOCK TABLES `staff_fine` WRITE;
/*!40000 ALTER TABLE `staff_fine` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_issue`
--

DROP TABLE IF EXISTS `staff_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_issue` (
  `rid` bigint(10) NOT NULL AUTO_INCREMENT,
  `book_accessing_no` varchar(20) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `return_date` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_issue`
--

LOCK TABLES `staff_issue` WRITE;
/*!40000 ALTER TABLE `staff_issue` DISABLE KEYS */;
INSERT INTO `staff_issue` VALUES (1,'BCA2','20202020','2023-06-11','2023-06-26');
/*!40000 ALTER TABLE `staff_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_return`
--

DROP TABLE IF EXISTS `staff_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_return` (
  `rid` bigint(20) NOT NULL,
  `book_accessing_no` varchar(20) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `return_date` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_return`
--

LOCK TABLES `staff_return` WRITE;
/*!40000 ALTER TABLE `staff_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `registration_no` bigint(10) DEFAULT NULL,
  `stud_department` varchar(50) DEFAULT NULL,
  `stud_year` varchar(20) DEFAULT NULL,
  `stud_name` varchar(100) DEFAULT NULL,
  `stud_mobno` varchar(12) DEFAULT NULL,
  `stud_dob` varchar(12) DEFAULT NULL,
  `stud_email` varchar(70) DEFAULT NULL,
  `stud_address` varchar(200) DEFAULT NULL,
  `stud_city` varchar(100) DEFAULT NULL,
  `stud_pincode` varchar(10) DEFAULT NULL,
  `stud_state` varchar(30) DEFAULT NULL,
  `stud_district` varchar(30) DEFAULT NULL,
  `stud_taluka` varchar(30) DEFAULT NULL,
  `stud_gender` varchar(10) DEFAULT NULL,
  `stud_photo` blob,
  `stud_sign` blob,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (20202020,'BCA','3','Sangram Subhash Patil','9579480968','2002-11-09','sangrampatil07live@gmail.com','Tiranga Chowk','Islampur','415409','Maharashtra','Sangli','Walwa','Male','ID_Photo.jpg','Sign.jpg','sang20202020','student'),(20202021,'BCA','3','Vaishanavi Sanjay Patil','9322181415','2002-12-17','vaishnavipatil9484@gmail.com','kapari','Shirala','415408','Maharashtra','Sangli','Shirala','Female','Vaishnavi ID Photo .jpg','Sign.jpg','vais20202021','student'),(20202023,'BCA','3','Pranjal Prakash Gadkari','8767726810','2001-08-30','pranjalgadkari007@gmail.com','Pune','Hinjawadi','415124','Maharashtra','Pune','Haveli','Female','id.jpg','Sign.jpg','pran20202023','student'),(20202025,'BCA','3','Aditya Dilip Sapate','7796709392','2002-10-10','adityasapate2002@gmail.com','Takari','Takari','4153013','Maharashtra','Sangli','Walwa','Male','aditya.jpg','Sign.jpg','adit20202025','student'),(3028433,'BCA','3','Prajwal Anil Magdum','9021020676','2002-09-02','magdumprajwal0630@gmail.com','Walwa','Walwa','416313','Maharashtra','Sangli','Walwa','Male','prajwal photo.jpg','prajwal sign.jpg','praj3028433','student');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_fine`
--

DROP TABLE IF EXISTS `student_fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_fine` (
  `t_id` bigint(20) NOT NULL,
  `book_accessing_no` varchar(10) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `issue_date` varchar(12) DEFAULT NULL,
  `expected_return_date` varchar(12) DEFAULT NULL,
  `return_date` varchar(12) DEFAULT NULL,
  `total_days` varchar(5) DEFAULT NULL,
  `fine` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_fine`
--

LOCK TABLES `student_fine` WRITE;
/*!40000 ALTER TABLE `student_fine` DISABLE KEYS */;
INSERT INTO `student_fine` VALUES (3,'BBA2','20202025','2023-06-14','2023-06-29','2023-07-04','5','10'),(4,'20202025','20202025','2023-06-15','2023-06-30','2023-07-16','16','32');
/*!40000 ALTER TABLE `student_fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_issue`
--

DROP TABLE IF EXISTS `student_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_issue` (
  `rid` bigint(10) NOT NULL AUTO_INCREMENT,
  `book_accessing_no` varchar(20) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `return_date` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_issue`
--

LOCK TABLES `student_issue` WRITE;
/*!40000 ALTER TABLE `student_issue` DISABLE KEYS */;
INSERT INTO `student_issue` VALUES (1,'BCA1','20202025','2023-06-10','2023-06-25'),(2,'BCA1','20202025','2023-06-11','2023-06-26'),(3,'BBA2','20202025','2023-06-14','2023-06-29'),(4,'20202025','20202025','2023-06-15','2023-06-30'),(5,'2684486','976+255','2023-06-19','2023-07-04'),(6,'2684486','976+255','2023-06-19','2023-07-04'),(7,'2684486','20202025','2023-06-19','2023-07-04'),(8,'BBA1','20202025','2023-06-23','2023-07-08');
/*!40000 ALTER TABLE `student_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_return`
--

DROP TABLE IF EXISTS `student_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_return` (
  `rid` bigint(20) NOT NULL,
  `book_accessing_no` varchar(20) DEFAULT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `return_date` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_return`
--

LOCK TABLES `student_return` WRITE;
/*!40000 ALTER TABLE `student_return` DISABLE KEYS */;
INSERT INTO `student_return` VALUES (1,'BCA1','20202025','2023-06-07'),(3,'BBA2','20202025','2023-07-04'),(4,'20202025','20202025','2023-07-16');
/*!40000 ALTER TABLE `student_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `update_newspaper`
--

DROP TABLE IF EXISTS `update_newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `update_newspaper` (
  `date` varchar(12) DEFAULT NULL,
  `news_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `update_newspaper`
--

LOCK TABLES `update_newspaper` WRITE;
/*!40000 ALTER TABLE `update_newspaper` DISABLE KEYS */;
INSERT INTO `update_newspaper` VALUES ('2023-05-11','Loksatta'),('2023-05-11','Pudhari'),('2023-05-11','Times Of India'),('2023-05-12','Loksatta'),('2023-05-12','Pudhari'),('2023-05-12','Times Of India'),('2023-05-12','Loksatta'),('2023-06-11','Loksatta'),('2023-06-11','Pudhari');
/*!40000 ALTER TABLE `update_newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `v_id` varchar(5) NOT NULL,
  `v_name` varchar(100) DEFAULT NULL,
  `v_company` varchar(100) DEFAULT NULL,
  `v_phone` varchar(12) DEFAULT NULL,
  `v_email` varchar(70) DEFAULT NULL,
  `v_address` varchar(300) DEFAULT NULL,
  `v_taluka` varchar(50) DEFAULT NULL,
  `v_district` varchar(50) DEFAULT NULL,
  `v_state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES ('1','Sangram Patil','Sangram Pvt Ltd','9579480968','sangrampatil07live@gmail.com','Islampur','Walwa','Sangli','Maharashtra'),('2','Aditya Sapate','Aditya Pvt Ltd','7796709392','adityasapate2002@gmail.com','Takari','Walwa','Sangli','Maharashtra'),('3','Vaishnavi Patil','Vaishnavi Pvt Ltd','9322181415','vaishnavipatil9484@gmail.com','Kapari','Shirala','Sangli','Maharashtra');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-24  9:53:43
