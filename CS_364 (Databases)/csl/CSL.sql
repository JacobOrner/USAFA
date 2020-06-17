-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2011 at 07:31 AM
-- Server version: 5.1.54
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csl`
--

CREATE DATABASE csl DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;

USE `csl`;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE IF NOT EXISTS `partners` (
  `partnerId` int(11) NOT NULL AUTO_INCREMENT,
  `partnerName` varchar(50) NOT NULL,
  `partnerLocation` varchar(50) NOT NULL,
  `partnerPhone` char(12) NOT NULL,
  PRIMARY KEY (`partnerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`partnerId`, `partnerName`, `partnerLocation`, `partnerPhone`) VALUES
(1, 'Habitat for Humanity', '2105 E. Bijou, Ste B, Colo Springs, CO 80909', '719-475-7800'),
(2, 'Salvation Army Soup Kitchen', '908 Yuma Street, Colo Springs, CO 80909-5045', '719-502-5290'),
(3, 'Big Brothers/Big Sisters', '111 S. Tejon, Ste 302, Colo Springs, CO 80903', '719-633-2443'),
(4, 'Keep Colorado Beautiful, Inc', '322 N. Tejon St, Ste 207, Colo Springs, CO 80903', '719-577-9111');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `userPassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `users`
--
-- NOTE: passwords are all set to '1234' and then hashed with MD5
--

INSERT INTO `users` (`userId`, `userName`, `userPassword`) VALUES
(6, 'Albert Einstein', '81dc9bdb52d04dc20036dbd8313ed055'),
(7, 'John Jacob Jinkle Heimer Smith', '81dc9bdb52d04dc20036dbd8313ed055'),
(8, 'Steve', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE IF NOT EXISTS `volunteers` (
  `volId` int(11) NOT NULL AUTO_INCREMENT,
  `volFirstName` varchar(50) NOT NULL,
  `volLastName` varchar(50) NOT NULL,
  `volEmailAddr` varchar(50) NOT NULL,
  `volAge` int(11) NOT NULL,
  `volGender` char(1) NOT NULL,
  `volCarAccess` char(1) DEFAULT NULL,
  PRIMARY KEY (`volId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`volId`, `volFirstName`, `volLastName`, `volEmailAddr`, `volAge`, `volGender`, `volCarAccess`) VALUES
(1, 'Steve', 'Hadfield', 'Steve@Hadfield_family.net', 21, 'm', 'Y'),
(2, 'Marissa', 'Hadfield', 'Marissa@Hadfield_family.net', 20, 'f', 'Y'),
(3, 'Christopher', 'Hadfield', 'Christopher@Hadfield_family.net', 20, 'm', 'N'),
(4, 'Andrew', 'Hadfield', 'Andrew@Hadfield_family.net', 22, 'm', 'N'),
(5, 'Melissa', 'Hadfield', 'Melissa@Hadfield_family.net', 25, 'f', 'Y'),
(6, 'Sally', 'Fields', 'Sally@Fields.com', 28, 'f', 'N'),
(12, 'John', 'Wayne', 'John@Wayne.com', 26, 'm', 'Y'),
(13, 'Harrison', 'Ford', 'Harrison_Ford@StarWars.com', 25, 'm', 'Y'),
(14, 'Penelope', 'Cruz', 'Penelope@Cruz.com', 19, 'f', 'Y'),
(15, 'Joan', 'Rivers', 'Joan@Rivers.com', 29, 'F', 'N'),
(16, 'Joshua', 'Jones', 'Joshua@Jones.com', 24, 'M', 'N');
