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
  KEY `emi_id` (`emi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `NS_ohvrid`
--

CREATE TABLE `NS_ohvrid` (
  `publitseerida` tinyint(4) DEFAULT NULL,
  `kirjekood` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `EMI juut` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `JM` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `MR` varchar(110) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Salo` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Perekonnanimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `p. variandid` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `SCHŠ` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Eesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `e. variandid` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sugu` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünniaeg` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünniaeg teine võimalus` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sünnikoht` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Elukoht` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Rahvus` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Andmebaasid` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Viited` varchar(190) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Pereregister` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kommentaarid` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kodakondsus` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Vahistamine` varchar(80) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Otsus` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Otsustaja` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kinnitamine` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kinnitaja` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surnud` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Surmakoht` varchar(70) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Asjaolud` varchar(220) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Amet` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Süüdistus` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Partei` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Perekonnaseis` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Haridus` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Märkused` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjandus` varchar(180) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Juurdlustoimik` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `R14-R16`
--

CREATE TABLE `R14-R16` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pereregister` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `perekonnanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `prkn-variandid` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesnimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `eesn-variandid` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isanimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isan-variandid` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pseud jm nimevariandid` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sugu` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `sünd` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `surm` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `s/a-variandid` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `allikad` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirje` text COLLATE utf8_estonian_ci NOT NULL,
  `sünnikoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `elukoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kirjekood`),
  KEY `pereregister` (`pereregister`),
  KEY `persoon` (`persoon`),
  KEY `sünd` (`sünd`),
  KEY `surm` (`surm`),
  KEY `sünnikoht` (`sünnikoht`),
  KEY `elukoht` (`elukoht`),
  KEY `perekonnanimi` (`perekonnanimi`,`prkn-variandid`) USING BTREE,
  KEY `eesnimi` (`eesnimi`,`eesn-variandid`) USING BTREE,
  KEY `isanimi` (`isanimi`,`isan-variandid`) USING BTREE,
  CONSTRAINT `FK_R14-R16_repis.kirjed` FOREIGN KEY (`persoon`) REFERENCES `repis`.`kirjed` (`kirjekood`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pereregister` FOREIGN KEY (`pereregister`) REFERENCES `pereregister` (`isikukood`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;

DECLARE _source VARCHAR(50) DEFAULT 'R14_R16_BU';

if true then

  -- midagi ei muutunud - midagi ei tee
  if  ifnull(OLD.persoon,'') = ifnull(NEW.persoon,'')
  AND ifnull(OLD.pereregister,'') = ifnull(NEW.pereregister,'') then
    leave proc_label;
  END if;

  -- muutus pereregister aga uut persooni ei lisatud
  if ( NEW.persoon IS NULL
    OR ifnull(OLD.persoon,'') = ifnull(NEW.persoon,'') )
  AND NEW.pereregister IS NOT NULL
  AND ifnull(OLD.pereregister,'') <> NEW.pereregister then
    SET @prsn = NULL;
    SELECT persoon INTO @prsn
	 FROM import.pereregister 
	 WHERE isikukood = NEW.pereregister;
	 if @prsn IS NOT NULL then
	   SET NEW.persoon = @prsn;
	 END if;
  END if;

  -- muutus persoon aga uut pereregistrit ei lisatud
  if ( NEW.pereregister IS NULL 
    OR ifnull(OLD.pereregister,'') = ifnull(NEW.pereregister,'') )
  AND NEW.persoon IS NOT NULL
  AND ifnull(OLD.persoon,'') <> NEW.persoon then
    SET @prkood = NULL;
    SELECT isikukood INTO @prkood
	 FROM import.pereregister 
	 WHERE persoon = NEW.persoon
	 ORDER BY id desc
	 LIMIT 1;
	 if @prkood IS NOT NULL then
      SET NEW.pereregister = @prkood;
    END if;
  END if;

  if ifnull(OLD.persoon,'') <> ifnull(NEW.persoon,'') then
--     CALL repis.log_msg('OLD.persoon', OLD.persoon, _source);
--     CALL repis.log_msg('NEW.persoon', NEW.persoon, _source);
	  if OLD.persoon IS NOT NULL then
	    DELETE IGNORE FROM repis.kirjed
	    WHERE kirjekood = OLD.kirjekood;
	  END if;
	
	  if NEW.persoon IS NOT NULL then
	    DELETE IGNORE FROM repis.kirjed
	    WHERE kirjekood = NEW.kirjekood;
	
	     INSERT IGNORE INTO repis.kirjed
		    ( persoon, kirjekood, Kirje
	       , Perenimi, Eesnimi, Isanimi, Sugu
	       , Sünd, Sünnikoht, Surm
			 , Allikas )
	     VALUES
	       ( NEW.persoon, NEW.kirjekood, NEW.kirje
	       , NEW.perekonnanimi, NEW.eesnimi, NEW.isanimi, NEW.sugu
	       , NEW.sünd, NEW.sünnikoht, NEW.surm
	       , 'R14-R16' );
	  END if;
  END if;
  
--  CALL repis.log_msg('NEW.pereregister', NEW.pereregister, _source);
  if NEW.persoon IS NOT NULL AND NEW.pereregister IS NOT NULL then
    UPDATE import.pereregister SET persoon = NEW.persoon WHERE isikukood = NEW.pereregister;
  END if;


END if;
END */;;
DELIMITER ;

--
-- Table structure for table `RR_paring_28092021`
--

CREATE TABLE `RR_paring_28092021` (
  `syk.id` smallint(6) NOT NULL,
  `markus` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Toimik` varchar(10) COLLATE utf8_estonian_ci NOT NULL,
  `Perenimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `Eesnimi` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `Sünd` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Surm` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirje` varchar(100) COLLATE utf8_estonian_ci NOT NULL,
  `paragrahv` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `RRisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `RReesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `RRperenimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `muueesnimi` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `muuperenimi` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sugu` char(1) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isikustaatustxt` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `synniaeg` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `synnikoht` varchar(90) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmaaeg` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `surmakoht` varchar(70) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaeesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emaperenimi` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaisikukood` varchar(11) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaeesnimi` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isaperenimi` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `foo` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `aa_eesnimed`
--

CREATE TABLE `aa_eesnimed` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi5` varchar(5) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi4` varchar(4) COLLATE utf8_estonian_ci NOT NULL,
  `eesnimi3` varchar(3) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`kirjekood`,`eesnimi`),
  KEY `kirjekood` (`kirjekood`),
  KEY `eesnimi` (`eesnimi`),
  KEY `eesnimi5` (`eesnimi5`),
  KEY `eesnimi4` (`eesnimi4`),
