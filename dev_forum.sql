-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: dev_forum
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(45) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `ARTICLE` varchar(2000) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `UPLOAD_DATA` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Aaron','Note7自燃 三星：電池瑕疵','【生活中心╱首爾—台北報導】去年全球發生40多起三星Note7手機自燃事件，全球回收250萬支，估三星電子因此損失逾千億元台幣。三星動員700人，測試20萬支Note7和3萬顆電池後，昨在韓國首爾三星城召開全球直播記者會，證實因設計不良和製程瑕疵，前後使用的SDI和ATL電池皆因短路自燃。','2016-10-30 18:35:12',1,NULL),(3,'Aaron','邊充電邊抓寶 易過熱','三星Note7去年連環爆事件震驚全球，官方昨天公布手機自燃原因，並宣布實施多項改善措施。台灣三星為展現誠意，去年12月起啟動產品健檢，意外發現台灣用戶最常見的幾個高風險「不當使用行為」，恐易使手機電池過熱、甚至短路導致起火。','2016-11-01 18:35:12',1,NULL),(4,'Aaron','【公庫】春節依法休假竟要被記曠職？ 「他們」按鈴告鐵路局長鹿潔身強制勞動','本週五（1/27）就是除夕，台灣鐵路產業工會為改善台鐵員工長期過勞、缺乏人力的問題，發起春節依法休假行動，未料交通部臺灣鐵路管理局以記曠職、影響考績來禁止員工在春節期間請假。台鐵產工會認為鐵路局已違法，今（1/24）天上午前往臺北地方法院檢察署告發鐵路局長鹿潔身，同時呼籲鐵路局不要打壓員工，盡快解決工時過長、人力不足以及無完整歷日休息的問題。','2016-11-02 18:35:12',1,NULL),(5,'Aaron','桃機啟用照護床 身障旅客出國更便利','桃園國際機場首見國內提供脊髓損傷無障礙照護床正式啟用，為了提供旅客更完善的服務，桃園機場在春節即將到來前，設置完成供脊髓損傷與行動不便或高齡旅客使用的折疊式照護床，該設置分別於第一航廈2樓北邊入境長廊A5無障礙洗手間內，以及第2航廈1樓入境大廳南側無障礙洗手間內，針對無障礙旅客服務更上一層樓。','2016-11-03 18:35:12',1,NULL),(6,'Babbs','中信春訓超緊湊　總教練史耐德仍在觀察球員','中信兄弟新任總教練史耐德開訓至今與球員相處已近一周，雙方仍在適應磨合期，他說：「目前進度算不錯，我也很享受其中過程，現在就是利用這段時間去看選手場上與場下的表現與能力，還沒有對誰有特別印象。」','2016-11-04 18:35:12',2,NULL),(7,'Babbs','【壹週刊】曾欠債八百萬　他是怎麼走出來的？','農曆年已近，小孩暢過年，大人苦無錢，民間總說欠錢不能欠過年，但一般人只要踩錯一步，容易陷入難以挽回的絕境。其實，《消費者債務清理條例》早已上路，沉重的社會角落還是有一絲光線照入，債務是能夠解決的。還完債了，能夠好好地重新做人。','2016-11-05 18:35:12',2,NULL),(8,'Babbs','「存這麼少！」　2童存28K被郵局員工羞辱','對家長來說，帶著孩子去存錢，金額不是重點，而是過程，培養孩子存錢的觀念。新竹一名媽媽帶著2個孩子去郵局存錢，沒想到郵局員工卻說「存這麼少」，傷透了孩子的心。','2016-11-06 18:35:12',2,NULL),(9,'Babbs','【郭董你被川普點名片】富士康變他眼中的模範生','美國總統川普周一再次會見美國企業領袖，宣傳回美國製造，開場不久就向特斯拉執行長馬斯克（Elon Musk，影片中川普右邊第2位），以及戴爾創辦人麥可戴爾（Michael Dell，影片中川普左邊第2位）等企業老闆表示，富士康將砸鉅資在美國蓋1座大型工廠，可能還不只1座，富士康赴美投資，顯然成了川普的宣傳樣本。','2016-11-07 18:35:12',2,NULL),(30,'Babbs','bbb','bbb',NULL,2,NULL),(52,'Babbs',NULL,NULL,'2017-02-02 17:45:00',2,NULL),(55,'Aaron','test','test','2017-02-02 18:06:14',1,'C:\\Users\\yesee\\superViewToSubView.java'),(56,'Calvin','uploadFileTest','','2017-02-02 18:19:26',3,'C:\\Users\\yesee\\StandardCodeStyle.java'),(57,'Calvin','test','test','2017-02-02 18:23:54',3,'C:\\Users\\yesee\\superViewToSubView.java'),(58,'Calvin','test','test','2017-02-02 18:34:01',3,'C:\\Users\\yesee\\firefox.exe'),(59,'Aaron','test','test','2017-02-02 18:47:50',1,'C:\\Users\\yesee\\chrome.exe');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMMENT` varchar(500) DEFAULT NULL,
  `ARTICLE_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'太棒了!!沒人買三星',1,3,'2016-11-08 18:35:12'),(2,'改買apple',1,3,'2016-11-09 18:35:12'),(3,'三星虧到爆',1,2,'2016-11-10 18:35:12'),(4,'謝謝大大的分享。',3,3,'2016-11-11 18:35:12'),(5,'還有人要抓寶??',3,3,'2016-11-12 18:35:12'),(6,'早就不想抓了',3,1,'2016-11-13 18:35:12'),(11,'test',30,2,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `USER_NAME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `ADMIN` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'aaa','aaaaa','Aaron','aaa@yesee.com.tw','2016-10-27 15:04:26','Y'),(2,'bbb','bbbbb','Babbs','bbb@yesee.com.tw','2016-10-30 15:04:26','N'),(3,'ccc','ccccc','Calvin','ccc@yesee.com.tw','2016-12-22 15:04:26','N');
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

-- Dump completed on 2017-02-07 19:03:42
