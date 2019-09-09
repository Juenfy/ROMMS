/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : romms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-04-26 10:13:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adapt
-- ----------------------------
DROP TABLE IF EXISTS `adapt`;
CREATE TABLE `adapt` (
  `adaptid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `modelid` int(11) NOT NULL,
  `remark` varchar(128) NOT NULL,
  `adaptdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`adaptid`),
  KEY `FK_Relationship_27` (`userid`),
  KEY `FK_Relationship_28` (`modelid`),
  CONSTRAINT `FK_Relationship_27` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_28` FOREIGN KEY (`modelid`) REFERENCES `model` (`modelid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of adapt
-- ----------------------------
INSERT INTO `adapt` VALUES ('2', '7', '9', 'MIUI10', '2019-03-06 03:23:19');

-- ----------------------------
-- Table structure for android
-- ----------------------------
DROP TABLE IF EXISTS `android`;
CREATE TABLE `android` (
  `anid` int(11) NOT NULL AUTO_INCREMENT,
  `android` varchar(10) NOT NULL,
  PRIMARY KEY (`anid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of android
-- ----------------------------
INSERT INTO `android` VALUES ('1', '2.2.x');
INSERT INTO `android` VALUES ('2', '2.3.X');
INSERT INTO `android` VALUES ('3', '4.0');
INSERT INTO `android` VALUES ('4', '4.0.x');
INSERT INTO `android` VALUES ('5', '4.1');
INSERT INTO `android` VALUES ('6', '4.2');
INSERT INTO `android` VALUES ('7', '4.2.x');
INSERT INTO `android` VALUES ('8', '4.3');
INSERT INTO `android` VALUES ('9', '4.3.x');
INSERT INTO `android` VALUES ('10', '4.3.x');
INSERT INTO `android` VALUES ('11', '4.4');
INSERT INTO `android` VALUES ('12', '4.4.x');
INSERT INTO `android` VALUES ('13', '5.0');
INSERT INTO `android` VALUES ('14', '5.0.x');
INSERT INTO `android` VALUES ('15', '5.1');
INSERT INTO `android` VALUES ('16', '5.1.x');
INSERT INTO `android` VALUES ('17', '6.0');
INSERT INTO `android` VALUES ('18', '6.0.x');
INSERT INTO `android` VALUES ('19', '7.0');
INSERT INTO `android` VALUES ('20', '7.0.x');
INSERT INTO `android` VALUES ('21', '7.1.x');
INSERT INTO `android` VALUES ('22', '8.0');
INSERT INTO `android` VALUES ('23', '8.1');
INSERT INTO `android` VALUES ('24', '9.0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `romid` int(11) DEFAULT NULL,
  `ftid` int(11) DEFAULT NULL,
  `pnid` int(11) DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET gb2312 DEFAULT NULL,
  `commentdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentid`),
  KEY `FK_Relationship_5` (`userid`),
  KEY `FK_Relationship_6` (`romid`),
  KEY `FK_Relationship_18` (`ftid`),
  KEY `FK_Relationship_19` (`pnid`),
  CONSTRAINT `FK_Relationship_18` FOREIGN KEY (`ftid`) REFERENCES `flashteach` (`ftid`),
  CONSTRAINT `FK_Relationship_19` FOREIGN KEY (`pnid`) REFERENCES `phonenews` (`pnid`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`romid`) REFERENCES `rom` (`romid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('87', '2', '9', null, null, '哈哈哈，非常好用的呢', '2018-11-23 22:17:50');
INSERT INTO `comment` VALUES ('91', '1', '20', null, null, '', '2018-11-28 18:13:30');
INSERT INTO `comment` VALUES ('92', '1', '20', null, null, '我很帅', '2018-11-28 18:13:49');
INSERT INTO `comment` VALUES ('93', '1', '14', null, null, '给你10分不要骄傲', '2018-11-29 17:39:58');
INSERT INTO `comment` VALUES ('94', '1', '10', null, null, '好用', '2018-12-05 21:48:23');
INSERT INTO `comment` VALUES ('95', '1', null, '2', null, '很不错的一个教程，赞', '2018-12-10 14:40:09');
INSERT INTO `comment` VALUES ('96', '1', null, '2', null, '哈哈哈哈哈', '2018-12-10 14:50:31');
INSERT INTO `comment` VALUES ('97', '1', null, '2', null, '我很帅', '2018-12-10 14:54:03');
INSERT INTO `comment` VALUES ('98', '1', null, '2', null, '我很帅', '2018-12-10 14:54:14');
INSERT INTO `comment` VALUES ('99', '1', null, '2', null, '我很帅', '2018-12-10 14:54:17');
INSERT INTO `comment` VALUES ('100', '1', null, '2', null, '我很帅', '2018-12-10 14:54:21');
INSERT INTO `comment` VALUES ('102', '1', null, null, '1', '哇！真是太棒了', '2018-12-10 15:19:39');
INSERT INTO `comment` VALUES ('103', '1', null, null, '1', '哈哈哈哈哈', '2018-12-15 15:32:02');
INSERT INTO `comment` VALUES ('104', '1', null, null, '1', '我是大哥我怕谁\r\n', '2018-12-15 15:32:23');
INSERT INTO `comment` VALUES ('105', '1', null, null, '1', '其他优化及调整\r\n', '2018-12-15 15:32:43');
INSERT INTO `comment` VALUES ('106', '1', null, null, '1', '其他优化及调整', '2018-12-15 15:32:51');
INSERT INTO `comment` VALUES ('107', '1', null, null, '1', '其他优化及调整', '2018-12-15 15:33:09');
INSERT INTO `comment` VALUES ('108', '1', '9', null, null, '哈哈哈哈哈', '2018-12-26 11:30:06');
INSERT INTO `comment` VALUES ('109', '1', null, '3', null, '哈哈哈哈', '2018-12-26 11:37:40');
INSERT INTO `comment` VALUES ('110', '1', null, null, '1', 'good', '2018-12-26 11:38:14');
INSERT INTO `comment` VALUES ('111', '1', null, '2', null, '我是大哥我怕谁', '2018-12-28 13:58:34');
INSERT INTO `comment` VALUES ('112', '1', null, null, '2', '我是大哥我怕谁', '2018-12-28 13:59:10');
INSERT INTO `comment` VALUES ('113', '1', null, '4', null, '我最帅', '2018-12-28 14:08:59');
INSERT INTO `comment` VALUES ('114', '1', null, null, '1', '我最帅', '2018-12-28 14:09:16');
INSERT INTO `comment` VALUES ('115', '1', '22', null, null, '移动端怎么适配？', '2018-12-28 19:29:29');
INSERT INTO `comment` VALUES ('116', '1', '12', null, null, '这个系统真心好用', '2018-12-30 19:01:38');
INSERT INTO `comment` VALUES ('117', '1', '20', null, null, 'a b c', '2019-02-21 18:39:51');
INSERT INTO `comment` VALUES ('118', '1', '20', null, null, 'ascascassa', '2019-02-21 18:40:31');
INSERT INTO `comment` VALUES ('119', '1', '20', null, null, 'a v c', '2019-02-21 18:42:10');
INSERT INTO `comment` VALUES ('120', '1', '20', null, null, 'z v', '2019-02-21 18:42:52');
INSERT INTO `comment` VALUES ('121', '1', '20', null, null, '', '2019-02-21 18:47:45');
INSERT INTO `comment` VALUES ('122', '1', null, '4', null, '', '2019-02-21 18:49:07');
INSERT INTO `comment` VALUES ('123', '1', null, '2', null, 'hahaha', '2019-02-28 00:17:42');
INSERT INTO `comment` VALUES ('124', '2', '33', null, null, '老谢是沙雕', '2019-03-04 12:36:57');
INSERT INTO `comment` VALUES ('125', '5', '9', null, null, '哈哈，很棒哟', '2019-03-04 20:41:15');
INSERT INTO `comment` VALUES ('126', '2', '29', null, null, '非常不错喔，加油', '2019-03-04 20:45:22');
INSERT INTO `comment` VALUES ('127', '5', '17', null, null, 'very good', '2019-03-04 20:45:28');
INSERT INTO `comment` VALUES ('128', '5', '29', null, null, 'very good', '2019-03-04 20:45:49');
INSERT INTO `comment` VALUES ('129', '7', '18', null, null, '棒棒哒', '2019-03-04 22:14:31');
INSERT INTO `comment` VALUES ('130', '7', '19', null, null, '哈哈哈', '2019-03-06 13:43:00');
INSERT INTO `comment` VALUES ('131', '7', '19', null, null, '我的世界变得奇妙更难以言语，还以为是从天而降的梦境。', '2019-03-06 13:44:04');
INSERT INTO `comment` VALUES ('132', '7', '11', null, null, '我的世界 变得奇妙更难以言喻\r\n还以为 是从天而降的梦境', '2019-03-06 13:49:15');
INSERT INTO `comment` VALUES ('133', '7', '11', null, null, '我的世界 变得奇妙更难以言喻还以为 是从天而降的梦境', '2019-03-06 13:50:31');
INSERT INTO `comment` VALUES ('134', '7', '26', null, null, 'thank、', '2019-03-06 16:14:35');
INSERT INTO `comment` VALUES ('135', '5', '13', null, null, '‘红红火火恍恍惚惚', '2019-03-08 22:24:06');
INSERT INTO `comment` VALUES ('136', '5', '13', null, null, 'http://192.168.43.201:8080/ROMMS/mobile/mobileShowUiType', '2019-03-08 22:24:43');
INSERT INTO `comment` VALUES ('137', '5', '14', null, null, 'gg', '2019-03-08 22:40:59');
INSERT INTO `comment` VALUES ('138', '5', '14', null, null, '哦哦', '2019-03-08 22:41:04');
INSERT INTO `comment` VALUES ('139', '5', '14', null, null, '茜茜', '2019-03-08 22:41:09');
INSERT INTO `comment` VALUES ('140', '5', '14', null, null, '秘密', '2019-03-08 22:41:14');
INSERT INTO `comment` VALUES ('141', '5', '14', null, null, '', '2019-03-08 22:41:17');
INSERT INTO `comment` VALUES ('142', '5', '14', null, null, '哈哈', '2019-03-08 22:41:24');
INSERT INTO `comment` VALUES ('143', '5', '13', null, null, '哈哈', '2019-03-09 00:16:12');
INSERT INTO `comment` VALUES ('144', '5', '13', null, null, '迷惑', '2019-03-09 00:16:17');
INSERT INTO `comment` VALUES ('145', '5', '13', null, null, '噢噢噢', '2019-03-09 00:16:23');
INSERT INTO `comment` VALUES ('146', '5', '13', null, null, '给你找', '2019-03-09 00:16:30');

-- ----------------------------
-- Table structure for flashteach
-- ----------------------------
DROP TABLE IF EXISTS `flashteach`;
CREATE TABLE `flashteach` (
  `ftid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `modelid` int(11) NOT NULL,
  `ftcontent` varchar(1536) NOT NULL,
  `redate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(50) NOT NULL,
  `coimg` varchar(16) DEFAULT NULL,
  `reviewnum` int(11) NOT NULL DEFAULT '0',
  `datedir` varchar(20) NOT NULL,
  PRIMARY KEY (`ftid`),
  KEY `FK_Relationship_8` (`userid`),
  KEY `FK_Relationship_9` (`modelid`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`modelid`) REFERENCES `model` (`modelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of flashteach
-- ----------------------------
INSERT INTO `flashteach` VALUES ('2', '4', '10', '    小米5(标准版 全网通)手机变砖了怎么办?对于经常刷机的安卓玩家来说，碰到刷机失败导致小米5(标准版 全网通)手机无法启动甚至无法进入recovery都是在所难免的事，这个时候我们就需要用到奇兔线刷大师线刷救砖功能了，它能轻松实现小米5(标准版 全网通)一键救砖。奇兔线刷大师救砖是一款新的救砖软件，大家用奇兔线刷大师救砖功能就能把自己砖头机救活了。现在已经支持了小米、三星等品牌机型的一键救砖，其他机型陆续支持中。小米5(标准版 全网通)怎么一键救砖呢?下面跟着奇兔ROM市场小编一起来看看小米5(标准版 全网通)一键救砖教程吧，小米5(标准版 全网通)一键救砖教程的具体操作步骤如下：\r\n\r\n1、打开奇兔线刷大师软件（点击下载），（此时电脑不需要连接手机，如果连接上了可以先拔掉数据线）\r\n\r\n2、搜索自己手机型号的机型，也可以点击下面机型品牌去里面详细查找，不知道如何选择正确的线刷包的用户，可点击“如何选择线刷包?”进入相关教程贴学习，小米手机用户可直接选择小米线刷包。\r\n\r\n3、也可以在进入固件市场后，通过快速查找机型功能输入“小米”关键词，找到小米5(标准版 全网通)，选择小米5(标准版 全网通)救砖包点击“一键刷入”。由于小米手机同一型号不同版本之间的线刷救砖包是可以通刷的，所以此时小米5(标准版 全网通)用户可以刷入任一救砖包。注意：非此机型请勿刷入，否则手机将彻底黑屏变砖。', '2018-12-10 13:59:44', '小米5(标准版 全网通)一键救砖教程，轻松刷回官方系统', 'teachcoimg.png', '47', '1544421584253');
INSERT INTO `flashteach` VALUES ('3', '4', '1', '    智能手机刷机相信大家已经都不再陌生了，不过对待小米8屏下指纹刷机还是需要非常谨慎操作，因为不当的刷机方法可能导致系统崩溃，带来很大的麻烦。由于不同品牌不同型号的手机刷机也会有差异，因此对于很多菜鸟而言都非常害怕因操作失误导致手机刷机失败，那么有没有什么简单的小米8屏下指纹刷机方法呢?\r\n\r\n    本文将为大家介绍奇兔刷机怎么用?如何使用奇兔刷机对小米8屏下指纹进行刷机的教程，下面一起来看看具体步骤如下\r\n\r\n    1.首先打开奇兔刷机，连接手机后打开USB调试模式，奇兔刷机检测到有机型连接后，会自动给该机型装驱动，驱动安装成功之后，就会自动连接手机，期间要保持手机是正常开机状态。\r\n\r\n    2.点击【一键刷机】，可以选择你要刷的小米8屏下指纹 ROM包，如果你还没有下载手机的刷机ROM包，可以在奇兔刷机ROM市场下载。选择好手机的刷机ROM包之后，进入资料备份界面，刷机会清除联系人, 短信, 通话记录和应用程序，建议大家备份，刷机后可以还原。\r\n\r\n    3.资料备份完之后，就开始刷机啦。\r\n\r\n    4.等操作完成后，手机进入自动刷机模式啦，这时候只要耐心等待手机自动重启就行了。\r\n\r\n    如果您在使用奇兔刷机中遇到任何问题或不懂之处，欢迎您来奇兔刷机官方论坛提问，我们会有技术人员和版主为您解答!\r\n\r\n    至此小米8屏下指纹刷机教程就结束了，通过奇兔刷机我们可以轻松的刷入各种手机OS系统，另外奇兔刷机ROM市场还有丰富的ROM任你挑选，总有一款刷机ROM包适合你，希望这篇小米8屏下指纹刷机教程对机友有所帮助。', '2018-12-10 15:30:41', '小米8屏下指纹一键刷机教程，看教程秒懂刷机', 'teachcoimg.png', '13', '1544427041779');
INSERT INTO `flashteach` VALUES ('4', '4', '11', '乐视超级手机乐1S(X500)怎么救砖？今天奇兔ROM市场(http://rom.7to.cn/)小编给大家分享一下乐视超级手机乐1S(X500)救砖教程，简单让你的手机刷回官方系统，手机刷完官方线刷包后即可正常OTA升级。有需要救砖的机友一起来看看下面的这篇救砖教程。\r\n\r\n1.刷机工具包 \r\n乐视超级手机乐1S(X500)刷机工具包：http://pan.baidu.com/s/1kUx7wwf\r\n将下载所得的刷机工具包解压，解压后通常都有三个文件夹，如下图\r\n\r\n安装线刷驱动\r\n\r\n\r\n请看：Windows系统MTK手动安装驱动教程(Win10通用)\r\n\r\n2.开始刷机\r\n待驱动安装完毕后，运行 “刷机工具“  目录下的 Flash_tool.exe\r\n点击 Scatter-loading（配置文件） ，选择 固件 目录下的 MT6795_Android_scatter_x500.txt ，并点击 Download（下载） 如下图：\r\n\r\n手机关机，连接USB数据线，工具开始刷机； \r\n\r\n刷机完成后如下图：\r\n拔掉数据线，取下电池重新装上，按电源键开机进入系统\r\n\r\n乐视超级手机乐1S(X500)救砖教程结束了。不懂怎么对乐视超级手机乐1S(X500)救砖的机友，看看上面奇兔ROM市场小编给大家分享的这篇乐视超级手机乐1S(X500)救砖教程，此教程可用于回官方系统，还支持OTA升级。', '2018-12-10 15:45:32', '乐视超级手机乐1S(X500)救砖教程 救砖包 刷回官方系统', 'teachcoimg.png', '10', '1544427932857');
INSERT INTO `flashteach` VALUES ('5', '4', '3', 'OPPO R11手机变砖了怎么办?对于经常刷机的安卓玩家来说，碰到刷机失败导致小米5(标准版 全网通)手机无法启动甚至无法进入recovery都是在所难免的事，这个时候我们就需要用到奇兔线刷大师线刷救砖功能了，它能轻松实现小米5(标准版 全网通)一键救砖。奇兔线刷大师救砖是一款新的救砖软件，大家用奇兔线刷大师救砖功能就能把自己砖头机救活了。现在已经支持了小米、三星等品牌机型的一键救砖，其他机型陆续支持中。小米5(标准版 全网通)怎么一键救砖呢?下面跟着奇兔ROM市场小编一起来看看小米5(标准版 全网通)一键救砖教程吧，小米5(标准版 全网通)一键救砖教程的具体操作步骤如下：\r\n\r\n1、打开奇兔线刷大师软件（点击下载），（此时电脑不需要连接手机，如果连接上了可以先拔掉数据线）\r\n\r\n2、搜索自己手机型号的机型，也可以点击下面机型品牌去里面详细查找，不知道如何选择正确的线刷包的用户，可点击“如何选择线刷包?”进入相关教程贴学习，小米手机用户可直接选择小米线刷包。\r\n\r\n3、也可以在进入固件市场后，通过快速查找机型功能输入“小米”关键词，找到小米5(标准版 全网通)，选择小米5(标准版 全网通)救砖包点击“一键刷入”。由于小米手机同一型号不同版本之间的线刷救砖包是可以通刷的，所以此时小米5(标准版 全网通)用户可以刷入任一救砖包。注意：非此机型请勿刷入，否则手机将彻底黑屏变砖。', '2019-02-28 00:47:27', 'oppo-r11救砖教程 救砖包 刷回官方系统', 'teachcoimg.png', '0', '1551286047474');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `hisid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `modelid` int(11) DEFAULT NULL,
  `romid` int(11) DEFAULT NULL,
  `ftid` int(11) DEFAULT NULL,
  `pnid` int(11) DEFAULT NULL,
  `recordsdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `histype` int(11) NOT NULL,
  PRIMARY KEY (`hisid`),
  KEY `FK_Relationship_20` (`userid`),
  KEY `FK_Relationship_21` (`modelid`),
  KEY `FK_Relationship_23` (`ftid`),
  KEY `FK_Relationship_24` (`pnid`),
  KEY `FK_Relationship_22` (`romid`),
  CONSTRAINT `FK_Relationship_20` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_21` FOREIGN KEY (`modelid`) REFERENCES `model` (`modelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`romid`) REFERENCES `rom` (`romid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_23` FOREIGN KEY (`ftid`) REFERENCES `flashteach` (`ftid`),
  CONSTRAINT `FK_Relationship_24` FOREIGN KEY (`pnid`) REFERENCES `phonenews` (`pnid`)
) ENGINE=InnoDB AUTO_INCREMENT=1232 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('251', '2', '8', null, null, null, '2018-11-23 21:49:50', '0');
INSERT INTO `history` VALUES ('252', '2', '8', null, null, null, '2018-11-23 21:51:28', '0');
INSERT INTO `history` VALUES ('258', '2', '8', null, null, null, '2018-11-23 22:00:05', '0');
INSERT INTO `history` VALUES ('265', '2', '8', null, null, null, '2018-11-23 22:11:02', '0');
INSERT INTO `history` VALUES ('266', '2', '8', null, null, null, '2018-11-23 22:17:10', '0');
INSERT INTO `history` VALUES ('267', '2', null, '9', null, null, '2018-11-23 22:17:19', '1');
INSERT INTO `history` VALUES ('268', '2', null, '9', null, null, '2018-11-23 22:17:27', '1');
INSERT INTO `history` VALUES ('269', '2', null, '9', null, null, '2018-11-23 22:17:35', '1');
INSERT INTO `history` VALUES ('270', '2', null, '9', null, null, '2018-11-23 22:17:50', '1');
INSERT INTO `history` VALUES ('271', '2', '8', null, null, null, '2018-11-23 22:30:37', '0');
INSERT INTO `history` VALUES ('272', '2', '8', null, null, null, '2018-11-23 22:30:49', '0');
INSERT INTO `history` VALUES ('273', '2', '8', null, null, null, '2018-11-23 22:30:55', '0');
INSERT INTO `history` VALUES ('274', '2', null, '9', null, null, '2018-11-23 22:31:04', '1');
INSERT INTO `history` VALUES ('275', '2', null, '9', null, null, '2018-11-23 22:32:07', '1');
INSERT INTO `history` VALUES ('276', '2', null, '9', null, null, '2018-11-23 22:32:21', '1');
INSERT INTO `history` VALUES ('277', '2', null, '9', null, null, '2018-11-23 22:32:32', '1');
INSERT INTO `history` VALUES ('278', '2', null, '9', null, null, '2018-11-23 22:32:41', '1');
INSERT INTO `history` VALUES ('279', '2', null, '9', null, null, '2018-11-23 22:32:54', '1');
INSERT INTO `history` VALUES ('302', '2', '2', null, null, null, '2018-11-26 10:01:50', '0');
INSERT INTO `history` VALUES ('303', '2', null, '13', null, null, '2018-11-26 10:01:56', '1');
INSERT INTO `history` VALUES ('304', '2', '4', null, null, null, '2018-11-26 10:02:32', '0');
INSERT INTO `history` VALUES ('306', '2', '1', null, null, null, '2018-11-26 10:03:34', '0');
INSERT INTO `history` VALUES ('307', '2', null, '19', null, null, '2018-11-26 10:03:41', '1');
INSERT INTO `history` VALUES ('308', '2', '5', null, null, null, '2018-11-26 10:23:46', '0');
INSERT INTO `history` VALUES ('310', '2', '2', null, null, null, '2018-11-26 13:14:53', '0');
INSERT INTO `history` VALUES ('311', '2', '1', null, null, null, '2018-11-26 21:47:11', '0');
INSERT INTO `history` VALUES ('312', '2', '8', null, null, null, '2018-11-26 21:50:53', '0');
INSERT INTO `history` VALUES ('313', '2', null, '12', null, null, '2018-11-26 21:51:14', '1');
INSERT INTO `history` VALUES ('314', '2', null, '12', null, null, '2018-11-26 21:52:01', '1');
INSERT INTO `history` VALUES ('315', '2', null, '12', null, null, '2018-11-26 21:52:33', '1');
INSERT INTO `history` VALUES ('316', '2', '8', null, null, null, '2018-11-26 22:16:40', '0');
INSERT INTO `history` VALUES ('317', '2', '8', null, null, null, '2018-11-26 22:26:56', '0');
INSERT INTO `history` VALUES ('319', '2', null, '9', null, null, '2018-11-26 22:27:03', '1');
INSERT INTO `history` VALUES ('841', '1', null, null, '3', null, '2018-12-26 16:17:22', '2');
INSERT INTO `history` VALUES ('844', '1', null, null, null, '2', '2018-12-26 16:33:59', '3');
INSERT INTO `history` VALUES ('845', '1', null, null, '3', null, '2018-12-26 17:35:18', '2');
INSERT INTO `history` VALUES ('846', '1', null, null, '4', null, '2018-12-26 17:35:30', '2');
INSERT INTO `history` VALUES ('847', '1', null, null, null, '2', '2018-12-26 17:35:34', '3');
INSERT INTO `history` VALUES ('848', '1', null, null, null, '1', '2018-12-26 17:35:37', '3');
INSERT INTO `history` VALUES ('855', '1', null, null, '2', null, '2018-12-26 18:07:23', '2');
INSERT INTO `history` VALUES ('860', '1', null, null, '2', null, '2018-12-26 18:10:19', '2');
INSERT INTO `history` VALUES ('861', '1', null, null, '2', null, '2018-12-26 18:11:04', '2');
INSERT INTO `history` VALUES ('862', '3', '2', null, null, null, '2018-12-26 19:09:49', '0');
INSERT INTO `history` VALUES ('863', '3', '1', null, null, null, '2018-12-26 19:09:55', '0');
INSERT INTO `history` VALUES ('864', '3', '4', null, null, null, '2018-12-26 19:10:00', '0');
INSERT INTO `history` VALUES ('865', '3', '10', null, null, null, '2018-12-26 19:10:09', '0');
INSERT INTO `history` VALUES ('867', '3', null, '16', null, null, '2018-12-26 19:47:12', '1');
INSERT INTO `history` VALUES ('868', '3', null, '19', null, null, '2018-12-26 19:47:46', '1');
INSERT INTO `history` VALUES ('869', '3', null, '13', null, null, '2018-12-26 19:48:44', '1');
INSERT INTO `history` VALUES ('870', '3', null, '21', null, null, '2018-12-26 19:48:58', '1');
INSERT INTO `history` VALUES ('871', '3', null, '14', null, null, '2018-12-26 19:49:00', '1');
INSERT INTO `history` VALUES ('872', '3', null, null, '2', null, '2018-12-26 19:57:17', '2');
INSERT INTO `history` VALUES ('873', '3', null, null, '4', null, '2018-12-26 20:00:16', '2');
INSERT INTO `history` VALUES ('874', '3', null, null, '4', null, '2018-12-26 20:00:28', '2');
INSERT INTO `history` VALUES ('875', '3', null, null, '3', null, '2018-12-26 20:02:26', '2');
INSERT INTO `history` VALUES ('876', '3', '2', null, null, null, '2018-12-26 20:58:41', '0');
INSERT INTO `history` VALUES ('879', '3', '9', null, null, null, '2018-12-26 20:58:53', '0');
INSERT INTO `history` VALUES ('880', '3', '11', null, null, null, '2018-12-26 20:58:59', '0');
INSERT INTO `history` VALUES ('885', '1', null, null, '2', null, '2018-12-28 13:58:12', '2');
INSERT INTO `history` VALUES ('886', '1', null, null, null, '2', '2018-12-28 13:59:00', '3');
INSERT INTO `history` VALUES ('887', '1', null, null, '4', null, '2018-12-28 14:06:19', '2');
INSERT INTO `history` VALUES ('888', '1', null, null, '4', null, '2018-12-28 14:08:51', '2');
INSERT INTO `history` VALUES ('889', '1', null, null, null, '1', '2018-12-28 14:09:11', '3');
INSERT INTO `history` VALUES ('903', '1', null, null, '2', null, '2018-12-30 19:44:43', '2');
INSERT INTO `history` VALUES ('918', '1', null, '18', null, null, '2019-01-01 14:50:00', '1');
INSERT INTO `history` VALUES ('928', '1', null, '13', null, null, '2019-01-01 15:03:49', '1');
INSERT INTO `history` VALUES ('932', '1', null, '20', null, null, '2019-01-02 13:26:46', '1');
INSERT INTO `history` VALUES ('933', '1', null, null, '2', null, '2019-01-02 13:29:34', '2');
INSERT INTO `history` VALUES ('934', '1', null, '13', null, null, '2019-01-02 22:49:03', '1');
INSERT INTO `history` VALUES ('936', '1', null, '12', null, null, '2019-01-03 14:26:58', '1');
INSERT INTO `history` VALUES ('937', '1', null, '12', null, null, '2019-01-03 14:27:04', '1');
INSERT INTO `history` VALUES ('939', '1', null, null, '2', null, '2019-01-03 23:44:59', '2');
INSERT INTO `history` VALUES ('943', '1', null, '20', null, null, '2019-01-04 19:33:21', '1');
INSERT INTO `history` VALUES ('944', '1', null, null, '2', null, '2019-01-04 19:42:41', '2');
INSERT INTO `history` VALUES ('945', '1', null, '20', null, null, '2019-01-04 20:47:34', '1');
INSERT INTO `history` VALUES ('947', '1', null, '13', null, null, '2019-01-04 20:47:58', '1');
INSERT INTO `history` VALUES ('948', '1', null, null, '2', null, '2019-01-04 21:03:51', '2');
INSERT INTO `history` VALUES ('952', '1', null, '22', null, null, '2019-01-07 03:30:33', '1');
INSERT INTO `history` VALUES ('953', '1', '2', null, null, null, '2019-01-07 03:30:40', '0');
INSERT INTO `history` VALUES ('954', '1', null, '13', null, null, '2019-01-07 03:30:43', '1');
INSERT INTO `history` VALUES ('955', '1', null, '21', null, null, '2019-01-07 03:30:54', '1');
INSERT INTO `history` VALUES ('956', '1', null, '17', null, null, '2019-01-07 03:31:02', '1');
INSERT INTO `history` VALUES ('957', '1', '1', null, null, null, '2019-01-08 11:21:59', '0');
INSERT INTO `history` VALUES ('958', '1', '1', null, null, null, '2019-01-08 11:27:16', '0');
INSERT INTO `history` VALUES ('959', '1', '1', null, null, null, '2019-01-08 11:30:21', '0');
INSERT INTO `history` VALUES ('963', '1', '17', null, null, null, '2019-01-08 19:05:26', '0');
INSERT INTO `history` VALUES ('964', '1', '17', null, null, null, '2019-01-08 19:05:35', '0');
INSERT INTO `history` VALUES ('981', '5', '1', null, null, null, '2019-01-12 13:43:21', '0');
INSERT INTO `history` VALUES ('982', '5', '1', null, null, null, '2019-01-12 13:43:42', '0');
INSERT INTO `history` VALUES ('983', '5', '1', null, null, null, '2019-01-12 13:43:53', '0');
INSERT INTO `history` VALUES ('984', '5', '1', null, null, null, '2019-01-12 13:44:36', '0');
INSERT INTO `history` VALUES ('985', '5', '1', null, null, null, '2019-01-12 13:54:00', '0');
INSERT INTO `history` VALUES ('986', '5', '1', null, null, null, '2019-01-12 14:07:41', '0');
INSERT INTO `history` VALUES ('987', '5', '1', null, null, null, '2019-01-12 14:07:53', '0');
INSERT INTO `history` VALUES ('988', '5', '3', null, null, null, '2019-01-12 14:08:02', '0');
INSERT INTO `history` VALUES ('989', '5', '4', null, null, null, '2019-01-12 14:08:09', '0');
INSERT INTO `history` VALUES ('990', '5', '4', null, null, null, '2019-01-12 14:09:55', '0');
INSERT INTO `history` VALUES ('991', '5', '4', null, null, null, '2019-01-12 14:10:35', '0');
INSERT INTO `history` VALUES ('992', '5', '4', null, null, null, '2019-01-12 14:12:48', '0');
INSERT INTO `history` VALUES ('993', '5', '4', null, null, null, '2019-01-12 14:16:05', '0');
INSERT INTO `history` VALUES ('994', '5', '4', null, null, null, '2019-01-12 14:16:12', '0');
INSERT INTO `history` VALUES ('995', '5', '4', null, null, null, '2019-01-12 14:16:23', '0');
INSERT INTO `history` VALUES ('996', '5', '16', null, null, null, '2019-01-12 14:16:30', '0');
INSERT INTO `history` VALUES ('997', '2', '16', null, null, null, '2019-01-12 14:24:59', '0');
INSERT INTO `history` VALUES ('998', '5', '8', null, null, null, '2019-01-12 15:32:24', '0');
INSERT INTO `history` VALUES ('1000', '5', '3', null, null, null, '2019-01-12 15:32:54', '0');
INSERT INTO `history` VALUES ('1001', '5', '1', null, null, null, '2019-01-12 15:33:00', '0');
INSERT INTO `history` VALUES ('1005', '5', '16', null, null, null, '2019-02-17 19:04:50', '0');
INSERT INTO `history` VALUES ('1007', '1', '1', null, null, null, '2019-02-21 18:08:39', '0');
INSERT INTO `history` VALUES ('1008', '1', null, '20', null, null, '2019-02-21 18:08:48', '1');
INSERT INTO `history` VALUES ('1009', '1', '1', null, null, null, '2019-02-21 18:22:09', '0');
INSERT INTO `history` VALUES ('1010', '1', null, '20', null, null, '2019-02-21 18:22:13', '1');
INSERT INTO `history` VALUES ('1011', '1', null, null, '4', null, '2019-02-21 18:49:02', '2');
INSERT INTO `history` VALUES ('1012', '1', null, null, '4', null, '2019-02-21 18:49:19', '2');
INSERT INTO `history` VALUES ('1013', '1', null, null, '4', null, '2019-02-21 18:51:49', '2');
INSERT INTO `history` VALUES ('1014', '1', '2', null, null, null, '2019-02-21 19:00:00', '0');
INSERT INTO `history` VALUES ('1015', '1', '2', null, null, null, '2019-02-21 19:02:59', '0');
INSERT INTO `history` VALUES ('1016', '1', '2', null, null, null, '2019-02-21 19:03:09', '0');
INSERT INTO `history` VALUES ('1017', '1', '2', null, null, null, '2019-02-21 19:07:44', '0');
INSERT INTO `history` VALUES ('1018', '1', '2', null, null, null, '2019-02-21 19:07:53', '0');
INSERT INTO `history` VALUES ('1019', '1', '2', null, null, null, '2019-02-21 19:09:24', '0');
INSERT INTO `history` VALUES ('1020', '1', '2', null, null, null, '2019-02-21 19:13:59', '0');
INSERT INTO `history` VALUES ('1021', '1', '1', null, null, null, '2019-02-22 12:15:47', '0');
INSERT INTO `history` VALUES ('1022', '1', null, '26', null, null, '2019-02-25 15:13:19', '1');
INSERT INTO `history` VALUES ('1023', '1', null, '20', null, null, '2019-02-27 23:45:40', '1');
INSERT INTO `history` VALUES ('1024', '1', null, null, '2', null, '2019-02-28 00:17:13', '2');
INSERT INTO `history` VALUES ('1025', '1', '1', null, null, null, '2019-02-28 00:19:45', '0');
INSERT INTO `history` VALUES ('1026', '1', null, null, '2', null, '2019-02-28 00:46:23', '2');
INSERT INTO `history` VALUES ('1027', '9', '2', null, null, null, '2019-03-01 02:34:14', '0');
INSERT INTO `history` VALUES ('1028', '3', null, '13', null, null, '2019-03-01 14:06:18', '1');
INSERT INTO `history` VALUES ('1029', '3', null, '13', null, null, '2019-03-01 14:06:54', '1');
INSERT INTO `history` VALUES ('1030', '3', null, '21', null, null, '2019-03-01 14:07:04', '1');
INSERT INTO `history` VALUES ('1031', '9', '2', null, null, null, '2019-03-01 14:10:49', '0');
INSERT INTO `history` VALUES ('1032', '9', '2', null, null, null, '2019-03-01 14:11:04', '0');
INSERT INTO `history` VALUES ('1033', '9', null, '14', null, null, '2019-03-01 14:11:13', '1');
INSERT INTO `history` VALUES ('1034', '9', null, '13', null, null, '2019-03-01 14:12:15', '1');
INSERT INTO `history` VALUES ('1035', '9', '2', null, null, null, '2019-03-01 14:30:13', '0');
INSERT INTO `history` VALUES ('1036', '9', '1', null, null, null, '2019-03-01 14:32:31', '0');
INSERT INTO `history` VALUES ('1037', '1', null, '13', null, null, '2019-03-04 12:34:17', '1');
INSERT INTO `history` VALUES ('1038', '2', null, '33', null, null, '2019-03-04 12:35:34', '1');
INSERT INTO `history` VALUES ('1039', '2', '8', null, null, null, '2019-03-04 12:43:34', '0');
INSERT INTO `history` VALUES ('1040', '2', '8', null, null, null, '2019-03-04 12:43:37', '0');
INSERT INTO `history` VALUES ('1041', '1', '8', null, null, null, '2019-03-04 13:47:48', '0');
INSERT INTO `history` VALUES ('1042', '1', '8', null, null, null, '2019-03-04 13:47:51', '0');
INSERT INTO `history` VALUES ('1043', '1', '2', null, null, null, '2019-03-04 16:05:58', '0');
INSERT INTO `history` VALUES ('1120', '2', null, '29', null, null, '2019-03-04 20:44:10', '1');
INSERT INTO `history` VALUES ('1121', '2', null, '29', null, null, '2019-03-04 20:45:09', '1');
INSERT INTO `history` VALUES ('1124', '7', '3', null, null, null, '2019-03-06 03:19:20', '0');
INSERT INTO `history` VALUES ('1125', '7', '9', null, null, null, '2019-03-06 03:19:39', '0');
INSERT INTO `history` VALUES ('1126', '7', '9', null, null, null, '2019-03-06 03:19:51', '0');
INSERT INTO `history` VALUES ('1127', '7', '9', null, null, null, '2019-03-06 03:23:19', '0');
INSERT INTO `history` VALUES ('1128', '1', null, '14', null, null, '2019-03-06 04:04:45', '1');
INSERT INTO `history` VALUES ('1129', '1', null, '13', null, null, '2019-03-06 04:14:32', '1');
INSERT INTO `history` VALUES ('1152', '7', '2', null, null, null, '2019-03-06 15:14:14', '0');
INSERT INTO `history` VALUES ('1155', '7', '2', null, null, null, '2019-03-06 15:24:00', '0');
INSERT INTO `history` VALUES ('1157', '7', '2', null, null, null, '2019-03-06 15:24:43', '0');
INSERT INTO `history` VALUES ('1159', '7', '2', null, null, null, '2019-03-06 15:28:33', '0');
INSERT INTO `history` VALUES ('1162', '7', '2', null, null, null, '2019-03-06 15:33:01', '0');
INSERT INTO `history` VALUES ('1163', '7', '1', null, null, null, '2019-03-06 15:33:06', '0');
INSERT INTO `history` VALUES ('1187', '7', null, '30', null, null, '2019-03-06 16:13:25', '1');
INSERT INTO `history` VALUES ('1188', '7', null, '19', null, null, '2019-03-06 16:13:35', '1');
INSERT INTO `history` VALUES ('1189', '7', null, '19', null, null, '2019-03-06 16:13:43', '1');
INSERT INTO `history` VALUES ('1190', '7', null, '37', null, null, '2019-03-06 16:13:54', '1');
INSERT INTO `history` VALUES ('1191', '7', null, '26', null, null, '2019-03-06 16:14:11', '1');
INSERT INTO `history` VALUES ('1192', '7', null, '26', null, null, '2019-03-06 16:14:19', '1');
INSERT INTO `history` VALUES ('1193', '7', null, '19', null, null, '2019-03-06 16:15:54', '1');
INSERT INTO `history` VALUES ('1194', '7', null, '19', null, null, '2019-03-06 16:26:30', '1');
INSERT INTO `history` VALUES ('1195', '7', null, '19', null, null, '2019-03-06 16:27:01', '1');
INSERT INTO `history` VALUES ('1196', '7', null, '19', null, null, '2019-03-06 16:27:29', '1');
INSERT INTO `history` VALUES ('1197', '7', null, '19', null, null, '2019-03-06 16:28:32', '1');
INSERT INTO `history` VALUES ('1198', '7', null, '19', null, null, '2019-03-06 16:29:52', '1');
INSERT INTO `history` VALUES ('1199', '7', null, '19', null, null, '2019-03-06 16:35:17', '1');
INSERT INTO `history` VALUES ('1200', '7', null, '19', null, null, '2019-03-06 16:36:51', '1');
INSERT INTO `history` VALUES ('1201', '7', null, '26', null, null, '2019-03-06 16:37:36', '1');
INSERT INTO `history` VALUES ('1202', '7', null, '30', null, null, '2019-03-06 16:38:04', '1');
INSERT INTO `history` VALUES ('1203', '7', null, '30', null, null, '2019-03-06 16:39:53', '1');
INSERT INTO `history` VALUES ('1204', '7', null, '26', null, null, '2019-03-06 16:41:14', '1');
INSERT INTO `history` VALUES ('1205', '7', null, '32', null, null, '2019-03-06 16:43:32', '1');
INSERT INTO `history` VALUES ('1206', '7', null, '13', null, null, '2019-03-06 20:15:02', '1');
INSERT INTO `history` VALUES ('1212', '5', null, '14', null, null, '2019-03-08 22:39:01', '1');
INSERT INTO `history` VALUES ('1213', '5', null, '14', null, null, '2019-03-08 22:40:53', '1');
INSERT INTO `history` VALUES ('1214', '5', null, '13', null, null, '2019-03-09 00:01:14', '1');
INSERT INTO `history` VALUES ('1215', '5', null, '38', null, null, '2019-03-09 00:01:24', '1');
INSERT INTO `history` VALUES ('1216', '5', null, '38', null, null, '2019-03-09 00:01:32', '1');
INSERT INTO `history` VALUES ('1217', '5', null, '32', null, null, '2019-03-09 00:01:46', '1');
INSERT INTO `history` VALUES ('1218', '5', null, '13', null, null, '2019-03-09 00:01:54', '1');
INSERT INTO `history` VALUES ('1219', '5', null, '13', null, null, '2019-03-09 00:04:29', '1');
INSERT INTO `history` VALUES ('1220', '5', null, '13', null, null, '2019-03-09 00:06:19', '1');
INSERT INTO `history` VALUES ('1221', '5', null, '13', null, null, '2019-03-09 00:06:23', '1');
INSERT INTO `history` VALUES ('1222', '5', null, '13', null, null, '2019-03-09 00:06:51', '1');
INSERT INTO `history` VALUES ('1223', '5', null, '13', null, null, '2019-03-09 00:07:10', '1');
INSERT INTO `history` VALUES ('1224', '5', null, '13', null, null, '2019-03-09 00:07:23', '1');
INSERT INTO `history` VALUES ('1225', '5', null, '12', null, null, '2019-03-09 00:12:43', '1');
INSERT INTO `history` VALUES ('1226', '5', null, '9', null, null, '2019-03-09 00:13:25', '1');
INSERT INTO `history` VALUES ('1227', '5', null, '13', null, null, '2019-03-09 00:13:33', '1');
INSERT INTO `history` VALUES ('1228', '5', null, '19', null, null, '2019-03-09 00:13:41', '1');
INSERT INTO `history` VALUES ('1229', '5', null, '30', null, null, '2019-03-09 00:14:19', '1');
INSERT INTO `history` VALUES ('1230', '5', null, '13', null, null, '2019-03-09 00:16:07', '1');
INSERT INTO `history` VALUES ('1231', '5', null, '14', null, null, '2019-03-09 00:19:00', '1');

-- ----------------------------
-- Table structure for mfture
-- ----------------------------
DROP TABLE IF EXISTS `mfture`;
CREATE TABLE `mfture` (
  `mftureid` int(11) NOT NULL AUTO_INCREMENT,
  `mfture` varchar(10) NOT NULL,
  `mfimg` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`mftureid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of mfture
-- ----------------------------
INSERT INTO `mfture` VALUES ('1', 'xiaomi', 'xiaomi.png');
INSERT INTO `mfture` VALUES ('2', 'lenovo', 'lenovo.png');
INSERT INTO `mfture` VALUES ('3', 'oppo', 'oppo.png');
INSERT INTO `mfture` VALUES ('4', 'vivo', 'vivo.png');
INSERT INTO `mfture` VALUES ('5', 'huawei', 'huawei.png');
INSERT INTO `mfture` VALUES ('6', 'letv', 'letv.png');
INSERT INTO `mfture` VALUES ('7', 'samsung', 'samsung.png');
INSERT INTO `mfture` VALUES ('8', 'gionee', 'gionee.png');
INSERT INTO `mfture` VALUES ('9', 'htc', 'htc.png');
INSERT INTO `mfture` VALUES ('10', 'coolpad', 'coolpad.png');
INSERT INTO `mfture` VALUES ('11', 'nubia', 'nubia.png');
INSERT INTO `mfture` VALUES ('12', '360', null);
INSERT INTO `mfture` VALUES ('13', '魅族', null);
INSERT INTO `mfture` VALUES ('14', 'zuk', null);
INSERT INTO `mfture` VALUES ('15', '一加', null);
INSERT INTO `mfture` VALUES ('20', '红辣椒', null);

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `modelid` int(11) NOT NULL AUTO_INCREMENT,
  `mftureid` int(11) NOT NULL,
  `model` varchar(24) NOT NULL,
  `moimg` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`modelid`),
  KEY `FK_Relationship_1` (`mftureid`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`mftureid`) REFERENCES `mfture` (`mftureid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('1', '1', 'xiaomi-mi8', 'xiaomi-mi8.png');
INSERT INTO `model` VALUES ('2', '2', 'lenovo-k3note', 'lenovo-k3note.png');
INSERT INTO `model` VALUES ('3', '3', 'oppo-r11', 'oppo-r11.png');
INSERT INTO `model` VALUES ('4', '4', 'vivo-x3sw', 'vivo-x3sw.png');
INSERT INTO `model` VALUES ('5', '5', 'honor-bndal10', 'honor-bndal10.png');
INSERT INTO `model` VALUES ('6', '6', 'letv-max2', 'letv-max2.png');
INSERT INTO `model` VALUES ('7', '7', 'samsung-s5', 'samsung-s5.png');
INSERT INTO `model` VALUES ('8', '8', 'gionee-103b', 'gioneef103b.png');
INSERT INTO `model` VALUES ('9', '1', 'xiaomi-mi6', 'xiaomi-mi6.png');
INSERT INTO `model` VALUES ('10', '1', 'xiaomi-mi5', 'xiaomi-mi5.png');
INSERT INTO `model` VALUES ('11', '6', 'letv-x500', 'letv-x500.png');
INSERT INTO `model` VALUES ('12', '6', 'letv-x600', 'letv-x600.png');
INSERT INTO `model` VALUES ('14', '2', 'lenovo-k3', null);
INSERT INTO `model` VALUES ('15', '7', 'samsung-a5000', 'samsung-a5000.png');
INSERT INTO `model` VALUES ('16', '13', 'meizu-m2', 'meizu-m2.png');
INSERT INTO `model` VALUES ('17', '15', '一加3（A3000）', '一加3（A3000）.png');
INSERT INTO `model` VALUES ('18', '13', '魅族魅蓝note2', '魅族魅蓝note2.png');
INSERT INTO `model` VALUES ('19', '8', '金立F105', '金立F105.png');

-- ----------------------------
-- Table structure for myphone
-- ----------------------------
DROP TABLE IF EXISTS `myphone`;
CREATE TABLE `myphone` (
  `mpid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `modelid` int(11) NOT NULL,
  PRIMARY KEY (`mpid`),
  KEY `FK_Relationship_12` (`userid`),
  KEY `FK_Relationship_13` (`modelid`),
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`modelid`) REFERENCES `model` (`modelid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of myphone
-- ----------------------------
INSERT INTO `myphone` VALUES ('1', '2', '8');
INSERT INTO `myphone` VALUES ('2', '1', '8');
INSERT INTO `myphone` VALUES ('3', '1', '2');
INSERT INTO `myphone` VALUES ('4', '3', '4');
INSERT INTO `myphone` VALUES ('5', '3', '2');
INSERT INTO `myphone` VALUES ('6', '5', '2');
INSERT INTO `myphone` VALUES ('7', '5', '1');
INSERT INTO `myphone` VALUES ('8', '5', '4');
INSERT INTO `myphone` VALUES ('9', '5', '16');
INSERT INTO `myphone` VALUES ('10', '2', '16');

-- ----------------------------
-- Table structure for phonenews
-- ----------------------------
DROP TABLE IF EXISTS `phonenews`;
CREATE TABLE `phonenews` (
  `pnid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `pncontent` varchar(1536) NOT NULL,
  `redate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(50) NOT NULL,
  `coimg` varchar(16) DEFAULT NULL,
  `reviewnum` int(11) NOT NULL DEFAULT '0',
  `datedir` varchar(20) NOT NULL,
  PRIMARY KEY (`pnid`),
  KEY `FK_Relationship_14` (`userid`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of phonenews
-- ----------------------------
INSERT INTO `phonenews` VALUES ('1', '4', '安卓ROM报道：9月10日，MIUI10稳定版开启升级推送，十二款机型可升级体验。\r\n\r\n9月10日，小米正式推送MIUI10稳定版升级，首批支持小米8SE、小米MIX2、小米MIX、小米6、小米6X、小米Note2、小米5、红米6Pro、红米6 和红米6A、红米Note5和红米S2等12款机型。这是继6月19日MIUI10开启开发版推送后，首次面向米粉推送稳定版系统更新，预示着将有更多的人体验到MIUI10系统AI智能带来的便捷和高效。更多miui 10稳定版资讯请关注安卓ROM获取!\r\n\r\n以下为官方公告：\r\n\r\n\r\nMIUI10 稳定版首批发布机型：\r\n\r\n\r\n小米手机6、红米Note 5、小米手机5、红米S2、小米Note 2、小米MIX、小米MIX 2、小米手机8 SE、红米6 Pro、小米手机6X、红米手机6、红米手机6A\r\n\r\n\r\n米粉们可前往设置->我的设备->MIUI版本中检测更新，通过在线升级方式更新到MIUI 10。\r\n\r\n\r\n因测试环节略有不同，目前小米手机8、小米MIX 2S等机型已经在内测阶段，也将在近期开放升级，我们将全力以赴，争取尽快全部发出!\r\n\r\n\r\nMIUI10 稳定版更新日志\r\n\r\n\r\n以“全面屏”为核心的全新设计\r\n\r\n\r\n全新的全面屏手势，属于全面屏时代的指尖操作\r\n\r\n全新的系统UI，以全面化视觉，与“全面屏”内外呼应\r\n\r\n(非全面屏用户，视觉升级同样一目了然)\r\n\r\n\r\n自然愉悦的声音体系\r\n\r\n\r\n自然且变化的系统音效，好听且有趣\r\n\r\n系统音效精简和通知过滤等策略，极大降低声音打扰\r\n\r\n内置自然白噪音，森林、海洋、夏夜、炉火、细雨，助您放松及入眠\r\n\r\n动态起床铃声，随天气和时间变化风格，并置入甜美人声播报\r\n\r\n\r\n强大好用的语音AI\r\n\r\n\r\n“小爱同学”和MIUI深度整合，一句话搞定手机复杂操作\r\n\r\n(功能在不同机型上支持程度或有差别)\r\n\r\n小爱训练计划，创建和分享你的独有技能\r\n\r\n探索性质的全语音驾车模式：语音收发微信、接拨电话、导航及点歌\r\n\r\n\r\nAI加持，比快更快\r\n\r\n\r\n系统跟手度大幅进步，典型场景操作更流畅\r\n\r\n\r\nIoT互联，更便捷，也更开放\r\n\r\n\r\n负一屏信息助手新增智能家居卡片，设备管理更加便捷\r\n\r\n靠近可连接设备时主动提醒，并最快一步连接\r\n\r\n小米IoT及旗下生态链品牌智能家电逐步接入中\r\n\r\n\r\n其他优化及调整\r\n\r\n\r\nAI单摄虚化，基于深度学习算法，为单摄手机提供提供媲美双摄的拍摄效果\r\n\r\n图片画质AI优化，为今日头条、朋友圈的低质量图片施加清晰魔法\r\n\r\n时钟、便签等系统工具的全新优化', '2018-12-08 22:44:04', 'miui 10稳定版 JY团队独家发布', 'newscoimg.png', '14', '1544280244038');
INSERT INTO `phonenews` VALUES ('2', '4', '    去年8月份，谷歌正式发布了Android 8.0，随后华为Mate 10系列在国内率先预装了基于Android 8.0的新版系统EMUI 8.0，随后华为Mate 9系列也获得了EMUI 8.0更新，而新品Nova 2s、荣耀9青春版也预装了EMUI 8.0系统。据悉，华为Mate 8、P9、P9 Plus、nova青春版、nova 2、nova 2 Plus、麦芒6、荣耀畅玩7X等机型都升级到了EMIUI 8.0系统。已经升级了emui8.0的你，手机续航手机反应速度，应用启动速度是不是有了很明显的改善了？开年大福利，奇兔刷机全网独家支持华为EMUI 8.0系列机型一键刷机。\r\n\r\n    目前奇兔刷机支持一键刷机华为EMUI 8.0机型：华为P10 、华为Mate9、华为P10Plus、华为Mate9Pro、华为Nova2s、华为荣耀V10、华为畅享7S、华为荣耀V9八款机型；另外会持续更新机型。想要体验EMUI8.0系统的机友不要忘记及时关注奇兔ROM市场，以便第一时间了解奇兔ROM市场更新最新动态。\r\n\r\nEMIUI 8.0打出了“因智慧而精彩”的理念，EMIUI 8.0系统七个精彩的智慧功能。\r\n\r\n一、AI智能识物\r\n\r\n二、手套模式\r\n\r\n有了手套模式，天寒地冻，带着手套也能玩手机。\r\n\r\n三、声控拍照\r\n\r\n有没有更方便的拍照操控方式，当然，EMIUI 8.0支持声控拍照，大声说“拍照”、“茄子”或“Cheese”就可以自动拍照。\r\n\r\n四、负一屏\r\n\r\n各种APP切换不停？EMIUI 8.0的负一屏可以帮到你。\r\n\r\n\"负一屏\"内首页的功能还可以根据你的使用习惯进行更改。\r\n\r\n五、智慧识屏\r\n\r\n在看新闻时，只需双指大面积按压文字，EMUI 8.0可基于上下文语义，从文字中生成关键词进行联网搜索，并弹出电影、酒店、景点、名人等服务卡片，快捷服务一步直达。\r\n\r\n六、稍后阅读\r\n\r\n正在看资讯被打断，没关系，EMIUI 8.0的稍后阅读可以帮到你。\r\n\r\n七、单手阅图\r\n\r\n浏览照片的时候经常会需要放大照片来观看细节地方。通常的方法是双指聚拢在屏幕然后划开。\r\n\r\n不过如果你一手在吃饭，手机又不能放饭桌上，请问该如何单手自如地放大缩小照片？\r\n\r\nEMIUI 8.0有个很特别的小细节可以帮到你：只需双击图片且第二次点击的时候不松开，然后不松开的手指再上下滑动屏幕，照片就会在你的单手操作下顺畅地放大缩小了。', '2018-12-10 15:40:51', '华为EMUI 8.0系列机型全网独家支持一键刷机 首发ROM', 'newscoimg.png', '6', '1544427651059');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `qtid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(30) NOT NULL,
  PRIMARY KEY (`qtid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '你小学学校是哪所');
INSERT INTO `question` VALUES ('2', '你最喜欢的宠物是什么');
INSERT INTO `question` VALUES ('3', '你最喜欢吃什么');
INSERT INTO `question` VALUES ('4', '你小时候的绰号是什么');
INSERT INTO `question` VALUES ('5', '你初恋是谁');
INSERT INTO `question` VALUES ('6', '你第一台电脑是什么品牌');
INSERT INTO `question` VALUES ('7', '你最喜欢的运动是什么');
INSERT INTO `question` VALUES ('8', '给你个愿望，你会做什么');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `replyid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `commentid` int(11) NOT NULL,
  `content` varchar(150) DEFAULT NULL,
  `replydate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replyid`),
  KEY `FK_Relationship_15` (`userid`),
  KEY `FK_Relationship_16` (`commentid`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`commentid`) REFERENCES `comment` (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `repid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `romid` int(11) NOT NULL,
  `repcontent` varchar(150) DEFAULT NULL,
  `repdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`repid`),
  KEY `FK_Relationship_25` (`userid`),
  KEY `FK_Relationship_26` (`romid`),
  CONSTRAINT `FK_Relationship_25` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_26` FOREIGN KEY (`romid`) REFERENCES `rom` (`romid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('18', '1', '25', 'youdianfeidian', '2018-12-30 22:04:14');
INSERT INTO `report` VALUES ('20', '1', '16', '很好，就是有点耗电，希望能优化一下', '2018-12-30 22:04:19');
INSERT INTO `report` VALUES ('21', '5', '20', 'adasdssad', '2019-01-12 15:43:27');
INSERT INTO `report` VALUES ('22', '7', '30', '有点耗电，其他都好', '2019-03-06 16:40:10');

-- ----------------------------
-- Table structure for rom
-- ----------------------------
DROP TABLE IF EXISTS `rom`;
CREATE TABLE `rom` (
  `romid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ROM_ID',
  `userid` int(11) NOT NULL COMMENT '开发者用户',
  `modelid` int(11) NOT NULL COMMENT '手机型号',
  `uiid` int(11) NOT NULL COMMENT 'UI类型',
  `download` int(11) NOT NULL DEFAULT '0' COMMENT 'ROM下载数量',
  `title` varchar(50) NOT NULL COMMENT 'ROM标题',
  `version` varchar(5) NOT NULL COMMENT 'ROM版本号',
  `anid` int(11) NOT NULL COMMENT '安卓版本',
  `romsize` varchar(6) NOT NULL COMMENT 'ROM大小',
  `romdesc` varchar(1024) NOT NULL COMMENT 'ROM介绍',
  `coimg` varchar(20) NOT NULL COMMENT '封面截图',
  `redate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布日期',
  `img1` varchar(20) NOT NULL COMMENT '锁屏截图',
  `img2` varchar(20) NOT NULL DEFAULT '' COMMENT '应用程序截图',
  `img3` varchar(20) NOT NULL COMMENT '关于手机截图',
  `img4` varchar(20) NOT NULL COMMENT '其他截图',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'ROM状态',
  `datedir` varchar(20) NOT NULL COMMENT '截图唯一目录',
  `scoreave` varchar(4) DEFAULT NULL COMMENT 'ROM评分',
  `upfailreason` varchar(128) DEFAULT NULL COMMENT '上架不通过原因',
  `downreason` varchar(128) DEFAULT NULL COMMENT '下架原因',
  `downfailreason` varchar(128) DEFAULT NULL COMMENT '下架不通过原因',
  PRIMARY KEY (`romid`),
  KEY `FK_Relationship_2` (`userid`),
  KEY `FK_Relationship_3` (`modelid`),
  KEY `FK_Relationship_4` (`uiid`),
  KEY `FK_Relationship_17` (`anid`),
  CONSTRAINT `FK_Relationship_17` FOREIGN KEY (`anid`) REFERENCES `android` (`anid`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`modelid`) REFERENCES `model` (`modelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`uiid`) REFERENCES `uitype` (`uiid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of rom
-- ----------------------------
INSERT INTO `rom` VALUES ('9', '1', '8', '7', '0', '金立F103BFlyme5适度精简添加ROOT流畅省电', '1.0.0', '17', '850', '我很快', 'cover.jpg', '2019-02-21 19:11:38', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542790744587', '8.5', null, null, null);
INSERT INTO `rom` VALUES ('10', '1', '8', '10', '1', '金立F103BVIBEUI3.0适度精简添加ROOT流畅省电', '1.0.0', '15', '790', '我不耗电', 'cover.jpg', '2018-11-21 17:01:09', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '-3', '1542790869033', '8.0', '请上传对应的机型截图', null, null);
INSERT INTO `rom` VALUES ('11', '1', '8', '5', '0', '金立F103BFlyme7适度精简添加ROOT流畅省电', '1.0.0', '15', '932', '我能时刻保持冷静', 'cover.jpg', '2019-02-21 19:13:38', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542791819709', null, null, null, null);
INSERT INTO `rom` VALUES ('12', '1', '8', '5', '1', '金立F103BFlyme7安卓6.0_适度精简', '1.0.0', '17', '954', '我有黑科技啊啊啊啊啊啊', 'cover.jpg', '2018-12-25 00:25:16', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542792587158', '8.0', null, null, null);
INSERT INTO `rom` VALUES ('13', '1', '2', '1', '6', '乐檬K3Note MIUI10最新开发版适度精简稳定流畅', '1.0.0', '17', '863', '就是好用', 'cover.jpg', '2018-12-26 11:43:56', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542792664099', '10.0', null, null, null);
INSERT INTO `rom` VALUES ('14', '1', '2', '7', '1', '乐檬K3Note Flyme5最新开发版适度精简稳定流畅', '1.0.0', '17', '834', '就是好用', 'cover.jpg', '2019-02-21 19:13:41', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542793071545', '9.0', null, null, null);
INSERT INTO `rom` VALUES ('16', '1', '4', '14', '0', 'vivo-x3sw 360OS', '1.0.0', '15', '863', 'vdvfxfs', 'cover.jpg', '2018-11-24 00:16:20', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542989780747', null, '', null, null);
INSERT INTO `rom` VALUES ('17', '1', '4', '5', '0', 'vivo-x3swBFlyme7适度精简添加ROOT流畅省电', '1.0.0', '15', '900', 'axascas', 'cover.jpg', '2018-11-24 00:23:18', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542990198784', null, '', null, null);
INSERT INTO `rom` VALUES ('18', '1', '5', '7', '1', 'honor-bandal10Flyme5适度精简添加ROOT流畅省电', '1.0.0', '15', '900', 'dfsdad', 'cover.jpg', '2018-11-24 00:28:18', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542990498049', '8.0', '', null, null);
INSERT INTO `rom` VALUES ('19', '1', '1', '14', '1', '小米8360OS最新开发版适度精简稳定流畅', '1.0.0', '15', '920', 'aSAASCSDC', 'cover.jpg', '2019-02-21 19:13:44', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542990867102', '8.5', null, null, null);
INSERT INTO `rom` VALUES ('20', '1', '1', '5', '2', '小米8Flyme7最新开发版适度精简稳定流畅', '1.0.0', '15', '890', 'sacasdcds', 'cover.jpg', '2018-12-24 23:56:31', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542991209210', null, null, null, null);
INSERT INTO `rom` VALUES ('21', '1', '2', '10', '1', '乐檬K3Note VIBEUI最新开发版适度精简稳定流畅', '1.0.0', '15', '863', 'ECASXASAS', 'cover.jpg', '2018-11-24 00:47:22', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1542991642793', null, '', null, null);
INSERT INTO `rom` VALUES ('22', '1', '16', '5', '1', '魅族m2Flyme7适度精简添加ROOT流畅省电', '1.0.0', '15', '920', 'asdasdasd', 'cover.jpg', '2018-12-04 15:57:50', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1543910270910', '8.0', '', null, null);
INSERT INTO `rom` VALUES ('23', '1', '16', '5', '0', '魅族魅蓝2公开版_Flyme7 夜间模式可用', '1.0.0', '15', '1024', 'ROM版本介绍一键刷机教程\r\n【卡刷包刷机教程：】\r\n1.解锁bl并刷入相应的第三方 Reovery\r\n2.把刷机包复制到内置 SD 卡中刷机即可\r\n3.刷机前最好双清再刷，避免产生不必要的BUGROM介绍基于上一版本修复夜间模式\r\n基于上一版添加re管理器\r\n基于上一版添加icebox（可用于主题任用，方法：进主题商店试用一个喜欢的主题或字体等，然后到icebox里把主题商店冻结了就可以了）\r\n基于上一版保留自带的语音助手、浏览器、游戏中心\r\n基于上一版添加七颜手电筒（简洁功能强大）经测试，相机、外放、听筒、蓝牙、wifi、基带、信号、数据、视频、内外存储、传感器等功能正常已知BUG\r\n状态兰手电不行（第三方可以）\r\n手势不行，移植都这样，没法修\r\n自带相机美颜拍照会卡死，移植都这样，没法修其他待测移植很难完美，要求高可以不刷，但请别喷', 'cover.jpg', '2018-12-10 16:34:27', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1544430867169', null, '', null, null);
INSERT INTO `rom` VALUES ('24', '1', '18', '16', '0', '魅蓝note2 Funtouchos2.5 2017-03-12最新版', '1.0.0', '13', '861', 'ROM版本介绍一键刷机教程\r\n个人更新\r\n1.破解双4G\r\n2.添加ROOT权限\r\n3.修复相机，1300W像素\r\n4.修复呼吸灯\r\n5.修复部分应用闪退\r\n6.自带长截屏、趣味截屏、单手模式和屏幕录制等有趣功能\r\n7.由于修改机型会导致主题无法应用，所以没修改\r\n8.修复上一版本兼容性不好，省电管家不可用等问题\r\n长按home或者轻触返回上滑调出多任务\r\n温馨提示：\r\n请双清再刷入，然后刷补丁包\r\n长按Home或者轻触返回向上滑均可调出后台\r\n电源键加Home键快速截屏', 'cover.jpg', '2018-12-10 16:43:22', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1544431402005', null, '', null, null);
INSERT INTO `rom` VALUES ('25', '1', '6', '5', '0', '乐视MaX2 Flyme7', '1.0.0', '15', '855', 'asassaascas', 'cover.jpg', '2019-02-21 19:13:47', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '-1', '1545213500777', null, null, null, null);
INSERT INTO `rom` VALUES ('26', '1', '17', '5', '1', '一加3（A3000） Flyme7适度精简', '1.0.0', '21', '963', '系统流畅，界面美观', 'cover.jpg', '2019-01-04 16:50:17', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1545275128723', null, null, null, null);
INSERT INTO `rom` VALUES ('28', '1', '15', '14', '0', '金立F103B_360OS3.0_安卓6.0_适度精简', '1.0.0', '17', '855', 'AXASAS', 'cover.jpg', '2018-12-25 02:19:27', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1545675567699', null, null, null, null);
INSERT INTO `rom` VALUES ('29', '1', '14', '1', '0', 'lenovo-k3 MIUI10_安卓6.0', '1.0.0', '17', '855', 'SADSAA', 'cover.jpg', '2018-12-25 12:46:34', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1545713194024', null, null, null, null);
INSERT INTO `rom` VALUES ('30', '1', '1', '1', '3', '小米8 MIUI10', '1.0.0', '22', '963', 'acsacascasca', 'cover.jpg', '2018-12-28 15:25:25', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1545921336046', null, null, null, null);
INSERT INTO `rom` VALUES ('31', '1', '6', '1', '0', '乐视MaX2 MIUI10', '1.0.0', '19', '954', 'WQDASDASA', 'cover.jpg', '2019-01-02 12:24:47', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1546403087286', null, null, null, null);
INSERT INTO `rom` VALUES ('32', '5', '14', '3', '0', 'lenovo-k3 MIUI8 适度精简', '1.0.0', '18', '855', 'hahahaa', 'cover.jpg', '2019-02-18 02:11:37', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1547269481371', null, null, null, null);
INSERT INTO `rom` VALUES ('33', '5', '3', '5', '1', 'oppo r11_Flyme7适度精简', '1.0.0', '15', '956', 'dccascsacas', 'cover.jpg', '2019-02-18 01:25:22', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1550424286370', '8.0', null, null, null);
INSERT INTO `rom` VALUES ('35', '5', '12', '5', '0', 'letv-x600 Flyme7安卓6.0_适度精简', '1.0.0', '17', '985', 'csaccascasc', 'cover.jpg', '2019-02-18 02:29:23', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '-1', '1550428143437', null, null, null, null);
INSERT INTO `rom` VALUES ('36', '1', '9', '1', '0', '小米6 MIUI10适度精简ROOT', '1.0.0', '19', '862', '就是好用', 'cover.jpg', '2019-02-28 00:26:30', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '-3', '1551284790778', null, '请上传正确的截图', null, null);
INSERT INTO `rom` VALUES ('37', '1', '2', '5', '1', 'lenovo-k3note Flyme7安卓6.0_适度精简', '1.0.0', '17', '855', 'ascsacsaca', 'cover.jpg', '2019-03-01 02:11:51', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1551377492043', null, null, null, null);
INSERT INTO `rom` VALUES ('38', '7', '19', '7', '1', '金立F103BFlyme5安卓6.0_适度精简5', '1.0.0', '15', '963', 'axscszcsz\r\nggdgdgfdgfdg\r\nfgbdfgnfgn', 'cover.jpg', '2019-03-06 03:08:17', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '1', '1551812158545', null, null, null, null);
INSERT INTO `rom` VALUES ('39', '5', '18', '14', '0', '魅蓝note2 360OS3.0_安卓6.0', '1.0.0', '17', '963', '按上次的事擦撒', 'cover.jpg', '2019-03-07 22:20:41', 'lockscreen.jpg', 'application.jpg', 'aboutphone.jpg', 'others.jpg', '0', '1551968440806', null, null, null, null);

-- ----------------------------
-- Table structure for romscore
-- ----------------------------
DROP TABLE IF EXISTS `romscore`;
CREATE TABLE `romscore` (
  `rsid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `romid` int(11) NOT NULL,
  `romscore` int(11) DEFAULT NULL,
  `dstatus` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rsid`),
  KEY `FK_Relationship_10` (`userid`),
  KEY `FK_Relationship_11` (`romid`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`romid`) REFERENCES `rom` (`romid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of romscore
-- ----------------------------
INSERT INTO `romscore` VALUES ('28', '2', '9', '9', '1');
INSERT INTO `romscore` VALUES ('30', '2', '13', '10', '1');
INSERT INTO `romscore` VALUES ('31', '2', '19', '9', '1');
INSERT INTO `romscore` VALUES ('32', '1', '19', '8', '1');
INSERT INTO `romscore` VALUES ('33', '1', '14', '10', '1');
INSERT INTO `romscore` VALUES ('34', '1', '9', '8', '1');
INSERT INTO `romscore` VALUES ('35', '1', '18', '8', '1');
INSERT INTO `romscore` VALUES ('36', '1', '10', '8', '1');
INSERT INTO `romscore` VALUES ('37', '1', '11', '8', '1');
INSERT INTO `romscore` VALUES ('38', '1', '12', '8', '1');
INSERT INTO `romscore` VALUES ('39', '1', '22', '8', '1');
INSERT INTO `romscore` VALUES ('40', '5', '20', null, '1');
INSERT INTO `romscore` VALUES ('41', '1', '20', null, '1');
INSERT INTO `romscore` VALUES ('42', '1', '13', null, '1');
INSERT INTO `romscore` VALUES ('43', '2', '33', '8', '1');
INSERT INTO `romscore` VALUES ('44', '7', '13', null, '1');
INSERT INTO `romscore` VALUES ('45', '7', '14', '8', '1');
INSERT INTO `romscore` VALUES ('46', '7', '30', null, '1');
INSERT INTO `romscore` VALUES ('47', '7', '21', null, '1');
INSERT INTO `romscore` VALUES ('48', '7', '37', null, '1');
INSERT INTO `romscore` VALUES ('49', '7', '19', null, '1');
INSERT INTO `romscore` VALUES ('50', '7', '26', null, '1');
INSERT INTO `romscore` VALUES ('51', '5', '38', null, '1');

-- ----------------------------
-- Table structure for uitype
-- ----------------------------
DROP TABLE IF EXISTS `uitype`;
CREATE TABLE `uitype` (
  `uiid` int(11) NOT NULL AUTO_INCREMENT,
  `uitype` varchar(20) NOT NULL,
  `uimg` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`uiid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of uitype
-- ----------------------------
INSERT INTO `uitype` VALUES ('1', 'miui10', 'miui10.png');
INSERT INTO `uitype` VALUES ('2', 'miui9', 'miui9.png');
INSERT INTO `uitype` VALUES ('3', 'miui8', 'miui8.png');
INSERT INTO `uitype` VALUES ('4', 'miui7', 'miui7.png');
INSERT INTO `uitype` VALUES ('5', 'flyme7', 'flyme7.png');
INSERT INTO `uitype` VALUES ('6', 'flyme6', 'flyme6.png');
INSERT INTO `uitype` VALUES ('7', 'flyme5', 'flyme5.png');
INSERT INTO `uitype` VALUES ('8', 'lewaos6', 'lewaos6.jpg');
INSERT INTO `uitype` VALUES ('9', 'mokee', 'mokee.png');
INSERT INTO `uitype` VALUES ('10', 'vibeui', 'vibeui.png');
INSERT INTO `uitype` VALUES ('11', 'yunos', 'yunos.png');
INSERT INTO `uitype` VALUES ('12', 'smartisanos', 'smartisanos.png');
INSERT INTO `uitype` VALUES ('13', 'iunios3', 'iunios3.png');
INSERT INTO `uitype` VALUES ('14', '360os', '360os.png');
INSERT INTO `uitype` VALUES ('15', 'emui', null);
INSERT INTO `uitype` VALUES ('16', 'funtouchos', null);
INSERT INTO `uitype` VALUES ('25', '其他', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `qtid` int(11) NOT NULL,
  `uname` varchar(10) NOT NULL,
  `uaccount` varchar(12) NOT NULL,
  `password` varchar(32) NOT NULL,
  `ptype` varchar(10) NOT NULL,
  `userimg` varchar(16) DEFAULT NULL,
  `registerdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `realname` varchar(6) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `qq` varchar(12) DEFAULT NULL,
  `answer` varchar(20) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `sign` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `FK_Relationship_7` (`qtid`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`qtid`) REFERENCES `question` (`qtid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2', '帅炸了', '824314051', '900F4B08F05A70D72B3788EE332A482C', 'developer', '帅帅帅帅帅帅帅帅帅帅.gif', '2018-10-17 23:40:27', '张三', '12345678910', '广东东莞', '54415636247', '猫', '男', '哎呀妈呀脑瓜疼');
INSERT INTO `user` VALUES ('2', '3', '宇宙无敌超级帅', '2102036809', '900F4B08F05A70D72B3788EE332A482C', 'user', '宇宙无敌超级帅.jpg', '2018-10-18 01:46:52', '小红', '78522245277', '广东东莞', '42725245535', '饭', '女', '哎呀妈呀脑瓜疼');
INSERT INTO `user` VALUES ('3', '3', 'jy122130', '2222', '900F4B08F05A70D72B3788EE332A482C', 'user', 'user.jpg', '2018-11-20 12:21:30', '小欣', '123654789', '广东东莞', '544156360', '饭', '女', null);
INSERT INTO `user` VALUES ('4', '3', '管理员先生', 'admin123456', 'A66ABB5684C45962D887564F08346E8D', 'admin', 'admin.jpg', '2018-11-22 19:57:44', null, null, null, null, '饭', '男', null);
INSERT INTO `user` VALUES ('5', '3', 'jy221928', 'juenfy', '900F4B08F05A70D72B3788EE332A482C', 'developer', 'user2.jpg', '2019-03-07 22:19:28', null, null, null, null, '饭', null, null);
INSERT INTO `user` VALUES ('6', '2', 'jy23743', 'user123456', '900F4B08F05A70D72B3788EE332A482C', 'user', 'user.jpg', '2019-01-10 02:37:43', null, null, null, null, '猫', null, null);
INSERT INTO `user` VALUES ('7', '2', '学习使我快乐', 'developer3', '900F4B08F05A70D72B3788EE332A482C', 'developer', '学习使我快乐.jpg', '2019-01-11 23:18:16', null, null, null, null, '猫', null, null);
INSERT INTO `user` VALUES ('8', '2', 'jy18573', 'user111', '900F4B08F05A70D72B3788EE332A482C', 'user', 'user.jpg', '2019-02-17 18:57:03', null, null, null, null, '猫', null, null);
INSERT INTO `user` VALUES ('9', '3', 'jy23217', 'test', '900F4B08F05A70D72B3788EE332A482C', 'user', 'user.jpg', '2019-03-01 02:32:17', '', '', '', '', '饭', '男', null);
INSERT INTO `user` VALUES ('10', '2', 'jy131', 'test2', '900F4B08F05A70D72B3788EE332A482C', 'user', 'user2.jpg', '2019-03-02 13:13:47', null, null, null, null, '猫', null, null);
INSERT INTO `user` VALUES ('11', '3', 'jy2289', 'user10', '900F4B08F05A70D72B3788EE332A482C', 'user', 'user0.jpg', '2019-03-06 02:28:09', null, null, null, null, '饭', null, null);
