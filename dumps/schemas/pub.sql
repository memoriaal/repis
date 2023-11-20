-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: pub
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `pub`
--


USE `pub`;

--
-- Table structure for table `nimekirjad`
--

DROP TABLE IF EXISTS `nimekirjad`;
CREATE TABLE `nimekirjad` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `redirect` char(10) COLLATE utf8_estonian_ci DEFAULT '',
  `kirje` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `evokirje` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `perenimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `emanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünd` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surm` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünnikoht` varchar(100) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surmakoht` varchar(100) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isPerson` bit(1) NOT NULL DEFAULT b'0',
  `kivi` bit(1) NOT NULL DEFAULT b'0',
  `emem` bit(1) NOT NULL DEFAULT b'0',
  `evo` bit(1) NOT NULL DEFAULT b'0',
  `wwiiref` bit(1) NOT NULL DEFAULT b'0',
  `mv` bit(1) NOT NULL DEFAULT b'0',
  `kirjed` longtext COLLATE utf8_estonian_ci NOT NULL DEFAULT '[]',
  `pereseosed` longtext COLLATE utf8_estonian_ci NOT NULL DEFAULT '[]',
  `tahvlikirje` longtext COLLATE utf8_estonian_ci NOT NULL DEFAULT '{}',
  `episoodid` longtext COLLATE utf8_estonian_ci NOT NULL DEFAULT '[]',
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`persoon`) USING BTREE,
  KEY `redirect` (`redirect`),
  CONSTRAINT `FK_nimekirjad_repis_kirjed` FOREIGN KEY (`persoon`) REFERENCES `repis`.`kirjed` (`kirjekood`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CC1` CHECK (json_valid(`kirjed`)),
  CONSTRAINT `CC2` CHECK (json_valid(`pereseosed`)),
  CONSTRAINT `CC3` CHECK (json_valid(`tahvlikirje`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='Persoonide kuulumine erinevatesse avaldatud nimekirjadesse';

