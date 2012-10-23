-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2012 at 06:03 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hackmedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblactivities`
--

CREATE TABLE IF NOT EXISTS `tblactivities` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Activity ID',
  `from` int(11) NOT NULL COMMENT 'From ID',
  `to` int(11) NOT NULL COMMENT 'To ID',
  `amount` int(11) NOT NULL COMMENT 'Amount (Money)',
  `dateTime` datetime NOT NULL COMMENT 'Date And Time OF The Activity',
  `comment` text COMMENT 'Activity Comment',
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Activities Table - Purchase / Wire Transfers' AUTO_INCREMENT=37 ;

--
-- Dumping data for table `tblactivities`
--

INSERT INTO `tblactivities` (`id`, `from`, `to`, `amount`, `dateTime`, `comment`) VALUES
(1, 3, 11, 200, '2012-10-09 06:31:39', NULL),
(2, 10, 4, 300, '2012-09-04 08:34:39', NULL),
(3, 11, 3, 200, '2012-10-16 11:38:27', NULL),
(22, 4, 6, 1, '2012-10-18 06:34:49', NULL),
(23, 4, 9, 1, '2012-10-18 06:53:00', NULL),
(24, 9, 4, 325, '2012-10-18 06:55:51', NULL),
(25, 9, 4, 325, '2012-10-18 06:55:52', NULL),
(26, 9, 4, 325, '2012-10-18 06:55:52', NULL),
(27, 9, 4, 325, '2012-10-18 06:55:53', NULL),
(28, 9, 4, 325, '2012-10-18 06:55:53', NULL),
(29, 9, 4, 325, '2012-10-18 06:55:54', 'WTF WTF WTF IS THIS?'),
(30, 4, 3, 1, '2012-10-18 08:01:13', 'Please Look At My Profile.'),
(31, 6, 3, 1, '2012-10-18 08:01:31', '<script>\r\nalert("I Hacked Your Account With XSS Attack");\r\n</script>\r\nHello Man ;)'),
(32, 3, 4, 325, '2012-10-19 18:20:11', 'Bank Activities'),
(33, 3, 4, 325, '2012-10-19 18:20:33', 'Bank Activities'),
(34, 3, 4, 325, '2012-10-19 18:20:41', 'Bank Activities'),
(35, 3, 4, 325, '2012-10-19 18:20:58', 'Bank Activities'),
(36, 3, 4, 325, '2012-10-19 18:31:46', 'Bank Activities');

-- --------------------------------------------------------

--
-- Table structure for table `tblcities`
--

CREATE TABLE IF NOT EXISTS `tblcities` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'City ID',
  `name` varchar(30) NOT NULL COMMENT 'City Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cities Table' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tblcities`
--

INSERT INTO `tblcities` (`id`, `name`) VALUES
(8, 'AULDEARN'),
(2, 'GREATHAM'),
(3, 'HALISTRA'),
(6, 'KIRRIEMUIR'),
(11, 'LONDON'),
(10, 'MADELEY'),
(12, 'MANCHESTER'),
(4, 'OVERCOMBE'),
(7, 'STREETLY'),
(5, 'WESTMILL'),
(1, 'WISTANSWICK'),
(9, 'WRAXALL');

-- --------------------------------------------------------

--
-- Table structure for table `tblcreditcards`
--

CREATE TABLE IF NOT EXISTS `tblcreditcards` (
  `bankID` int(11) NOT NULL COMMENT 'Bank Identity Number',
  `cardID` tinyint(4) NOT NULL COMMENT 'Card ID',
  `cardNumber` varchar(16) NOT NULL COMMENT 'CardNumber',
  `expires` date NOT NULL COMMENT 'Expiration Date',
  `securityCode` smallint(3) NOT NULL COMMENT 'Card Security Code',
  UNIQUE KEY `cardNumber` (`cardNumber`),
  KEY `bankID` (`bankID`),
  KEY `cardID` (`cardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Credit Cards Table';

--
-- Dumping data for table `tblcreditcards`
--

INSERT INTO `tblcreditcards` (`bankID`, `cardID`, `cardNumber`, `expires`, `securityCode`) VALUES
(11, 2, '4532593351978997', '2015-09-01', 258),
(4, 2, '491669530035580', '2015-04-01', 76),
(5, 2, '4929300005859602', '2016-12-01', 778),
(10, 1, '5100611175814765', '2016-06-01', 190),
(12, 1, '5161119300892686', '2015-01-01', 735),
(7, 1, '5429687965003649', '2015-11-01', 955),
(3, 1, '5430976730197472', '2015-06-01', 753),
(6, 1, '5537543009062415', '2017-09-01', 147),
(9, 1, '5545780166550101', '2017-12-01', 99),
(8, 1, '5589245285450192', '2013-04-01', 53);

-- --------------------------------------------------------

--
-- Table structure for table `tblcreditcardstype`
--

CREATE TABLE IF NOT EXISTS `tblcreditcardstype` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'Credit Card ID',
  `name` varchar(30) NOT NULL COMMENT 'Credit Card Type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Credit Cards Types Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tblcreditcardstype`
--

INSERT INTO `tblcreditcardstype` (`id`, `name`) VALUES
(1, 'Master Card'),
(2, 'Visa'),
(3, 'American Express'),
(4, 'Diners'),
(5, 'Isracard');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE IF NOT EXISTS `tblusers` (
  `bankID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Bank Identity Number',
  `nino` varchar(9) NOT NULL COMMENT 'National Insurance Numbers',
  `firstName` varchar(30) NOT NULL COMMENT 'First Name',
  `lastName` varchar(30) NOT NULL COMMENT 'Last Name',
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Gender (1 = Male, 0 = Female)',
  `address` varchar(35) NOT NULL COMMENT 'Street Address',
  `city` smallint(6) NOT NULL COMMENT 'City',
  `passcode` varchar(7) DEFAULT NULL COMMENT 'Passcode',
  `phone` bigint(11) NOT NULL COMMENT 'Phone Number',
  `birthday` date NOT NULL COMMENT 'BirthDay Date',
  `occupation` varchar(40) DEFAULT NULL COMMENT 'Occupation',
  `username` varchar(30) NOT NULL COMMENT 'User Name',
  `password` varchar(32) NOT NULL COMMENT 'Password',
  `email` varchar(100) NOT NULL COMMENT 'Email Address',
  `pictureURL` varchar(150) DEFAULT 'images/profiles/nopic.png' COMMENT 'Picture URL',
  PRIMARY KEY (`bankID`),
  UNIQUE KEY `nino` (`nino`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `city` (`city`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='User Details Table' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`bankID`, `nino`, `firstName`, `lastName`, `gender`, `address`, `city`, `passcode`, `phone`, `birthday`, `occupation`, `username`, `password`, `email`, `pictureURL`) VALUES
(3, 'GJ352274C', 'Aaron', 'Howell', 1, '69 Temple Way', 8, 'TF97DW', 7956686747, '1935-10-02', 'Jeweler', 'Gainnoo1935', '4c22bbbe1ac409c7def582ed39489086', 'AaronHowell@teleworm.us', 'images/profiles/sil-male.png'),
(4, 'ZJ970015', 'Sofia', 'Morton', 0, '34 Walden Road', 2, 'RH203NN', 7919699732, '1965-01-27', 'Loan interviewer', 'Thomene', '7592e99453393cbebf92a967bb299abf', 'SofiaMorton@teleworm.us', 'pages/transference-wire.jsp?to=4&amount=325&comment=Bank Activities&send=send'),
(5, 'SR628780C', 'Peter', 'Hunter', 1, '27 Fordham Rd', 3, 'IV553DG', 7074780680, '1930-04-01', 'Billing and posting clerk', 'Gond1930', '01f95bf73ffddee60db468332445b05c', 'PeterHunter@teleworm.us', 'images/profiles/sil-male.png'),
(6, 'EW506660A', 'Corey', 'Nicholls', 1, '19 York Road', 4, 'DT33WA', 7023992014, '1960-09-29', 'Ophthalmic medical assistant', 'Alcour', '9c6c6533c3e58c2bb77fdbf5f1833a6f', 'CoreyNicholls@teleworm.us', 'images/profiles/sil-male.png'),
(7, 'JN632558', 'Chelsea', 'Hancock', 0, '17 Bouverie Road', 5, 'SG90RN', 7700950884, '1935-11-24', 'Mathematician', 'Rater1935', '01142620345763ad08950d8bb89c8975', 'ChelseaHancock@dayrep.com', 'images/profiles/sil-female.png'),
(8, 'SR446112B', 'Alexander', 'Bolton', 1, '45 Witney Way', 6, 'DD88PF', 7081145205, '1929-04-25', 'Pediatrician', 'Forepainely', '1ece31f17227e95c47edb1a75148114a', 'AlexanderBolton@teleworm.us', 'images/profiles/sil-male.png'),
(9, 'YC594700', 'Adam', 'Rose', 1, '10 Berkeley Rd', 7, 'B746GB', 7006479241, '1974-11-15', 'Airport terminal controller', 'Housee', 'ab69e1cf15c9c6f1d8ea15b2e9bdcc07', 'AdamRose@teleworm.us', 'images/profiles/sil-male.png'),
(10, 'CR661660C', 'Joshua', 'Dodd', 1, '94 Leicester Road', 8, 'IV124GF', 7955532329, '1963-07-01', 'Route driver', 'Hiself', 'a9d22fa808974a43989c157a5a99e27e', 'JoshuaDodd@teleworm.us', 'images/profiles/sil-male.png'),
(11, 'MP711069', 'Charles', 'Pearson', 1, '37 Oxford Rd', 9, 'BS198TZ', 7028749417, '1964-07-04', 'Cooling and freezing equipment tender', 'Hiseespeark', 'cdafd468a0b4775eeaaaa2f6e83f627f', 'CharlesPearson@dayrep.com', 'images/profiles/sil-male.png'),
(12, 'YL555515D', 'Grace', 'Turner', 0, '43 South Crescent', 10, 'TF79DA', 7041151289, '1928-12-15', 'Construction inspector', 'Veragiclumad', '7b0d1f32c32f9489705b373e724f3f82', 'GraceTurner@teleworm.us', 'images/profiles/sil-female.png');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblactivities`
--
ALTER TABLE `tblactivities`
  ADD CONSTRAINT `tblactivities_ibfk_1` FOREIGN KEY (`from`) REFERENCES `tblusers` (`bankID`),
  ADD CONSTRAINT `tblactivities_ibfk_2` FOREIGN KEY (`to`) REFERENCES `tblusers` (`bankID`);

--
-- Constraints for table `tblcreditcards`
--
ALTER TABLE `tblcreditcards`
  ADD CONSTRAINT `tblcreditcards_ibfk_1` FOREIGN KEY (`bankID`) REFERENCES `tblusers` (`bankID`),
  ADD CONSTRAINT `tblcreditcards_ibfk_2` FOREIGN KEY (`cardID`) REFERENCES `tblcreditcardstype` (`id`);

--
-- Constraints for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD CONSTRAINT `tblusers_ibfk_1` FOREIGN KEY (`city`) REFERENCES `tblcities` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
