-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cfms_newschema
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `coordinatorlist`
--

DROP TABLE IF EXISTS `coordinatorlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinatorlist` (
  `listID` int(11) NOT NULL AUTO_INCREMENT,
  `semYear` varchar(7) NOT NULL,
  `subjectID` varchar(45) NOT NULL,
  `sectionCount` varchar(45) NOT NULL,
  `coordinatorID` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Incomplete',
  PRIMARY KEY (`listID`),
  UNIQUE KEY `listID_UNIQUE` (`listID`),
  KEY `coorList_subID_idx` (`subjectID`),
  KEY `coorList_coorID_idx` (`coordinatorID`),
  KEY `coorList_entryID` (`semYear`),
  CONSTRAINT `coorList_coorID` FOREIGN KEY (`coordinatorID`) REFERENCES `userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `coorList_subID` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinatorlist`
--

LOCK TABLES `coordinatorlist` WRITE;
/*!40000 ALTER TABLE `coordinatorlist` DISABLE KEYS */;
INSERT INTO `coordinatorlist` VALUES (9,'1-13/14','SCSD1513','4','ID06','Incomplete'),(10,'1-13/14','SCSI1013','4',NULL,'Incomplete'),(11,'1-13/14','SCSJ1013','4',NULL,'Incomplete'),(12,'1-13/14','SCSR1013','4',NULL,'Incomplete'),(13,'1-13/14','UHAS1162','4',NULL,'Incomplete'),(14,'1-13/14','ULAB1122','4',NULL,'Incomplete'),(16,'2-12/13','SCSI1113','4',NULL,'Incomplete'),(17,'2-12/13','SCSJ1023','4',NULL,'Incomplete'),(18,'2-12/13','SCSR1213','4',NULL,'Incomplete'),(19,'2-12/13','SCSV1223','4',NULL,'Incomplete'),(20,'2-12/13','SQB1143','4',NULL,'Incomplete'),(21,'2-12/13','UICI1012','4',NULL,'Incomplete'),(22,'2-12/13','UKQXxxx1','2',NULL,'Incomplete'),(23,'2-12/13','ULAM2112','2',NULL,'Incomplete');
/*!40000 ALTER TABLE `coordinatorlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseID` varchar(5) NOT NULL,
  `courseName` varchar(45) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('1SCSB','  Bioinformatics 1'),('1SCSJ','Software Engineering 1'),('1SCSR','Computer Network and Security 1'),('1SCSV','Graphics and Multimedia Software 1'),('2SCSB','Bioinformatics 2'),('2SCSJ','Software Engineering 2'),('2SCSR','Computer Network and Security 2'),('2SCSV','Graphics and Multimedia Software 2'),('3SCSB','Bioinformatics 3'),('3SCSJ','Software Engineering 3'),('3SCSR','Computer Network and Security 3'),('3SCSV','Graphics and Multimedia Software 3'),('4SCSB','Bioinformatics 4'),('4SCSJ','Software Engineering 4'),('4SCSR','Computer Network and Security 4'),('4SCSV','Graphics and Multimedia Software 4');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseentry`
--

DROP TABLE IF EXISTS `courseentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courseentry` (
  `courseEntryID` int(11) NOT NULL AUTO_INCREMENT,
  `courseID` varchar(5) NOT NULL,
  `semYear` varchar(45) NOT NULL,
  PRIMARY KEY (`courseEntryID`),
  UNIQUE KEY `courseentry` (`courseID`,`semYear`),
  KEY `courseEntry_courseID_idx` (`courseID`),
  CONSTRAINT `courseEntry_courseID` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseentry`
--

LOCK TABLES `courseentry` WRITE;
/*!40000 ALTER TABLE `courseentry` DISABLE KEYS */;
INSERT INTO `courseentry` VALUES (15,'1SCSB','1-13/14'),(17,'1SCSB','2-12/13'),(5,'1SCSJ','1-13/14'),(1,'1SCSJ','1-14/15'),(7,'1SCSJ','1-15/16'),(2,'1SCSV','1-14/15'),(11,'1SCSV','2-14/15'),(3,'2SCSJ','1-14/15'),(4,'2SCSV','1-14/15'),(16,'4SCSJ','1-15/16');
/*!40000 ALTER TABLE `courseentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filechangelog`
--

DROP TABLE IF EXISTS `filechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filechangelog` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `fileID` int(11) NOT NULL,
  `action` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` varchar(45) NOT NULL,
  PRIMARY KEY (`logID`),
  KEY `subFile_fileID_idx` (`fileID`),
  KEY `fileLog_userID_idx` (`userID`),
  CONSTRAINT `fileLog_fileID` FOREIGN KEY (`fileID`) REFERENCES `subjectfile` (`fileID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fileLog_userID` FOREIGN KEY (`userID`) REFERENCES `userinfo` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filechangelog`
--

LOCK TABLES `filechangelog` WRITE;
/*!40000 ALTER TABLE `filechangelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `filechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectlist`
--

DROP TABLE IF EXISTS `lectlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectlist` (
  `listID` int(11) NOT NULL AUTO_INCREMENT,
  `courseEntryID` int(11) DEFAULT NULL,
  `lecturerID` varchar(45) DEFAULT NULL,
  `subjectID` varchar(45) NOT NULL,
  `sectionNo` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`listID`),
  KEY `lectList_subID_idx` (`subjectID`),
  KEY `lectList_secNo_idx` (`sectionNo`),
  KEY `subList_lectID_idx` (`lecturerID`),
  KEY `lectList_courseEntryID_idx` (`courseEntryID`),
  CONSTRAINT `lectList_courseID` FOREIGN KEY (`courseEntryID`) REFERENCES `courseentry` (`courseEntryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lectList_lectID` FOREIGN KEY (`lecturerID`) REFERENCES `userinfo` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lectList_subID` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectlist`
--

LOCK TABLES `lectlist` WRITE;
/*!40000 ALTER TABLE `lectlist` DISABLE KEYS */;
INSERT INTO `lectlist` VALUES (2,15,'ID02','SCSD1513','1','Pending'),(3,15,'ID03','SCSD1513','2','Pending'),(4,15,'ID04','SCSD1513','3','Pending'),(5,15,'ID01','SCSD1513','0','Pending'),(6,15,'ID02','SCSD1513','1','Pending'),(7,17,'ID09','SCSD1513','1','Pending');
/*!40000 ALTER TABLE `lectlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presetsubjects`
--

DROP TABLE IF EXISTS `presetsubjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presetsubjects` (
  `courseID` varchar(5) NOT NULL,
  `subjectID` varchar(8) NOT NULL,
  `semester` int(2) NOT NULL,
  PRIMARY KEY (`courseID`,`subjectID`),
  KEY `preset_subject_idx` (`subjectID`),
  CONSTRAINT `preset_course` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `preset_subject` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presetsubjects`
--

LOCK TABLES `presetsubjects` WRITE;
/*!40000 ALTER TABLE `presetsubjects` DISABLE KEYS */;
INSERT INTO `presetsubjects` VALUES ('1SCSB','SCSD1513',1),('1SCSB','SCSI1013',1),('1SCSB','SCSI1113',2),('1SCSB','SCSJ1013',1),('1SCSB','SCSJ1023',2),('1SCSB','SCSR1013',1),('1SCSB','SCSR1213',2),('1SCSB','SCSV1223',2),('1SCSB','SQB1143',2),('1SCSB','UHAS1162',1),('1SCSB','UHAS1172',1),('1SCSB','UICI1012',2),('1SCSB','UKQXxxx1',2),('1SCSB','ULAB1122',1),('1SCSB','ULAM2112',2),('1SCSJ','SCSD1513',1),('1SCSJ','SCSI1013',1),('1SCSJ','SCSI1113',2),('1SCSJ','SCSJ1013',1),('1SCSJ','SCSJ1023',2),('1SCSJ','SCSR1013',1),('1SCSJ','SCSR1213',2),('1SCSJ','SCSV1223',2),('1SCSJ','UHAS1162',1),('1SCSJ','UHAS1172',1),('1SCSJ','UICI1012',2),('1SCSJ','UKQXxxx1',2),('1SCSJ','ULAB1122',1),('1SCSJ','ULAM2112',2),('1SCSR','SCSD1513',1),('1SCSR','SCSI1013',1),('1SCSR','SCSI1113',2),('1SCSR','SCSJ1013',1),('1SCSR','SCSJ1023',2),('1SCSR','SCSR1013',1),('1SCSR','SCSR1213',2),('1SCSR','SCSV1223',2),('1SCSR','UHAS1162',1),('1SCSR','UHAS1172',1),('1SCSR','UICI1012',2),('1SCSR','UKQXxxx1',2),('1SCSR','ULAB1122',1),('1SCSR','ULAM2112',2),('1SCSV','SCSD1513',1),('1SCSV','SCSI1013',1),('1SCSV','SCSJ1013',1),('1SCSV','SCSJ1023',2),('1SCSV','SCSR1013',1),('1SCSV','SCSR1213',2),('1SCSV','SCSV1113',2),('1SCSV','SCSV1223',2),('1SCSV','UHAS1162',1),('1SCSV','UHAS1172',1),('1SCSV','UICI1012',2),('1SCSV','UKQXxxx1',2),('1SCSV','ULAB1122',1),('1SCSV','ULAM2112',2),('2SCSB','SCSB2103',2),('2SCSB','SCSD2523',1),('2SCSB','SCSD2613',1),('2SCSB','SCSD2623',2),('2SCSB','SCSI2143',2),('2SCSB','SCSJ2013',1),('2SCSB','SCSJ2154',2),('2SCSB','SCSJ2203',2),('2SCSB','SCSR2033',1),('2SCSB','SCSR2043',2),('2SCSB','SCSV2113',1),('2SCSB','UICI2022',1),('2SCSB','UKQXxxx2',1),('2SCSB','ULAB2122',2),('2SCSJ','SCSD2523',1),('2SCSJ','SCSD2613',1),('2SCSJ','SCSI2143',2),('2SCSJ','SCSJ2013',1),('2SCSJ','SCSJ2154',2),('2SCSJ','SCSJ2203',2),('2SCSJ','SCSJ2253',2),('2SCSJ','SCSJ2363',2),('2SCSJ','SCSR2033',1),('2SCSJ','SCSR2043',2),('2SCSJ','SCSV2113',1),('2SCSJ','UICI2022',1),('2SCSJ','UKQXxxx2',1),('2SCSJ','ULAB2122',2),('2SCSR','SCSD2523',1),('2SCSR','SCSD2613',1),('2SCSR','SCSD2623',2),('2SCSR','SCSI2143',2),('2SCSR','SCSJ2013',1),('2SCSR','SCSJ2154',2),('2SCSR','SCSJ2203',2),('2SCSR','SCSR2033',1),('2SCSR','SCSR2043',2),('2SCSR','SCSR2242',2),('2SCSR','SCSR2941',2),('2SCSR','SCSV2113',1),('2SCSR','UICI2022',1),('2SCSR','UKQXxxx2',1),('2SCSR','ULAB2122',2),('2SCSV','SCSD2523',1),('2SCSV','SCSD2613',1),('2SCSV','SCSJ2013',1),('2SCSV','SCSR2033',1),('2SCSV','SCSV2113',1),('2SCSV','UICI2022',1),('2SCSV','UKQXxxx2',1),('3SCSB','SCSB3032',2),('3SCSB','SCSB3103',1),('3SCSB','SCSB3133',1),('3SCSB','SCSB3203',1),('3SCSB','SCSB3213',2),('3SCSB','SCSB3223',2),('3SCSB','SCSB4243',2),('3SCSB','SCSD3761',2),('3SCSB','SCSJ3104',1),('3SCSB','SCSJ3253',1),('3SCSB','SCSJ3553',1),('3SCSB','SQB3683',2),('3SCSB','UCSD2762',2),('3SCSB','UHAS2XX2',2),('3SCSB','ULAB3162',1),('3SCSJ','SCSD3761',2),('3SCSJ','SCSJ3032',2),('3SCSJ','SCSJ3104',1),('3SCSJ','SCSJ3203',1),('3SCSJ','SCSJ3253',2),('3SCSJ','SCSJ3303',1),('3SCSJ','SCSJ3323',2),('3SCSJ','SCSJ3343',1),('3SCSJ','SCSJ3403',2),('3SCSJ','SCSJ3553',1),('3SCSJ','SCSJ3563',2),('3SCSJ','SCSJ3603',1),('3SCSJ','UCSD2762',2),('3SCSJ','UHAS2XX2',2),('3SCSJ','ULAB3162',1),('3SCSR','SCSD3761',2),('3SCSR','SCSJ3203',1),('3SCSR','SCSJ3553',1),('3SCSR','SCSR3032',2),('3SCSR','SCSR3104',1),('3SCSR','SCSR3242',1),('3SCSR','SCSR3243',2),('3SCSR','SCSR3253',2),('3SCSR','SCSR3413',1),('3SCSR','SCSR3443',2),('3SCSR','SCSR3941',1),('3SCSR','SCSR4273',1),('3SCSR','SCSR4283',2),('3SCSR','UCSD2762',2),('3SCSR','UHAS2XX2',2),('3SCSR','ULAB3162',1),('3SCSV','SCSD3761',2),('3SCSV','SCSJ3253',1),('3SCSV','SCSJ3553',1),('3SCSV','SCSR3243',1),('3SCSV','SCSV3032',2),('3SCSV','SCSV3104',1),('3SCSV','SCSV3113',1),('3SCSV','SCSV3123',1),('3SCSV','SCSV3213',2),('3SCSV','SCSV3223',2),('3SCSV','SCSV3233',2),('3SCSV','SCSV4233',2),('3SCSV','SCSV4283',2),('3SCSV','UCSD2762',2),('3SCSV','UHAS2XX2',2),('3SCSV','ULAB3162',1),('4SCSB','SCSB4114',1),('4SCSB','SCSB4118',1),('4SCSB','SCSB4134',2),('4SCSB','SCSB4213',2),('4SCSB','SCSB4313',2),('4SCSB','SCSJ3303',2),('4SCSB','SQB4713',2),('4SCSB','ULAx2112',2),('4SCSJ','SCSJ4114',1),('4SCSJ','SCSJ4118',1),('4SCSJ','SCSJ4134',2),('4SCSJ','SCSJ4383',2),('4SCSJ','SCSJ4423',2),('4SCSJ','SCSJ4463',2),('4SCSJ','SCSJ4483',2),('4SCSJ','ULAX2112',2),('4SCSR','SCSR4114',1),('4SCSR','SCSR4118',1),('4SCSR','SCSR4134',2),('4SCSR','SCSR4453',2),('4SCSR','SCSR4473',2),('4SCSR','SCSR4483',2),('4SCSR','SCSR4493',2),('4SCSR','SCSR4973',2),('4SCSR','ULAX2112',2),('4SCSV','SCSV4114',1),('4SCSV','SCSV4118',1),('4SCSV','SCSV4134',2),('4SCSV','SCSV4213',2),('4SCSV','SCSV4233',2),('4SCSV','SCSV4263',2),('4SCSV','SCSV4273',2),('4SCSV','ULAX2112',2);
/*!40000 ALTER TABLE `presetsubjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectID` varchar(8) NOT NULL,
  `subjectName` varchar(80) NOT NULL,
  PRIMARY KEY (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('SCSB2103','Bioformatics I'),('SCSB3032','Bioinformatic Project I'),('SCSB3103','Bioinformatics II'),('SCSB3133','Computational Biology I'),('SCSB3203','Programming for Bioinformatics'),('SCSB3213','Bioinformatics Database'),('SCSB3223','Computational Biology II'),('SCSB4114','Industrial Training Report'),('SCSB4118','Industrial Training(HW)'),('SCSB4134','Bioinformatic Project II'),('SCSB4213','Bioinformatics Visualisation'),('SCSB4243','Special Topics in Bioinformatics'),('SCSB4313','Bioinformatics Modeling and Simulation'),('SCSD1513','Technology and Information System'),('SCSD2523','Database'),('SCSD2613','System Analysis and Design'),('SCSD2623','Database Programming'),('SCSD3761','Technopreneurship Seminar'),('SCSI1013','Discrete Structure'),('SCSI1113','Computational Mathematics'),('SCSI2143','Probability & Statistical Data Analysis'),('SCSJ1013','Programming Technique I'),('SCSJ1023','Programming Technique II'),('SCSJ2013','Data Stucture and Algorithm'),('SCSJ2033','Computer Organization and Architecture'),('SCSJ2154','Object Oriented Programming'),('SCSJ2203','Software Engineering'),('SCSJ2253','Requirement Engineering & Software'),('SCSJ2363','Software Project Management'),('SCSJ3032','Software Engineering Project I'),('SCSJ3104','Application Development'),('SCSJ3203','Computer Science Theory'),('SCSJ3253','Programming Technique III'),('SCSJ3303','Internet Programming'),('SCSJ3323','Software Design & Architecture'),('SCSJ3343','Software Quality Assurance'),('SCSJ3403','Special Topics in Software Engineering'),('SCSJ3553','Artificial Intelligence'),('SCSJ3563','Computational Intelligence'),('SCSJ3603','Knowledge-based Expert System'),('SCSJ4114','Industrial Training Report'),('SCSJ4118','Industrial Training(HW)'),('SCSJ4134','Software Engineering Project II'),('SCSJ4383','Software Construction'),('SCSJ4423','Real-time Software Engineering'),('SCSJ4463','Agent-Oriented Software Engineering'),('SCSJ4483','Web Technology'),('SCSR1013','Digital Logic'),('SCSR1213','Network Communications'),('SCSR2033','Computer Organization and Architecture'),('SCSR2043','Operating System'),('SCSR2242','Computer Networks'),('SCSR2941','Computer Networks Lab'),('SCSR3032','Computer Network & Security Project I'),('SCSR3104','Application Development'),('SCSR3242','Inter Networking Technology'),('SCSR3243','Netcentric Programming'),('SCSR3253','Network Programming'),('SCSR3413','Computer Security'),('SCSR3443','Cryptography'),('SCSR3941','Inter Networking Technology Lab'),('SCSR4114','Industrial Training Report'),('SCSR4118','Industrial Training(HW)'),('SCSR4134','Computer Network & Security Project II'),('SCSR4273','Network Administration and Management'),('SCSR4283','Network Analysis and Design Simulation'),('SCSR4453','Network Security'),('SCSR4473','Security Management'),('SCSR4483','Security Programming'),('SCSR4493','Computer Forensic'),('SCSR4973','Computer Network & Security Special Topic'),('SCSV1113','Mathematics for Computer Graphics'),('SCSV1223','Web Programming'),('SCSV2113','Human Computer Interaction'),('SCSV2122','Fundamental of Image Processing'),('SCSV3032','Graphics and Multimedia Software Project I'),('SCSV3104','Application Development'),('SCSV3113','Geometric Modeling'),('SCSV3123','Real-time Computer Graphics'),('SCSV3213','Fundamental of Image Processing'),('SCSV3223','Multimedia Data Processing'),('SCSV3233','Multimedia Networking'),('SCSV4114','Industrial Training Report'),('SCSV4118','Industrial Training(HW)'),('SCSV4134','Graphics and Multimedia Software '),('SCSV4213','Computer Games Development'),('SCSV4233','Data Visualisation'),('SCSV4263','Multimedia Web Programming'),('SCSV4273','Introduction to Speech Recognition'),('SCSV4283','Windows Programming'),('SQB1143','Molecular and Cellular Biology'),('SQB3683','Structure And Function of Proteins'),('SQB4713','Genomics and Proteomics'),('UCSD2762','Fundamental of Technopreneurship'),('UHAS1162','Art,Custom and Beliefs of Malaysia (International)'),('UHAS1172','Malaysia Dynamic'),('UHAS2XX2','Innovation and Creativity Sub cluster-Choose 1 from 3 electives'),('UICI1012','TITAS '),('UICI2022','Science, Technology and Human'),('UKQXxxx1','Co-Curriculum'),('UKQXxxx2','Co-Curriculum'),('ULAB1122','Academic English Skills'),('ULAB2122','Advanced Academic English Skills'),('ULAB3162','English for Profesional Purpose'),('ULAM2112','Bahasa Melayu Untuk Komunikasi(International) '),('ULAx2112','Elective Foreign Language');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectfile`
--

DROP TABLE IF EXISTS `subjectfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectfile` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `sub_sectionID` int(11) DEFAULT NULL,
  `fileType` varchar(45) NOT NULL,
  `fileName` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Pending',
  `fileLocation` varchar(255) NOT NULL,
  PRIMARY KEY (`fileID`),
  KEY `subjectFile_subID_idx` (`sub_sectionID`),
  CONSTRAINT `subjectFile_subID` FOREIGN KEY (`sub_sectionID`) REFERENCES `lectlist` (`listID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectfile`
--

LOCK TABLES `subjectfile` WRITE;
/*!40000 ALTER TABLE `subjectfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjectfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `userID` varchar(45) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `userType` varchar(45) NOT NULL,
  `jabatan` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('ID01','admin','abc123','1','SC','admin'),('ID02','pentadbir','abc123','2','SC','pentadbir'),('ID03','kjscsj','abc123','2','SCSJ','kjscsj'),('ID04','kjscsv','abc123','2','SCSV','kjscsv'),('ID05','kjscsr','abc123','2','SCSR','kjscsr'),('ID06','coord1','abc123','3','SCSJ','coord1'),('ID07','coord2','abc123','3','SCSV','coord2'),('ID08','coord3','abc123','3','SCSR','coord3'),('ID09','lect1','abc123','4','SCSJ','lect1'),('ID10','lect2','abc123','4','SCSV','lect2'),('ID11','lect3','abc123','4','SCSR','lect3');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-07  0:01:52
