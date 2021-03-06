-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: risk_management
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Current Database: `risk_management`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `risk_management` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `risk_management`;

--
-- Table structure for table `RiskManagement_asset`
--

DROP TABLE IF EXISTS `RiskManagement_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_code` varchar(20) NOT NULL,
  `asset_class` varchar(8) NOT NULL,
  `asset_name` varchar(50) NOT NULL,
  `use` varchar(50) NOT NULL,
  `cnt` int(11) NOT NULL,
  `model` varchar(50) NOT NULL,
  `made` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `os` varchar(50) NOT NULL,
  `version` varchar(50) NOT NULL,
  `ip` char(39) DEFAULT NULL,
  `mac` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `archive` varchar(50) NOT NULL,
  `confidential` int(11) NOT NULL,
  `integrity` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `staff_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RiskManagement_asset_4c05597f` (`staff_name_id`),
  CONSTRAINT `RiskMa_staff_name_id_2be8cd37ecab08c5_fk_RiskManagement_staff_id` FOREIGN KEY (`staff_name_id`) REFERENCES `RiskManagement_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_asset`
--

LOCK TABLES `RiskManagement_asset` WRITE;
/*!40000 ALTER TABLE `RiskManagement_asset` DISABLE KEYS */;
INSERT INTO `RiskManagement_asset` VALUES (6,'74-db-31','PC','LG','a',1,'a','a','a','Windows','8','61.42.208.140','ac-7b-a1-74-db-31','a','a',2,2,2,'a',13),(7,'74-db-31','PC','LG','a',1,'a','a','a','Windows','8','61.42.208.140','ac-7b-a1-74-db-31','a','a',2,2,2,'a',16);
/*!40000 ALTER TABLE `RiskManagement_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_asset_valuation`
--

DROP TABLE IF EXISTS `RiskManagement_asset_valuation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_asset_valuation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valuation_code` varchar(10) NOT NULL,
  `cia` varchar(1) NOT NULL,
  `rating` int(11) NOT NULL,
  `desc` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_asset_valuation`
--

LOCK TABLES `RiskManagement_asset_valuation` WRITE;
/*!40000 ALTER TABLE `RiskManagement_asset_valuation` DISABLE KEYS */;
INSERT INTO `RiskManagement_asset_valuation` VALUES (1,'CH','C',1,'낮은 수준의 비밀성'),(2,'CM','C',2,'중간 수준의 비밀성'),(3,'CL','C',3,'높은 수준의 비밀성'),(4,'IL','I',1,'낮은 수준의 무결성'),(5,'IM','I',2,'중간 수준의 무결성'),(6,'IH','I',3,'높은 수준의 무결성'),(7,'VL','A',1,'낮은 수준의 가용성'),(8,'VM','A',2,'중간 수준의 가용성'),(9,'AH','A',3,'높은 수준의 가용성');
/*!40000 ALTER TABLE `RiskManagement_asset_valuation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_company`
--

DROP TABLE IF EXISTS `RiskManagement_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corp_name` varchar(30) NOT NULL,
  `biz_reg_no` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `established` date NOT NULL,
  `biz_type` varchar(30) NOT NULL,
  `representative` varchar(30) NOT NULL,
  `sales` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_company`
--

LOCK TABLES `RiskManagement_company` WRITE;
/*!40000 ALTER TABLE `RiskManagement_company` DISABLE KEYS */;
INSERT INTO `RiskManagement_company` VALUES (1,'(주)아이시큐어','107-86-67359','서울특별시 금천구 가산디지털1로 131(가산동, 비와이씨하이시티) A동 2001-가','2005-07-20','서비스','원유준',1000000000);
/*!40000 ALTER TABLE `RiskManagement_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_department`
--

DROP TABLE IF EXISTS `RiskManagement_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depart` varchar(30) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `corpinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RiskMan_corpinfo_id_9d48237ccec5a86_fk_RiskManagement_company_id` (`corpinfo_id`),
  CONSTRAINT `RiskMan_corpinfo_id_9d48237ccec5a86_fk_RiskManagement_company_id` FOREIGN KEY (`corpinfo_id`) REFERENCES `RiskManagement_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_department`
--

LOCK TABLES `RiskManagement_department` WRITE;
/*!40000 ALTER TABLE `RiskManagement_department` DISABLE KEYS */;
INSERT INTO `RiskManagement_department` VALUES (1,'보안컨설팅','모의해킹, 취약점분석, ISMS컨설팅',1),(2,'경영지원','회계, ',1);
/*!40000 ALTER TABLE `RiskManagement_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_duty`
--

DROP TABLE IF EXISTS `RiskManagement_duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_duty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duty` varchar(20) NOT NULL,
  `outline` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_duty`
--

LOCK TABLES `RiskManagement_duty` WRITE;
/*!40000 ALTER TABLE `RiskManagement_duty` DISABLE KEYS */;
INSERT INTO `RiskManagement_duty` VALUES (1,'정보보호 최고책임자(CISO)   ','정보보호 계획과 집행의 전반적인 조정/검토/감독 등 보안 총괄 기능을 수행','<ol>\r\n<li>회사 보안관리 총괄 및 정보보호위원회 소집 건의</li>\r\n<ul>\r\n<li>회사 내의 보안 총괄</li>\r\n<li>정보보호위원회 소집, 주요 사안에 대해 협의, 의사결정 지원</li>\r\n</ul><br>\r\n<li>정보보호정책/지침, 각종 보안계획 검토 및 추진 총괄</li>\r\n<ul>\r\n<li>정보보호 정책/지침</li>\r\n<li>연간 정보보호 교육 계획</li>\r\n<li>정보보호 이행 계획</li>\r\n<li>IT 재해복구 계획, 보안 감사</li>\r\n<li>정보보호위원회 의결 추진</li>\r\n</ul><br>\r\n<li>영역별 보안관리 감독 총괄 및 감독</li>\r\n<ul>\r\n<li>서버/네트워크/보안장비/DB/문서,매체/PC/개발보안에 대한 보안현황 총괄 검토, 감독\r\n</li>\r\n</ul><br>\r\n<li>장애 및 보안사고 대응/복구 총괄 및 감독</li>\r\n<ul>\r\n<li>장애 및 보안 침해사고 발생/대응/복구/사후관리 전반에 대한 총괄 감독</li>\r\n</ul>\r\n</ol>'),(2,'개인정보 관리책임자','개인정보보호 계획과 집행의 전반적인 조정/검토/감독 등 개인정보보호 총괄 기능을 수행','1. 회사 개인정보보호 총괄 및 정보보호위원회 소집 건의\r\n- 회사 내의 개인정보보호 총괄\r\n- 정보보호위원회 소집 건의, 주요 사안에 대해 협의, 의사결정 지원\r\n\r\n2. 개인정보보호지침, 각종 보안계획 검토 및 추진 총괄 및 감독\r\n- 개인정보보호지침, 연간 개인정보보호교육 계획 수립\r\n- 개인정보보호 이행계획, 보안감사\r\n-  정보보호위원회 의결 추진\r\n- 영상정보처리기기에 대한 보호 계획 수립 및 시행\r\n\r\n3. 개인정보보호 감독 총괄 및 검토 및 감독\r\n- 개인정보취급자에 대한 관리 및 감독\r\n- 개인정보보호/안전 보안 등에 관한 보안현황 총괄 감독\r\n\r\n4. 개인정보 사고 대응/복구 총괄 감독\r\n- 개인정보 유출 및 침해사고 발생/대응/복구/사후관리 전반에 대한 총괄 감독\r\n- 개인정보 유출 및 오용, 남용 방지를 위한 내부통제시스템의 구축'),(3,'정보보호 관리책임자','정보보호 업무 관련 관리자로서 보안대책/보안정책/지침 개발, 각종 보안계획을 수립하고 이행하는 책임을 수행','<ol>\r\n    <li>회사 보안실무 관리 및 정보보호위원회 위원회 간사</li>\r\n    <ul>\r\n        <li>회사 내의 정보보호에 관한 주요활동에 관하여 검토, 확인하여 정보보호책임자에게 보고</li>\r\n        <li>정보보호위원회 소집건의, 운영 지원</li>\r\n    </ul>\r\n    <li>정보보호정책/지침, 각종 보안계획 수립</li>\r\n    <ul><li>정보보호 정책/지침, 년간 보안교육계획, 정보보호 이행계획, 업무연속성확보계획 등 각종 보안추진계획 수립</li></ul>\r\n    <li>영역별 보안관리 검토, 감독</li>\r\n    <ul><li>서버/네트워크/보안장비/DB/문서,매체보안관리/PC/개발보안/암호키에 관한 보안현황 검토, 관리감독</li></ul>\r\n    <li>관리자 비밀번호 현황 관리</li>\r\n    <ul><li>관리자 계정 및 비밀번호 현황 관리</li></ul>\r\n    <li>어플리케이션 이관 관리</li>\r\n    <ul><li>개발 완료된 어플리케이션에 대한 사전 보안성 평가, 운영서버 이관 수행</li></ul>\r\n    <li>위험평가 시행결과 검토, 확인</li>\r\n    <ul><li>연 1회 위험분석 수행결과 검토, 확인</li></ul>\r\n    <li>장애 및 보안사고 대응/복구 검토 및 조정</li>\r\n    <ul><li>장애 및 보안 침해사고(개인정보보호포함) 발생/대응/복구/사후관리 전반에 대한 검토 및 조정</li></ul>\r\n</ol>'),(4,'정보보호 담당자','정보보호 업무 관련 담당자로서 보안대책/보안정책/지침 개발, 각종 보안계획을 이행하는 역할을 수행','<ol>\r\n<li> 회사 보안실무 관리 및 정보보호위원회 위원회 간사</li>\r\n    <ul>\r\n    <li>회사 내의 정보보호에 관한 주요활동에 관하여 검토, 확인하여 정보보호관리자,최고책임자에게 보고</li>\r\n    <li>정보보호위원회 소집건의, 운영 지원</li>\r\n    </ul>\r\n<li>정보보호정책/지침, 각종 보안계획 이행</li>\r\n    <ul><li>정보보호 정책/지침, 년간 보안교육계획, 정보보호 이행계획, 업무연속성확보계획 등 각종 보안추진계획 이행</li></ul>\r\n<li>영역별 보안관리 점검</li>\r\n    <ul><li>서버/네트워크/보안장비/DB/문서,매체보안관리/PC/개발보안/암호키에 관한 보안현황 점검</li></ul>\r\n<li>위험평가 수행</li>\r\n    <ul><li>연 1회 위험분석 수행</li></ul>\r\n<li>장애 및 보안사고 대응/복구 지원</li>\r\n    <ul><li>장애 및 보안 침해사고(개인정보보호포함) 발생/대응/복구/사후관리 전반에 대한 지원</li></ul>\r\n</ol>'),(5,'개인정보보호담당자','개인정보보호 계획과 집행의 전반적인 조정/검토 등 개인정보보호 총괄 기능을 수행','1. 회사 개인정보보호 총괄 및 정보보호위원회 간사\r\n- 회사 내의 개인정보보호 활동에 관하여 검토, 확인하여 개인정보관리책임자에게 보고\r\n- 정보보호위원회 소집건의, 운영 지원\r\n\r\n2. 개인정보보호지침, 각종 보안계획 이행\r\n- 개인정보보호지침, 개인정보취급방침 개정\r\n- 연간 개인정보보호교육 계획 수립\r\n- 개인정보보호 관리(개인정보의 열람, 수집, 저장, 이용, 처리)\r\n\r\n3. 개인정보보호 점검 및 수행\r\n- 개인정보취급자에 대한 관리\r\n- 개인정보보호/안전 보안 등에 관한 보안현황 점검\r\n\r\n4. 개인정보 사고 대응/복구 지원\r\n- 개인정보 유출 및 침해사고 발생/대응/복구/사후관리 전반에 대한 지원\r\n- 개인정보 유출 및 오용, 남용 방지를 위한 내부통제시스템의 구축 지원');
/*!40000 ALTER TABLE `RiskManagement_duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_mapping`
--

DROP TABLE IF EXISTS `RiskManagement_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mapping_code` varchar(20) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RiskManageme_asset_id_c0830d54785446a_fk_RiskManagement_asset_id` (`asset_id`),
  CONSTRAINT `RiskManageme_asset_id_c0830d54785446a_fk_RiskManagement_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `RiskManagement_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_mapping`
--

LOCK TABLES `RiskManagement_mapping` WRITE;
/*!40000 ALTER TABLE `RiskManagement_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `RiskManagement_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_partner`
--

DROP TABLE IF EXISTS `RiskManagement_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `outline` varchar(30) NOT NULL,
  `desc` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_partner`
--

LOCK TABLES `RiskManagement_partner` WRITE;
/*!40000 ALTER TABLE `RiskManagement_partner` DISABLE KEYS */;
INSERT INTO `RiskManagement_partner` VALUES (1,'(주)코리아센터닷컴','쇼핑몰 ASP','결제 서비스 활용중, 계약서');
/*!40000 ALTER TABLE `RiskManagement_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_risk_analysis`
--

DROP TABLE IF EXISTS `RiskManagement_risk_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_risk_analysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_code` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `asset_id` int(11) NOT NULL,
  `vul_code_id` int(11) NOT NULL,
  `threat_code_id` int(11),
  PRIMARY KEY (`id`),
  KEY `RiskManagem_asset_id_3a1871bbbcc7799c_fk_RiskManagement_asset_id` (`asset_id`),
  KEY `RiskManagement_risk_analysis_d0efc989` (`vul_code_id`),
  KEY `RiskManagement_risk_analysis_34a3eb19` (`threat_code_id`),
  CONSTRAINT `Risk_threat_code_id_5a01d067404d9ee6_fk_RiskManagement_threat_id` FOREIGN KEY (`threat_code_id`) REFERENCES `RiskManagement_threat` (`id`),
  CONSTRAINT `RiskManagem_asset_id_3a1871bbbcc7799c_fk_RiskManagement_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `RiskManagement_asset` (`id`),
  CONSTRAINT `R_vul_code_id_376bdb90a3030d02_fk_RiskManagement_vul_analysis_id` FOREIGN KEY (`vul_code_id`) REFERENCES `RiskManagement_vul_analysis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_risk_analysis`
--

LOCK TABLES `RiskManagement_risk_analysis` WRITE;
/*!40000 ALTER TABLE `RiskManagement_risk_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `RiskManagement_risk_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_risk_control`
--

DROP TABLE IF EXISTS `RiskManagement_risk_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_risk_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_item` varchar(50) NOT NULL,
  `risk_action` varchar(20) NOT NULL,
  `as_is` varchar(200) NOT NULL,
  `to_be` varchar(200) NOT NULL,
  `desc` longtext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `risk_action_code_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bf4c1418d23d1f75b19c09f72b7d0cc1` (`risk_action_code_id`),
  CONSTRAINT `bf4c1418d23d1f75b19c09f72b7d0cc1` FOREIGN KEY (`risk_action_code_id`) REFERENCES `RiskManagement_risk_analysis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_risk_control`
--

LOCK TABLES `RiskManagement_risk_control` WRITE;
/*!40000 ALTER TABLE `RiskManagement_risk_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `RiskManagement_risk_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_staff`
--

DROP TABLE IF EXISTS `RiskManagement_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `location` varchar(100) NOT NULL,
  `depart_id` int(11) NOT NULL,
  `duty_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RiskMa_depart_id_2eb2eff74a46171_fk_RiskManagement_department_id` (`depart_id`),
  KEY `RiskManagemen_duty_id_192917a75ae0d5a7_fk_RiskManagement_duty_id` (`duty_id`),
  CONSTRAINT `RiskManagemen_duty_id_192917a75ae0d5a7_fk_RiskManagement_duty_id` FOREIGN KEY (`duty_id`) REFERENCES `RiskManagement_duty` (`id`),
  CONSTRAINT `RiskMa_depart_id_2eb2eff74a46171_fk_RiskManagement_department_id` FOREIGN KEY (`depart_id`) REFERENCES `RiskManagement_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_staff`
--

LOCK TABLES `RiskManagement_staff` WRITE;
/*!40000 ALTER TABLE `RiskManagement_staff` DISABLE KEYS */;
INSERT INTO `RiskManagement_staff` VALUES (1,'고항준','전임','본사',1,2),(2,'원유준','이사','본사',2,1),(7,'신유식','전임','본사',1,2),(8,'원유준','이사','본사',2,2),(9,'우성희','전임','본사',1,4),(12,'김태상','부장','본사',2,2),(13,'테스트20','개인정보보호담당자','본사',1,5),(14,'임성진','이사','본사',2,2),(15,'천인혁','과장','본사',2,2),(16,'테스트21','개인정보보호담당자','a',1,5);
/*!40000 ALTER TABLE `RiskManagement_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RiskManagement_threat`
--

--
-- Table structure for table `RiskManagement_vul_analysis`
--

--
-- Table structure for table `RiskManagement_vulnerability`
--

DROP TABLE IF EXISTS `RiskManagement_vulnerability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RiskManagement_vulnerability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vul_code` varchar(20) NOT NULL,
  `classification` varchar(10) DEFAULT NULL,
  `entry` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `control` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RiskManagement_vulnerability`
--

LOCK TABLES `RiskManagement_vulnerability` WRITE;
/*!40000 ALTER TABLE `RiskManagement_vulnerability` DISABLE KEYS */;
INSERT INTO `RiskManagement_vulnerability` VALUES (1,'PC1-01','PC','계정 관리','계정의 패스워드를 주기적으로 변경하지 않고 오랫동안 사용할 경우 계정 패스워드가 외부에 유출될 수 있으며, 관리자 계정의 패스워드가 유출될 시 자료 유출 등 심각한 사고 발생 가능성이 존재함',3,'계정 관리','\"1. 제어판 > 관리도구 > 로컬 보안 정책 > 보안 설정 > 계정 정책 > “최대 암호 사용 기간” 정책의 속성 > “다음 이후 암호 만료” 값을 “90일” 로 설정\n2. 제어판 > 관리도구 > 컴퓨터 관리 > 로컬 사용자 및 그룹 > 사용자 > Administrator 마우스 우 클릭 > 속성 에서 “암호 사용 기간 제한 없음” 해제\"'),(2,'PC1-02','PC','패스워드 정책이 해당 기관의 보안 정책에 적합하게 설정','대부분의 환경에서 3종류(영문?숫자?특수문자) 조합의 경우 8자리 패스워드 사용, 2종류(영문?숫자) 조합의 경우 10자리 암호 사용을 권고하고 있음.<br>패스워드 정책에 적합하게 패스워드가 설정된 경우 무작위 대입 공격(Brute Force Attack)이나 패스워드 추측 공격(Password Guessing)에 대한 대비가 가능함. ',3,'계정관리','제어판 > 관리도구 > 로컬 보안 정책 > 보안 설정 > 계정 정책 > “최소 암호 길이” 정책의 속성 > “암호에 필요한 최소 문자” 값을 “8문자” 로 설정'),(5,'PC1-03','PC','복구 콘솔 자동 로그인 금지 설정','윈도우 복구 콘솔(Recovery Console) 자동 로그온 설정은 시스템 액세스 허가 전 Administrator 계정의 암호 제공 여부를 결정하는 것으로 이 옵션을 사용하면 복구 콘솔에 암호를 입력하지 않아도 시스템에 자동으로 로그온됨. 이 경우 비인가자가 관리자 권한으로 시스템에 접근하여 주요 정보를 획득할 수 있는 위험이 있음.',2,'계정관리','제어판 > 관리도구 > 로컬 보안 정책 > 보안 설정 > 로컬 정책 > 보안 옵션 > “복구 콘솔 : 자동 관리 로그온 허용” 정책의 속성 에서 “사용 안 함” 설정'),(6,'CI1-01','Network','초기 패스워드 설정','초기 패스워드는 인터넷 검색을 통해 노출되어 있어 비인가자의 관리자 권한 획득이 가능함으로 초기 설정 패스워드는 반드시 변경 설정해야 함.\r\n',3,'계정 관리','1. Enable 패스워드\r\n# config terminal > # enable password <패스워드>\r\n2. Virtual Terminal Password 설정\r\n# config terminal > # line vty 0 4 > # login > # password <패스워드>\r\n3. 콘솔 패스워드 설정\r\n# config terminal > # line console ? > # login > # password <패스워드>\r\n4. 보조포트(AUX) 패스워드 설정\r\n# config terminal > # line aux ? > # login > # password <패스워드>'),(7,'PC2-01','PC','공유 폴더 제거','시스템의 기본 공유 항목이 제거되지 않으면 모든 시스템 자원에 접근할 수 있는 위험한 상황이 발생할 수 있음. 2001년에 발생한 *Win32.Nimda 바이러스도 여러 가지 방법 중에서 이러한 공유 기능 침투의 한 경로를 이용한 것임',2,'파일 시스템','\"1. 시작 > 실행 > FSMGMT.MSC > 공유 > 기본공유 선택 > 공유 중지\n2. 시작 > 실행 > REGEDIT > 아래 레지스트리 값을 0 으로 수정(키 값이 없을 경우 새로 생성 DWORD)\n\"\"HKLM\\SYSTEM\\CurrentControlSet\\Services\\lanmanserver\\parameters\\AutoShareServer\"\"\n※ 레지스트리를 설정해야 영구 설정되며, Active Directory, Clustered system 에서는 적용시 영향 있음\"'),(8,'CI1-02','Network','패스워드 복잡성 설정','단순한 패스워드를 사용할 경우 악의적인 사용자가 쉽게 장비에 접속할 수 있으므로 암호 복잡성을 만족하여야 함.',3,'계정 관리','문자, 숫자, 특수문자를 조합하여 최소 8자 이상으로 패스워드 설정'),(9,'CI1-03','Network','암호화된 패스워드 사용','네트워크 장비의 패스워드는 기본 평문으로 저장되기 때문에 모든 패스워드를 암호화하여 저장하도록 설정을 변경해야 함.\r\n',3,'계정 관리','Enable secret 패스워드 설정 (Enable 패스워드와 서로 다르게 입력)\r\n# config terminal\r\n# enable secret <패스워드>\r\n# service password-encryption\r\n# ^Z\r\n# show running'),(10,'CI1-04','Network','사용자, 명령어 별 권한 수준 설정','사용자, 명령어별 권한 수준이 설정되어 있지 않은 경우 허가되지 않은 사용자가 중요한 프로그램을 실행하거나 모니터링 권한 설정을 변경할 수 있는 위험이 발생할 수 있으므로 사용자의 업무 수준에 따라 권한과 기능을 제한해야 함.',2,'계정 관리','1. 사용자별 권한 수준 지정 (1-15 Level)\r\n# config terminal\r\n# username [ID] privilege [1-15] password [PASS]\r\n2. 명령어별 권한 수준 지정\r\nRouter(config)# privilege exec level [1-15] [서비스명]\r\n* 레벨 15 설정해야 할 명령어 : connect, telnet, rlogin, show ip access-list, show logging'),(11,'CI2-01','Network','원격 접근 제어 설정','VTY 사용 시 Telnet이나 SSH로 원격 접속이 가능하지만 Telnet은 접속 시 평문으로 정보가 전송되어 SSH 사용을 권고함. 인가된 사용자만이 접속할 수 있도록 IP를 제한하여 비인가자의 접근을 차단해야 함.',3,'접근 관리','1. VTY 접근 허용 IP 설정\r\n# Router(config)# access-list 1 permit <IP>\r\n2. SSH 사용 시\r\n(config)# ip ssh client <IP>'),(12,'CI2-02','Network','Sesssion Timeout 설정','네트워크 장비에 세션 타임아웃이 설정되어 있지 않으면 관리자가 잠시 자리를 비운 사이 악의적인 사용자가 불법 접근할 수 있으므로 일정 시간 동안 키 입력이 없을 경우 연결된 접속을 자동 종료시키는 설정이 필요함.',3,'접근 관리','Console, VTY, AUX 설정 접속 후 타임아웃 설정\r\n(config-line)# exec-timeout 5 0'),(13,'CI2-03','Network','원격 관리 시 SSH 설정','원격 관리 시 Telnet은 평문 전송으로 패스워드가 쉽게 노출될 수 있으므로 SSH 프로토콜 사용을 권장함.',2,'접근 관리','1. SSH 설정\r\n(config)# crypto key generate rsa (RSA 사용 설정)\r\n(config)# ip ssh time-out [sec]\r\n(config)# ip ssh authentication-retries [횟수]\r\n(config)# line vty 0 4\r\n(config)# transport input ssh\r\n2. SSH 접속\r\n# ssh -c rsa -l <id><라우터IP>'),(14,'CI2-04','Network','불필요한 보조 입출력 포트 사용 금지 설정','불필요한 보조 입출력 포트가 활성화되어 있으면 비인가자가 포트로 불법적인 접속을 시도할 수 있으므로 불필요한 포트를 차단시켜야 함.',2,'접근 관리','1. AUX 포트 차단\r\n(config)# line aux 0\r\n# no password (어떤 사용자도 접속 금지)\r\n# transport input none (어떤 입력도 받지 않음)\r\n# no exec (어떤 명령도 실행 안 됨)\r\n# exec-timeout 0 1 (1초 지나면 자동 타임아웃)'),(15,'PC2-02','PC','불필요한 서비스 제거','불필요한 서비스가 시스템에 디폴트로 설치되어 실행되는 경우 시스템 자원을 낭비 하게 될 뿐만 아니라, 이 서비스를 통해 악의적인 공격자가 침입할 수 있으므로 필요 하지 않은 서비스는 중지시켜야 함',3,'파일 시스템','시작 > 실행 > SERVICES.MSC 에서 불필요한 서비스 중지'),(16,'CI2-05','Network','로그온 시 경고 메시지 설정','로그온 시 경고 메시지를 띄움으로써 사용자들에게 경각심을 줄 수 있기 때문에 경고 메시지 설정이 필요함.',2,'접근 관리','# config terminal\r\n(config)# banner motd #\r\n(config)# banner login #\r\n(config)# banner exec #\r\n'),(17,'CI3-01','Network','최신 보안 패치 및 벤더 권고사항 적용','네트워크 장비의 보안 수준을 높이고 성능 및 기능 향상을 위해서는 버전 업그레이드 및 보안 패치 작업이 필요함.',3,'패치 관리','CISCO 버전별 정보\r\nhttp://www.cisco.com/web/about/security/intelligence/ios-ref.html'),(18,'CI4-01','Network','원격 로그서버 사용','네트워크 장비의 관리, 보안 알람 및 일반적인 정보 메시지를 원격에 위치한 로그 서버로 실시간 로깅 및 관리하는 운영이 필요함. 악의적인 사용자에 의해 로그 기록의 변조를 방지할 수 있음.',1,'로그 관리','1. 로깅 설정 확인 : # show running-config\r\n2. 로그 정보 확인 : # show logging\r\n3. 원격 로깅 설정 : syslog를 이용하여 설정'),(19,'CI4-02','Network','로깅 버퍼 크기 설정','기본적으로 로그는 파일이 아닌 버퍼 메모리에 저장되는데 메모리의 양을 초과하여 로그가 저장될 경우 로그 정보를 잃게 될 수 있음. 저장되는 로그 데이터 용량을 고려하여 버퍼 크기를 설정하여야 함.',2,'로그 관리','# config terminal\r\n(config)# logging on (로그를 메모리에 백업)\r\n(config)# logging buffered 16000 (16Kbytes 할당)\r\n(config)# logging buffered information (severity 레벨 설정)\r\n(config)# ^Z'),(20,'PC2-03','PC','Windows Messenger(MSN, .NET 메신저 등)와 같은 상용 메신저의 사용 ','일반 사용자 PC에서 Windows Messenger를 사용할 경우, 메신저(Messenger)를 통 해서 주요 정보가 유출될 수 있을 뿐만 아니라 악성코드가 유입될 수 있음\r\n',3,'파일 시스템','\"1. Windows Messenger의 경우\n시작 > 실행 > gpedit.msc 입력 > 컴퓨터 구성 > 관리 템플릿 > Windows 구성 요소 > Windows Messenger 에서 “Windows Messenger를 실행 허용 안 함” 확인\"'),(21,'CI4-03','Network','NTP 서버 연동','로그의 통합 보관 시 시간의 동기화 및 일관된 시간 관리를 위해 NTP 서버로 연동되어야 함. 하지만 NTP 서버가 사용하는 프로토콜은 보안에 취약하므로 별도의 내부 NTP 서버나 신뢰할 수 있는 서버로 설정해야 함.',2,'로그 관리','NTP 서버 연동 설정\r\n# config terminal\r\n# ntp server 129.237.32.2 (NTP 서버 IP)\r\n# ^Z'),(22,'PC2-04','PC','파일 시스템을 NTFS로 포맷','NTFS 파일 시스템은 포맷 시 모든 파일과 디렉터리에 소유권과 사용 권한 설정이 가능하고 ACL(접근 통제 목록)을 제공함으로써 *FAT32 파일 시스템에 비해 보다 강 화된 보안 기능을 제공함\r\n',2,'파일 시스템','\"시작 > 실행 > cmd 입력 > “convert 드라이브명:/fs:ntfs” 입력\n※ 관리자 권한으로 명령 프롬프트 실행\"'),(23,'CI4-04','Network','정책에 따른 로깅 설정','로깅 설정을 통해 로그를 정기적으로 검사하고 정상적인 운영 상태 및 공격 유형을 식별하여 네트워크 동향을 파악하여야 함.',2,'로그 관리','효율적으로 로깅을 사용하기 위해 아래의 6가지 방법을 활용함.\r\n1. 콘솔 로깅\r\n2. Buffered 로깅\r\n3. Terminal 로깅\r\n4. syslog (원격 로그서버 저장)\r\n5. SNMP traps\r\n6. ACL 침입 로깅'),(24,'PC3-01','PC','HOT FIX 등 최신 보안패치','HOT FIX 설치 및 자동 *업데이트가 설정되어 있지 않은 경우 취약점으로 인한 공격이 발생할 수 있으므로 Hot Fix 출시 즉시 신속하게 설치하고 항상 최신의 보안 업데이트가 이루어져야 함\r\n',3,'시스템보안','최신 Hotfix 설치\r\nhttp://www.microsoft.com/korea/technet/security/current.asp\r\n'),(25,'PC3-02','PC','최신 서비스팩 적용','최신 서비스팩을 적용하지 않을 경우, 공격에 쉽게 노출될 수 있음.\r\n',3,'시스템보안','1. 시작 > 실행 > Winver\r\n2. Windows 8, Windows 7, Windows Vista의 경우 Windows 업데이트를 사용하고, Windows XP의 경우 자동 업데이트를 사용\r\n'),(26,'PC4-01','PC','바이러스 백신 프로그램 설치 및 주기적 업데이트','바이러스 백신 프로그램은 바이러스, 웜 등으로부터 시스템을 보호하기 위한 중요 한 보안 요소임. 최신 바이러스 탐지를 위하여 패턴 업데이트가 자주 발생하므로 이를 즉각적으로 반영하는 것이 중요함\r\n',3,'바이러스/웜 진단','담당자를 통해 바이러스 백신을 설치\r\n'),(27,'PC4-02','PC','바이러스 백신 프로그램에서 제공하는 실시간 감시 기능 활성화','바이러스 백신 프로그램의 실시간 감시 기능으로 바이러스, 스파이웨어 탐지 및 방 화벽 설정 등이 가능함. 시스템에 대한 위협 발생 시 즉시 대응이 가능하도록 실시간 감시 기능을 사용할 것을 권고함\r\n',3,'바이러스/웜 진단','백신 프로그램 내의 실시간 감시 기능을 활성화\r\n'),(28,'PC4-03','PC','OS에서 제공하는 침입차단 기능 활성화','윈도우에서 제공하는 침입차단 기능인 윈도우 방화벽을 사용함으로써 PC의 자료  출 방지, 불법 접근 차단 등을 가능하게 함. 네트워크 방화벽과 더불어 각각의 PC에 윈도우 방화벽과 같은 호스트 기반의 방화벽을 구현할 때 네트워크의 방어 수준이 향상될 수 있음.\r\n',3,'바이러스/웜 진단','시작> 제어판> Windows 방화벽 > Windows 방화벽 설정 또는 해제 > Windows 방화벽 “사용” 설정\r\n'),(29,'PC4-04','PC','화면보호기 대기 시간 설정 및 재시작 시 암호 보호 설정','사용자가 일정 시간 동안 아무런 작업을 수행하지 않을 경우 자동으로 로그오프 되거나 워크스테이션이 잠기도록 설정하여야 함. 해당 기능을 설정하지 않은 경우 사용자가 자리를 비운 사이에 임의의 사용자가 해당 시스템에 접근하여 중요 정보를 유출하거나, 악의적인 행위를 통해 시스템 운영에 악영향을 미칠 수 있으므로 화면보호기 대기 시간 및 암호 사용 설정을 이용해서 비인가자의 물리적 접근을 차단함\r\n',3,'바이러스/웜 진단','\"시작>제어판>개인설정>화면보호기설정\r\n화면보호기 : 없음외의 선택\r\n대기시간 : 10분이하\r\n암호사용 : 체크\"\r\n'),(30,'PC4-05','PC','CD, DVD, USB 메모리 등과 같은 미디어의 자동실행 방지 등 이동식 미디어에 대한 ','CD/DVD, USB 메모리 등과 같은 미디어에 탑재된 Autorun.inf 파일을 통해 다른 응용 프로그램이 자동 실행될 수 있음. 대부분의 USB 관련 악성코드들은 Autorun.inf 파일을 통해 자동 실행되도록 제작되므로 이를 통해 악성코드가 PC로 쉽게 유입될 수 있음\r\n',3,'바이러스/웜 진단','\"제어판에서 자동 실행 기능 설정\r\n시작> 제어판> 자동 실행> “모든 미디어 및 장치에 자동 실행 사용(U)” 체크 해제\"\r\n'),(31,'PC4-06','PC','원격 지원 금지 정책 설정','시스템 관리 등의 목적으로 원격 지원 기능을 활용할 수 있으나 원격 지원 기능이 비인가자에게 허용될 경우 시스템 제어 권한이 악용될 수 있음\r\n',2,'바이러스/웜 진단','1. 시작> 실행> “gpedit.msc” 입력> 컴퓨터 구성> 관리 템플릿> 시스템> 원격 지원\r\n2. “원격 지원 제공”을 “사용 안 함” 으로 설정\r\n'),(32,'CI4-05','Network','timestamp 로그 설정','로그의 신뢰성을 위해 로그 시간 정보가 필요하므로 timestamp 설정을 권고함.',1,'로그 관리','# config terminal\r\n(config)# service timestamp log date time msec local show-timezone (log 할 때 시간이 print 되도록 설정)'),(33,'CI5-01','Network','SNMP 서비스 확인','SNMP(Simple Network Management Protocol)은 네트워크 디바이스 관리를 쉽게하는 Application Layer 프로토콜로, 이는 네트워크를 확장, 네트워크의 문제를 해결, 네트우크의 성능을 관리하는 도구로 사용되나 악용시에 네트워크 장비 접근 및 설정 변경등으로 시스템 장애가 발생할 수 있음',3,'기능 관리','SNMP 서비스가 특별히 필요하지 않을 경우 비활성화\r\nRouter(config)# no snmp-server'),(34,'CI5-02','Network','SNMP community string 복잡성 설정','SNMP의 Public, Private과 같은 디폴트 community string을 변경하지 않고 사용할 경우, 악의적인 사용자가 장비 설정을 쉽게 변경하여 중요 시스템 정보가 노출될 수 있으므로 추측하기 어려운 Community String으로 변경하는 설정이 필요함.',3,'기능 관리','Community String 문자열 변경\r\n# config terminal\r\n(config)# snmp-server community <커뮤니티명>'),(35,'CI5-03','Network','SNMP ACL 설정','ACL을 설정할 경우 접속 대상 호스트를 지정하여 접근이 가능한 IP를 제한할 수 있음. 이 기능을 사용하여 정보의 노출을 줄이고 임의의 호스트에서 SNMP 접근을 차단하여 Community String 추측공격을 차단할 수 있음.',3,'기능 관리','access-list를 이용하여 특정 호스트만 열어 주기\r\n(config)# access-list 100 permit ip host <IP> any\r\n(config)# access-list 100 deny udp any any eq snmp\r\n(config)# access-list 100 deny udp any any eq snmptrap\r\n(config)# access-list 100 permit ip any any'),(36,'WA1-01','Web','Apache 디렉터리 리스팅 제거','디렉터리 검색은 디렉터리 요청 시 해당 디렉터리에 기본 문서가 존재하지 않을 경우 디렉터리 내 모든 파일의 목록을 보여주는 기능임. 디렉터리 검색 기능이 활성화되어 있는 경우 외부에서 디렉터리 내의 모든 파일에 대한 접근이 가능하여 WEB 서버 구조 노출뿐만 아니라 백업 파일이나 소스파일 등 공개되어서는 안 되는 중요 파일 노출이 가능함\r\n',3,'보안 설정','디렉터리 검색 기능 제거 (/[Apache_home]/conf/httpd.conf 파일에 설정된 모든 디렉터리의 Options 지시자에서 Indexes 옵션 제거)'),(37,'CI5-04','Network','SNMP 커뮤니티 권한 설정','SNMP에서는 RO(Read Only)와 RW(Read Write) 모드를 제공함. 보안 설정을 확실하게 하지 않을 경우 SNMP를 이용하여 설정을 수정할 수 있는 등 보안 문제를 유발할 수 있음.',3,'기능 관리','SNMP Community String 권한 설정 방법(RW 삭제 권고)\r\n# config terminal\r\n(config)# snmp-server community <스트링명> RO\r\n(config)# snmp-server community <스트링명> RW'),(38,'CI5-05','Network','TFTP 서비스 차단','TFTP 서비스는 인증 절차를 요구하지 않으면서 평문으로 통신하므로 보안상 취약함. 사용이 필요하다면 ACL 설정을 통해서 비인가자의 접근을 차단하여야 함.',3,'기능 관리','외부망에서 사용할 필요가 없는 TFTP 서비스 차단\r\n# config terminal\r\n(config)# no service tftp'),(39,'CI5-06','Network','IP Spoofing 방지 필터링 적용','Source IP가 변조된 불법 패킷을 차단하지 않으면 Dos 등 악의적인 목적으로 사용될 수 있음.',3,'기능 관리','Global configuration mode로 접속\r\naccess-list number deny ip 127.0.0.0 0.255.255.255 any\r\naccess-list number deny ip 224.0.0.0 31.255.255.255 any\r\naccess-list number deny ip host 0.0.0.0 any\r\naccess-list number permit ip any any'),(40,'WA1-02','Web','Apache 웹 프로세스 권한 제한','UNIX 시스템의 경우 Web 서버 데몬이 root 권한으로 운영될 경우 Web Application의 취약점 또는, 버퍼 오버플로우(Buffer Overflow)로 인하여 root 권한을 획득할 수 있으므로 서버 데몬이 root 권한으로 운영되지 않도록 관리하여야 함\r\n',3,'보안 설정','Apache 데몬을 root 가 아닌 별도 계정으로 구동\r\n'),(41,'CI5-07','Network','Ddos 공격 방지 설정','DDos 공격 방어 설정이 되어있지 않으면 불필요한 트래픽으로 인한 네트워크 서비스의 마비될 수 있으므로 Ddos 보안 설정이 필요함.',3,'기능 관리','Global configuration mode로 접속\r\nno ip directed-broadcast\r\nno service tcp-small-servers\r\nno service udp-small-servers'),(42,'CI5-08','Network','IP Source Routing 제한 여부',' 라우터에서 패킷의 목적지에 따라 패킷을 라우팅하는 것이 기본이지만, 경우에 따라 송신측에서 라우팅 경로 정보를 송신 데이터에 포함시켜 라우팅 시키는 방법을 사용하는 경우가 있다. 현재, 거의 사용되지 않는 방법이지만 내부의 라우팅 경로를 파악하여 라우팅이 되지 않는 중요 서버로 접근 할 수 있기 때문에 소스 라우팅을 기본적으로 막아야 함',2,'기능 관리','1. Global configuration mode로 들어감\r\n2. no ip source-route'),(43,'WA1-03','Web','Apache 상위 디렉터리 접근 금지','상위경로로 이동하는 것이 가능할 경우 하위경로에 접속하여 상위경로로 이동함으로써 해킹을 당할 위험이 있으며, 유니코드 버그(Unicode Bug) 및 서비스 거부 공격에 취약해지기 쉬우므로 “..” 와 같은 상위경로로 이동이 가능한 문자사용이 불가능하도록 설정할 것을 권장함. Apache는 특정 디렉터리 내에 존재하는 파일들을 호출할 때 사용자 인증을 수행하도록 설정할 수 있음. 따라서 해당 설정을 이용하여 중요 파일 및 데이터 접근은 허가된 사용자만 가능하도록 제한함\r\n',3,'보안 설정','\"1. 사용자 인증을 하기 위해서 각 디렉터리 별로 httpd.conf 파일 내 AllowOverride   지시자의 옵션 설정을 변경 (None에서 AuthConfig 또는, All로 변경) \r\n2. 사용자 인증을 설정할 디렉터리에 .htaccess 파일 생성\r\n3. 사용자 인증 계정 생성: htpasswd -c <인증 파일> <사용자 계정>\"\r\n'),(44,'CI5-09','Network','Proxy ARP 차단','악의적인 사용자가 잘못된 IP와 MAC 정보를 보내올 경우 ARP 프록시는 잘못된 정보를 보관하여 정상적인 통신을 방해하므로 ARP Proxy를 차단해야 함.',2,'기능 관리','# ARP Proxy 차단 설정\r\n(config)# interface fastethernet 0/1\r\n(config)# no ip proxy-arp\r\n(config)# ^Z'),(45,'CI5-10','Network','CDP 서비스 사용 제한 여부','CDP(Cisco Discovery Protocol)은 시스코 장비간 네트웍 관리 기능을 위해 사용되어지지만, 시스템(라우터)에 대한 모델번호, Cisco IOS버전정보등 다양한 정보를 인접한 장치에 유출을 방지하여야 함.',2,'기능 관리','글로벌 설정 모드에서 CDP 프로토콜 정지\r\nRouter(config)#no cdp run'),(46,'WA1-04','Management','Apache 불필요한 파일 제거','웹 서버 설치 시 기본으로 생성되는 매뉴얼 파일은 외부 침입자에게 시스템 정보 및 웹 서버 정보를 제공할 수 있으므로 제거하여야 함\r\n',3,'보안 설정','메뉴얼 파일 및 디렉터리 제거 (“/[Apache_home]/htdocs/manual”, “/[Apache_home]/manual” 파일 제거)\r\n'),(47,'CI5-11','Network','사용하지 않는 인터페이스의 shutdown 설정','사용하지 않는 포트에 비인가자가 불법적인 접근이 가능할 수 있으므로 네트워크 정보 유출 및 손상 위험 방지를 위해 사용하지 않는 인터페이스를 shutdown 시키는 설정이 필요함.',3,'기능 관리','shutdown 설정\r\n# config terminal\r\n(config)# interface fastethernet 0/1\r\n(config-line)# shutdown\r\n사용할 포트는 no shutdown으로 포트 상태를 up 시켜줌.'),(48,'CI5-12','Network','Finger 서비스 제거','Finger 서비스로 장비의 접속 상태가 노출될 수 있으며, VTY의 사용 현황을 원격에서 파악하는 것이 가능하므로 제한 설정이 필요함.',2,'기능 관리','# config terminal\r\n(config)# no service finger (이전 버전)\r\n(config)# no ip finger (최근 IOS)'),(49,'WA1-05','Web','Apache 링크 사용금지','일부 서버는 심볼릭 링크(Symbolic link)를 이용하여 기존의 웹 문서 이외의 파일시스템 접근이 가능하도록 하고 있음. 이러한 방법은 편의성을 제공하는 반면, 일반 사용자들도 시스템 중요 파일에 접근할 수 있게 하는 보안 문제를 발생시킴. 가령 시스템 자체의 root 디렉터리(/)에 링크를 걸게 되면 웹 서버 구동 사용자 권한(nobody)으로 모든 파일 시스템의 파일에 접근할 수 있게 되어 “/etc/passwd” 파일과 같은 민감한 파일을 누구나 열람할 수 있게 됨\r\n',3,'보안 설정','심볼릭 링크, aliases 사용 제한 (/[Apache_home]/conf/httpd.conf 파일에 설정된 모든 디렉터리의 Options 지시자에서 심볼릭 링크를 가능하게 하는 FollowSymLinks 옵션 제거)\r\n'),(50,'CI5-13','Network','Bootp 서비스 차단','BOOTP는 네트워크 사용자가 자동으로 IP 주소를 받게 구성되고 사용자의 관여 없이도 부트되는 운영체계를 가지고 있게 해주는 프로토콜임, 그러나 사용하지 않는 불필요한 서비스는 시스템 또는 네트워크 공격자의 공격루트로 활용될 수 있음, 따라서 사용하지 않는 Bootp Server를 비활성화 시킬 것을 권고함.',2,'기능 관리','Bootp 차단 설정\r\n# config terminal\r\n(config)# no ip bootp server'),(51,'WA1-06','Web','Apache 파일 업로드 및 다운로드 제한','불필요한 파일 업로드, 다운로드 시에 대량의 업로드, 다운로드로 인한 서비스 불능상태가 발생할 수 있음. 따라서 불필요한 업로드와 다운로드는 허용하지 않으며, 웹 서버에 의해 처리되지 못하게 하고, 자동이나 수동으로 파일의 보안성 검토를 수행함\r\n',3,'보안 설정','파일 업로드 및 다운로드 용량 제한 (/[Apache_home]/conf/httpd.conf 파일에 설정된 모든 디렉터리의 LimitRequestBody 지시자에 파일 사이즈 용량 제한 설정\r\n'),(52,'CI5-14','Network','ICMP unreachable, Redirect 차단','ICMP unreachable과 ICMP Redirect가 설정되어 있으면 악의적인 사용자가 네트워크 경로 정보에 대한 패킷을 가로챌 수 있으므로 서비스를 중지하여야 함.',2,'기능 관리','# config terminal\r\n(config)# interface fastethernet0/1 (인터페이스 선택)\r\n(config-if)# no ip unreachables\r\n(config-if)# no ip redirects (RIP, OSPF 프로토콜을 사용함으로써 ICMP Redirect 제거 가능)'),(53,'CI5-15','Network','pad 차단','pad 서비스는 X.25 프로토콜 시 사용하므로 불필요할 경우 중지해야 함.',2,'기능 관리','# config terminal\r\n(config)# no service pad'),(54,'WA1-07','Web','Apache 웹 서비스 영역의 분리','Apache 설치 시 htdocs 디렉터리를 DocumentRoot로 사용하고 있는데 htdocs 디렉터리는 공개되어서는 안 될(또는, 공개될 필요가 없는) Apache 문서뿐만 아니라 공격에 이용될 수 있는 시스템 관련 정보도 포함하고 있으므로 이를 변경하여야 함. 또한, 대량의 업로드와 다운로드 시 서비스 불능 상태가 발생할 수 있음\r\n',3,'보안 설정','DocumentRoot \"/usr/local/apache/htdocs”-> DocumentRoot \"별도 디렉터리\" 로 변경\r\n'),(55,'CI5-16','Network','mask-reply 차단','mask-reply는 인터페이스를 통해 netmask를 요청하는 ICMP 패킷 발송 시 응답하도록 하는 설정임. 활성화한 경우 네트워크의 netmask 정보 등이 유출될 수 있으므로 차단해야 함.',2,'기능 관리','# config terminal\r\n(config)# interface serial 1/0\r\n(config)# no ip mask-rely'),(56,'WA1-08','Web','Apache 웹서비스 정보 숨김','에러 페이지, 웹 서버 종류, OS 정보, 사용자 계정 이름 등 웹 서버와 관련된 불필요한 정보가 노출되지 않도록 하여야 함. 불필요한 정보가 노출될 경우 해당 정보를 이용하여 시스템의 취약점을 수집할 수 있음\r\n',2,'보안 설정','헤더에 최소한의 정보를 제한 후 전송 (ServerTokens 지시자에 Prod 옵션 설정)\r\n'),(57,'WA2-01','Web','로그 설정 관리','Apache 웹 서버의 로그 포맷을 Combined 로그 포맷으로 설정하지 않으면, 공격 여부 파악, 공격자 사용 툴 파악, 공격자 위치 파악이 불가능하므로 반드시 Combined 포맷으로 설정해야 함\r\n',3,'로그 및 패치 관리','CustomLog의 Default 값은 기본적인 정보만 로그로 기록하는 common 이며, combined로 수정\r\n'),(58,'JP1-01','Network','초기 패스워드 설정','초기 패스워드는 인터넷 검색을 통해 노출되어 있어 비인가자의 관리자 권한 획득이 가능함으로 초기 설정 패스워드는 반드시 변경 설정해야 함.',3,'계정 관리','> configure\r\n[edit]\r\n# set system root-authentication plain-text-passwd'),(59,'JP1-02','Network','패스워드 복잡성 설정','단순한 패스워드를 사용할 경우 악의적인 사용자가 쉽게 장비에 접속할 수 있으므로 암호 복잡성을 만족하여야 함.',3,'계정 관리','문자, 숫자, 특수문자를 조합하여 최소 8자 이상으로 패스워드 설정'),(60,'WA2-02','Web','최신 패치 적용','주기적으로 보안 패치를 적용하지 않으면 서버 침해가 발생할 수 있음\r\n',3,'로그 및 패치 관리','업데이트 릴리즈 여부를 정기적으로 확인하고, 적용 여부를 검토 한 후 최신 버전 업데이트 적용\r\n'),(61,'JP1-03','Network','암호화된 패스워드 사용','네트워크 장비의 패스워드는 기본 평문으로 저장되기 때문에 모든 패스워드를 암호화하여 저장하도록 설정을 변경해야 함.',3,'계정 관리','> configure\r\n[edit]\r\n# set system root-authentication encrypted-password \"#1$14c5.%4Bopasddfs0\"'),(62,'JP1-04','Network','사용자, 명령어 별 권한 수준 설정','사용자, 명령어별 권한 수준이 설정되어 있지 않은 경우 허가되지 않은 사용자가 중요한 프로그램을 실행하거나 모니터링 권한 설정을 변경할 수 있는 위험이 발생할 수 있으므로 사용자의 업무 수준에 따라 권한과 기능을 제한해야 함.',2,'계정 관리','장비 구성 시 사용하는 superuser 클래스와 monitoring 용으로 사용하는 read-only 클래스를 분리하여 사용할 것을 권장.'),(63,'JP2-01','Network','원격 접근 제어 설정','VTY 사용 시 Telnet이나 SSH로 원격 접속이 가능하지만 Telnet은 접속 시 평문으로 정보가 전송되어 SSH 사용을 권고함. 인가된 사용자만이 접속할 수 있도록 IP를 제한하여 비인가자의 접근을 차단해야 함.',3,'접근 관리','ACL 로깅 설정\r\nAccess-list를 생성하면 기본 Deny가 되므로 네트워크 담당자를 통해 설정\r\n> configure\r\n[edit]\r\n# source-address 127.0.0.0/24;\r\n# source-address 224.0.0.0/4;\r\n# source-address 0.0.0.0/0;\r\n'),(64,'JP2-02','Network','Sesssion Timeout 설정','네트워크 장비에 세션 타임아웃이 설정되어 있지 않으면 관리자가 잠시 자리를 비운 사이 악의적인 사용자가 불법 접근할 수 있으므로 일정 시간 동안 키 입력이 없을 경우 연결된 접속을 자동 종료시키는 설정이 필요함.',3,'접근 관리','> configure\r\n[edit]\r\n# set admin auth timeout 360\r\n-------unknown keyword timeout'),(65,'WI1-01','Web','IIS 서비스 구동 점검','IIS 서비스는 WEB, FTP 등의 서비스를 제공해주는 유용한 서비스이지만 프로파일링, 서비스 거부, 불법적인 접근, 임의의 코드실행, 정보 공개, 바이러스, 웜, 트로이목마 등의 위협에 노출될 수 있으므로 필요하지 않은 서비스는 중지하여야 함.\r\n',3,'보안 설정','IIS 서비스를 사용하지 않는 경우 IIS 서비스 중지\r\n'),(66,'JP2-03','Network','원격 관리 시 SSH 설정','원격 관리 시 Telnet은 평문 전송으로 패스워드가 쉽게 노출될 수 있으므로 SSH 프로토콜 사용을 권장함.',2,'접근 관리','1. SSH 버전 확인\r\n# set ssh\r\n2. ssh 활성화\r\n[edit]\r\n# set ssh enable'),(67,'WI1-02','Web','IIS 디렉터리 리스팅 제거','디렉터리 검색은 디렉터리에 대한 요청 시 기본 페이지가 호출되어 사용자에게 전송 하지만, 기본 페이지가 존재하지 않는 경우 디렉터리 내에 존재하는 모든 파일의 목 록을 보여줌. 따라서 디렉터리 검색이 허용될 경우 외부에서 디렉터리 내의 모든 파 일에 대한 접근이 가능하므로 중요한 파일들이 노출될 수 있음\r\n',3,'보안 설정','사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 디렉터리 검색 체크 해제\r\n'),(68,'JP2-04','Network','불필요한 보조 입출력 포트 사용 금지 설정','불필요한 보조 입출력 포트가 활성화되어 있으면 비인가자가 포트로 불법적인 접속을 시도할 수 있으므로 불필요한 포트를 차단시켜야 함.',2,'접근 관리','> configure\r\n[edit]\r\n# editinterfacesso-1/0/3\r\n[edit interfaces so-1/0/3]\r\n# setunit0familyinetaddress10.0.20.1/24'),(69,'JP2-05','Network','로그온 시 경고 메시지 설정','로그온 시 경고 메시지를 띄움으로써 사용자들에게 경각심을 줄 수 있기 때문에 경고 메시지 설정이 필요함.',2,'접근 관리','[edit system login]\r\nmessage text;'),(70,'JP3-01','Network','최신 보안 패치 및 벤더 권고사항 적용','네트워크 장비의 보안 수준을 높이고 성능 및 기능 향상을 위해서는 버전 업그레이드 및 보안 패치 작업이 필요함.',3,'패치 관리','Juniper 버전별 정보\r\nhttp://www.juniper.net/us/en/products-services/routing/'),(71,'WI1-03','Web','IIS CGI 실행 제한','CGI 스크립트는 정해진 디렉터리에서만 실행되도록 하여야 함. 게시판이나 자료실과 같이 업로드 되는 파일이 저장되는 디렉터리에 CGI 스크립트가 실행 가능하다면 악의적인 파일을 업로드하고 이를 실행하여 시스템의 중요 정보가 노출될 수 있으며 침해사고의 경로로 이용될 수 있음\r\n',3,'보안 설정','사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 Everyone에 모든 권한, 수정 권한 쓰기 권한 제거 후 Administrators, System 그룹 추가(모든 권한)\r\n'),(72,'JP4-01','Network','원격 로그서버 사용','네트워크 장비의 관리, 보안 알람 및 일반적인 정보 메시지를 원격에 위치한 로그 서버로 실시간 로깅 및 관리하는 운영이 필요함. 악의적인 사용자에 의해 로그 기록의 변조를 방지할 수 있음.',1,'로그 관리','> configure\r\n[edit]\r\n# edit system syslog\r\n[edit system syslog]\r\n# set archive files 5 sizes 5m world-readable\r\nfiles 5는 파일 수를 5개까지 표시하여 데이터를 사용하며, 5m은 최대 사이즈를 5m까지 허용하는 것을 뜻함.'),(73,'WI1-04','Web','IIS 상위 디렉터리 접근 금지','상위경로로 이동하는 것이 가능할 때 하위경로에 접속하여 상위로 이동함으로써 해 킹을 당할 위험이 있으며, Unicode 버그 및 서비스 거부 공격에 이용당하기 쉬우므 로 되도록이면 “.” 와 같은 상위 경로를 사용하지 못하도록 설정하는 것이 바람직함. “.” 는 unicode 버그, 서비스 거부와 같은 공격에 쉽게 이용되므로 허용하지 않는 것 을 권장함\r\n',3,'보안 설정','사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 Everyone에 모든 권한, 수정 권한 쓰기 권한 제거 후 Administrators, System 그룹 추가(모든 권한) '),(74,'JP4-02','Network','정책에 따른 로깅 설정','로깅 설정을 통해 로그를 정기적으로 검사하고 정상적인 운영 상태 및 공격 유형을 식별하여 네트워크 동향을 파악하여야 함.',2,'로그 관리','효율적으로 로깅을 사용하기 위해 아래의 6가지 방법을 활용함.\r\n1. 콘솔 로깅\r\n2. Buffered 로깅\r\n3. Terminal 로깅\r\n4. syslog (원격 로그서버 저장)\r\n5. SNMP traps\r\n6. ACL 침입 로깅'),(75,'JP4-03','Network','NTP 서버 연동','로그의 통합 보관 시 시간의 동기화 및 일관된 시간 관리를 위해 NTP 서버로 연동되어야 함. 하지만 NTP 서버가 사용하는 프로토콜은 보안에 취약하므로 별도의 내부 NTP 서버나 신뢰할 수 있는 서버로 설정해야 함.',2,'로그 관리','Juniper 라우터에서 NTP를 설정하기 위해 Boot 서버 설정 필요\r\n> configure\r\n[edit]\r\n# edit system ntp\r\n[edit system ntp]\r\n# set boot-server 1.1.1.1 <- NTP 서버 주소\r\n\r\n클라이언트 모드 : # set server (NTP 서버주소)\r\n브로드캐스트 모드 : # set broadcast (NTP 서버주소)\r\nSymmetric ative 모드\r\n# set peer (NTP 서버주소) prefer\r\n# set peer (NTP 서버주소)'),(76,'JP4-04','Network','timestamp 로그 설정','로그의 신뢰성을 위해 로그 시간 정보가 필요하므로 timestamp 설정을 권고함.',1,'로그 관리','> set cli timestamp format \'%m-%d-%T\' <- 해당 월 일 시간 입력'),(77,'JP5-01','Network','SNMP 서비스 확인','SNMP(Simple Network Management Protocol)은 네트워크 디바이스 관리를 쉽게하는 Application Layer 프로토콜로, 이는 네트워크를 확장, 네트워크의 문제를 해결, 네트우크의 성능을 관리하는 도구로 사용되나 악용시에 네트워크 장비 접근 및 설정 변경등으로 시스템 장애가 발생할 수 있음.',3,'기능 관리','1. 확인\r\n> configure\r\n[edit]\r\n# show snmp\r\nroot authentication 설정을 이용하여 [edit system] 레벨에서 snmp 서비스 설정 확인\r\n2. SNMP 서비스가 불필요할 경우 중지\r\n> configure\r\n# no set snmp community public'),(78,'WI1-05','Web','IIS 불필요한 파일 제거','샘플 애플리케이션은 IIS 서비스 설치 시 디폴트로 설치되는 예제 스크립트로 제거하는 것이 안전함. IIS를 설치하면 기본적으로 예제와 설명서 등이 같이 설치되는데 이러한 폴 더들은 공격 대상으로 이용되거나 백도어가 심어질 위험이 있으므로 제거해 주어야 함\r\n',3,'보안 설정','사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 가상 디렉터리 삭제\r\n'),(79,'JP5-02','Network','SNMP community string 복잡성 설정','SNMP의 Public, Private과 같은 디폴트 community string을 변경하지 않고 사용할 경우, 악의적인 사용자가 장비 설정을 쉽게 변경하여 중요 시스템 정보가 노출될 수 있으므로 추측하기 어려운 Community String으로 변경하는 설정이 필요함.',3,'기능 관리','1. 확인 방법\r\n> configure\r\n[edit]\r\n# show\r\nroot authentication 설정을 이용하여 [edit system] 레벨에서 community string 확인\r\n2. SNMP Community 설정\r\n[edit groups global]\r\n# set snmp community <name>\r\n[edit groups global snmp community <name>]\r\n# set authorization read-only'),(80,'WI1-06','Web','IIS 웹 프로세스 권한 제한','웹 프로세스에서 권한을 제한하지 않는다면, 웹 사이트 방문자가 웹 서비스의 취약점 을 이용하여 시스템 권한을 획득할 수 있음. 웹 취약점을 통해 접속 권한을 획득한 경우에는 관리자 권한을 획득할 수 있고 서버에 접속하여 해당 정보를 해킹하거나 변경 손실할 우려가 있음\r\n',3,'보안 설정','시작> 제어판> 관리 도구> 로컬 보안 정책에서 nobody 계정 설정 \r\n'),(81,'JP5-03','Network','SNMP ACL 설정','ACL을 설정할 경우 접속 대상 호스트를 지정하여 접근이 가능한 IP를 제한할 수 있음. 이 기능을 사용하여 정보의 노출을 줄이고 임의의 호스트에서 SNMP 접근을 차단하여 Community String 추측공격을 차단할 수 있음.',3,'기능 관리','1. 해당 인터페이스에서만 접속 가능\r\n[edit snmp]\r\nsnmp {\r\n            interface [ so-0/0/0.0 so-0/0/0.1 at-1/0/1.0 at-1/0/1.1 ];\r\n}\r\n2. 203.235.xxx.xxx 에서만 해당 네트워크 장비로 접속 가능\r\n[edit snmp community]\r\n        clients {\r\n            default restrict;\r\n            203.235.xxx.xxx <restrict>;'),(82,'JP5-04','Network','SNMP 커뮤니티 권한 설정','SNMP에서는 RO(Read Only)와 RW(Read Write) 모드를 제공함. 보안 설정을 확실하게 하지 않을 경우 SNMP를 이용하여 설정을 수정할 수 있는 등 보안 문제를 유발할 수 있음.',3,'기능 관리','SNMP 권한 설정\r\n[edit groups global]\r\n# set snmp community <name>\r\n[edit groups global snmp community <name>]\r\n# set authorization read-only\r\n# set authorization read-write'),(83,'JP5-05','Network','IP Spoofing 방지 필터링 적용','Source IP가 변조된 불법 패킷을 차단하지 않으면 Dos 등 악의적인 목적으로 사용될 수 있음.',3,'기능 관리','사이트 참고 : https://www.juniper.net/techpubs/en_US/junos12.3/information-products/pathway-pages/config-guide-firewall-filter/config-guide-firewall-filter.html#configuration'),(84,'JP5-06','Network','Ddos 공격 방지 설정','DDos 공격 방어 설정이 되어있지 않으면 불필요한 트래픽으로 인한 네트워크 서비스의 마비될 수 있으므로 Ddos 보안 설정이 필요함.',3,'기능 관리','1. Ddos 공격 방어 설정 요소\r\n- Fragmemt 공격 차단 설정\r\n- 적절한 ACL을 통한 사전방어 설정 필요\r\n- 보안담당자와 네트워크담당자가 연계하여 차단 설정\r\n2. 설정 요소 확인\r\n> configure\r\n# show configuration\r\nroot authentication 설정을 이용하여 [edit system] 레벨에서 Ddos 방어 설정 요소 확인'),(85,'JP5-07','Network','사용하지 않는 인터페이스의 shutdown 설정','사용하지 않는 포트에 비인가자가 불법적인 접근이 가능할 수 있으므로 네트워크 정보 유출 및 손상 위험 방지를 위해 사용하지 않는 인터페이스를 shutdown 시키는 설정이 필요함.',3,'기능 관리','기본적인 인터페이스 비활성\r\n[edit interface interface-name] <- 해당 인터페이스 이름 삽입\r\ndisable;\r\n예제>\r\n# configure\r\n# edit interfaces\r\n\r\n[edit interface]\r\n# set so-1/1/0 disable'),(86,'JP5-08','Network','Finger 서비스 제거','Finger 서비스로 장비의 접속 상태가 노출될 수 있으며, VTY의 사용 현황을 원격에서 파악하는 것이 가능하므로 제한 설정이 필요함.',2,'기능 관리','> configure\r\n[edit]\r\n# edit system services\r\n[edit system services]\r\n  no finger {\r\n        <connection-limit limit>;\r\n        <rate-limit limit>;'),(87,'JP5-09','Network','Bootp 서비스 차단','BOOTP는 네트워크 사용자가 자동으로 IP 주소를 받게 구성되고 사용자의 관여 없이도 부트되는 운영체계를 가지고 있게 해주는 프로토콜임, 그러나 사용하지 않는 불필요한 서비스는 시스템 또는 네트워크 공격자의 공격루트로 활용될 수 있음, 따라서 사용하지 않는 Bootp Server를 비활성화 시킬 것을 권고함.',2,'기능 관리','DHCP 서버 IP 주소와 서버가 연결되어있는 스위치에 대한 인터페이스 지정 옵션 제거\r\n> configure\r\n[edit]\r\n# edit forwarding-options helpers bootp\r\n# no set interface (인터페이스 포트) server (주소)'),(88,'JP5-10','Network','Directed-broadcast 차단','IP Directed Broadcast는 DoS(Denial Of Service)의 일종인 “Smurf” 공격에 주로 쓰이는 방식으로 Directed Broadcast는 목표지점에 도달하기 전까지 unicast 방식으로 전송되다가 최종 라우터를 통과할 때 비로소 Directed Broadcast를 알아볼 수 있으므로, 각 장치별로 이러한 패킷을 Drop 시킬 수 있도록 설정해야 함',2,'기능 관리','> configure\r\n[edit]\r\n# no ip directed-broadcast'),(89,'JP5-11','Network','IP Source Routing 제한 여부',' 라우터에서 패킷의 목적지에 따라 패킷을 라우팅하는 것이 기본이지만, 경우에 따라 송신측에서 라우팅 경로 정보를 송신 데이터에 포함시켜 라우팅 시키는 방법을 사용하는 경우가 있다. 현재, 거의 사용되지 않는 방법이지만 내부의 라우팅 경로를 파악하여 라우팅이 되지 않는 중요 서버로 접근 할 수 있기 때문에 소스 라우팅을 기본적으로 막아야 함',3,'기능 관리','1. 확인 방법\r\n# show route\r\nip source route 설정 확인\r\n2. IP Source Routing 제한 설정\r\n> configure\r\n[edit]\r\n# no-source-route'),(90,'JP5-12','Network','Proxy ARP 차단','악의적인 사용자가 잘못된 IP와 MAC 정보를 보내올 경우 ARP 프록시는 잘못된 정보를 보관하여 정상적인 통신을 방해하므로 ARP Proxy를 차단해야 함.',2,'기능 관리','Syntax\r\nproxy-arp (restricted | unrestricted);'),(91,'JP5-13','Network','ICMP unreachable, Redirect 차단','ICMP unreachable과 ICMP Redirect가 설정되어 있으면 악의적인 사용자가 네트워크 경로 정보에 대한 패킷을 가로챌 수 있으므로 서비스를 중지하여야 함.',2,'기능 관리','1. 설정 확인\r\n# show\r\nICMP Unreachables, ICMP redirects 적용 확인\r\n2. ICMP Unreachables, ICMP redirects 설정 차단'),(92,'JP5-14','Network','pad 차단','pad 서비스는 X.25 프로토콜 시 사용하므로 불필요할 경우 중지해야 함.',2,'기능 관리','> configure\r\n[edit]\r\n# no hello-padding (adaptive | loosse | strict);'),(93,'JP5-15','Network','mask-reply 차단','mask-rely는 인터페이스를 통해 netmask를 요청하는 ICMP 패킷 발송 시 응답하도록 하는 설정임. 활성화한 경우 네트워크의 netmask 정보 등이 유출될 수 있으므로 차단해야 함.',2,'기능 관리','> configure\r\n[edit]\r\n# no ip mask-reply'),(94,'WI1-07','Web','IIS 링크 사용금지','공개적인 웹 콘텐츠 디렉터리 안에서 서버의 다른 디렉터리나 파일들에 접근할 수 있는 심볼릭 링크, aliases, 바로가기 등을 사용하지 않도록 하여야 함\r\n',3,'보안 설정','등록된 웹 사이트의 홈 디렉터리에 있는 심볼릭 링크, aliases, 바로가기 파일 삭제\r\n'),(95,'MS1-01','DB','기본 계정의 패스워드, 정책 변경하여 사용','sa 계정 null 암호 취약점은 비인가자에 의해 sa 계정으로 데이터베이스에 침입하여 정보 삭제, 변경 등의 행위를 할 수 있음',3,'계정 관리','sa 계정 패스워드 변경\r\nalter login sa with password=\'new password\''),(96,'MS1-02','DB','불필요한 계정의 제거 및 잠금 설정','데이터베이스의 계정 중 불필요한 계정들이 있을 경우 비 인가자가 접속하여 데이터의 열람, 수정, 삭제를 할 위험이 있음',3,'계정 관리','불필요한 계정 삭제\r\nexec sp_droplogin \'삭제할 계정\''),(97,'WI1-08','Web','IIS 파일 업로드 및 다운로드 제한','대량의 파일 업로드 및 다운로드로 인하여 서비스 불능상태가 발생할 수 있으므로 불필요한 업로드 및 다운로드의 용량을 제한하여야 함. 또한, 대량의 파일 용량을 허 용할 경우 웹 취약점으로 인하여 중요 정보가 대량으로 유출될 위험성이 있음\r\n',3,'보안 설정','파일 업로드 및 다운로드 용량을 허용할 수 있는 최소 범위로 설정\r\n'),(98,'MS1-03','DB','패스워드 사용기간 및 복잡도 설정','패스워드 복잡도가 설정되지 않은 경우 공격자는 bruteforce 공격을 통하여 패스워드를 쉽게 획득할 위험이 있음',3,'계정 관리','1. MSSQL에서 \'암호 만료 강제 적용\' 체크\r\n2. 암호 만료 강제 적용\r\n보안 > 로그인 > 각 로그인 계정 > 속성\r\n암호 만료 강제 적용 : 설정(체크) 확인\r\n3. OS의 암호 정책 설정\r\n관리도구 > 로컬 보안 정책 > 보안 설정 > 계정 정책 > 암호 정책 : 최대 암호 사용 기간 \'60일\' 설정'),(99,'WI1-09','Web','IIS DB 연결 취약점 점검','Global.asa 파일에는 데이터베이스 관련 정보(IP 주소, DB명, 패스워드), 내부 IP 주소, 웹 애플리케이션 환경설정 정보 및 기타 정보 등 보안상 민감한 내용이 포함되어 있 으므로 해당 파일이 악의적인 사용자에게 노출될 경우 침해사고로 이어질 수 있음\r\n',3,'보안 설정','사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 .asa 매핑을 아래 그림과 같이 추가 \r\n'),(100,'MS1-04','DB','DB 사용자 계정 개별적 부여','데이터베이스의 계정이 사용자, 프로세스와 응용프로그램 등에 동일하게 사용하게 될 경우 침해사고 발생 시 책임 추적에 영향을 주며, 계정별 권한 부여가 불가능해지고 비인가 사용자 접속이 가능함',2,'계정 관리','1. 불필요한 계정 삭제\r\n2. 사용자별, 응용프로그램별 계정 생성'),(101,'MS1-05','DB','Windows OS 그룹 멤버 확인','데이터베이스 접속시 윈도우 인증을 하는 경우 OS그룹에 포함된 모든 사용자는 DBA권한으로 DB에 접속할 수 있음\r\n임의의 사용자가 그룹에 포함될 경우 DBA권한을 획득할 수 있는 위험이 있음',2,'계정 관리','administrators 그룹내에 포함된 멤버들을 확인하여 DBA가 모르는 불필요한 멤버가 존재하는\r\n 경우 삭제'),(102,'WI1-10','Web','IIS 가상 디렉터리 삭제','IIS 4.0, 5.0 설치 시 기본적으로 /issadmpwd라는 가상 디렉터리를 생성하는데, 이 디렉 터리에는 웹 서버를 통하여 패스워드를 변경시켜주는 기능 등을 하는 .HTR 파일이 존재 함. 이러한 기능들이 필요하지 않을 경우 /issadmpwd를 제거하고 이 외 존재하는 취약 점을 줄이기 위해서 IIS Admin에 관계되는 모든 파일 및 디렉터리를 삭제하여야 함\r\n',3,'보안 설정','사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 IIS Admin, IIS Adminpwd 삭제\r\n'),(103,'MS1-06','DB','취약한 패스워드 사용','DBA 관리자 및 사용자의 패스워드가 계정명과 동일 하거나 패스워드 없는 사용자 등\r\n취약하게 설정된 경우 악의적인 공격자에 의해서 데이터베이스 접근을 쉽게 할 위험이\r\n존재함(패스워드는 복잡하게 설정하여 관리해야 함)\r\n',3,'계정 관리','특수문자, 숫자, 문자 혼합하여 8자리 이상으로 패스워드 설정\r\nexec sp_password \'<기존패스워드>\',\'<신규패스워드>\',\'<사용자 ID>\''),(104,'MS2-01','Network','인가되지 않은 사용자 시스템 테이블 접근 제한 설정','DBA만 접근 가능해야 할 테이블을 잘못 설정할 경우 비인가 사용자가 시스템의 정보를 열람하거나 설정 변경이 가능함',3,'접근 관리','1. System tables 접근 권한이 Public, Guest 또는 비 인가된 사용자에게 부여된 경우 접근 권한을 제거\r\nUse database name\r\nrevoke <권한> on <object> from [username][public][guest]\r\n2. 시스템 테이블에 접근하기 위해서는 stored procedure 또는 information_schema views를\r\n 통해서 접근해야 함\r\n3. 시스템 테이블에 접근 가능한 stored procedure는 사용이 제한되어야 함'),(105,'WI1-11','Web','IIS 데이터 파일 ACL 적용','웹 데이터 파일에 *ACL을 부여함으로써 권한 없는 사용자로부터의 실행 및 읽기 제 한을 설정할 수 있음. 향후 필요에 의해 IIS를 설치하여 운용한다면 웹 데이터 파일에 대한 ACL을 부여하는 것이 바람직하며 ACL을 설정할 때에는 다음과 같은 사항을 참 고하여 설정하여야 함. 1. 가능한 파일의 종류끼리 분류하여 폴더에 저장하는 것이 좋음. 2. 홈 디렉터리(기본: c:\\inetpub\\wwwroot)내에 적절한 ACL 권한을 부여함\r\n',3,'보안 설정','\"IIS 서비스를 사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 홈 디렉터리에 Administrators, System 권한만 설정 후 하위 디렉터리에 존재하는 모든 Everyone 권한 제거\r\n(정적 콘텐츠 파일에 경우 Read 권한 허용) \"\r\n'),(106,'MS2-02','DB','xp_cmdshell procedure 사용 제한','원격에서 xp_cmdshell procedure 를 활용하여 OS 명령을 수행하여 root 권한을 획득할 수 있으므로, 실행권한을 제거하여 비 인가자에 의한 사용이 제한되도록 설정해야 함',3,'접근 관리','<SQL 2000>\r\nSQL Server 그룹 > master 데이터베이스 > 확장 저장프로시저 > XP_CMDSHELL 프로시저 등록정보 > 사용권한 > 실행 권한 제거\r\n<SQL 2005>\r\n시작 > 구성도구 > SQL Server 노출 영역 구성 > 기능에 대한 노출 영역 구성 > Database Engine 클릭 > xp_cmdshell > 체크 해제\r\n<MSSQL 2008>\r\n기본값이 비활성화 (exec sp_configure \'xp_cmdshell\' 값이 없을 경우 비활성화)\r\nExec sp_configure ‘show advanced options’,1\r\nExec sp_configure ‘xp_cmdshell’,’0’\r\nReconfigure'),(107,'MS3-01','DB','Public 그룹의 권한 제한','Object의 사용권한이 Public 권한(role)이 부여되어 있는 경우, 모든 계정이 해당 object에 대한 접근이 가능하므로, 해당 object에서 public 권한이 필요하지 않을 경우, public role에 object 사용권한을 부여하는 것을 제한해야 함',3,'옵션 관리','각 object의 사용권한이 불필요하게 public role, guest에 부여된 경우 권한 제거\r\nUse <databasename>\r\nRevoke <권한> on <object> from public|guest\r\nRevoke grant option for <권한> on <object> from public'),(108,'MS3-02','DB','With grant option 사용','With grant option과 함께 권한을 받은 사용자는 해당 권한을 다른 사용자에게 grant 할 수 있으므로, 다른 object 의 사용권한 부여는 DBA만 할 수 있도록 제한해야 함',1,'옵션 관리','각 데이터베이스에서 불필요하게 with grant option이 부여된 경우 사용자로부터 권한 제거\r\n<SQL 2000>\r\n Revoke <권한> on <object> from <user>\r\n<SQL 2005>\r\n Revoke grant option for <object name> from <user name>'),(109,'MS4-01','DB','데이터베이스에 대해 최신 보안패치 적용','데이터베이스의 보안 패치를 적용하지 않을 경우 공격자가 알려진 취약점을 이용하여 데이터베이스에 접근 가능함.',3,'패치 관리','데이터베이스에 대한 최신의 보안패치를 확인하여 패치 수행 (중기 적용)\r\n참고 사이트 : http://support.microsoft.com/kb/321185/en-us'),(110,'WI1-12','Web','IIS 미사용 스크립트 매핑 제거','사용하지 않는 스크립트 매핑은 보안에 위협이 될 수 있으므로 개발자와 협의하여 불필요한 매핑인지 확인한 후 제거함. .asp나 .shtm 과 같은 확장자들은 특정 DLL 파일과 매핑 되어 있어, 이러한 파일들에 대한 요청이 들어오면 해당 DLL에 의해 처리됨. 이러한 매핑 중 사용되지 않는 것들 은 제거하면 보안에 도움이 되며, 특히, .ida, .idc, .idq, .printer, .htr, .htw 확장자는  버퍼 오버플로우(Buffer Overflow) 공격 위험이 존재하므로 삭제를 권고함\r\n',3,'보안 설정','사용하지 않는 경우 IIS 서비스 중지, 사용할 경우 취약한 매핑 제거 (아래 표 참고)\r\n'),(111,'MS5-01','DB','보안 감사 설정','SQL 서버에 대한 접근 기록 후 주기적인 검사를 통하여 침입여부를 확인함으로써 침해 및 시도를 확인 할 수 있음.',3,'로그 관리','<MSSQL 2000>\r\nSQL Server > 등록정보 > 보안탭 > 감사수준 : \'모두\' 선택\r\n<MSSQL 2005, 2008>\r\nMSSQL2005 > 속성 > 보안탭 > 로그인 감사 옵션 > \'실패한 로그인과 성공한 로그인 모두\' 선택'),(112,'MS5-02','DB','백업 관리','주기적인 백업이 수행되어야 하며 특히 DBMS의 유지보수 및 Upgrade 작업에는 전체 full 백업을 실시하여 장애 및 외부 침입 등에 대한 변조가 발생할 경우를 대비해야 함',1,'로그 관리','백업 정책을 바탕으로 주기적인 백업 절차를 수립함\r\nDBMS의 유지보수 및 Upgrade 작업 시에는 전체 full 백업 절차를 수립함'),(113,'WI1-13','Web',' IIS Exec 명령어 쉘 호출 진단','명령어가 Web 서버에서 임의의 명령을 호출하여 허가되지 않은 파일을 실행하도록 사용될 수 있음. 임의의 명령을 호출하도록 설정되어 있다면 아래의 조치 방법에 따 라서 설정을 변경하여 주는 것이 안전함\r\n',3,'보안 설정','■ Windows NT, 2000\r\n1. 시작> 실행> REGEDIT> HKLM\\SYSTEM\\CurrentControlSet\\Services\\W3SVC\\Parameters 검색\r\n2. DWORD> SSIEnableCmdDirective 값을 찾아 값을 “0”으로 입력\r\n※ IIS 6.0 이상 버전 해당 사항 없음\r\n'),(114,'OC1-01','DB','기본 계정의 패스워드, 정책 변경하여 사용','기본 계정(system,scott)의 정책을 변경하지 않고 사용할 경우 공격자가 데이터베이스에 쉽게 접근할 수 있는 취약점이 존재',3,'계정 관리','모든 계정 확인 : select * from all_users;\r\n계정 삭제 : SQL> drop user <username>;\r\n기본 패스워드 변경 : alter user username identified by new_passwd;'),(115,'OC1-02','DB','불필요한 계정의 제거 및 잠금 설정','데이터베이스의 계정 중 불필요한 계정들이 있을 경우 비 인가자가 접속하여 데이터의 열람, 수정, 삭제를 할 위험이 있음',3,'계정 관리','모든 계정 확인 : select * from all_users;\r\n계정 삭제 : SQL>Drop user <username>;\r\n계정 잠금/만료 : alter user \'계정명\' account lock password expire'),(116,'WI1-14','Web','IIS WebDAV 비활성화','악의적으로 작성된 요청을 이용하여 특별한 방식으로 인증을 우회할 경우 패스워드 로 보호된 WebDAV의 자원에 접근할 수 있음. 또한, 매개 변수를 정확하게 점검하 지 않는 WebDAV에 의해 호출된 구성 요소 중 하나에 결함이 존재하며, 이로 인해 버퍼 오버런이 일어날 수 있음\r\n',3,'보안 설정','IIS 서비스를 사용하지 않는 경우 IIS 서비스 중지,\r\n사용할 경우 해당 레지스트리 값을 1로 설정함\r\n(Windows NT, 2000 서비스팩 4 이상 양호, Windows 2003 WebDAV가 금지 시 양호, Windows XP 서비스팩 2이상 양호)\r\n\r\n'),(117,'OC1-03','DB','패스워드 사용기간 및 복잡도 설정','패스워드 복잡도가 설정되지 않은 경우 공격자는 bruteforce 공격을 통하여 패스워드를 쉽게 획득할 위험이 있음',3,'계정 관리','1. PASSWORD_LIFE_TIME 프로파일 파라미터 변경\r\nSQL> ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME 60;\r\n2. 프로파일 값과 관련된 사용자 변경\r\nSQL> alter user profile\r\n3. 패스워드 설정 변경\r\nFAILED_LOGIN_ATTEMPTS 3 (패스워드 실패 3번 까지만 가능)\r\nPASSWORD_LIFE_TIME 60 (60일 동안만 패스워드 사용 가능)\r\nPASSWORD_REUSE_TIME 30 (사용한 패스워드 30일 후부터 재사용 가능\r\nPASSWORD_VERIFY_FUNCTION verify_function (패스워드 검증 수행)\r\nPASSWORD_VERIFY_FUNCTION verify_function_11g (11g 버전일 경우)\r\nPASSWORD_GRACE_TIME 5; (LIFE TIME이 끝나고 5일 동안 메시지를 보여줌)'),(118,'WI1-15','Web','IIS 웹 서비스 정보 숨김','에러 페이지, 웹 서버 종류, 사용 OS, 사용자 계정이름 등 웹 서버와 관련된 불필요 한 정보가 노출되지 않도록 하여야 함. 이러한 정보가 노출된다면 공격에 필요한 정 보를 수집하는 데 도움이 될 수 있음\r\n',2,'보안 설정','발생 가능한 각 에러에 대한 별도의 웹 서비스 에러 페이지를 지정함\r\n'),(119,'OC1-04','DB','취약한 패스워드 사용','계정명과 동일, Default 패스워드 설정 등 계정의 패스워드가 취약하게 설정되어 있는 경우 비인가자가 쉽게 데이터베이스에 접근 할 위험이 있음\r\n접근 시 데이터베이스 삭제, 변경 등의 심각한 침해사고를 일으킬 수 있음',3,'계정 관리','패스워드를 문자, 숫자, 특수문자를 혼용하여 8자리 이상으로 설정 권고함\r\nSQL>ALTER USER user_name IDENTIFIED BY new_password'),(120,'OC1-05','DB','패스워드 재사용에 대한 제약','패스워드 재사용될 수 있기 전에 일수를 명시하는 파라미터 값과 패스워스 횟수 설정 파라미터 값이 미설정 시 패스워드 노출 가능성이 증가함.',2,'계정 관리','1. 현재의 프로파일 설정 확인\r\nSQL> select * from dba_profiles;\r\n2. PASSWORD_REUSE_TIME 값 확인 후 설정 (현재 패스워드 재사용할 수 없는 기간)\r\n3. PASSWORD_REUSE_MAX 값 확인 후 설정 (현재 패스워드를 재사용할 수 있는 횟수)'),(121,'WI2-01','Web','최신 패치 적용','주기적으로 보안 패치를 적용하지 않으면 서버 침해가 발생할 수 있음\r\n',3,'로그 및 패치 관리','업데이트 릴리즈 여부를 정기적으로 확인하고, 적용 여부를 검토 한 후 최신 버전 업데이트 적용\r\n'),(122,'OC1-06','DB','SYSDBA 권한의 제한','SYSDBA 권한은 database를 startup,shutdown,reconfiguration 할 수 있는 권한을 사용자에게 부여하므로 DBA외의 사용자에게 권한은 제한적으로 부여해야 함',3,'계정 관리','SYSDBA 권한이 일반 사용자에게 불필요하게 주어진 경우 권한 제거\r\n SQL> REVOKE SYSDBA FROM user_name'),(123,'OC1-07','DB','DB 사용자 계정 개별적 부여','데이터베이스의 계정이 사용자, 프로세스와 응용프로그램 등에 동일하게 사용하게 될 경우 침해사고 발생 시 책임 추적에 영향을 주며, 계정별 권한 부여가 불가능해지고 비인가 사용자 접속이 가능함',2,'계정 관리','1. 계정 확인 (사용하지 않거나 모르는 계정 확인)\r\nSQL> select username from dba_users order by username;\r\n2. 공통으로 사용하는 계정 삭제\r\nSQL> drop user \'삭제할 계정\'\r\n3. 사용자별, 응용프로그램별 계정 생성\r\nSQL> create user username identified by passwd;\r\n4. 권한 부여\r\nSQL> grant connect, resource to username;'),(124,'OC2-01','DB','인가되지 않은 사용자 시스템 테이블 접근 제한 설정','DBA만 접근 가능해야 할 테이블을 잘못 설정할 경우 비인가 사용자가 시스템의 정보를 열람하거나 설정 변경이 가능함',3,'접근 관리','불필요하게 테이블 접근 권한이 사용자 계정에 할당된 경우 접근 권한 회수\r\nSQL> revoke 권한 on 객체 from user;'),(125,'OC2-02','DB','리스너 패스워드 설정','Listener의 패스워드가 설정되어 있지 않은 경우, listener의 owner라면 DBA가 아니라도 Listener 를 Shut Down 시키거나 DB 서버에 임의의 파일을 생성할 수 있음(Clustering 사용시 DB를 따로 사용하는 경우는 제외)',3,'접근 관리','1. 확인 방법\r\nListener.ora파일에 패스워드가 설정 또는 ADMIN_RESTRICTIONS_< Listener Name>=ON이 설정된 경우 양호\r\n- Listener 프로세스가 활성화 되지 않는 경우에도 양호\r\n- 10g 이상은 디폴트로 원격 접근 시 사용자 인증 요구를 하기 때문에 양호\r\n2. 조치 방안\r\nListener에 패스워드가 설정되지 않은 경우 dos, 정보 획득, listener 프로세서 다운 시킬 수 있는 위험이 있으므로 반드시 listener 패스워드 설정'),(126,'OC2-03','DB','로그인 임계값 설정','일정한 횟수의 로그인 실패 횟수 발생 시 이를 제한하지 않으면 공격자가 무작위 추측 공격을 통하여 데이터베이스에 접근 가능함.',2,'접근 관리','1. failed_login_attemps 프로파일 파라미터 수정\r\nSQL> alter profile limit failed_login_attempts xx\r\n'),(127,'OC2-04','DB','패스워드 설정 파일 접근 권한 설정','데이터베이스의 패스워드 설정 관련 파일에 접근 권한이 설정되어 있지 않으면 비인가자가 접근하여 수정, 삭제 가능함.',2,'접근 관리','1. Unix OS\r\n패스워드 파일의 접근권한을 640, 600으로 설정 \r\n# find / -name orapw* (패스워드 파일 찾는 방법)\r\n# chmod 640 orapw<SID>\r\n2. Windows\r\n오라클 패스워드 파일(orapw<SID>) 접근 권한은 administrators, system group, owner group, oracle service account, DBAs에게 모든 권한 또는 이하로 설정하고 기타 다른 그룹은 제거'),(128,'OC3-01','DB','Public 그룹의 권한 제한','Object에 Public 권한이 부여되는 경우, 모든 계정에게 그 Object 사용 권한이 부여됨으로 허가되지 않는 사용자도 접근이 가능함.',3,'옵션 관리','Object 의 사용권한이 불필요하게 public 에 부여된 경우 public 로부터 권한 제거\r\nSQL>REVOKE 권한 ON object FROM PUBLIC;'),(129,'OC3-02','DB','원격 OS 인증 방식 설정','Remote_os_authent가 true로 설정되어 있을 경우 보호되지 않은 연결을 통해서 원격 OS인증 연결이 가능함',2,'옵션 관리','가. 원격 OS인증방식이 불필요한 경우\r\nSYS계정으로 접속하여 remote_os_authent=false 로 설정\r\n- spfile 파라미터를 사용하는 경우 : alter system set remote_os_authent=false scope=spfile\r\n- pfile 파라미터를 사용하는 경우: init<SID>.ora 파일에서 remote_os_authent=false 설정\r\n나. 원격 OS 인증방식이 필요한 경우\r\n- 방화벽을 통한 원격 접근 IP 제한\r\n- NAT(Network Address Translation)를 사용하여 비 공인 IP를 부여하고 외부 접근제한'),(130,'OC3-03','DB','자원 제한 기능을 True로 설정','설정 옵션 중 Resource_limit에 의해서 모든 프로파일 limit 설정 값을 무시할 수 있음',1,'옵션 관리','1. init.ora 설정 파일에 resource_limit = true 라인 추가\r\n2. SQL> alter system set resource_limit=true;'),(131,'WN1-01','Web','nginx 디렉터리 리스팅 제거','디렉터리 검색은 디렉터리 요청 시 해당 디렉터리에 기본 문서가 존재하지 않을 경우 디렉터리 내 모든 파일의 목록을 보여주는 기능임. 디렉터리 검색 기능이 활성화되어 있는 경우 외부에서 디렉터리 내의 모든 파일에 대한 접근이 가능하여 WEB 서버 구조 노출뿐만 아니라 백업 파일이나 소스파일 등 공개되어서는 안 되는 중요 파일 노출이 가능함\r\n',3,'보안 설정','1. nginx.conf 에서 autoindex 옵션을 비활성화 (Default 값은 OFF)\r\n# vi [NginX 설정 디렉터리]/nginx.conf\r\nlocation / {\r\n    autoindex  off;\r\n}\r\n2. Directory Listing 기능을 제공하는 것은 ngx_http_autoindex_module로, 해당 기능이 필요하지 않다면 아래와 같이 nginx 컴파일 시 해당 모듈을 제외하고 컴파일\r\n$ ./configure --without-http_autoindex_module --without-http_ssi_module\r\n$ make\r\n$ make install\r\n'),(132,'OC3-04','DB','패스워드 확인 함수 설정','password_verify_function 값은 프로파일에 명시된 사용자가 데이터베이스에 로그인 할 때 패스워드 확인을 위해 PL/SQL 함수가 사용되도록 명시하는 프로파일임.',2,'옵션 관리','패스워드 복잡도를 강제하는 패스워드 검증 함수를 생성, 사용하여야 함\r\nSQL> alter profile default limit\r\nSQL> password_verify_function verify_password;'),(133,'OC4-01','DB','데이터베이스에 대해 최신 보안패치 적용','데이터베이스의 보안 패치를 적용하지 않을 경우 공격자가 알려진 취약점을 이용하여 데이터베이스에 접근 가능함.',3,'패치 관리','오라클 제공 패치 명령을 이용하여 확인\r\n# opatchlsinventory [-all] [-detail]\r\n사이트를 참고하여 업그레이드 및 패치 수행\r\n참고 사이트 : http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html'),(134,'OC4-02','DB','보안 패치를 지원해주는 버전의 데이터베이스 사용','밴더에서 최신 보안 패치를 지원하지 않는 버전을 사용할 경우 공격자가 취약점을 이용하여 시스템 권한을 획득할 수 있는 취약점이 존재함.',2,'패치 관리','1. 9.2 버전 또는 이전 버전에 대한 업그레이드\r\n2. 버전 확인\r\nSQL> select banner from v$version where banner like \'Oracle%\';'),(135,'OC5-01','DB','SYS감사 수행 설정','중요 정보에 대한 SYS사용자와 SYSDBA/SYSOPER로 접속하는 다른 사용자들에 대해 감사 기능을 설정함으로써 침해 발생 분석 및 침해시도 여부를 확인할 수 있음',3,'로그 관리','Audit_sys_operation 값을 True로 설정'),(136,'OC5-02','DB','보안 감사 설정','감사를 수행할 수 있게 설정함으로써 사용자에 의한 문장에 대한 감사, 권한에 대한 감사, 객체에 대한 감사를 수행할 수 있음. 침해사고 및 장애 시 감사 자료를 분석하여 정확한 분석을 할 수 있음',1,'로그 관리','1. 감사를 활성화시키기 위하여 “Audit_trail” 의 값을 [DB|TRUE|OS|DB_EXTENDED]중\r\n  하나 설정\r\n- pfile을 사용하는 경우 init<SID>.ora 파일 안에 다음과 같이 설정\r\naudit_trail=[OS|TRUE|DB|DB_EXTENDED] 중 하나 삽입\r\n* DB_EXTENDED는 10g이후 버전에만 설정\r\n- spfile을 사용하는 경우 spfile<SID>파일에 다음과 같이 설정\r\n       ALTER SYSTEM SET audit_trail=[OS|TRUE|DB|DB_EXTENDED scope=spfile'),(137,'OC5-03','DB','백업 관리','주기적인 백업이 수행되어야 하며 특히 DBMS의 유지보수 및 Upgrade 작업에는 전체 full 백업을 실시하여 장애 및 외부 침입 등에 대한 변조가 발생할 경우를 대비해야 함',1,'로그 관리','1. 백업 정책을 바탕으로 주기적인 백업 절차를 수립함\r\n2. DBMS의 유지보수 및 Upgrade 작업 시에는 전체 full 백업 절차를 수립함'),(138,'WN1-02','Web','nginx 웹 프로세스 권한 제한','UNIX 시스템의 경우 Web 서버 데몬이 root 권한으로 운영될 경우 Web Application의 취약점 또는, 버퍼 오버플로우(Buffer Overflow)로 인하여 root 권한을 획득할 수 있으므로 서버 데몬이 root 권한으로 운영되지 않도록 관리하여야 함\r\n',3,'보안 설정','웹 서버 프로세스 소유자 계정에 대해 로그인되지 않도록 /bin/false(nologin) 설정\r\n# vi /etc/passwd\r\nnobody:*:65534:65534:Unprivileged user:/nonexistent:/usr/sbin/nologin'),(139,'WN1-03','Web','nginx 불필요한 파일 제거','웹 서버 설치 시 기본으로 생성되는 매뉴얼 파일은 외부 침입자에게 시스템 정보 및 웹 서버 정보를 제공할 수 있으므로 제거하여야 함\r\n',3,'보안 설정','sample, test 파일 등 불필요한 파일 및 데릭토리 제거\r\n'),(140,'WN1-04','Web','nginx 파일 업로드 및 다운로드 제한','불필요한 파일 업로드, 다운로드 시에 대량의 업로드, 다운로드로 인한 서비스 불능상태가 발생할 수 있음. 따라서 불필요한 업로드와 다운로드는 허용하지 않으며, 웹 서버에 의해 처리되지 못하게 하고, 자동이나 수동으로 파일의 보안성 검토를 수행함\r\n',3,'보안 설정','nginx.conf 에서 업로드 용량 제한 설정\r\n# vi [NginX 설치 디렉터리]/nginx.conf\r\nclient_max_body_size 10m'),(141,'WN1-05','Web','nginx 웹 서비스 영역의 분리','nginx 설치 시 html 디렉터리를 DocumentRoot로 사용하고 있는데 html 디렉터리는 공개되어서는 안 될(또는, 공개될 필요가 없는) nginx 문서뿐만 아니라 공격에 이용될 수 있는 시스템 관련 정보도 포함하고 있으므로 이를 변경하여야 함. 또한, 대량의 업로드와 다운로드 시 서비스 불능 상태가 발생할 수 있음\r\n',3,'보안 설정','기본 디렉토리 위치 변경\r\n# vi [Nginx 설정 디렉터리]/nginx.conf\r\nlocation / {\r\n            root   /usr/local/www/nginx;\r\n            index  index.html index.htm;\r\n        }'),(142,'WN1-06','Web','nginx 웹서비스 정보 숨김','에러 페이지, 웹 서버 종류, OS 정보, 사용자 계정 이름 등 웹 서버와 관련된 불필요한 정보가 노출되지 않도록 하여야 함. 불필요한 정보가 노출될 경우 해당 정보를 이용하여 시스템의 취약점을 수집할 수 있음\r\n',2,'보안 설정','\"1. nginx.conf 에서 server_tokens 옵션을 비활성화\r\n# vi [NginX 설정 디렉터리]/nginx.conf\r\nserver_tokens off;\r\n\r\n2. 컴파일 전에 아래 파일의 웹서버 명(AAAAAAAA, BBBBBBBB 부분)을 변경하면 해당 이름이 서버 정보로 나타남\r\n파일 경로 : src/http/ngx_http_header_filter_module.c\r\nstatic char ngx_http_server_string[] = \"\"Server: AAAAAAAAAA\"\" CRLF;\r\nstatic char ngx_http_server_full_string[] = \"\"Server: BBBBBBBBBB \"\"  CRLF;\"\r\n'),(143,'WN2-01','Web','로그 설정 관리','웹 서버의 로그 포맷을 Combined 로그 포맷으로 설정하지 않으면, 공격 여부 파악, 공격자 사용 툴 파악, 공격자 위치 파악이 불가능하므로 반드시 Combined 포맷으로 설정해야 함\r\n',3,'로그 및 패치 관리','nginx.conf 에서 로그 포맷을 설정\r\n# vi [NginX 설정 디렉터리]/nginx.conf\r\nerror_log  /var/log/nginx/error.log warn;\r\nlog_format  main  \'$remote_addr - $remote_user [$time_local] \"\"$request\"\" \'\'$status $body_bytes_sent \"\"$http_referer\"\" \'\'\"\"$http_user_agent\"\" \"\"$http_x_forwarded_for\"\"\';\r\naccess_log  /var/log/nginx/access.log  combined;\r\n'),(144,'WN2-02','Web','최신 패치 적용','주기적으로 보안 패치를 적용하지 않으면 서버 침해가 발생할 수 있음\r\n',3,'로그 및 패치 관리','업데이트 릴리즈 여부를 정기적으로 확인하고, 적용 여부를 검토 한 후 최신 버전 업데이트 적용\r\n'),(145,'US1-01','Unix','root 이외의 UID가 \'0\' 금지','root(UID=0)와 동일한 UID(User Identification)를 가진 계정 존재 시 root 권한으로 시스템 접근이 가능하므로 root의 UID를 가진 계정이 존재하지 않도록 확인하여야 함. root뿐만 아니라 사용자 간 UID 중복 시에도 권한 중복으로 인한 사용자 감사 추적이 어렵게 되는 문제가 발생하므로 계정 및 UID 확인이 필요함.',2,'계정 관리','UID가 0인 계정 존재 시 변경할 UID를 확인 후 다른 UID로 변경 및 불필요 시 삭제, 계정이 사용 중이면 명령어로 조치가 안 되므로 /etc/passwd 파일 설정 변경'),(146,'US1-02','Unix','불필요한 계정 제거','OS나 Package 설치 시 Default로 생성되는 계정은 대부분 Default 패스워드를 사용하는 경우가 많으며 패스워드 추측공격에 악용될 수 있으므로 시스템에서 이용하지 않는 \"lp, uucp, nuucp” 등의 Default 계정 및 의심스러운 특이한 계정의 존재 유무를 확인 후 삭제함',2,'계정 관리','현재 등록된 계정 현황 확인 후 불필요한 계정 삭제'),(147,'US1-03','Unix','사용자 shell 점검','로그인이 필요 없는 계정을 이용해 시스템에 접근하여 사용자의 명령어를 해석하고 악용할 가능성이 있으므로, /bin/false 쉘(Shell)을 부여해 로그인을 금지함',2,'계정 관리','로그인이 필요하지 않은 계정에 대해 /bin/false(nologin) 쉘 부여'),(148,'US1-04','Unix','패스워드 정책 설정','패스워드 무작위 대입 공격(Brute Force Attack)이나 패스워드 추측 공격(Password Guessing)을 피하기 위하여 패스워드 최소 길이가 설정되어 있는지 점검함. 패스워드 최소 길이가 설정되어 있지 않거나, 짧게 설정되어 있을 경우 쉽게 유추될 수 있음\n그리고 패스워드 최대 사용기간을 설정하지 않은 경우 일정 기간 경과 후에도 유출된 패스워드로 접속이 가능함. 악의적인 사용자로부터 계속적인 접속을 차단하기 위해 패스워드 최대 사용기간을 설정하여 주기적으로 변경할 수 있도록 함\n또한 패스워드 최소 사용기간을 설정하지 않은 경우 사용자에게 익숙한 패스워드로 변경이 가능하며, 이를 재사용함으로써 패스워드의 정기적인 변경은 무의미해질 수 있음. 이전 암호를 그대로 재사용하는 것을 방지하기 위해 최근 암호 기억 설정을 함께 적용하여 패스워드를 보호함.',2,'계정 관리','패스워드 정책 설정파일을 수정하여 패스워드 최소 길이를 8자 이상으로 설정\n패스워드 정책 설정파일을 수정하여 패스워드 최대 사용기간을 90일(12주)로 설정\n패스워드 정책 설정파일을 수정하여 패스워드 최소 사용기간을 1일(1주)로 설정'),(149,'US1-05','Unix','root 계정 su 제한','권한이 없는 일반 사용자가 su 명령을 사용하여 로그인을 시도하고 패스워드 무작위 대입 공격(Brute Force Attack)이나 패스워드 추측 공격(Password Guessing)을 통해 root 권한을 획득할 수 있음. su 명령어 사용이 허용된 사용자만 root 계정으로 접속할 수 있도록 함',2,'계정 관리','일반 사용자의 su 명령 사용 제한\n1. Group 생성(생성할 그룹 요청, 일반적으로 wheel 사용)\n2. su 명령어의 그룹을 요청받은 그룹으로 변경\n3. su 명령어의 권한 변경(4750)\n4. su 명령어 사용이 필요한 계정을 새로 생성한 그룹에 추가(추가할 계정 요청)\n※ LINUX의 경우, *PAM(Pluggable Authentication Module)을 이용한 설정 가능'),(150,'US1-06','Unix','취약한 패스워드 사용 여부','사용자 계정(root 및 일반 계정 모두 해당) 암호를 유추하기 쉽게 설정할 경우 비인가자의 무작위 대입 공격(Brute Force Attack)이나 패스워드 추측 공격(Password Guessing)을 공격을 통한 시스템 접근을 허용하게 하는 위험이 존재함. 여러 문자를 혼합한 8자리 이상의 암호를 사용하게 하여 패스워드 복잡성을 높이면 비인가자에 의해 발생하는 침입 공격 발생률을 낮출 수 있음',3,'계정 관리','계정과 유사하지 않은 8자 이상의 영문, 숫자, 특수문자의 조합으로 암호 설정'),(151,'US2-01','Unix','계정 관련 파일 접근권한 설정','“/etc/passwd” 파일은 사용자의 ID, 패스워드(보안상 ‘x’로 표시), UID, GID, 홈 디렉터리, 쉘 정보를 담고 있는 중요 파일로 관리자 이외의 사용자가 \"/etc/passwd” 파일에 접근 시 root 권한 획득이 가능하므로 해당 파일의 접근을 제한하여야 함',3,'접근 통제','“/etc/passwd” 파일의 소유자 및 권한 변경 (소유자 root, 권한 644)'),(152,'US2-02','Unix','주요 디렉터리 접근권한 설정','주요 디렉토리의 파일 권한이 적절히 설정되어 있는지 점검\n주요 디렉토리 접근권한 설정이 잘못되어 있을 경우 비인가자가 다양한 방법으로 사용자 환경을 변경하여 침해사고를 일으킬 수 있음',3,'접근 통제','/sbin, /etc/, /bin, /usr/bin, /usr/sbin, /usr/lbin 디렉토리의 권한을 \nroot(또는 bin) 소유의 타사용자 쓰기 권한 제거 설정\nchown root [디렉토리명]\nchmod o-w [디렉토리명]'),(153,'US2-03','Unix','네트워크 서비스 설정 파일 접근권한 설정','“/etc/hosts” 파일은 IP 주소와 호스트네임을 매핑 하는데 사용되는 파일이며, 이 파일의 접근권한 설정이 잘못 설정되어 있을 경우 악의적인 시스템을 신뢰하게 되므로 “/etc/hosts” 파일에 대한 접근권한을 제한하고 있는지 점검함\n인터넷 슈퍼데몬 서비스 설정파일인 inetd.conf(xinetd.d) 파일은 접근권한이 잘못 설정되어 있을 경우 비인가자가 악의적인 프로그램을 등록하고 root 권한으로 서비스를 실행시켜 기존 서비스에 영향을 줄 수 있음. 때문에 Inetd.conf(xinetd.d)에 대한 접근권한 제한 여부를 점검함.\n서비스 관리를 위해 사용되는 /etc/services 파일은 일반 사용자에 의해 접근 및 변경이 가능하면, 정상적인 서비스를 제한하거나 허용되지 않은 서비스를 악의적으로 실행시켜 침해사고를 발생시킬 수 있음. 따라서 소유자 권한 설정을 통해 접근을 제한하여야 함.',2,'접근 통제','“/etc/hosts” 파일의 소유자 및 권한 변경 (소유자 root, 권한 600)\n“/etc/inetd.conf” 파일의 소유자 및 권한 변경 (소유자 root, 권한 600)\n“/etc/services” 파일의 소유자 및 권한 변경 (소유자 root, 권한 644)'),(154,'US2-04','Unix',' root 계정 원격 접속 제한','\nroot는 시스템을 관리하는 매우 중요한 계정임. root 계정으로 직접 로그인하도록 허용하면 불법적인 침입자의 목표가 될 수 있으므로 root 계정 접속에 대한 관리가 필요함. root 계정의 원격 접속 허용은 공격자에게 더 좋은 기회를 제공할 수 있으므로 root의 원격 접속은 금지하여야 함.\n',2,'접근 통제','원격 접속 시 root 계정으로 바로 접속 할 수 없도록 설정파일 수정'),(155,'US2-05','Unix','R 서비스 설정파일 접근권한 설정','‘r’command 사용을 통한 원격 접속은 *NET Backup이나 다른 용도로 사용되기도 하나, 보안상 매우 취약하여 서비스 포트가 열려있을 경우 중요 정보 유출 및 시스템 장애 발생 등 침해사고의 원인이 됨. 만약 사용이 불가피한 경우 /etc/hosts.equiv 파일 및 .rhosts 파일 사용자를 root 또는, 해당 계정으로 설정한 뒤 권한을 600으로 설정하고 해당 파일 설정에 ‘+’ 설정(모든 호스트 허용)이 포함되지 않도록 함',2,'접근 통제','1. /etc/hosts.equiv 및 $HOME/.rhosts 파일 소유자를 root 또는, 해당 계정으로 변경\n2. /etc/hosts.equiv 및 $HOME/.rhosts 파일 권한을 600 이하로 변경\n3. /etc/hosts.equiv 및 $HOME/.rhosts 파일에서 “+”를 제거하고 반드시 필요한 호스트 및 계정만 등록 (해당 내역 요청)'),(156,'US2-06','Unix','/etc/syslog.conf 파일 소유자 및 권한 설정','“/etc/syslog.conf” 파일은 시스템 운영 중 발생하는 주요 로그 기록을 설정하는 파일로 관리자 이외의 사용자는 해당 파일을 변경할 수 없도록 하여야 함. 만약, 해당 파일의 접근권한이 적절하지 않을 경우 시스템 로그가 정상적으로 기록되지 않아 침입자의 흔적 또는, 시스템 오류 사항을 정확히 분석할 수 없음.',2,'접근 통제','“/etc/syslog.conf” 파일의 소유자 및 권한 변경 (소유자 root, 권한 644'),(157,'US2-07','Unix','로그파일 접근권한 설정','사용자가 일정 시간 동안 아무런 작업을 수행하지 않을 경우 자동으로 로그오프 되거나 워크스테이션이 잠기도록 설정하여야 함. 해당 기능을 설정하지 않은 경우 사용자가 자리를 비운 사이에 임의의 사용자가 해당 시스템에 접근하여 중요 정보를 유출하거나, 악의적인 행위를 통해 시스템 운영에 악영향을 미칠 수 있으므로 화면보호기 대기 시간 및 암호 사용 설정을 이용해서 비인가자의 물리적 접근을 차단함',2,'접근 통제','시작>제어판>개인설정>화면보호기설정\n화면보호기 : 없음외의 선택\n대기시간 : 10분이하\n암호사용 : 체크'),(158,'US3-01','Unix','UMASK 설정 관리','시스템 내에서 사용자가 새로 생성하는 파일의 접근권한은 *UMASK 값에 따라 정해 짐. 현재 설정된 UMASK는 명령 프롬프트에서 “umask”를 수행하여 확인할 수 있으며 UMASK 값이 “027” 또는, “022”이기를 권장함',1,'시스템 환경설정','설정파일에 UMASK 값을 “022”로 설정.'),(159,'US3-02','Unix','PATH 설정','root 계정의 PATH 환경변수에 “.” (현재 디렉토리 지칭)가 포함되어 있으면, root계정의 인가자로 인해 비의도적으로 현재 디렉토리에 위치하고 있는 명령어가 실행될 수 있음. 즉 “.”이 /usr/bin이나 /bin, /sbin등 명령어들이 위치하고 있는 디렉토리보다 우선하여 위치하고 있을 경우, root 계정의 인가자가 어떠한 명령을 실행했을 때, 비인가자가 불법적으로 위치시킨 파일을 비의도적으로 실행하여, 예기치 않은 결과를 가져올 수 있음',2,'시스템 환경설정','root 계정의 환경변수 설정파일(.profile, .cshrc등)과 “/etc/profile” 등에서 PATH 환경변수에 포함되어 있는 현재 디렉터리를 나타내는 “.”을 제거\n(현재 디렉토리를 의미하는 “.”이 PATH 맨 앞이나 중간에 위치하면 안됨 → 맨뒤로 옮기거나 제거)\n\n애플리케이션 구성상 “.” 을 사용해야 하는 경우에는 “.”을 PATH 환경변수의 마지막으로 이동\n'),(160,'US4-01','Unix','로그온 시 경고 메시지 제공','로그인 배너가 설정되지 않을 경우 배너에 서버 OS 버전 및 서비스 버전이 공격자에게 노출될 수 있으며 공격자는 이러한 정보를 통하여 해당 OS 및 서비스의 취약점을 이용하여 공격을 시도할 수 있음',1,'네트워크 서비스','Telnet, FTP, SMTP, DNS 서비스를 사용할 경우 설정파일 조치 후 inetd 데몬 재시작'),(161,'US4-02','Unix','RPC 서비스 확인','RPC (Remote Procedure Call) 서비스는 분산처리 환경에서 개발을 하는 데 있어 많은 이점을 제공하지만, 아래와 같은 서비스들은 버퍼 오버플로우(Buffer Overflow) 취약성이 다수 존재하여 root 권한 획득 및 침해사고 발생 위험이 있으므로 서비스를 중지하여야 함. rpc.cmsd, rpc.ttdbserverd, sadmind, rusersd, walld, sprayd, rstatd, rpc.nisd, rexd, rpc.pcnfsd, rpc.statd, rpc.ypupdated, rpc.rquotad, kcms_server, cachefsd',2,'네트워크 서비스','일반적으로 사용하지 않는 RPC 서비스들을 inetd.conf 파일에서 주석 처리한 후 inetd 재구동 (진단 보고서에 발견된 RPC 서비스 조치)'),(162,'US4-03','Unix','불필요한 R 서비스(1) 구동 중지','rsh, rlogin, rexec 등의 ‘r’ commands는 인증없이 관리자의 원격접속이 가능하게 하는 명령어들로, NET Backup이나 다른 용도로 사용되는 경우가 있으나 ‘r’ command의 사용은 보안상 매우 취약하여, 서비스 포트가 열려있으면 침해사고의 위험성이 있음',2,'네트워크 서비스','/etc/inetd.conf 파일에서 해당 라인 주석처리 후 inetd 재 시동 하거나\n/etc/xinetd.d 디렉토리 내의 서비스 파일 수정'),(163,'US4-04','Unix','불필요한 R 서비스(2) 신뢰관계설정','“/etc/hosts.equiv” 파일은 TRUSTED 시스템들을 등록하고 ‘r’ command를 이용하여 인증 없이 접근하는 것을 가능하게 하는 설정파일임\n“.rhosts” 파일은 “/etc/hosts.equiv” 파일과 거의 동일한 기능을 수행하지만, “.rhosts” 파일은 사용자 별로 ‘r’ command 를 통해 접속 가능하도록 설정할 수 있음',2,'네트워크 서비스','‘r’ command를 사용하지 않는다면 파일의 permission을 000으로 설정하거나 “/dev/null”로 링크를 걸어 외부에서 파일을 생성하기 어렵게 하는 것이 보안상 필요함\n사용할 경우에는 특정 서버만 신중히 적어두고, “+”와 같이 모든 서버가 접근 가능하도록 하는 것은 매우 위험하므로 주의하여 설정하여야 함'),(164,'US4-05','Unix','Anonymous FTP 비활성화','\nAnonymous FTP(익명 FTP)를 사용할 경우 악의적인 사용자가 시스템에 관한 정보를 획득할 수 있으며 디렉터리에 쓰기 권한이 설정되어 있을 경우 local exploit을 사용하 여 다양한 공격이 가능하게 되므로 반드시 필요한 사용자만 접속 할 수 있도록 설정 하여 권한 없는 사용자의 FTP 사용을 제한하여야 함.\n',1,'네트워크 서비스','Anonymous FTP를 사용하지 않는 경우 Anonymous FTP 접속 차단 설정 적용'),(165,'US4-06','Unix','Telnet의 root 계정 로그인 제한','\"/etc/default/login\" 파일을 이용하여 직접적인 root의 원격 접속을 제한할 수 있음\n(Default 설정으로 root 원격 접속이 가능하도록 설정되어 있음)\nroot로 직접적인 접근은 보안상 위험하므로, 이 옵션을 설정하여 일반 사용자를 통해 root로 갈 수 있도록 하는 것이 보안상 필요함',2,'네트워크 서비스','\"/etc/pam.d/login\" 파일 수정 (주석 제거 또는 신규 삽입)\n(수정 후) account         requisite       pam_securetty.so'),(166,'US4-07','Unix',' SNMP 서비스 Community String의 복잡성 설정','SNMP(Simple Network Management Protocol) 서비스는 시스템 상태를 실시간으로 파악하는 *NMS(Network Management System)를 위하여 UNIX 시스템에서 기본적으로 제공하는 서비스이며 정보를 받기 위해 일종의 패스워드인 Community String을 사용함. *Community String은 Default로 public, private로 설정된 경우가 많으며, 이를 변경하지 않으면 이 String을 악용하여 시스템의 주요 정보 및 설정을 파악할 수 있음',2,'네트워크 서비스','snmpd.conf 파일에서 커뮤니티명을 확인한 후 디폴트 커뮤니티명인 “public, private”를 추측하기 어려운 커뮤니티명으로 변경'),(167,'US4-08','Unix','DoS 공격에 취약한 서비스 비활성화','Dos(서비스 거부 공격)에 취약한 echo, discard, daytime, chargen 서비스는 취약점이 많이 발표된 불필요한 서비스들로 해당 서비스 사용을 중지하여야 함. 만약 해당 서 비스가 활성화되어 있는 경우 시스템 정보 유출 및 Dos(서비스 거부 공격)의 대상이 될 수 있음',2,'네트워크 서비스','\"/etc/inetd.conf\" 파일에서 해당 라인 # 처리(주석처리) 후 inetd 재 시동\n# vi /etc/inetd.conf\necho   stream  tcp6    nowait  root    internal (수정 전)\n# echo   stream  tcp6    nowait  root    internal (수정 후)\n# ps -ef | grep inetd\nroot   141     1  0 15:03:22 ?        0:01 /usr/sbin/inetd -s\n# kill -HUP 141'),(168,'US5-01','Unix','SU 로그 기록','기본적으로 일반 사용자에서 Super User로 사용되는 기록을 남기기 위해서 Su 사용로그를 남기도록 하는 보안 설정이 필요함. 시스템의 가용성 및 무결성 등을 침해하는 사건이 발생할 경우, 일반적으로 Super User 권한으로 사건이 진행되기 때문에 Su의 로깅이 필요함',1,'감사 및 로그관리','# vi /etc/login.defs 를 실행하여 아래와 같은 설정으로 변경\nSULOG_FILE   /var/log/sulog     \n\n또는 # vi /etc/syslog.conf 파일에서 아래와 같은 설정으로 변경\n  authpriv.* /var/log/secure\n\n위 설정 적용 후 syslog 재기동\n# /etc/rc.d/init.d/syslog restart    데몬 재기동\n'),(169,'US5-02','Unix','정책에 따른 시스템 로깅 설정','감사 설정이 구성되어 있지 않거나 보안 정책에 비하여 감사 설정 수준이 낮아 보안 사고가 발생한 경우 원인 파악 및 각종 침해 사실에 대한 확인이 어려우며, 법적 대응을 위한 충분한 증거로 사용할 수 없음',2,'감사 및 로그관리','로그 기록 정책을 수립하고, 정책에 따라 syslog.conf 파일을 설정'),(170,'US6-01','Unix','최신 보안패치 및 벤더 권고사항 적용','주기적인 패치 적용을 통하여 보안성 및 시스템 안정성을 확보하는 것이 시스템 운용의 중요한 요소임. 서비스 중인 시스템의 경우 패치 적용에 따르는 문제점(현재 운용중인 응용프로그램의 예기치 않은 중지, 패치 자체의 버그 등)과 재부팅의 어려움 등으로 많은 패치를 적용하는 것이 매우 어렵기 때문에 패치 적용 시 많은 부분을 고려하여야 함',3,'패치 관리','O/S 관리자, 서비스 개발자가 패치 적용에 따른 서비스 영향 정도를 파악하여 OS 관리자 및 벤더에서 적용함\n※ OS 패치의 경우 지속적으로 취약점이 발표되고 있기 때문에 O/S 관리자, 서비스 개발자가 패치 적용에 따른 서비스 영향 정도를 정확히 파악하여 주기적인 패치 적용 정책을 수립하여 적용하여야 함'),(171,'MY1-01','DB','기본 계정의 패스워드, 정책 등을 변경하여 사용','root 계정의 패스워드가 디폴트 설정 값인 null을 사용할 경우, 시스템에  접근한 임의의 모든 사용자가 root 권한으로 접속하여 mysql의 모든 작업을 할 수  있어 mysql DB에 저장된 모든 정보가 유출 되는 등의 침해사고를 일으킬 위험이  있음. 기본 계정을 변경하지 않고 사용하는 경우 공격자에게 정보가 노출될   가능성이 있으므로 변경하여야 함.',3,'계정관리','root 계정 패스워드 변경\nmysql> use mysql mysql> update user set password=password(‘new password’) where user=’root’; mysql> flush privileges; 또는,\nmysql> set password for root=password(‘new password’)'),(172,'MY1-02','DB','scott 등 Demonstration 및 불필요 계정을 제거하거나 잠금 설정 후 사용','데이터베이스의 계정 중 실질적으로 업무에 사용하지 않는 SCOTT, PM, ADAMS, CLARK 등의 Demonstration 계정이 삭제되지 않고 존재하면 공격자가 데이터베이스 시스템에 쉽게 접근하여 데이터를 열람, 삭제, 수정할 위험이 존재함.',3,'계정관리','불필요한 계정 삭제 mysql> Delete from user where user=’삭제할 계정’'),(173,'MY1-03','DB','패스워드의 사용기간 및 복잡도 기관 정책에 맞도록 설정','주기적인 패스워드 변경이 없을 경우 공격자는 Brute force 공격을 통하여 패스워드 를 획득할 위험이 존재함.',3,'계정관리','패스워드 설정은 다음과 같은 방법으로 가능\nmysql> use mysql\nmysql> update user set password=password(‘new password’) where user=’user name’;\nmysql> flush privileges; 또는,\nmysql> set password for ‘user name’@’%’=password(‘new password’)  mysql> flush privileges;'),(174,'MY1-04','DB','DB 사용자 계정 개별적 부여','데이터베이스의 사용자 계정이 사용자, 프로세스와 응용 프로그램 등에 동일하게 사용하게 될 경우 침해사고 발생 시 책임 추적에 영향을 주며, 계정별 권한 부여가 불가능해지고 사용하지 않는 계정을 이용한 비인가 사용자 접속이 가능함',2,'계정관리','1. 불필요한 계정 삭제\nmysql> Delete from user where user=’삭제할 계정’ \n2. 사용자별, 응용프로그램별 계정 생성, 권한 설정 \nmysql> insert into user(\'localhost\',\'user\', \'password\') values(\'localhost\', \'생성 계정\', \'password(\'패스워드\'));\nmysql> insert into mysql.db values(‘%’,’DB name’, ’username’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’, ’Y’)\nmysql> flush privileges'),(175,'MY2-01','DB','원격에서 DB 서버로의 접속 제한','허용되지 않은 IP에서 원격으로 DB에 접속이 허용되어 있는 경우 공격자에 의해 네트워크 서비스 스캐닝을 통한 DB 사용 여부가 확인되어 공격 대상이 될 수 있으며, DB 내의 데이터 유출이 가능함',3,'접근관리','1. mysql.user 테이블과 mysql.db 테이블을 조회하여 host가 “%”인 필드 삭제하고 접속 IP를 지정하 여 등록\nmysql> delete from user where host=’%’;\nmysql> delete from db where host=’%’;'),(176,'MY2-02','DB','DBA이외의 인가되지 않은 사용자 시스템 테이블 접근 제한 설정','DBA만 접근 가능해야 할 테이블을 잘못 설정할 경우 비인가 사용자가 시스템의 주요 정보를 획득하거나, 주요 데이터베이스 설정 변경이 가능함',3,'접근관리','1. 일반 사용자로부터 mysql.user 테이블 모든 접근 권한 제거\nmysql> revoke all on mysql.user from ‘[user name]’@’[hosts]’;\nmysql> flush privileges\n2. 일반 사용자로부터 mysql.user 테이블 접근 권한 제거\nmysql> revoke [권한] on mysql.user from [user name];\nmysql> flush privileges'),(177,'MY2-03','DB','불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거','애플리케이션에 따라 샘플 데이터베이스를 위해서 ODBC 데이터 소스를 설치하거나 불필요한 ODBC/OLE-DB 데이터베이스 드라이브를 설치하여 사용하는 경우 임의의 명령어 실행, 임의의 파일 수정, 시스템 관리자 권한 획득이 가능함',2,'접근관리','불필요한 ODBC/OLE-DB 제거'),(178,'MY2-04','DB','데이터베이스의 주요 파일 보호 등을 위해 DB 계정의 umask를 022 이상으로 설정','Oracle 소프트웨어의 주요 파일에 대한 보호 등을 위해 Oracle 계정의 umask는 022 이상으로 설정되어야 하며, 설정되어있지 않은 경우 인가되지 않은 사용자가 이를 이용하여 관련 소프트웨어를 실행할 수 있는 위험이 있음',1,'접근관리','일시적 설정으로 umask 명령을 이용하여 umask 022 이상 설정\n> 시스템 재부팅\n> 설정 내역 유지를 위해 .bashrc, .cshrc, .login,.profile 등의 환경 변수 지정 파일에 umask 022(이상 설정)를 추가함'),(179,'MY2-05','DB','데이터베이스의 주요 설정파일, 패스워드 파일 등 주요 파일들의 접근 권한 설정','비인가자가 redo 파일, 데이터베이스 설정 파일, 데이터 파일, 네트워크 설정 파일, Oracle 패스워드 관련 파일인 orapw.ora, listener.ora,init<SID>.ora 등의 주요 파일에 접근하여 수정·삭제하면 Oracle 데이터베이스 운영에 오류가 발생함',2,'접근관리','? Unix OS 초기화 파일(my.cnf, my.ini)의 접근 권한을 초기화 파일에 대한 보호를 위하여 600 또는, 640으로 설정 my.cnf 파일 디폴트 위치: /etc/my.cnf,  <각 홈디렉터리>/my.cnf # chmod 600 ./my.cnf\n ? Windows OS 초기화 파일의 접근 권한은 Adminisrators, SYSTEM, Owner에게 모든 권한 또는, 그 이하로 설정하고  다른 그룹은 제거함'),(180,'MY3-01','DB','데이터베이스에 대해 최신 보안패치와 밴더 권고사항을 모두 적용','데이터베이스의 주요 보안 패치 등을 설치하지 않은 경우 공격자가 알려진 취약점을 이용하여 데이터베이스에 접근 가능함',3,'패치관리','데이터베이스에 대한 버전을 확인 후 업그레이드 및 패치 적용'),(181,'WS1-01','Windows','Administrator 계정 이름 바꾸기','일반적으로 관리자 계정을 Administrator로 설정한 경우 로그온 시도 실패 횟수의 제한이 없는 점을 이용해 악의적인 사용자가 패스워드 유추 공격을 계속해서 시도할 수 있음. 관리자 계정의 이름을 변경함으로써 공격자가 패스워드뿐만 아니라 계정 이름을 쉽게 유추하지 못하도록 하여야 함',3,'계정 관리','1. 시작> 프로그램> 제어판> 관리 도구> 로컬 보안 정책> 로컬 정책> 보안 옵션> \n2. “계정: Administrator 계정 이름 바꾸기”를 유추하기 어려운 계정 이름으로 변경'),(182,'WS1-02','Windows','Guest 계정 상태','Guest 계정은 시스템 임시 접근을 허용하는 취약한 계정으로 사용을 제한하여야 함. 대부분의 시스템은 Guest 계정의 사용이 필요치 않으며, 불특정 다수의 접근이 필요 할 경우 Guest 계정이 아닌 일반 사용자 계정을 생성해 사용하도록 하여야 함',3,'계정 관리','1. 시작> 프로그램> 관리 도구> 도메인 사용자 관리> Guest 계정 선택> 등록 정보\n2. “계정 사용 안함”에 체크'),(183,'WS1-03','Windows','불필요한 계정 제거','퇴직, 전직, 휴직 등의 이유로 더 이상 사용하지 않는 계정, 불필요한 계정, 의심스러운 계정이 존재하는지 점검함. 관리되지 않은 불필요한 계정은 장기간 패스워드가 변경되지 않아 *무작위 대입 공격(Brute Force Attack)이나 패스워드 추측 공격(Password Guessing)에 의해 계정 정보가 유출되어도 인지하기 어려움.',3,'계정 관리','1. 시작> 프로그램> 관리 도구> 도메인 사용자 관리> 계정 선택> 등록 정보\n2. “계정 사용 안함”에 체크하거나 계정 삭제'),(184,'WS1-04','Windows','계정 잠금 임계값 설정','자동화된 방법을 이용하여 공격자는 모든 사용자 계정에 대해 암호조합 공격을 시도할 수 있으므로 계정 잠금 임계값 설정을 적용하여 로그온 실패 횟수를 제한하여야 함',3,'계정 관리','계정 잠금 임계값을 5번 이하의 값으로 설정 '),(185,'WS1-05','Windows','해독 가능한 암호화를 사용하여 암호 저장','인증을 위해 사용자 암호를 알아야 하는 응용 프로그램 프로토콜이 지원될 경우 해독 가능한 방식으로 암호를 저장하기 때문에 암호공격을 이용한 공격자가 노출된 계정을 사용하여 네트워크 리소스에 로그온할 수 있음',3,'계정 관리','1. 시작> 실행> SECPOL.MSC> 계정 정책> 암호 정책\n2. “해독 가능한 암호화를 사용하여 암호 저장”을 “사용 안 함” 으로 설정'),(186,'WS1-06','Windows','관리자 그룹에 최소한의 사용자 포함','일반 사용자 권한으로부터 받을 수 있는 시스템 피해를 줄이기 위해서 관리 업무를 위한 계정과 일반 업무를 위한 계정을 분리하여 사용하는 것이 바람직함. 시스템 관 리를 위해서는 각각 두 개의 계정을 가져야 하며 관리자 그룹에는 가능한 최소한의 사용자만 포함하도록 하여야 함',3,'계정 관리','1. 시작> 프로그램> 관리 도구> 도메인 사용자 관리> Administrators 그룹> 등록 정보\n2. Administrator 그룹에서 불필요한 계정 제거 후 그룹 변경'),(187,'WS1-07','Windows','Everyone 사용 권한을 익명 사용자에게 적용','익명 사용자가 Everyone 그룹으로 사용 권한을 준 모든 리소스에 접근할지를 결정함. 만약 “사용”으로 설정할 경우 권한이 없는 사용자가 익명으로 계정 이름 및 공유 리 소스를 나열하고 이 정보를 사용하여 암호를 추측하거나 *DoS(Denial of Service)  공 격을 실행할 수 있음',2,'계정 관리','1. 시작> 실행> SECPOL.MSC> 로컬 정책> 보안 옵션\n2. “Everyone 사용 권한을 익명 사용자에게 적용” 정책이 “사용 안 함” 으로 설정'),(188,'WS1-08','Windows','계정 잠금 기간 설정','계정 잠금 기간 설정을 사용하면 지정한 기간 동안 잠긴 계정은 사용할 수 없으며, 계정 잠금이 해제될 때까지 접근할 수 없음. 따라서 공격자가 자동으로 암호를 추측 하는 것이 어렵게 되어 암호공격 효과를 낮출 수 있음',2,'계정 관리','“계정 잠금 기간“ 및 “잠금 기간 원래대로 설정 기간“ 60분 설정'),(189,'WS1-09','Windows','패스워드 복잡성 설정','패스워드 설정 시 문자/숫자/특수문자를 모두 포함하여 강력한 패스워드가 설정될 수 있도록 암호 복잡성을 설정하여야 함. 영?숫자만으로 이루어진 암호는 현재 공개된 패 스워드 크랙 유틸리티에 의해 쉽게 유추할 수 있으므로 패스워드 조합 및 길이에 따 라 최소 암호 길이 및 암호 복잡성을 적절하게 설정하여 패스워드를 알아낼 수 있는 평균 시간을 증가시킬 수 있도록 설정하여야 함',2,'계정 관리','암호는 복잡성을 만족해야 함 → 사용 '),(190,'WS1-10','Windows','패스워드 최소 암호 길이','일반적인 단어와 구를 이용해 취약하게 암호를 설정한 계정은 사전 공격과 가능한 모 든 문자의 조합을 시도하는 무작위 공격을 통해 권한이 도용당할 수 있음. 최소 암호 길이를 8자리로 설정하면 대부분 환경에서 적절한 보안이 제공될 뿐만 아니라 사용자 가 쉽게 기억할 수 있으며 무작위 공격을 방어할 수 있음',2,'계정 관리','최소 암호 길이 8문자 이상으로 설정'),(191,'WS1-11','Windows','패스워드 최대 사용 기간','가장 복잡한 암호를 포함한 모든 암호는 추측 공격에 의해 유출될 수 있으므로 패스 워드가 일정 기간이 지나도 유효하다면 침해 발생 가능성이 있음. 사용자가 암호를 자주 바꾸도록 하면 유효한 암호가 공격당하는 위험을 줄일 뿐만 아니라 누군가가 불 법으로 획득한 암호를 사용하여 무단 로그온하는 경우를 줄일 수 있음',2,'계정 관리','최대 암호 사용 기간 90일 설정'),(192,'WS1-12','Windows','패스워드 최소 사용 기간','패스워드 변경에 시간적 제약이 없다면 이전에 즐겨 사용하던 암호를 다시 사용할 수 있으므로 주기적으로 패스워드를 변경하는 정책의 효과가 없어짐. 최소 암호 사용 기 간 정책 설정을 0보다 큰 값으로 구성하면 최근 암호 기억 설정을 유효하게 사용함으 로써 이전 암호를 다시 사용하는 것을 막을 수 있음',2,'계정 관리','최소 암호 사용 기간 1일 설정'),(193,'WS1-13','Windows','마지막 사용자 이름 표시 안함','마지막으로 로그온한 사용자의 이름이 로그온 대화 상자에 표시될 경우 공격자는 이 를 획득하여 암호를 추측하거나 무작위 공격을 시도할 수 있음. 실제로 콘솔에 접근 할 수 있는 사용자 또는, 터미널 서비스를 통해 서버에 연결할 수 있는 사용자들에게 쉽게 노출될 수 있으므로 사용자 이름이 표시되지 않도록 설정하여야 함',2,'계정 관리','Windows NT: 마지막으로 로그온한 사용자 이름 표시 안 함 → 설정 후 저장\nWindows 2000: 로그온 스크린에 마지막 사용자 이름 표시 안 함 → 사용\nWindows 2003, 2008: 대화형 로그온: 마지막 사용자 이름 표시 안 함 → 사용\n'),(194,'WS1-14','Windows','마지막 사용자 이름 표시 안함','마지막으로 로그온한 사용자의 이름이 로그온 대화 상자에 표시될 경우 공격자는 이 를 획득하여 암호를 추측하거나 무작위 공격을 시도할 수 있음. 실제로 콘솔에 접근 할 수 있는 사용자 또는, 터미널 서비스를 통해 서버에 연결할 수 있는 사용자들에게 쉽게 노출될 수 있으므로 사용자 이름이 표시되지 않도록 설정하여야 함',2,'계정 관리','Windows NT: 마지막으로 로그온한 사용자 이름 표시 안 함 → 설정 후 저장\nWindows 2000: 로그온 스크린에 마지막 사용자 이름 표시 안 함 → 사용\nWindows 2003, 2009: 대화형 로그온: 마지막 사용자 이름 표시 안 함 → 사용\n'),(195,'WS1-15','Windows','익명 SID/이름 변환 허용','익명 사용자가 다른 사용자의 SID 특성을 요청할 수 있는지를 결정함. 이를 이용해 로컬 접근 권한이 있는 사용자가 잘 알려진 Administrator SID를 사용하여 Administrator 계정의 실제 이름을 알아낼 수 있으며 암호 추측 공격을 실행할 수 있음. “사용 안 함”으로 정책을 설정할 경우 Windows NT 도메인 환경에서 통신이 불가능하게 될 수 있음',2,'계정 관리','1. 시작> 실행> SECPOL.MSC> 로컬 정책> 보안 옵션\n2. “네트워크 액세스: 익명 SID/이름 변환 허용” 정책이 “사용 안 함” 으로 설정'),(196,'WS1-16','Windows','최근 암호 기억','사용자가 현재 암호 또는, 최근에 사용했던 암호와 똑같은 새 암호로 설정할 수 없도 록 하여야 함. 특정 계정에 같은 암호를 오래 사용할수록 공격자가 무작위 공격을 통 해 암호를 확인할 가능성이 커지며, 유출된 계정의 암호를 바꾸지 않는 한 계속 악용 될 수 있음. 또한, 암호를 변경해야 할 경우 암호를 다시 사용하는 것을 금지하지 않 거나, 적은 수의 암호를 계속해서 다시 사용할 수 있도록 허용하면 좋은 암호 정책의 효과가 크게 반감됨',2,'계정 관리','최근 암호 기억을 12개 암호로 설정'),(197,'WS1-17','Windows','콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한','암호로 보호되지 않는 로컬 계정을 사용하여 터미널 서비스, Telnet 및 FTP와 같은 네 트워크 서비스의 원격 대화형 로그온이 가능하므로 이를 허용할지를 결정함. 콘솔에 서 실제로 수행하는 대화형 로그온이나 도메인 계정을 사용하는 로그온에는 영향을 주지 않음',2,'계정 관리','1. 시작> 실행> SECPOL.MSC> 로컬 정책> 보안 옵션\n2. “콘솔 로그온 시 로컬 계정에서 빈 암호 사용 제한” 정책을 “사용” 으로 설정'),(198,'WS1-18','Windows','원격터미널 접속 가능한 사용자 그룹 제한','원격터미널의 그룹이나 계정을 제한하지 않으면 임의의 사용자가 원격으로 접속하여 해당 서버에 정보를 변경하거나 정보가 유출될 가능성이 있으므로 사용자 그룹과 계 정을 설정하여 접속을 제한하여야 함.',2,'계정 관리','1. 제어판> 사용자 계정> 관리자 계정 이외의 계정 생성한 후\n2. 제어판> 시스템> [원격] 탭> [원격] 탭 메뉴에서 “사용자가 이 컴퓨터에 원격으로 연결할 수    있음”에 체크> “원격 사용자 선택”에서 원격 사용자 지정 후 확인'),(199,'WS2-01','Windows','공유 권한 및 사용자 그룹 설정','Everyone이 공유계정에 포함되어 있으면 익명 사용자의 접근이 가능하므로 디폴트 공유인 C$, D$, Admin$, IPC$ 등을 제외한 공유 폴더가 Everyone 그룹으로 공유가 금지되었는지를 점검하여 익명 사용자의 접근 여부를 확인하여야 함',3,'서비스 관리','공유 디렉터리 접근 권한에서 Everyone 권한 제거 후 필요한 계정 추가 '),(200,'WS2-02','Windows','하드디스크 기본 공유 제거','Windows는 프로그램 및 서비스를 네트워크나 컴퓨터 환경에서 관리하기 위해 시스 템 기본 공유 항목을 자동으로 생성함. 이를 제거하지 않으면 비인가자가 모든 시스 템 자원에 접근할 수 있는 위험한 상황이 발생할 수 있으며 이러한 공유 기능의 경 로를 이용하여 바이러스가 침투될 수 있음',3,'서비스 관리','기본 공유 중지 후 레지스트리 값 설정(IPC$, 일반 공유 제외) '),(201,'WS2-03','Windows','불필요한 서비스 제거','일반적으로 시스템에는 필요하지 않은 취약한 서비스들이 디폴트로 설치되어 실행되 고 있으며 이러한 서비스 또는, 응용 프로그램은 공격 지점이 될 수 있으므로 사용자 의 환경에서 필요하지 않은 서비스나 실행 파일을 사용하지 않거나 제거하여야 함',3,'서비스 관리','서비스 중지 후 “사용 안 함” 설정'),(202,'WS2-04','Windows','NetBIOS 바인딩 서비스 구동 점검','NetBIOS(Network Basic Input/Output System)는 IBM PC를 위한 네트워크 인터페이스 체계로 네임, 세션, 데이터 그램의 세 가지 서비스를 제공하고 있음. 윈도우 NT 시스템이 인터넷에 직접 연결되어 있으면 공격자가 쉽게 파일시스템을 사용할 수 있으므로 NetBIOS에 대한 접근 통제가 적용되어야 함',3,'서비스 관리','시작> 실행> ncpa.cpl> 로컬 영역 연결> 속성> TCP/IP> [일반] 탭에서 [고급] 클릭>   [WINS] 탭에서 TCP/IP에서 “NetBIOS 사용 안 함” 또는, “NetBIOS over TCP/IP 사용 안 함” 선택'),(203,'WS2-05','Windows','FTP 서비스 구동 점검','기본적인 FTP 서비스는 계정과 패스워드가 암호화되지 않은 채로 전송되어 간단한 *Sniffer에 의해서도 스니핑이 가능하므로 FTP 서비스를 사용하지 않을 것을 권고함',3,'서비스 관리','FTP 서비스가 필요하지 않다면 서비스 중지 '),(204,'WS2-06','Windows','FTP 디렉터리 접근권한 설정','홈 디렉터리에 쓰기 권한이 주어진 경우 임의의 사용자가 쓰기, 수정이 가능하므로 정보유출, 파일 위?변조로 인한 피해가 발생할 수 있음',3,'서비스 관리','FTP 홈 디렉터리에서 Everyone 권한 삭제, 각 사용자에게 적절한 권한 부여'),(205,'WS2-07','Windows','Anonymous FTP 금지','사용자가 일정 시간 동안 아무런 작업을 수행하지 않을 경우 자동으로 로그오프 되거나 워크스테이션이 잠기도록 설정하여야 함. 해당 기능을 설정하지 않은 경우 사용자가 자리를 비운 사이에 임의의 사용자가 해당 시스템에 접근하여 중요 정보를 유출하거나, 악의적인 행위를 통해 시스템 운영에 악영향을 미칠 수 있으므로 화면보호기 대기 시간 및 암호 사용 설정을 이용해서 비인가자의 물리적 접근을 차단함',3,'서비스 관리','FTP 서비스를 사용하지 않는 경우 서비스 중지, 사용할 경우 “익명 연결 허용” 체크 해제'),(206,'WS2-08','Windows','FTP 접근 제어 설정','기본적인 FTP 서비스는 계정과 패스워드가 암호화되지 않은 채로 전송되어 간단한 Sniffer에 의해서도 스니핑이 가능하므로 FTP 서비스를 사용하지 않을 것을 권고. 만약 불가피하게 FTP 서비스를 이용해야 하는 경우 특정 IP 주소에 허가된 사용만이 접속할 수 있도록 접근제어 설정을 적용하여야 함',3,'서비스 관리',' 인터넷 정보 서비스(IIS) 관리> FTP 사이트> 속성> [디렉터리 보안] 탭에서 “액세스 거부” 선택 후 접근 가능 IP 주소 추가 (만약 개별 FTP 사이트에 적용할 경우 해당 사이트에만 설정이 적용되고, 기본 설정은 적용 받지 않음)'),(207,'WS2-09','Windows','DNS Zone Transfer 설정','DNS 서버에 저장되어 있는 도메인 정보를 승인된 DNS서버가 아닌 다른 외부로 유 출하는 것은 보안상 바람직하지 않으므로 적절한 보안 설정을 통하여 도메인 정보 전송을 제한하여야 함. 만약, DNS 도메인 정보가 외부로 노출될 경우 악의적인 사용 자가 해당 정보를 이용하여 홈페이지 및 하위 URL 정보를 입수하여 웹 애플리케이션 구조를 예측할 수 있음',3,'서비스 관리','불필요 시 서비스 중지/사용 안 함, \n사용하는 경우 영역 전송을 특정 서버로 제한하거나 “영역 전송 허용”에 체크 해제 '),(208,'WS2-10','Windows','RDS(Remote Data Services) 제거','RDS는 MDAC(Microsoft Data Access Components)의 한 컴포넌트로 RDS(Remote Data Services)가 잘못 설정되어 있으면 서비스거부 공격이나 원격에서 관리자 권한 으로 임의의 명령을 실행할 수 있는 취약점이 존재함. MDAC 2.7 미만의 버전에서 웹 서버와 웹 클라이언트는 모두 이 취약점으로 인해 위험해질 수 있으므로 RDS가 불필요할 경우 제거하는 것이 안전함',3,'서비스 관리','사용하지 않는 경우 IIS 서비스 중지/사용 안 함, \n사용할 경우 레지스트리 키 값 제거 또는, 관련 패치 적용 '),(209,'WS2-11','Windows','터미널 서비스 암호화 수준 설정','사용자가 일정 시간 동안 아무런 작업을 수행하지 않을 경우 자동으로 로그오프 되거나 워크스테이션이 잠기도록 설정하여야 함. 해당 기능을 설정하지 않은 경우 사용자가 자리를 비운 사이에 임의의 사용자가 해당 시스템에 접근하여 중요 정보를 유출하거나, 악의적인 행위를 통해 시스템 운영에 악영향을 미칠 수 있으므로 화면보호기 대기 시간 및 암호 사용 설정을 이용해서 비인가자의 물리적 접근을 차단함',2,'서비스 관리','불필요 시 서비스 중지/사용 안 함 설정,\n사용할 경우 암호화 수준 설정'),(210,'WS2-12','Windows','SNMP 서비스 구동 점검','SNMP 서비스는 시스템 상태를 실시간으로 파악하거나 설정하기 위해 사용하는 서비 스이므로 시스템의 주요정보 유출 및 불법수정을 방지하기 위해 사용하지 않는 경우 중지하여야 함',2,'서비스 관리','불필요 시 서비스 중지/사용 안 함'),(211,'WS2-13','Windows','SNMP 서비스 커뮤니티스트링의 복잡성 설정','SNMP 서비스는 시스템 상태를 실시간으로 파악하고, 설정하기 위해 사용되는 서비스 로 시스템 정보를 송수신하기 위해 일종의 패스워드인 Community String 값을 사용 함. 하지만 대부분의 시스템에서 Community String 설정을 public, private 등 Default 설정 값으로 사용하는 경우 많은데, 이를 변경하지 않을 경우 Community String 값을 이용하여 비인가자가 시스템의 주요 정보 및 설정 상황을 파악할 수 있음',2,'서비스 관리','불필요 시 서비스 중지/사용 안 함, 사용 시 Default Community 이름(public) 변경'),(212,'WS2-14','Windows','SNMP Access control 설정','SNMP v1의 가장 큰 취약점은 보안 기능이 없어 단순하게 Community name 확인 절차만 거치면 Network가 불가능하게 되는 문제점 등이 발견되었는데 이를 SNMP v2를 통해 보완함. 인증 절차에 대한 보안 M5 알고리즘과 Partymib를 이용한 사용자 에게만 특정 객체를 이용하거나 못하게 하는 접근 통제 기능이 추가되어 보안요소가 높아짐',2,'서비스 관리','불필요 시 서비스 중지/사용 안 함, 사용 시 Default Community 이름(public) 변경'),(213,'WS2-15','Windows','DNS 서비스 구동 점검','동적 업데이트는 DNS 정보에 변경 사항이 있을 때마다 DNS 클라이언트 컴퓨터가 자신의 리소스 레코드(zone 파일)를 DNS 서버에 자동으로 업데이트하는 기능으로 영 역 레코드 수동 관리 작업을 줄일 수 있음. 하지만 동적 업데이트를 사용할 경우 악 의적인 사용자에 의해 신뢰할 수 없는 데이터가 받아들여질 수 있으므로 동적 업데 이트 사용을 제한하여야 함',2,'서비스 관리','일반적으로 동적 업데이트 기능이 필요 없으나 확인 필요'),(214,'WS2-16','Windows','HTTP/FTP/SMTP 배너 차단','임의의 사용자가 HTTP, FTP, SMTP 접속 시도 시 보이는 접속 배너 정보를 수집하여 해킹에 사용할 수 있음',3,'서비스 관리','사용하지 않는 경우 IIS 서비스 중지/사용 안 함, 사용 시 속성 값 수정'),(215,'WS2-17','Windows','Telnet 보안 설정','Telnet 서비스는 평문으로 데이터를 송수신하기 때문에 Password 방식으로 인증을 수행할 경우 ID 및 Password가 외부로 노출될 위험성이 있음. \n따라서 Telnet 이용 시 네트워크상으로 패스워드를 전송하지 않는 NTLM 인증만 사용하여야 함. ※ Windows 서버의 Telnet 서비스는 NTLM 인증과 Password 인증 방법을 제공함. ? NTLM 인증: 암호를 전송하지 않고 negotiate/challenge/response 절차로 인증을 수행함. ? Password 인증: 관리자 및 TelnetClients 그룹에 포함된 ID/PWD로 인증 절차를 수행함.',2,'서비스 관리','사용하지 않는 경우 IIS 서비스 중지/사용 안 함,\n사용 시 속성 값 수정'),(216,'WS2-18','Windows','불필요한 ODBC/OLE-DB 데이터 소스와 드라이브 제거','특정 샘플 애플리케이션은 샘플 데이터베이스를 위해 ODBC 데이터 소스를 설치하거 나 불필요한 ODBC/OLE-DB 데이터베이스 드라이브를 설치하므로 불필요한 데이터 소 스나 드라이버는 ODBC 데이터 소스 관리자 도구를 이용해서 제거하는 것이 바람직함',2,'서비스 관리','사용하지 않는 불필요한 ODBC 데이터 소스 제거 '),(217,'WS2-19','Windows','원격터미널 접속 타임아웃 설정','일반적으로 웹 서비스 이용 시 사용자의 브라우저에서 어떠한 이벤트도 발생하지 않 는다면 웹 서버에서 보안상 자동으로 세션을 끊는 경우가 있음. 이와 같은 방식으로 원격제어를 이용하여 터미널에 접속 후 일정 시간 동안 이벤트가 발생시키지 않는다 면 세션을 종료시키기 위해 Timeout 설정을 해주어야 함',2,'서비스 관리','1. 시작> 실행> 열기> tscc.msc 실행   (Windows 2008은 tsconfig.msc)\n2. RDP-Tcp connection에서 우클릭> 속성 실행\n3. [세션] 탭에서 아래 Override user settings(사용자 설정 무시)을 체크하고 Idle session time 세션이 끊어지도록(유휴 세션 제한) 원하는 시간을 설정함'),(218,'WS2-20','Windows','예약된 작업에 의심스러운 명령이 등록되어 있는지 점검','일정 시간마다 미리 설정해둔 프로그램을 실행할 수 있는 예약된 작업은 시작프로그램과 더불어서 해킹과 트로이 목마, 백도어를 설치하여 공격하기 좋은 루트로 사용될 수 있으므로 예약된 작업을 수시로 확인하는 것을 권장함',2,'서비스 관리','예약 작업에 대한 주기적인 확인'),(219,'WS3-01','Windows','최신 보안패치 및 벤더 권고사항 적용','주기적인 패치 적용을 통하여 보안성 및 시스템 안정성을 확보하는 것이 시스템 운용의 중요한 요소임. 서비스 중인 시스템의 경우 패치 적용에 따르는 문제점(현재 운용중인 응용프로그램의 예기치 않은 중지, 패치 자체의 버그 등)과 재부팅의 어려움 등으로 많은 패치를 적용하는 것이 매우 어렵기 때문에 패치 적용 시 많은 부분을 고려하여야 함',3,'패치 관리','O/S 관리자, 서비스 개발자가 패치 적용에 따른 서비스 영향 정도를 파악하여 OS 관리자 및 벤더에서 적용함\n※ OS 패치의 경우 지속적으로 취약점이 발표되고 있기 때문에 O/S 관리자, 서비스 개발자가 패치 적용에 따른 서비스 영향 정도를 정확히 파악하여 주기적인 패치 적용 정책을 수립하여 적용하여야 함'),(220,'WS3-02','Windows','최신 HOT FIX 적용','Hot Fix는 즉시 교정되어야만 하는 주요한 취약점(주로 보안과 관련된)을 패치하기 위 해 배포되는 프로그램으로 각각의 서비스팩이 발표된 이후 패치가 추가될 필요가 있 을 때 별도로 발표됨. 때론, Hot Fix보다 취약성을 이용한 공격도구가 먼저 출현할 수 있으므로 Hot Fix는 발표 후 가능한 한 빨리 설치할 것을 권장함',3,'패치 관리','최신 Hotfix 설치'),(221,'WS3-03','Windows','백신 프로그램 업데이트','계속되는 신종 바이러스의 출현으로 인해 백신 프로그램의 설치만으로는 그 효과를 볼 수 없으므로 바이러스 정보에 대한 주기적인 업데이트를 통해 최신의 바이러스까 지 치료할 수 있는 기능이 필요함',3,'패치 관리','담당자를 통해 바이러스 백신을 설치 후 엔진 업데이트를 설정하도록 권고'),(222,'WS4-01','Windows','정책에 따른 시스템 로깅 설정','감사 설정이 구성되어 있지 않거나 감사 설정 수준이 너무 낮으면 보안 관련 문제 발생 시 원인을 파악하기 어려우며 법적 대응을 위한 충분한 증거로 사용될 수도 없음. 그러나 감사 설정이 너무 높으면 보안 로그에 불필요한 항목이 많이 기록되므로 매 우 중요한 항목과 혼동할 수 있으며 시스템 성능에도 심각한 영향을 줄 수 있기 때문 에 법적 요구 사항과 조직의 정책에 따라 필요한 로그를 남기도록 설정하여야 함',2,'감사 및 로그관리','위와 같은 이벤트에 대한 추가적인 감사 설정'),(223,'WS4-02','Windows','원격으로 액세스할 수 있는 레지스트리 경로','Windows에 의해 사용되는 모든 초기화 및 환경설정 정보가 레지스트리에 저장되므로 레지스트리에 대한 철저한 보안이 요구됨. 레지스트리 편집기는 원격접속으로도 그 키 를 바꿀 수 있지만, 대단히 위험하므로 네트워크를 통한 레지스트리 접속을 차단하여 야 함. 원격에서 레지스트리로의 접근을 위해서는 관리자의 권한 또는, 원격에서 접 근하기 위한 특별한 계정이 필요함. 윈도우에서는 원격에서 레지스트리 접근에 대한 요구를 다루기 위해 원격 레지스트리 서비스를 제공하고 있는데, 이 서비스를 중지시 키면 레지스트리에 대한 어떠한 원격 접근도 막을 수 있으므로 불가피한 경우를 제 외하고는 사용을 중지할 것을 권고함',2,'감사 및 로그관리','불필요 시 서비스 중지 및 사용 안 함으로 설정'),(224,'WS4-03','Windows','이벤트 로그 관리 설정','최대 로그 크기는 ”10,240Kb 이상“으로 설정하여 충분한 로그가 저장될 수 있는 공간 을 확보하고, 이벤트 로그 관리는 ”이벤트 겹쳐 쓰지 않음“으로 설정하여 로그가 자동 으로 덮어 씌워짐으로써 과거의 로그가 삭제되는 일이 발생하지 않도록 확인함',1,'감사 및 로그관리','최대 로그 크기 “10204KB”, “90일 이후 이벤트 덮어씀” 설정'),(225,'WS4-04','Windows','원격에서 이벤트 로그 파일 접근 차단','익명으로 중요 “시스템 로그’ 파일 및 ‘애플리케이션 로그“ 파일에 접근할 수 있어 중요 보안 감사 정보의 변조·삭제·유출의 위험이 존재하므로 원격 익명 사용자의 시스템 로그 접근을 제한하여야 함. ※ 일반적으로 시스템 로그는C:\\winnt\\system32\\config 파일에 저장되지만. 애플리 케이션 로그 파일은 각각의 애플리케이션마다 로그 저장 위치가 다름. 웹 서버에 많 이 사용하는 IIS 경우, C:\\winnt\\system32\\LogFiles에 저장됨',2,'감사 및 로그관리','1. 탐색기> 로그 디렉터리> 속성> 보안\n2. Everyone 제거'),(226,'WS5-01','Windows','백신 프로그램 설치','웜, 트로이목마 등의 악성 바이러스로 인한 피해규모가 커지고 있으므로 이에 대한 피해를 최소화하기 위해 반드시 바이러스 백신 프로그램을 설치 및 운영하여야 함. 바이러스 백신 프로그램은 바이러스 감염 여부 진단 및 치료뿐만 아니라 파일 보호 를 통한 예방 조치도 가능함',3,'보안 관리','담당자를 통해 바이러스 반드시 설치하여야 하도록 함 '),(227,'WS5-02','Windows','SAM 파일 접근 통제 설정','SAM(Security Account Manager) 파일은 사용자와 그룹 계정의 패스워드를 관리하고, LSA(Local Security Authority)를 통한 인증을 제공함. 따라서 SAM 파일에 대한 패스워드 공격 시도로 인해 패스워드 데이터베이스 정보가 노출될 수 있으므로 Administrator 및 System 그룹 외에는 SAM 파일에 대한 접근을 제한하여야 함',3,'보안 관리','SAM 파일 권한 확인 후 Administrator, System 그룹 외 다른 그룹에 설정된 권한 제거 '),(228,'WS5-03','Windows','화면 보호기 설정','사용자가 일정 시간 동안 아무런 작업을 수행하지 않을 경우 자동으로 로그오프 되 거나 워크스테이션이 잠기도록 설정하여야 함. 해당 기능을 설정하지 않은 경우 사용 자가 자리를 비운 사이에 임의의 사용자가 해당 시스템에 접근하여 중요 정보를 유 출 하거나, 악의적인 행위를 통해 시스템 운영에 악영향을 미칠 수 있음',3,'보안 관리','화면 보호기 사용, 대기 시간 10분, 암호 사용'),(229,'WS5-04','Windows','로그온 하지 않고 시스템 종료 허용','로그온 창에 “시스템 종료” 버튼이 활성화되어 있으면 로그인을 하지 않고도 불법적 인 시스템 종료가 가능하여 정상적인 서비스 운영이 불가능할 수 있음. 시스템 종료 버튼을 비활성화 시킴으로써 허가되지 않은 사용자가 시스템 종료를 하는 위협을 방 지할 수 있음',3,'보안 관리','시스템 종료: 로그온 하지 않고 시스템 종료 허용 → 사용 안 함 '),(230,'WS5-05','Windows','원격 시스템에서 강제로 시스템 종료','원격에서 네트워크를 통하여 운영 체제를 종료할 수 있는 사용자나 그룹을 결정하여 특정 사용자만 제어할 수 있도록 설정함. 만약 해당 권한 부여가 부적절할 경우 서비 스 거부 공격에 악용될 수 있음',3,'보안 관리','원격 시스템에서 강제로 시스템 종료 → Administrators '),(231,'WS5-06','Windows','보안 감사를 로그할 수 없는 경우 즉시 시스템 종료','보안 감사를 로그할 수 없는 경우 즉시 시스템 종료 여부 설정으로 보안 이벤트를 기록할 수 없는 경우 컴퓨터를 종료할 것인지 결정함. 이 정책을 사용 시 서비스 거부 공격에 악용될 수 있으며, 비정상적인 시스템 종료로 인하여 시스템 및 데이터에 손 상을 입힐 수 있음',3,'보안 관리','Windows 2000: 보안 감사를 로그할 수 없는 경우 즉시 시스템 종료 → 사용 안 함 Windows 2003: 감사: 보안 감사를 로그할 수 없는 경우 즉시 시스템 종료 → 사용 안 함 Windows 2008: 감사: 보안 감사를 로그할 수 없는 경우 즉시 시스템 종료 → 사용 안 함 '),(232,'WS5-07','Windows','SAM 계정과 공유의 익명 열거 허용 안 함','Windows에서는 익명의 사용자가 도메인 계정(사용자, 컴퓨터 및 그룹)과 네트워크 공유 이름의 열거 작업을 수행할 수 있으므로 SAM(보안계정관리자) 계정과 공유의 익명 열거가 허용될 경우 악의적인 사용자가 계정 이름 목록을 확인하고 이 정보를 사용하여 암호를 추측하거나 사회 공학적 공격기법을 수행할 수 있음',3,'보안 관리','레지스트리 값 또는, 로컬 보안 정책 설정'),(233,'WS5-08','Windows','Autologon 기능 제어','*Autologon 기능을 사용하면 침입자가 해킹 도구를 이용하여 레지스트리에서 로그인 계정 및 암호를 확인할 수 있으므로 Autologon 기능을 사용하지 않도록 설정함',3,'보안 관리','해당 레지스트리 값이 존재하는 경우 0으로 설정'),(234,'WS5-09','Windows','이동식 미디어 포맷 및 꺼내기 허용','이동식 미디어의 NTFS 포맷 및 꺼내기가 허용되는 사용자를 제한함으로써 사용자가 관리 권한을 갖고 있는 임의의 컴퓨터로만 이동식 디스크의 데이터를 이동하고, 파일 에 대한 소유권을 얻어 파일을 보거나 수정할 수 있도록 함',3,'보안 관리','이동식 미디어 포맷 및 꺼내기 허용 → Administrator'),(235,'WS5-10','Windows','디스크볼륨 암호화 설정','디스크 볼륨이 암호화 되어 있지 않은 경우 비인가자가 데이터를 열람할 수 있음',3,'보안 관리','EFS(Encryping File System) 활성화 '),(236,'WS5-11','Windows','Dos공격 방어 레지스트리 설정','Dos(서비스 거부 공격)은 네트워크 사용자가 컴퓨터나 컴퓨터의 특정 서비스를 사용 할 수 없도록 만들기 위한 네트워크 공격으로, TCP/IP 스택(Stack)을 강화하는 레지스 트리 값 변경을 통하여 Dos 공격을 방어할 수 있음. 만약 Dos 방어 레지스트리를 설 정하지 않은 경우 Dos 공격에 의한 시스템 다운으로 서비스 제공이 중단될 수 있음',2,'보안 관리','? SynAttackProtect = REG_DWORD 0(False) -> 1 이상 \n? EnableDeadGWDetect = REG_DWORD 1(True) -> 0\n? KeepAliveTime = REG_DWORD 7,200,000(2시간) -> 300,000(5분) \n? NoNameReleaseOnDemand = REG_DWORD 0(False) -> 1\n위에 명시된 레지스트리 값을 추가 또는, 변경하여 적용함'),(237,'WS5-12','Windows','사용자가 프린터 드라이버를 설치할 수 없게 함','서버에 프린터 드라이버를 설치하는 경우 악의적인 사용자가 고의적으로 잘못된 프 린터 드라이버를 설치하여 컴퓨터를 손상시킬 수 있으며, 프린터 드라이버로 위장한 악성 코드를 설치할 수 있으므로 사용자가 프린터 드라이버를 설치할 수 없게 설정 하여야 함',2,'보안 관리','사용자가 프린터 드라이버를 설치할 수 없게 함 → 사용'),(238,'WS5-13','Windows','세션 연결을 중단하기 전에 필요한 유휴시간','세션이 중단되기 전에 *SMB(서버 메시지 블록) 세션에서 보내야 하는 연속 유휴 시 간을 결정할 수 있음. 각 SMB 세션에서는 서버 리소스를 사용하며, null(공백) 세션 수가 많으면 서버 속도가 느려지거나 서버에 오류를 발생시킬 수 있으므로 공격자는 이를 악용하여 SMB 세션을 반복 설정하여 서버의 SMB 서비스가 느려지거나 응답하 지 않게 하여 서비스 거부 공격을 실행 할 수 있음',2,'보안 관리','로그온 시간이 만료되면 클라이언트 연결 끊기 → 사용\n세션 연결을 중단하기 전에 필요한 유휴 시간 → 15분'),(239,'WS5-14','Windows','경고 메시지 설정','시스템에 로그온을 시도하는 사용자들에게 관리자는 시스템의 불법적인 사용에 대하 여 경고 창을 띄움으로써 경각심을 줄 수 있음. 이러한 경고창의 효과는 악의적인 사 용자에게 관리자가 적절한 보안수준으로 시스템을 보호하고 있으며, 공격자의 활동을 주시하고 있다는 생각을 상기시킴으로써 간접적으로 공격 피해를 감소시키는 효과를 볼 수 있음',1,'보안 관리','로그인 메시지 제목 및 메시지 내용에 경고 문구 삽입'),(240,'WS5-15','Windows','사용자별 홈 디렉터리 권한 설정','사용자 계정별 홈 디렉터리의 권한이 제한되어 있지 않은 경우 임의의 사용자 다른 사용자의 홈 디렉터리에 악의적인 목적으로 접근할 수 있으며, 접근 후 의도 또는, 의도하지 않은 행위로 시스템에 악영향을 미칠 수 있음',2,'보안 관리','Everyone 권한 제거'),(241,'WS5-16','Windows','LAN Manager 인증 수준','Lan Manager 인증 수준 설정을 통해 네트워크 로그온에 사용할 Challenge/Response 인증 프로토콜을 결정하며, 이 설정은 클라이언트가 사용하는 인증 프로토콜 수준, 협상된 세션 보안 수준 및 서버가 사용하는 인증 수준에 영향을 주기 때문에 보다 안전한 인증을 위해 NTLMv2를 사용하는 것을 권장함',2,'보안 관리','Windows 2000: LAN Manager 인증 7수준 -> NTLMv2 응답만 보냄\nWindows 2003: 네트워크 보안: LAN Manager 인증 수준 -> NTMLv2 응답만 보냄 Windows 2008: 네트워크 보안: LAN Manager 인증 수준 -> NTMLv2 응답만 보냄 '),(242,'WS5-17','Windows','보안 채널 데이터 디지털 암호화 또는, 서명','보안 채널 데이터 디지털 암호화 또는, 서명 설정을 통해 도메인 구성원이 시작한 모 든 보안 채널 트래픽이 최소 보안 요구 사항을 충족해야 하는지를 설정함. 특히 도메 인 구성원에 의해 시작된 모든 보안 채널 트래픽의 서명과 암호화 여부를 설정함. 인증 트래픽 끼어들기 공격, 반복 공격 및 기타 유형의 네트워크 공격으로부터 보호 하기 위해 Windows 기반에서는 NetLogon을 통해 보안 채널이라는 통신 채널을 만 들어 컴퓨터 및 사용자 계정에 대한 인증을 함. 이 정책을 사용하면 모든 보안 채널의 서명 또는, 암호화가 협상되지 않는 한 보안 채널이 확립되지 않으며, 사용하지 않을 경우 모든 보안 채널 트래픽의 암호화 및 서 명이 도메인 컨트롤러와 협상되고 서명 및 암호화 수준은 도메인 컨트롤러의 버전 및 다음 두 정책의 설정에 따라 좌우됨. (정책 사용 시 자동으로 활성화됨) ? 도메인 구성원: 보안 채널 데이터를 디지털 암호화(가능하면) ? 도메인 구성원: 보안 채널 데이터를 디지털 서명(가능하면)',2,'보안 관리','보안 채널 데이터를 디지털 암호화·서명 관련 3개 정책 → 사용'),(243,'WS5-18','Windows','파일 및 디렉터리 보호','NTFS 파일 시스템은 포맷 시 모든 파일과 디렉터리에 소유권과 사용 권한 설정이 가능하고 ACL(접근 통제 목록)을 제공함으로써 *FAT 파일 시스템에 비해 보다 강화 된 보안 기능을 제공함. 기존에 FAT파일 시스템을 사용하다가 NTFS로 변환하기 위해서는 convert.exe 명령을 사용할 수 있지만 FAT파일 시스템으로 운영 중 변환해야 하는 경우 Default ACL이 적용되지 않으므로 가능한 초기 설치 시 NTFS 파일 시스템을 선택하는 것을 권장함',2,'보안 관리','FAT파일 시스템을 사용하고 있다면, 가급적 NTFS 파일 시스템으로 변환 '),(244,'WS5-19','Windows','시작프로그램 목록 분석','윈도우 부팅 시 너무 많은 시작프로그램이 동시에 실행되면 속도가 저하되는 문제가 발생하므로 불필요한 프로그램을 확인하고 삭제하거나 체크를 해제할 필요가 있음. 뿐만 아니라 공격자가 심어놓은 악성 프로그램이나 해킹 툴이 실행되어 시스템에 피 해를 줄 수 있으므로 시작프로그램 목록을 수시로 검사하고 불필요하거나 의심스러 운 프로그램은 제거하여야 함',2,'보안 관리','시작프로그램 목록의 정기적인 검사 실시 및 불필요한 서비스 비활성화 ');
/*!40000 ALTER TABLE `RiskManagement_vulnerability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 회사',7,'add_company'),(20,'Can change 회사',7,'change_company'),(21,'Can delete 회사',7,'delete_company'),(22,'Can add 부서',8,'add_department'),(23,'Can change 부서',8,'change_department'),(24,'Can delete 부서',8,'delete_department'),(25,'Can add 직무 기술서',9,'add_duty'),(26,'Can change 직무 기술서',9,'change_duty'),(27,'Can delete 직무 기술서',9,'delete_duty'),(28,'Can add 임직원',10,'add_staff'),(29,'Can change 임직원',10,'change_staff'),(30,'Can delete 임직원',10,'delete_staff'),(31,'Can add partner',11,'add_partner'),(32,'Can change partner',11,'change_partner'),(33,'Can delete partner',11,'delete_partner'),(34,'Can add 자산 평가기준',12,'add_asset_valuation'),(35,'Can change 자산 평가기준',12,'change_asset_valuation'),(36,'Can delete 자산 평가기준',12,'delete_asset_valuation'),(37,'Can add 자산',13,'add_asset'),(38,'Can change 자산',13,'change_asset'),(39,'Can delete 자산',13,'delete_asset'),(40,'Can add 취약점',14,'add_vulnerability'),(41,'Can change 취약점',14,'change_vulnerability'),(42,'Can delete 취약점',14,'delete_vulnerability'),(43,'Can add 위협',15,'add_threat'),(44,'Can change 위협',15,'change_threat'),(45,'Can delete 위협',15,'delete_threat'),(46,'Can add 자산과 위협 상관 관계 분석',16,'add_mapping'),(47,'Can change 자산과 위협 상관 관계 분석',16,'change_mapping'),(48,'Can delete 자산과 위협 상관 관계 분석',16,'delete_mapping'),(49,'Can add 취약점 분석',17,'add_vul_analysis'),(50,'Can change 취약점 분석',17,'change_vul_analysis'),(51,'Can delete 취약점 분석',17,'delete_vul_analysis'),(52,'Can add 위험 분석',18,'add_risk_analysis'),(53,'Can change 위험 분석',18,'change_risk_analysis'),(54,'Can delete 위험 분석',18,'delete_risk_analysis'),(55,'Can add 위험 처리 방안',19,'add_risk_control'),(56,'Can change 위험 처리 방안',19,'change_risk_control'),(57,'Can delete 위험 처리 방안',19,'delete_risk_control');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$LqtHvhSCHmoQ$sF7ft5zu3vrkWvI0eEXjYWaWkpeq/idPHFCa8ZkF2g8=','2015-06-16 02:41:04',1,'isecure','','','isecure@isecurekr.com',1,1,'2015-06-10 07:49:04'),(2,'pbkdf2_sha256$20000$YF8Ki2pN7zwH$gIjalNfFnXuWB5MtfdC1SJVwAbiieRs21nGH0WOTMlg=','2015-06-11 02:02:09',0,'spekitty','','','',0,1,'2015-06-10 09:29:53'),(3,'pbkdf2_sha256$20000$9dhehTD9y457$ihYjtP3S4yNu+dGsKe6IsP+xn33QQ1S3SWK91I+S50k=','2015-06-11 04:56:14',0,'yusik','','','',0,1,'2015-06-10 09:30:08'),(4,'pbkdf2_sha256$20000$ZDptnd0pfv3e$0+Agr//eSGuFf+eyG86iSTxWXFGGQ6wQ4ascry7ux5M=',NULL,0,'yanna','','','',0,1,'2015-06-10 09:50:23');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-06-10 09:29:53','2','spekitty',1,'',4,1),(2,'2015-06-10 09:30:08','3','yusik',1,'',4,1),(3,'2015-06-10 09:50:23','4','yanna',1,'',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'RiskManagement','asset'),(12,'RiskManagement','asset_valuation'),(7,'RiskManagement','company'),(8,'RiskManagement','department'),(9,'RiskManagement','duty'),(16,'RiskManagement','mapping'),(11,'RiskManagement','partner'),(18,'RiskManagement','risk_analysis'),(19,'RiskManagement','risk_control'),(10,'RiskManagement','staff'),(15,'RiskManagement','threat'),(14,'RiskManagement','vulnerability'),(17,'RiskManagement','vul_analysis'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'RiskManagement','0001_initial','2015-06-10 07:44:28'),(2,'contenttypes','0001_initial','2015-06-10 07:44:39'),(3,'auth','0001_initial','2015-06-10 07:44:39'),(4,'admin','0001_initial','2015-06-10 07:44:39'),(5,'contenttypes','0002_remove_content_type_name','2015-06-10 07:44:39'),(6,'auth','0002_alter_permission_name_max_length','2015-06-10 07:44:40'),(7,'auth','0003_alter_user_email_max_length','2015-06-10 07:44:40'),(8,'auth','0004_alter_user_username_opts','2015-06-10 07:44:40'),(9,'auth','0005_alter_user_last_login_null','2015-06-10 07:44:40'),(10,'auth','0006_require_contenttypes_0002','2015-06-10 07:44:40'),(11,'sessions','0001_initial','2015-06-10 07:44:40'),(12,'RiskManagement','0002_auto_20150610_2131','2015-06-10 12:31:25'),(13,'RiskManagement','0003_auto_20150610_2131','2015-06-10 12:31:43'),(14,'RiskManagement','0004_auto_20150610_2131','2015-06-10 12:32:01'),(15,'RiskManagement','0005_auto_20150610_2149','2015-06-10 12:49:51'),(16,'RiskManagement','0006_vulnerability_control','2015-06-10 14:55:05'),(17,'RiskManagement','0007_remove_vulnerability_based','2015-06-11 02:30:01'),(18,'RiskManagement','0008_auto_20150612_1437','2015-06-12 05:37:51'),(19,'RiskManagement','0009_auto_20150616_0401','2015-06-15 19:01:48');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6thewu9xgfcft2az9e9euqa458b8yhys','MjQ2NzBlZGFmNmVhOWM1Y2NkMTU4ZjY5NjAzOGJjYjMxYmQzOTcxMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1NWUyMDdiZjNlMjcwNmY2OTcyYTk1N2M4ODY5OGJkZWUwZjg0Y2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-06-30 02:41:04'),('a9dgu6x38wm9o2vow6xnqgfbfj19xkpp','MThiODdlNzAwZjAwM2I4OTBjMWM4ODZlNTJiOTQwYzgzYmYzMGY2OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI0OWRjM2JmMjEyMDljNTQ4ZTY1MmE4OGY1ZmE3ZTQxODVjZWU3ZDYiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-06-25 02:02:09'),('b6cqgeuh1n3eot1l054hnr8ua2q4gttx','MjQ2NzBlZGFmNmVhOWM1Y2NkMTU4ZjY5NjAzOGJjYjMxYmQzOTcxMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1NWUyMDdiZjNlMjcwNmY2OTcyYTk1N2M4ODY5OGJkZWUwZjg0Y2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-06-29 10:39:45'),('ign71plbzjktmhtv2erzjbbhp2kj3px5','MDE1ZWNhYThjNzUxYTJlNmNhNGMzNDk0NDI2MTFiMTIwZTI0YTAxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjM1NWUyMDdiZjNlMjcwNmY2OTcyYTk1N2M4ODY5OGJkZWUwZjg0Y2IiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-06-29 16:23:37'),('p3tk4cgytfvbyegi2g16ombegepoke5k','MTAwYjM3ZTIyMjkxN2M4MGE3ODY5YmU5M2E4M2EwMTc2NTFiNDY2MTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFmMTg3YWIzM2RjMDQ4YjI1MDQxMDIzMWI5YmU1YjljMGU3YmI1NGEiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-06-25 04:56:14');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-16 17:47:57
