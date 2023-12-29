-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: import
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `import`
--


USE `import`;

--
-- Table structure for table `49_kyyd_vab`
--

CREATE TABLE `49_kyyd_vab` (
  `emi_id` int(11) DEFAULT NULL,
  `isikukood` char(63) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  KEY `emi_id` (`emi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `49kyyd_mittesurnud_lapsed`
--

CREATE TABLE `49kyyd_mittesurnud_lapsed` (
  `jrk` int(11) NOT NULL,
  `emi_id` int(11) DEFAULT NULL,
  `isikukood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` varchar(4000) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perekood` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lipik` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`jrk`),
  KEY `persoon` (`persoon`),
