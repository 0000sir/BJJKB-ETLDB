-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: jiankangbao
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `jiankangbao` CHAR SET utf8mb4 collate utf8mb4_unicode_ci;

USE `jiankangbao`;

--
-- Table structure for table `TZ_COVID19_PERSON_ACID_DN`
--

DROP TABLE IF EXISTS `TZ_COVID19_PERSON_ACID_DN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TZ_COVID19_PERSON_ACID_DN` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `XM` varchar(100) NOT NULL COMMENT '姓名',
  `ZJHM` varchar(100) NOT NULL COMMENT '证件号码',
  `UPDATE_DATE` datetime NOT NULL COMMENT '数据最后更新时间',
  `ZJLX` varchar(10) NOT NULL COMMENT '证件类型',
  `DYZYMPP` varchar(100) NOT NULL COMMENT '第一针疫苗品牌',
  `DYZJZSJ` datetime NOT NULL COMMENT '第一针接种时间',
  `DEZYMPP` varchar(100) NOT NULL COMMENT '第二针疫苗品牌',
  `DEZJZSJ` datetime NOT NULL COMMENT '第二针接种时间',
  `DSZYMPP` varchar(100) NOT NULL COMMENT '第三针疫苗品牌',
  `DSZJZSJ` datetime NOT NULL COMMENT '第三针接种时间',
  `COMPARE_DATE` datetime NOT NULL COMMENT '比较时间，由大数据平台反馈',
  `EXT_CLIENT_CODE` varchar(1000) NOT NULL COMMENT '内部字段，高校不提供',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TZ_COVID19_STAFF_COLLEGE_UP`
--

DROP TABLE IF EXISTS `TZ_COVID19_STAFF_COLLEGE_UP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TZ_COVID19_STAFF_COLLEGE_UP` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `XXDM` varchar(100) NOT NULL COMMENT '学校统一社会信用代码',
  `XXMC` varchar(500) NOT NULL COMMENT '学校名称',
  `XM` varchar(100) NOT NULL COMMENT '姓名',
  `XB` enum('男','女') NOT NULL COMMENT '性别，填写：男、女',
  `ZJHM` varchar(100) NOT NULL COMMENT '证件号码',
  `ZJLX` varchar(10) NOT NULL COMMENT '证件类型',
  `SJH` varchar(100) NOT NULL COMMENT '手机号',
  `EJDW` varchar(500) NOT NULL COMMENT '二级单位',
  `ZW` varchar(100) NOT NULL COMMENT '职务',
  `ZC` varchar(100) NOT NULL COMMENT '职称',
  `RYLX` varchar(100) NOT NULL COMMENT '人员类型，填写：教师、干部、劳务派遣员工、离退休人员、保安、食堂、保洁、其他在校内人员',
  `SFZX` enum('是','否') NOT NULL COMMENT '是否住校，是否',
  `SJJZD` varchar(500) NOT NULL COMMENT '实际居住地',
  `CREATE_DATE` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_DATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `EXT_CLIENT_CODE` varchar(1000) DEFAULT NULL COMMENT '内部字段，高校不提供',
  `EXT_CREATE_TIME` datetime DEFAULT NULL COMMENT '内部字段，高校不提供',
  `EXT_UPDATE_TIME` datetime DEFAULT NULL COMMENT '内部字段，高校不提供',
  `EXT_DLM_INSTANCE_ID` varchar(50) DEFAULT NULL COMMENT '内部字段，高校不提供',
  `EXT_ORG_TYPE` varchar(50) DEFAULT NULL COMMENT '内部字段，高校不提供',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1028 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TZ_COVID19_STUDENT_COLLEGE_UP`
--

DROP TABLE IF EXISTS `TZ_COVID19_STUDENT_COLLEGE_UP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TZ_COVID19_STUDENT_COLLEGE_UP` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `XXDM` varchar(100) NOT NULL COMMENT '学校统一社会信用代码',
  `XXMC` varchar(500) NOT NULL COMMENT '学校名称',
  `XM` varchar(100) NOT NULL COMMENT '姓名',
  `ZJLX` varchar(10) NOT NULL COMMENT '证件类型',
  `ZJHM` varchar(100) NOT NULL COMMENT '证件号码',
  `MZ` varchar(100) NOT NULL COMMENT '民族，汉族',
  `XB` varchar(100) NOT NULL COMMENT '性别，男、女',
  `SZXYM` varchar(500) NOT NULL COMMENT '所在校区',
  `SZXY` varchar(500) NOT NULL COMMENT '所在单位（学院/系）',
  `NJ` varchar(50) NOT NULL COMMENT '年级',
  `PYCC` varchar(100) NOT NULL COMMENT '培养层次',
  `ZY` varchar(200) NOT NULL COMMENT '专业',
  `RXSJ` varchar(100) NOT NULL COMMENT '入校时间，YYYYMM格式',
  `BYSJ` varchar(100) NOT NULL COMMENT '预计毕业时间，YYYYMM格式',
  `YDDH` varchar(100) NOT NULL COMMENT '联系电话',
  `SFZJ` enum('是','否') NOT NULL COMMENT '是否在校，填写：是、否',
  `CREATE_DATE` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_DATE` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `EXT_CLIENT_CODE` varchar(1000) DEFAULT NULL COMMENT '内部字段，高校不提供',
  `EXT_CREATE_TIME` datetime DEFAULT NULL COMMENT '内部字段，高校不提供',
  `EXT_UPDATE_TIME` datetime DEFAULT NULL COMMENT '内部字段，高校不提供',
  `EXT_DLM_INSTANCE_ID` varchar(50) DEFAULT NULL COMMENT '内部字段，高校不提供',
  `EXT_ORG_TYPE` varchar(50) DEFAULT NULL COMMENT '内部字段，高校不提供',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4096 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
