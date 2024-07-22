-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.30-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 wms_db 的数据库结构
CREATE DATABASE IF NOT EXISTS `wms_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wms_db`;

-- 导出  表 wms_db.wms_access_record 结构
CREATE TABLE IF NOT EXISTS `wms_access_record` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `ACCESS_TYPE` varchar(30) NOT NULL,
  `ACCESS_TIME` datetime NOT NULL,
  `ACCESS_IP` varchar(45) NOT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_access_record 的数据：~0 rows (大约)
DELETE FROM `wms_access_record`;
/*!40000 ALTER TABLE `wms_access_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wms_access_record` ENABLE KEYS */;

-- 导出  表 wms_db.wms_action 结构
CREATE TABLE IF NOT EXISTS `wms_action` (
  `ACTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTION_NAME` varchar(30) NOT NULL,
  `ACTION_DESC` varchar(30) DEFAULT NULL,
  `ACTION_PARAM` varchar(50) NOT NULL,
  PRIMARY KEY (`ACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_action 的数据：~48 rows (大约)
DELETE FROM `wms_action`;
/*!40000 ALTER TABLE `wms_action` DISABLE KEYS */;
INSERT INTO `wms_action` (`ACTION_ID`, `ACTION_NAME`, `ACTION_DESC`, `ACTION_PARAM`) VALUES
	(1, 'addSupplier', NULL, '/supplierManage/addSupplier'),
	(2, 'deleteSupplier', NULL, '/supplierManage/deleteSupplier'),
	(3, 'updateSupplier', NULL, '/supplierManage/updateSupplier'),
	(4, 'selectSupplier', NULL, '/supplierManage/getSupplierList'),
	(5, 'getSupplierInfo', NULL, '/supplierManage/getSupplierInfo'),
	(6, 'importSupplier', NULL, '/supplierManage/importSupplier'),
	(7, 'exportSupplier', NULL, '/supplierManage/exportSupplier'),
	(8, 'selectCustomer', NULL, '/customerManage/getCustomerList'),
	(9, 'addCustomer', NULL, '/customerManage/addCustomer'),
	(10, 'getCustomerInfo', NULL, '/customerManage/getCustomerInfo'),
	(11, 'updateCustomer', NULL, '/customerManage/updateCustomer'),
	(12, 'deleteCustomer', NULL, '/customerManage/deleteCustomer'),
	(13, 'importCustomer', NULL, '/customerManage/importCustomer'),
	(14, 'exportCustomer', NULL, '/customerManage/exportCustomer'),
	(15, 'selectGoods', NULL, '/goodsManage/getGoodsList'),
	(16, 'addGoods', NULL, '/goodsManage/addGoods'),
	(17, 'getGoodsInfo', NULL, '/goodsManage/getGoodsInfo'),
	(18, 'updateGoods', NULL, '/goodsManage/updateGoods'),
	(19, 'deleteGoods', NULL, '/goodsManage/deleteGoods'),
	(20, 'importGoods', NULL, '/goodsManage/importGoods'),
	(21, 'exportGoods', NULL, '/goodsManage/exportGoods'),
	(22, 'selectRepository', NULL, '/repositoryManage/getRepositoryList'),
	(23, 'addRepository', NULL, '/repositoryManage/addRepository'),
	(24, 'getRepositoryInfo', NULL, '/repositoryManage/getRepository'),
	(25, 'updateRepository', NULL, '/repositoryManage/updateRepository'),
	(26, 'deleteRepository', NULL, '/repositoryManage/deleteRepository'),
	(27, 'importRepository', NULL, '/repositoryManage/importRepository'),
	(28, 'exportRepository', NULL, '/repositoryManage/exportRepository'),
	(29, 'selectRepositoryAdmin', NULL, '/repositoryAdminManage/getRepositoryAdminList'),
	(30, 'addRepositoryAdmin', NULL, '/repositoryAdminManage/addRepositoryAdmin'),
	(31, 'getRepositoryAdminInfo', NULL, '/repositoryAdminManage/getRepositoryAdminInfo'),
	(32, 'updateRepositoryAdmin', NULL, '/repositoryAdminManage/updateRepositoryAdmin'),
	(33, 'deleteRepositoryAdmin', NULL, '/repositoryAdminManage/deleteRepositoryAdmin'),
	(34, 'importRepositoryAd,om', NULL, '/repositoryAdminManage/importRepositoryAdmin'),
	(35, 'exportRepository', NULL, '/repositoryAdminManage/exportRepositoryAdmin'),
	(36, 'getUnassignRepository', NULL, '/repositoryManage/getUnassignRepository'),
	(37, 'getStorageListWithRepository', NULL, '/storageManage/getStorageListWithRepository'),
	(38, 'getStorageList', NULL, '/storageManage/getStorageList'),
	(39, 'addStorageRecord', NULL, '/storageManage/addStorageRecord'),
	(40, 'updateStorageRecord', NULL, '/storageManage/updateStorageRecord'),
	(41, 'deleteStorageRecord', NULL, '/storageManage/deleteStorageRecord'),
	(42, 'importStorageRecord', NULL, '/storageManage/importStorageRecord'),
	(43, 'exportStorageRecord', NULL, '/storageManage/exportStorageRecord'),
	(44, ' stockIn', NULL, '/stockRecordManage/stockIn'),
	(45, 'stockOut', NULL, '/stockRecordManage/stockOut'),
	(46, 'searchStockRecord', NULL, '/stockRecordManage/searchStockRecord'),
	(47, 'getAccessRecords', NULL, '/systemLog/getAccessRecords'),
	(48, 'selectUserOperationRecords', NULL, '/systemLog/selectUserOperationRecords'),
	(49, 'getRepoTempHumList', NULL, '/repoTempHum/getRepoTempHumList'),
	(50, 'addRepoTempHumRecord', NULL, '/repoTempHum/addRepoTempHumRecord'),
	(51, 'exportRepoTempHumRecord', NULL, '/repoTempHum/exportRecord');
/*!40000 ALTER TABLE `wms_action` ENABLE KEYS */;

-- 导出  表 wms_db.wms_customer 结构
CREATE TABLE IF NOT EXISTS `wms_customer` (
  `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_NAME` varchar(30) NOT NULL,
  `CUSTOMER_PERSON` varchar(10) NOT NULL,
  `CUSTOMER_TEL` varchar(20) NOT NULL,
  `CUSTOMER_EMAIL` varchar(20) NOT NULL,
  `CUSTOMER_ADDRESS` varchar(30) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1217 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_customer 的数据：~3 rows (大约)
DELETE FROM `wms_customer`;
/*!40000 ALTER TABLE `wms_customer` DISABLE KEYS */;
INSERT INTO `wms_customer` (`CUSTOMER_ID`, `CUSTOMER_NAME`, `CUSTOMER_PERSON`, `CUSTOMER_TEL`, `CUSTOMER_EMAIL`, `CUSTOMER_ADDRESS`) VALUES
	(1214, '醴陵荣旗瓷业有限公司', '陈娟', '17716786888', '23369888@136.com', '中国 湖南 醴陵市 嘉树乡玉茶村柏树组'),
	(1215, '深圳市松林达电子有限公司', '刘明', '85263335-820', '85264958@126.com', '中国 广东 深圳市宝安区 深圳市宝安区福永社区桥头村桥塘路育'),
	(1216, '郑州绿之源饮品有限公司 ', '赵志敬', '87094196', '87092165@qq.com', '中国 河南 郑州市 郑州市嘉亿东方大厦609');
/*!40000 ALTER TABLE `wms_customer` ENABLE KEYS */;

-- 导出  表 wms_db.wms_goods 结构
CREATE TABLE IF NOT EXISTS `wms_goods` (
  `GOOD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GOOD_NAME` varchar(30) NOT NULL,
  `GOOD_RYPE` varchar(20) DEFAULT NULL,
  `GOOD_SIZE` varchar(20) DEFAULT NULL,
  `GOOD_VALUE` double NOT NULL,
  PRIMARY KEY (`GOOD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_goods 的数据：~3 rows (大约)
DELETE FROM `wms_goods`;
/*!40000 ALTER TABLE `wms_goods` DISABLE KEYS */;
INSERT INTO `wms_goods` (`GOOD_ID`, `GOOD_NAME`, `GOOD_RYPE`, `GOOD_SIZE`, `GOOD_VALUE`) VALUES
	(103, '五孔插座西门子墙壁开关', '电器', '86*86', 1.85),
	(104, '陶瓷马克杯', '陶瓷', '9*9*11', 3.5),
	(105, '精酿苹果醋', '饮料', '312ml', 300);
/*!40000 ALTER TABLE `wms_goods` ENABLE KEYS */;

-- 导出  表 wms_db.wms_operation_record 结构
CREATE TABLE IF NOT EXISTS `wms_operation_record` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `OPERATION_NAME` varchar(30) NOT NULL,
  `OPERATION_TIME` datetime NOT NULL,
  `OPERATION_RESULT` varchar(15) NOT NULL,
  PRIMARY KEY (`RECORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_operation_record 的数据：~0 rows (大约)
DELETE FROM `wms_operation_record`;
/*!40000 ALTER TABLE `wms_operation_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `wms_operation_record` ENABLE KEYS */;

-- 导出  表 wms_db.wms_record_in 结构
CREATE TABLE IF NOT EXISTS `wms_record_in` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECORD_SUPPLIERID` int(11) NOT NULL,
  `RECORD_GOODID` int(11) NOT NULL,
  `RECORD_NUMBER` int(11) NOT NULL,
  `RECORD_TIME` datetime NOT NULL,
  `RECORD_PERSON` varchar(10) NOT NULL,
  `RECORD_REPOSITORYID` int(11) NOT NULL,
  PRIMARY KEY (`RECORD_ID`),
  KEY `RECORD_SUPPLIERID` (`RECORD_SUPPLIERID`),
  KEY `RECORD_GOODID` (`RECORD_GOODID`),
  KEY `RECORD_REPOSITORYID` (`RECORD_REPOSITORYID`),
  CONSTRAINT `wms_record_in_ibfk_1` FOREIGN KEY (`RECORD_SUPPLIERID`) REFERENCES `wms_supplier` (`SUPPLIER_ID`),
  CONSTRAINT `wms_record_in_ibfk_2` FOREIGN KEY (`RECORD_GOODID`) REFERENCES `wms_goods` (`GOOD_ID`),
  CONSTRAINT `wms_record_in_ibfk_3` FOREIGN KEY (`RECORD_REPOSITORYID`) REFERENCES `wms_respository` (`REPO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_record_in 的数据：~12 rows (大约)
DELETE FROM `wms_record_in`;
/*!40000 ALTER TABLE `wms_record_in` DISABLE KEYS */;
INSERT INTO `wms_record_in` (`RECORD_ID`, `RECORD_SUPPLIERID`, `RECORD_GOODID`, `RECORD_NUMBER`, `RECORD_TIME`, `RECORD_PERSON`, `RECORD_REPOSITORYID`) VALUES
	(15, 1015, 105, 1000, '2016-12-31 00:00:00', 'admin', 1004),
	(16, 1015, 105, 200, '2017-01-02 00:00:00', 'admin', 1004),
	(17, 1014, 105, 500, '2021-03-09 20:40:04', 'admin', 1004),
	(18, 1014, 105, 1111, '2021-03-09 20:56:24', 'admin', 1004),
	(19, 1014, 105, 11, '2021-03-09 20:58:07', 'admin', 1004),
	(20, 1014, 104, 2, '2021-03-09 21:49:53', 'admin', 1003),
	(21, 1013, 103, 10, '2021-04-27 21:59:37', 'admin', 1005),
	(22, 1013, 104, 10, '2021-04-27 22:18:28', 'admin', 1004),
	(23, 1013, 103, 10, '2021-04-27 22:18:40', 'admin', 1004),
	(24, 1013, 104, 13, '2021-05-23 15:18:55', '王皓', 1004),
	(25, 1013, 104, 3, '2021-05-23 16:06:04', '王皓', 1004),
	(26, 1013, 104, 1, '2021-05-23 16:06:21', '王皓', 1004),
	(27, 1013, 105, 7, '2021-05-23 16:09:38', '王皓', 1004);
/*!40000 ALTER TABLE `wms_record_in` ENABLE KEYS */;

-- 导出  表 wms_db.wms_record_out 结构
CREATE TABLE IF NOT EXISTS `wms_record_out` (
  `RECORD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RECORD_CUSTOMERID` int(11) NOT NULL,
  `RECORD_GOODID` int(11) NOT NULL,
  `RECORD_NUMBER` int(11) NOT NULL,
  `RECORD_TIME` datetime NOT NULL,
  `RECORD_PERSON` varchar(10) NOT NULL,
  `RECORD_REPOSITORYID` int(11) NOT NULL,
  PRIMARY KEY (`RECORD_ID`),
  KEY `RECORD_CUSTOMERID` (`RECORD_CUSTOMERID`),
  KEY `RECORD_GOODID` (`RECORD_GOODID`),
  KEY `RECORD_REPOSITORYID` (`RECORD_REPOSITORYID`),
  CONSTRAINT `wms_record_out_ibfk_1` FOREIGN KEY (`RECORD_CUSTOMERID`) REFERENCES `wms_customer` (`CUSTOMER_ID`),
  CONSTRAINT `wms_record_out_ibfk_2` FOREIGN KEY (`RECORD_GOODID`) REFERENCES `wms_goods` (`GOOD_ID`),
  CONSTRAINT `wms_record_out_ibfk_3` FOREIGN KEY (`RECORD_REPOSITORYID`) REFERENCES `wms_respository` (`REPO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_record_out 的数据：~2 rows (大约)
DELETE FROM `wms_record_out`;
/*!40000 ALTER TABLE `wms_record_out` DISABLE KEYS */;
INSERT INTO `wms_record_out` (`RECORD_ID`, `RECORD_CUSTOMERID`, `RECORD_GOODID`, `RECORD_NUMBER`, `RECORD_TIME`, `RECORD_PERSON`, `RECORD_REPOSITORYID`) VALUES
	(7, 1214, 104, 750, '2016-12-31 00:00:00', 'admin', 1003),
	(8, 1216, 104, 1, '2021-03-09 21:50:10', 'admin', 1003),
	(9, 1215, 104, 1, '2021-05-23 16:21:17', '王皓', 1004);
/*!40000 ALTER TABLE `wms_record_out` ENABLE KEYS */;

-- 导出  表 wms_db.wms_record_storage 结构
CREATE TABLE IF NOT EXISTS `wms_record_storage` (
  `RECORD_GOODID` int(11) NOT NULL,
  `RECORD_REPOSITORY` int(11) NOT NULL,
  `RECORD_NUMBER` int(11) NOT NULL,
  PRIMARY KEY (`RECORD_GOODID`,`RECORD_REPOSITORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_record_storage 的数据：~5 rows (大约)
DELETE FROM `wms_record_storage`;
/*!40000 ALTER TABLE `wms_record_storage` DISABLE KEYS */;
INSERT INTO `wms_record_storage` (`RECORD_GOODID`, `RECORD_REPOSITORY`, `RECORD_NUMBER`) VALUES
	(103, 1004, 10),
	(103, 1005, 10020),
	(104, 1003, 1751),
	(104, 1004, 26),
	(105, 1004, 3629);
/*!40000 ALTER TABLE `wms_record_storage` ENABLE KEYS */;

-- 导出  表 wms_db.wms_repo_admin 结构
CREATE TABLE IF NOT EXISTS `wms_repo_admin` (
  `REPO_ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPO_ADMIN_NAME` varchar(10) NOT NULL,
  `REPO_ADMIN_SEX` varchar(10) NOT NULL,
  `REPO_ADMIN_TEL` varchar(20) NOT NULL,
  `REPO_ADMIN_ADDRESS` varchar(30) NOT NULL,
  `REPO_ADMIN_BIRTH` datetime NOT NULL,
  `REPO_ADMIN_REPOID` int(11) DEFAULT NULL,
  PRIMARY KEY (`REPO_ADMIN_ID`),
  KEY `REPO_ADMIN_REPOID` (`REPO_ADMIN_REPOID`),
  CONSTRAINT `wms_repo_admin_ibfk_1` FOREIGN KEY (`REPO_ADMIN_REPOID`) REFERENCES `wms_respository` (`REPO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_repo_admin 的数据：~2 rows (大约)
DELETE FROM `wms_repo_admin`;
/*!40000 ALTER TABLE `wms_repo_admin` DISABLE KEYS */;
INSERT INTO `wms_repo_admin` (`REPO_ADMIN_ID`, `REPO_ADMIN_NAME`, `REPO_ADMIN_SEX`, `REPO_ADMIN_TEL`, `REPO_ADMIN_ADDRESS`, `REPO_ADMIN_BIRTH`, `REPO_ADMIN_REPOID`) VALUES
	(1018, '王皓', '女', '12345874526', '中国佛山', '2016-12-09 00:00:00', 1004),
	(1019, '李富荣', '男', '1234', '广州', '2016-12-07 00:00:00', 1003);
/*!40000 ALTER TABLE `wms_repo_admin` ENABLE KEYS */;

-- 导出  表 wms_db.wms_repo_temp_hum 结构
CREATE TABLE IF NOT EXISTS `wms_repo_temp_hum` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `REPO_ID` int(11) NOT NULL COMMENT '仓库id',
  `TEMP` float NOT NULL DEFAULT '0' COMMENT '温度',
  `HUM` float NOT NULL DEFAULT '0' COMMENT '湿度',
  `REPO_ADMIN_ID` int(11) NOT NULL COMMENT '仓库管理员id',
  `CREATE_TIME` datetime NOT NULL COMMENT '记录时间',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='仓库温湿度信息表';

-- 正在导出表  wms_db.wms_repo_temp_hum 的数据：~1 rows (大约)
DELETE FROM `wms_repo_temp_hum`;
/*!40000 ALTER TABLE `wms_repo_temp_hum` DISABLE KEYS */;
INSERT INTO `wms_repo_temp_hum` (`LOG_ID`, `REPO_ID`, `TEMP`, `HUM`, `REPO_ADMIN_ID`, `CREATE_TIME`, `REMARK`) VALUES
	(1, 1004, 25.6, 67.3, 1018, '2021-05-30 16:07:49', '666');
/*!40000 ALTER TABLE `wms_repo_temp_hum` ENABLE KEYS */;

-- 导出  表 wms_db.wms_respository 结构
CREATE TABLE IF NOT EXISTS `wms_respository` (
  `REPO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPO_ADDRESS` varchar(30) NOT NULL,
  `REPO_STATUS` varchar(20) NOT NULL,
  `REPO_AREA` varchar(20) NOT NULL,
  `REPO_DESC` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`REPO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_respository 的数据：~3 rows (大约)
DELETE FROM `wms_respository`;
/*!40000 ALTER TABLE `wms_respository` DISABLE KEYS */;
INSERT INTO `wms_respository` (`REPO_ID`, `REPO_ADDRESS`, `REPO_STATUS`, `REPO_AREA`, `REPO_DESC`) VALUES
	(1003, '北京顺义南彩工业园区彩祥西路9号', '可用', '11000㎡', '提供服务完整'),
	(1004, '广州白云石井石潭路大基围工业区', '可用', '1000㎡', '物流极为便利'),
	(1005, ' 香港北区文锦渡路（红桥新村）', '可用', '5000.00㎡', NULL),
	(1006, '新仓库', '可用', '1000', '');
/*!40000 ALTER TABLE `wms_respository` ENABLE KEYS */;

-- 导出  表 wms_db.wms_roles 结构
CREATE TABLE IF NOT EXISTS `wms_roles` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(20) NOT NULL,
  `ROLE_DESC` varchar(30) DEFAULT NULL,
  `ROLE_URL_PREFIX` varchar(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_roles 的数据：~2 rows (大约)
DELETE FROM `wms_roles`;
/*!40000 ALTER TABLE `wms_roles` DISABLE KEYS */;
INSERT INTO `wms_roles` (`ROLE_ID`, `ROLE_NAME`, `ROLE_DESC`, `ROLE_URL_PREFIX`) VALUES
	(1, 'systemAdmin', NULL, 'systemAdmin'),
	(2, 'commonsAdmin', NULL, 'commonsAdmin');
/*!40000 ALTER TABLE `wms_roles` ENABLE KEYS */;

-- 导出  表 wms_db.wms_role_action 结构
CREATE TABLE IF NOT EXISTS `wms_role_action` (
  `ACTION_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ACTION_ID`,`ROLE_ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `wms_role_action_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `wms_roles` (`ROLE_ID`),
  CONSTRAINT `wms_role_action_ibfk_2` FOREIGN KEY (`ACTION_ID`) REFERENCES `wms_action` (`ACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_role_action 的数据：~55 rows (大约)
DELETE FROM `wms_role_action`;
/*!40000 ALTER TABLE `wms_role_action` DISABLE KEYS */;
INSERT INTO `wms_role_action` (`ACTION_ID`, `ROLE_ID`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(51, 1),
	(4, 2),
	(8, 2),
	(15, 2),
	(22, 2),
	(23, 2),
	(37, 2),
	(38, 2),
	(43, 2),
	(44, 2),
	(45, 2),
	(50, 2);
/*!40000 ALTER TABLE `wms_role_action` ENABLE KEYS */;

-- 导出  表 wms_db.wms_supplier 结构
CREATE TABLE IF NOT EXISTS `wms_supplier` (
  `SUPPLIER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUPPLIER_NAME` varchar(30) NOT NULL,
  `SUPPLIER_PERSON` varchar(10) NOT NULL,
  `SUPPLIER_TEL` varchar(20) NOT NULL,
  `SUPPLIER_EMAIL` varchar(20) NOT NULL,
  `SUPPLIER_ADDRESS` varchar(30) NOT NULL,
  PRIMARY KEY (`SUPPLIER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_supplier 的数据：~3 rows (大约)
DELETE FROM `wms_supplier`;
/*!40000 ALTER TABLE `wms_supplier` DISABLE KEYS */;
INSERT INTO `wms_supplier` (`SUPPLIER_ID`, `SUPPLIER_NAME`, `SUPPLIER_PERSON`, `SUPPLIER_TEL`, `SUPPLIER_EMAIL`, `SUPPLIER_ADDRESS`) VALUES
	(1013, '浙江奇同电器有限公司', '王泽伟', '13777771126', '86827868@126.com', '中国 浙江 温州市龙湾区 龙湾区永强大道1648号'),
	(1014, '醴陵春天陶瓷实业有限公司', '温仙容', '13974167256', '23267999@126.com', '中国 湖南 醴陵市 东正街15号'),
	(1015, '洛阳嘉吉利饮品有限公司', '郑绮云', '26391678', '22390898@qq.com', '中国 广东 佛山市顺德区 北滘镇怡和路2号怡和中心14楼');
/*!40000 ALTER TABLE `wms_supplier` ENABLE KEYS */;

-- 导出  表 wms_db.wms_user 结构
CREATE TABLE IF NOT EXISTS `wms_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_USERNAME` varchar(30) NOT NULL,
  `USER_PASSWORD` varchar(40) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_user 的数据：~3 rows (大约)
DELETE FROM `wms_user`;
/*!40000 ALTER TABLE `wms_user` DISABLE KEYS */;
INSERT INTO `wms_user` (`USER_ID`, `USER_USERNAME`, `USER_PASSWORD`) VALUES
	(1001, 'admin', '6f5379e73c1a9eac6163ab8eaec7e41c'),
	(1018, '王皓', '50f202f4862360e55635b0a9616ded13'),
	(1019, '李富荣', 'c4b3af5a5ab3e3d5aac4c5a5436201b8');
/*!40000 ALTER TABLE `wms_user` ENABLE KEYS */;

-- 导出  表 wms_db.wms_user_role 结构
CREATE TABLE IF NOT EXISTS `wms_user_role` (
  `ROLE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `wms_user_role_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `wms_roles` (`ROLE_ID`),
  CONSTRAINT `wms_user_role_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `wms_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  wms_db.wms_user_role 的数据：~3 rows (大约)
DELETE FROM `wms_user_role`;
/*!40000 ALTER TABLE `wms_user_role` DISABLE KEYS */;
INSERT INTO `wms_user_role` (`ROLE_ID`, `USER_ID`) VALUES
	(1, 1001),
	(2, 1018),
	(2, 1019);
/*!40000 ALTER TABLE `wms_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
