-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: repis
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `repis`
--


USE `repis`;

--
-- Temporary table structure for view `RR_kanded`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `id`,
  1 AS `ToimikId`,
  1 AS `persoon`,
  1 AS `Kirjed`,
  1 AS `Eesnimi`,
  1 AS `Perenimi`,
  1 AS `Isanimi`,
  1 AS `Surm`,
  1 AS `Sugu`,
  1 AS `Surmakoht`,
  1 AS `Rahvus`,
  1 AS `Märkus`,
  1 AS `Alusdokument`,
  1 AS `xml` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `RR_kanded_xml`
--

CREATE TABLE `RR_kanded_xml` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `xml` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `_deprecated_emadisad`
--

CREATE TABLE `_deprecated_emadisad` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `ema` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `isa` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `abikaasa` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kasuema` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kasuisa` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `updated_by` varchar(40) COLLATE utf8_estonian_ci NOT NULL DEFAULT '-',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`persoon`),
  KEY `ema` (`ema`),
  KEY `isa` (`isa`),
  KEY `abikaasa` (`abikaasa`),
  KEY `kasuema` (`kasuema`),
  KEY `kasuisa` (`kasuisa`),
  CONSTRAINT `_deprecated_emadisad_ibfk_1` FOREIGN KEY (`persoon`) REFERENCES `kirjed` (`kirjekood`),
  CONSTRAINT `_deprecated_emadisad_ibfk_4` FOREIGN KEY (`abikaasa`) REFERENCES `kirjed` (`kirjekood`),
  CONSTRAINT `_deprecated_emadisad_ibfk_5` FOREIGN KEY (`kasuema`) REFERENCES `kirjed` (`kirjekood`),
  CONSTRAINT `_deprecated_emadisad_ibfk_6` FOREIGN KEY (`kasuisa`) REFERENCES `kirjed` (`kirjekood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `a_kirjed`
--

CREATE TABLE `a_kirjed` (
  `Persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Kirjed` mediumtext COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `a_lipikud`
--

CREATE TABLE `a_lipikud` (
  `Persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Lipikud` mediumtext COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `a_persoonid`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `perenimi`,
  1 AS `eesnimi`,
  1 AS `isanimi`,
  1 AS `emanimi`,
  1 AS `sünd`,
  1 AS `surm`,
  1 AS `kirjed`,
  1 AS `lipikud`,
  1 AS `sildid`,
  1 AS `kommentaar` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `a_sildid`
--

CREATE TABLE `a_sildid` (
  `Persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `Sildid` mediumtext COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `allikad`
--

CREATE TABLE `allikad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nonPerson` bit(1) NOT NULL DEFAULT b'0',
  `isFilter` bit(1) NOT NULL DEFAULT b'0',
  `Allikas` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Nimetus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kood` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  `Lühend` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Avaldatud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Nimekiri` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjeid allikas` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjeid imporditud` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kirjeldus` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Andmeväljad` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Kommentaar` varchar(255) COLLATE utf8_estonian_ci DEFAULT NULL,
  `prioriteetPerenimi` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetEesnimi` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetIsanimi` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetEmanimi` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetSünd` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetSurm` int(5) unsigned NOT NULL DEFAULT 10000,
  `prioriteetKirje` int(5) unsigned NOT NULL DEFAULT 10000,
  `Küüdiaasta` char(4) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`Kood`),
  KEY `Index 2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `asukohad`
--

CREATE TABLE `asukohad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nimetus` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Liik` enum('','Administratiivüksus','Vangilaager','Vangla','Asumispaik','Laager','Alias') COLLATE utf8_estonian_ci NOT NULL DEFAULT 'Administratiivüksus',
  `Alamliik` enum('','ANSV','krai','kreis','küla','vald','linn','NSV','oblast','rajoon') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Nimekuju` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Originaalnimi` varchar(250) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Kirjeldus` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Asukoht` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nimetus` (`Nimetus`,`Liik`,`Asukoht`,`Alamliik`) USING BTREE,
  KEY `asukohad_ibfk_1` (`Asukoht`),
  CONSTRAINT `asukohad_ibfk_1` FOREIGN KEY (`Asukoht`) REFERENCES `asukohad` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `c_lipikud`
--

CREATE TABLE `c_lipikud` (
  `lipik` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `selgitus` text COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`lipik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `c_seoseliigid`
--

CREATE TABLE `c_seoseliigid` (
  `seoseliik` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sugu` enum('','M','N') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sugu_1` enum('','M','N','=','X') COLLATE utf8_estonian_ci DEFAULT NULL,
  `seoseliik_1M` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `seoseliik_1N` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `seoseliik_1X` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`seoseliik`),
  KEY `seoseliik_1` (`seoseliik_1M`),
  KEY `seoseliik_1N` (`seoseliik_1N`),
  KEY `seoseliik_1X` (`seoseliik_1X`),
  CONSTRAINT `c_seoseliigid_ibfk_1` FOREIGN KEY (`seoseliik_1M`) REFERENCES `c_seoseliigid` (`seoseliik`) ON UPDATE CASCADE,
  CONSTRAINT `c_seoseliigid_ibfk_2` FOREIGN KEY (`seoseliik_1N`) REFERENCES `c_seoseliigid` (`seoseliik`) ON UPDATE CASCADE,
  CONSTRAINT `c_seoseliigid_ibfk_3` FOREIGN KEY (`seoseliik_1X`) REFERENCES `c_seoseliigid` (`seoseliik`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `c_sildid`
--

CREATE TABLE `c_sildid` (
  `silt` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `selgitus` text COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`silt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `value` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `desk_lipikud`
--

CREATE TABLE `desk_lipikud` (
  `desktop_id` int(10) unsigned NOT NULL,
  `lipik` varchar(50) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`desktop_id`,`lipik`),
  KEY `lipik` (`lipik`),
  CONSTRAINT `desk_lipikud_ibfk_1` FOREIGN KEY (`desktop_id`) REFERENCES `desktop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `desk_lipikud_ibfk_2` FOREIGN KEY (`lipik`) REFERENCES `c_lipikud` (`lipik`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `desk_sildid`
--

CREATE TABLE `desk_sildid` (
  `desktop_id` int(10) unsigned NOT NULL,
  `silt` varchar(50) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`desktop_id`,`silt`),
  KEY `silt` (`silt`),
  CONSTRAINT `desk_sildid_ibfk_1` FOREIGN KEY (`desktop_id`) REFERENCES `desktop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `desk_sildid_ibfk_2` FOREIGN KEY (`silt`) REFERENCES `c_sildid` (`silt`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `desktop`
--

CREATE TABLE `desktop` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `valmis` enum('Valmis','','Untsus') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `jutt` text COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `perenimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `emanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünd` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sünnikoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surm` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surmakoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `matmisaeg` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `elukoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `matmiskoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `surma põhjus` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `lipik` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `lipikud` text COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `silt` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sildid` text COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `kirje` text COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `legend` text COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `välisviide` varchar(2000) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `allikas` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kirjekood`,`created_by`),
  UNIQUE KEY `id` (`id`),
  KEY `lipik` (`lipik`),
  KEY `silt` (`silt`),
  CONSTRAINT `desktop_ibfk_1` FOREIGN KEY (`lipik`) REFERENCES `c_lipikud` (`lipik`) ON UPDATE CASCADE,
  CONSTRAINT `desktop_ibfk_2` FOREIGN KEY (`silt`) REFERENCES `c_sildid` (`silt`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;

    IF NEW.created_by = '' THEN
      SET NEW.created_by = user();
    END IF;

    SET @new_code = UPPER(IF(NEW.kirjekood = '', NEW.persoon, NEW.kirjekood));

    IF @new_code IN ('EMI', 'TS', 'R4-1', 'KR') THEN
      SET NEW.persoon = '',
          NEW.kirjekood = repis.desktop_next_id(@new_code),
          NEW.allikas = @new_code;

    ELSEIF @new_code = '0' THEN
      SET @ik = repis.desktop_next_id('Persoon');
      SET NEW.persoon = @ik,
          NEW.kirjekood = @ik,
          NEW.allikas = 'Persoon';

      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2,    task,              params, created_by)
      VALUES                           (NEW.persoon, NEW.kirjekood, 'desktop_collect', NULL,   NEW.created_by);
      IF @new_code LIKE 'PR-%' THEN
        SET NEW.persoon = '';
        SET NEW.kirjekood = @new_code;
        SET NEW.allikas = 'PR';
        INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2,   task,                        params, created_by)
        VALUES                           (NULL,       @new_code,    'desktop_PR_import', NULL,   NEW.created_by);
      ELSEIF @new_code LIKE 'RK-%' THEN
        SET NEW.persoon = '';
        SET NEW.kirjekood = @new_code;
        SET NEW.allikas = 'RK';
        INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2,   task,                        params, created_by)
        VALUES                           (NULL,       @new_code,    'desktop_RK_import', NULL,   NEW.created_by);
      ELSEIF @new_code LIKE 'RR-%' THEN
        SET NEW.persoon = '';
        SET NEW.kirjekood = @new_code;
        SET NEW.allikas = 'RR';
        INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2,   task,                        params, created_by)
        VALUES                           (NULL,       @new_code,    'desktop_RR_import', NULL,   NEW.created_by);
      END IF;

    END IF;
  END */;;
DELIMITER ;
DELIMITER ;;

    DECLARE msg TEXT;

    -- can change only owned records
        THEN
        SELECT concat_ws('\n'
          , user()
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
      END IF;

    -- no meddling
      SET NEW.created_by = OLD.created_by;
      SET NEW.allikas = OLD.allikas;
      SET NEW.jutt = IF(OLD.jutt = ' - - - ', ' - - - ', NEW.jutt);

    -- cant change the identifier
        SELECT concat_ws('\n'
          , 'Kirjekoode ei saa muuta.'
          , 'Mitte kuidagi ei saa.'
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
      END IF;

    -- cant remove person from record
        SELECT concat_ws('\n'
          , 'Kirjelt ei saa persooni ära võtta.'
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
      END IF;

    -- cant assign person to another person
        -- SELECT concat_ws('\n'
        --   , 'Nimekuju kirjet ei saa isikust lahutada.'
        -- ) INTO msg;
        -- SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
        SET NEW.eesnimi = '';
        SET NEW.perenimi = '';
        SET NEW.emanimi = '';
        SET NEW.isanimi = '';
        SET NEW.sünd = '';
        SET NEW.surm = '';
        INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2,  task,                   params, created_by)
        VALUES                           (OLD.persoon, NEW.persoon, 'desktop_join_persons', '',     user());
        INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,                    params, created_by)
        VALUES                           (NEW.persoon, NULL,       'desktop_NK_refresh',    '1',   user());

        LEAVE proc_label;
      END IF;

    -- cant change almost anything but person for original records
      IF OLD.allikas NOT IN ('EMI', 'TS', 'Persoon', 'KR')
        SELECT concat_ws('\n'
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
      END IF;


    --
    -- Update desktop silts'n'lipiks
    --
    IF NEW.lipik IS NOT NULL THEN
      INSERT IGNORE INTO repis.desk_lipikud (desktop_id, lipik)
      VALUES (NEW.id, NEW.lipik);
      IF row_count() = 0 THEN
        DELETE FROM repis.desk_lipikud WHERE desktop_id = NEW.id AND lipik = NEW.lipik;
      END IF;

      SELECT GROUP_CONCAT(dl.lipik SEPARATOR '; ') INTO @lipikud
      FROM repis.desk_lipikud dl
      WHERE dl.desktop_id = NEW.id;

      SET NEW.lipikud = IFNULL(@lipikud, '');
      SET NEW.lipik = NULL;
    END IF;

    IF NEW.silt IS NOT NULL THEN
      INSERT IGNORE INTO repis.desk_sildid (desktop_id, silt)
      VALUES (NEW.id, NEW.silt);
      IF row_count() = 0 THEN
        DELETE FROM repis.desk_sildid WHERE desktop_id = NEW.id AND silt = NEW.silt;
      END IF;

      SELECT GROUP_CONCAT(ds.silt SEPARATOR '; ') INTO @sildid
      FROM repis.desk_sildid ds
      WHERE ds.desktop_id = NEW.id;

      SET NEW.sildid = IFNULL(@sildid, '');
      SET NEW.silt = NULL;
    END IF;


    --
    -- Prefill names'n'dates'n'kirje of new EMI
    --
    IF     OLD.allikas IN ('EMI', 'KR')
      IF     NEW.perenimi  = '' AND NEW.eesnimi   = ''
         AND NEW.isanimi   = '' AND NEW.emanimi   = ''
         AND NEW.sünd      = '' AND NEW.surm      = ''
         AND NEW.sünnikoht = '' AND NEW.surmakoht = '' THEN
            SET @perenimi = '', @eesnimi = ''
               , @isanimi = '', @emanimi = ''
               , @sünd = '', @surm = ''
               , @sünnikoht = '', @surmakoht = ''
               , @kirje = '', @allikas = '';
            SELECT k.perenimi, k.eesnimi
                 , k.isanimi, k.emanimi
                 , k.sünd, k.surm
                 , k.sünnikoht, k.surmakoht
                 , k.kirje, k.allikas
              INTO @perenimi, @eesnimi
                 , @isanimi, @emanimi
                 , @sünd, @surm
                 , @sünnikoht, @surmakoht
                 , @kirje, @allikas
              FROM repis.desktop k
             WHERE k.kirjekood = NEW.persoon;

            SET NEW.perenimi = @perenimi, NEW.eesnimi = @eesnimi,
                NEW.isanimi = @isanimi, NEW.emanimi = @emanimi,
                NEW.sünd = @sünd, NEW.surm = @surm,
                NEW.sünnikoht = @sünnikoht, NEW.surmakoht = @surmakoht;

      END IF;
    END IF;


    --
    -- Recalculate current record
    --
    IF OLD.allikas IN ('EMI', 'Persoon') THEN
      SET NEW.kirje =
        concat_ws('. ',
          repis.desktop_person_text(
              NEW.perenimi, NEW.eesnimi,
              NEW.isanimi, NEW.emanimi,
              NEW.sünd, NEW.surm,
              NEW.sünnikoht, NEW.surmakoht
            ) COLLATE utf8_estonian_ci,
          if(NEW.jutt IN('', ' - - - '), NULL, NEW.jutt)
        )
      ;
    END IF;


    --
    -- Request recalculation for person that gave away record
    --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
      VALUES                           (OLD.persoon, NULL,       'desktop_NK_refresh', '1',   user());
    END IF;


    --
    -- Request recalculation for affected person(s)
    --

      SET @refresh_requested = 0;

        INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
        VALUES                           (NEW.persoon, NULL,       'desktop_NK_refresh', '2.1',   user());
        SET @refresh_requested = 1;
      END IF;

         )
            INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
            VALUES                           (NEW.persoon, NULL,       'desktop_NK_refresh', '2.2',   user());
            SET @refresh_requested = 1;
      END IF;

    END IF;

    --
    -- Request recalculation for person with changed status
    --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
      VALUES                           (OLD.persoon, NULL,       'desktop_NK_refresh', '3',   user());
    END IF;



    --
    -- Clean desktop
    --
    IF NEW.valmis = 'Untsus' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
      VALUES                           (NULL,        NULL,       'desktop_flush', NULL,   user());


    --
    -- Save and clean desktop
    --
    ELSEIF NEW.valmis = 'Valmis' THEN

      -- Save new persons if any
      INSERT INTO repis.kirjed (
        persoon, kirjekood, kirje, legend, perenimi, eesnimi,
        isanimi, emanimi, sünd, sünnikoht, surm, surmakoht, allikas,
        matmisaeg, elukoht, matmiskoht, `surma põhjus`,
        välisviide, EkslikKanne, Peatatud, EiArvesta,
        created_at, created_by,
        KirjePersoon)
      SELECT d.persoon, d.kirjekood, d.kirje, d.legend, d.perenimi, d.eesnimi,
             d.isanimi, d.emanimi, d.sünd, d.sünnikoht, d.surm, d.surmakoht, d.allikas,
             d.matmisaeg, d.elukoht, d.matmiskoht, d.`surma põhjus`,
             d.välisviide, d.EkslikKanne, d.Peatatud, d.EiArvesta,
             now(), SUBSTRING_INDEX(user(), '@', 1),
             repis.desktop_person_text(
                d.perenimi, d.eesnimi,
                d.isanimi, d.emanimi,
                d.sünd, d.surm,
                d.sünnikoht, d.surmakoht
              )
      FROM repis.desktop d
      LEFT JOIN repis.kirjed k ON k.kirjekood = d.kirjekood
      WHERE k.persoon IS NULL
      AND d.persoon = d.kirjekood
      AND d.created_by = user();

      -- Save new records to new persons if any
      INSERT INTO repis.kirjed (
        persoon, kirjekood, kirje, legend, perenimi, eesnimi,
        isanimi, emanimi, sünd, sünnikoht, surm, surmakoht, allikas,
        matmisaeg, elukoht, matmiskoht, `surma põhjus`,
        välisviide, EkslikKanne, Peatatud, EiArvesta,
        created_at, created_by,
        KirjePersoon,
        kirjeJutt)
      SELECT d.persoon, d.kirjekood, d.kirje, d.legend, d.perenimi, d.eesnimi,
             d.isanimi, d.emanimi, d.sünd, d.sünnikoht, d.surm, d.surmakoht, d.allikas,
             d.matmisaeg, d.elukoht, d.matmiskoht, d.`surma põhjus`,
             d.välisviide, d.EkslikKanne, d.Peatatud, d.EiArvesta,
             now(), SUBSTRING_INDEX(user(), '@', 1),
             if(d.allikas IN ('EMI', 'TS'),
                  repis.desktop_person_text(
                    d2.perenimi, d2.eesnimi,
                    d2.isanimi, d2.emanimi,
                    d2.sünd, d2.surm,
                    d2.sünnikoht, d2.surmakoht
                  ),
                  NULL
               ),
             if(d.allikas IN ('EMI', 'TS'), d.jutt, NULL)
      FROM repis.desktop d
      LEFT JOIN repis.kirjed k ON k.kirjekood = d.kirjekood
      LEFT JOIN repis.desktop d2 ON d2.kirjekood = d.persoon
      WHERE k.kirjekood IS NULL
      AND d.created_by = user();


      -- Update changed silts'n'lipiks
      DELETE kl FROM repis.v_kirjelipikud kl
      RIGHT JOIN repis.desktop d ON d.kirjekood = kl.kirjekood
      WHERE d.created_by = user();
      --
      DELETE ks FROM repis.v_kirjesildid ks
      RIGHT JOIN repis.desktop d ON d.kirjekood = ks.kirjekood
      WHERE d.created_by = user();
      --
      INSERT INTO repis.v_kirjelipikud (kirjekood, lipik)
      SELECT d.kirjekood, dl.lipik
      FROM repis.desk_lipikud dl
      RIGHT JOIN repis.desktop d ON d.id = dl.desktop_id
      WHERE d.created_by = user()
        AND dl.lipik IS NOT NULL;
      --
      INSERT INTO repis.v_kirjesildid (kirjekood, silt)
      SELECT d.kirjekood, dl.silt
      FROM repis.desk_sildid dl
      RIGHT JOIN repis.desktop d ON d.id = dl.desktop_id
      WHERE d.created_by = user()
        AND dl.silt IS NOT NULL;


      -- Update changed persons
      UPDATE repis.kirjed k
      RIGHT JOIN repis.desktop d ON d.kirjekood = k.kirjekood
      LEFT JOIN repis.desktop d2 ON d2.kirjekood = d.persoon
      SET k.persoon = d.persoon,
          k.lipikud = repis.func_kirjelipikud(k.kirjekood),
          k.sildid = repis.func_kirjesildid(k.kirjekood),
          k.kirje = d.kirje, k.legend = d.legend,
          k.perenimi = d.perenimi, k.eesnimi = d.eesnimi,
          k.isanimi = d.isanimi, k.emanimi = d.emanimi,
          k.sünd = d.sünd, k.sünnikoht = d.sünnikoht, 
			 k.surm = d.surm, k.surmakoht = d.surmakoht, 
			 k.allikas = d.allikas, k.matmisaeg = d.matmisaeg, 
          k.elukoht = d.elukoht, k.matmiskoht = d.matmiskoht, 
          k.`surma põhjus` = d.`surma põhjus`,
          k.välisviide = d.välisviide, k.EkslikKanne = d.EkslikKanne,
          k.Peatatud = d.Peatatud,
          k.EiArvesta = d.EiArvesta,
          k.updated_at = now(), updated_by = SUBSTRING_INDEX(user(), '@', 1),
          k.KirjePersoon = if(d.allikas IN ('EMI', 'TS'),
               repis.desktop_person_text(
                 d2.perenimi, d2.eesnimi,
                 d2.isanimi, d2.emanimi,
                 d2.sünd, d2.surm,
                 d2.sünnikoht, d2.surmakoht
               ),
               NULL
            ),
          k.kirjeJutt = if(d.allikas IN ('EMI', 'TS'), d.jutt, NULL)
      WHERE d.created_by = user();


      -- Remove deleted records
      UPDATE repis.kirjed k
      RIGHT JOIN repis.desktop d ON d.kirjekood = k.kirjekood
                                AND d.created_by = user()
      SET k.persoon = NULL;

      DELETE k FROM repis.kirjed k
      RIGHT JOIN repis.desktop d ON d.kirjekood = k.kirjekood
                                AND d.created_by = user()

      -- Clean desktop
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,            params, created_by)
      VALUES                           (NULL,        NULL,       'desktop_flush', NULL,   user());
    END IF;

  END */;;
DELIMITER ;

--
-- Table structure for table `emaisalaud`
--

CREATE TABLE `emaisalaud` (
  `A` enum('','Valmis') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `kirjed` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `ema` varchar(1000) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `isa` varchar(1000) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `abikaasa` varchar(1000) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `kasuema` varchar(1000) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `kasuisa` varchar(1000) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `emakirjed` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `isakirjed` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `abikaasakirjed` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `kasuisakirjed` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `kasuemakirjed` text COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`persoon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;
  proc_label:BEGIN

    DECLARE msg TEXT;
    SET @ema = NULL;
    SET @isa = NULL;
    SET @kasuema = NULL;
    SET @kasuisa = NULL;
    SET @abikaasa = NULL;

    IF IFNULL(NEW.persoon, '') = '' THEN
      SELECT concat_ws('\n'
        , 'Alusta persooni koodiga'
        , USER()
        , NEW.created_by
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    IF NEW.created_by IS NULL THEN
      SET NEW.created_by = USER();
    END IF;

    SET NEW.kirjed = repis.func_persoonikirjed(NEW.persoon);

    SET @s_id = NULL;
    SET @s_kirjed = NULL;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'ema';
    SET NEW.ema = IFNULL(@s_id, ''), NEW.emakirjed = @s_kirjed;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'isa';
    SET NEW.isa = IFNULL(@s_id, ''), NEW.isakirjed = @s_kirjed;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'kasuema';
    SET NEW.kasuema = IFNULL(@s_id, ''), NEW.kasuemakirjed = @s_kirjed;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'kasuisa';
    SET NEW.kasuisa = IFNULL(@s_id, ''), NEW.kasuisakirjed = @s_kirjed;

    SELECT group_concat(sugulane SEPARATOR ','),
           group_concat('== ', sugulane, ' ==\n', repis.func_persoonikirjed(sugulane) SEPARATOR '\n')
    INTO @s_id, @s_kirjed
    FROM repis.sugulased
    WHERE persoon = NEW.persoon AND seos = 'abikaasa';
    SET NEW.abikaasa = IFNULL(@s_id, ''), NEW.abikaasakirjed = @s_kirjed;

  END */;;
DELIMITER ;
DELIMITER ;;
  proc_label:BEGIN

    INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,                 params, created_by)
    VALUES                           (NEW.persoon, NULL,       'raamatupere2emaisa', '',     NEW.created_by);

      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.ema,     NEW.created_by);
    END IF;
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.isa,     NEW.created_by);
    END IF;
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.abikaasa,NEW.created_by);
    END IF;
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.kasuema, NEW.created_by);
    END IF;
      INSERT IGNORE INTO repis.z_queue (kirjekood1,  kirjekood2, task,         params,      created_by)
      VALUES                           (NULL,        NULL,       'add2emaisa', NEW.kasuisa, NEW.created_by);
    END IF;

    INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2, task, params, created_by)
    SELECT NULL AS kirjekood1, NULL AS kirjekood2, 'add2emaisa' AS task, persoon AS params, NEW.created_by AS created_by
      FROM repis.sugulased ei
     WHERE ei.sugulane = NEW.persoon;

  END */;;
DELIMITER ;
DELIMITER ;;
  proc_label:BEGIN

    DECLARE msg TEXT;

      SELECT concat_ws('\n'
        , USER()
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    IF NEW.ema = OLD.persoon OR NEW.isa = OLD.persoon OR NEW.abikaasa = OLD.persoon OR
       NEW.kasuema = OLD.persoon OR NEW.kasuisa = OLD.persoon THEN
      SELECT concat_ws('\n'
        , USER()
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    IF NEW.ema = 'E' THEN
      SET NEW.ema = repis.emadisad_next_id('E');
    END IF;
    IF NEW.isa = 'I' THEN
      SET NEW.isa = repis.emadisad_next_id('I');
    END IF;

    IF NEW.ema = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'ema'
        AND sugulane = OLD.ema AND persoon = OLD.persoon;
    END IF;
    IF NEW.isa = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'isa'
        AND sugulane = OLD.isa AND persoon = OLD.persoon;
    END IF;
    IF NEW.kasuema = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'kasuema'
        AND sugulane = OLD.kasuema AND persoon = OLD.persoon;
    END IF;
    IF NEW.kasuisa = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'kasuisa'
        AND sugulane = OLD.kasuisa AND persoon = OLD.persoon;
    END IF;
    IF NEW.abikaasa = '' THEN
      DELETE FROM repis.sugulased
      WHERE seos = 'abikaasa'
        AND (  sugulane IN (SELECT k0.kirjekood FROM repis.kirjed k0 WHERE OLD.abikaasa regexp k0.kirjekood) AND persoon  = OLD.persoon
            OR persoon  IN (SELECT k0.kirjekood FROM repis.kirjed k0 WHERE OLD.abikaasa regexp k0.kirjekood) AND sugulane = OLD.persoon
            );
    END IF;

    SET NEW.emakirjed = repis.func_persoonikirjed(NEW.ema);
    SET NEW.isakirjed = repis.func_persoonikirjed(NEW.isa);
    SET NEW.abikaasakirjed = repis.func_persoonikirjed(NEW.abikaasa);
    SET NEW.kasuemakirjed = repis.func_persoonikirjed(NEW.kasuema);
    SET NEW.kasuisakirjed = repis.func_persoonikirjed(NEW.kasuisa);

  END */;;
DELIMITER ;
DELIMITER ;;
  proc_label:BEGIN

      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'ema', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.ema REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.ema = k0.kirjekood;
    END IF;
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'isa', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.isa REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.isa = k0.kirjekood;
    END IF;
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'abikaasa', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.abikaasa REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT k0.persoon, 'abikaasa', NEW.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.abikaasa REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      -- VALUES                           (NEW.abikaasa, NEW.abikaasa, 'emaisalaud_replace', '',     NEW.created_by);
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.abikaasa regexp k0.kirjekood OR OLD.abikaasa regexp k0.kirjekood;
    END IF;
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'kasuisa', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.kasuisa REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.kasuisa regexp k0.kirjekood;
    END IF;
      INSERT IGNORE INTO repis.sugulased (persoon, seos, sugulane, created_by, created_at)
      SELECT DISTINCT NEW.persoon, 'kasuema', k0.persoon, NEW.created_by, now()
      FROM repis.kirjed k0
      WHERE NEW.kasuema REGEXP k0.persoon;
      --
      INSERT IGNORE INTO repis.z_queue (kirjekood1,   kirjekood2,   task,                 params, created_by)
      SELECT k0.kirjekood, k0.kirjekood, 'emaisalaud_replace', '', NEW.created_by
      FROM repis.kirjed k0
      WHERE NEW.kasuema regexp k0.kirjekood;
    END IF;

    IF NEW.A = 'Valmis' THEN
      INSERT IGNORE INTO repis.z_queue (kirjekood1, kirjekood2, task,               params, created_by)
      VALUES                           (NULL,       NULL,       'emaisalaud_flush', '',     NEW.created_by);
    END IF;

  END */;;
DELIMITER ;

--
-- Table structure for table `episoodid`
--

CREATE TABLE `episoodid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Nimetus` enum('','Arreteerimine','Vangistus','Küüditamine','Matmispaik','Asumise algus','Asumiselt vabanemine','Laager','Surm','Vangilaager','Elukoht','Põgenes') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Aeg` char(10) COLLATE utf8_estonian_ci DEFAULT '',
  `Asukoht` int(11) unsigned DEFAULT NULL,
  `Väärtus` varchar(50) COLLATE utf8_estonian_ci DEFAULT '',
  `Kinnitatud` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `Kirjekood` (`Kirjekood`,`Nimetus`,`Aeg`,`Asukoht`) USING BTREE,
  KEY `Asukoht` (`Asukoht`) USING BTREE,
  CONSTRAINT `episoodid_ibfk_1` FOREIGN KEY (`Asukoht`) REFERENCES `asukohad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci ROW_FORMAT=DYNAMIC;

--
-- Table structure for table `episoodid_0`
--

CREATE TABLE `episoodid_0` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Aeg` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Asukoht` int(11) unsigned DEFAULT NULL,
  `Nimetus` enum('','Arreteerimine','Vangistus','Küüditamine','Matmispaik','Asumise algus','Asumiselt vabanemine','Laager','Surm','Vangilaager') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `kinnitatud` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Kirjekood` (`Kirjekood`,`Nimetus`,`Aeg`,`Asukoht`),
  KEY `Asukoht` (`Asukoht`),
  CONSTRAINT `episoodid_0_ibfk_1` FOREIGN KEY (`Asukoht`) REFERENCES `asukohad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `failid`
--

CREATE TABLE `failid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT '',
  `fail` longblob NOT NULL,
  `failinimi` varchar(100) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `fondid`
--

CREATE TABLE `fondid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Arhiiv` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Fond` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Nimistu` varchar(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Arhiiv` (`Arhiiv`,`Fond`,`Nimistu`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `kirjed`
--

CREATE TABLE `kirjed` (
  `persoon` char(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Kirje` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Perenimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Eesnimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Isanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Emanimi` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Sünd` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Sünnikoht` varchar(100) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Surm` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Surmakoht` varchar(100) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Lipikud` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Sildid` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `RaamatuPere` varchar(25) COLLATE utf8_estonian_ci DEFAULT NULL,
  `LeidPere` int(10) unsigned DEFAULT NULL,
  `Sugu` enum('M','N','') COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Rahvus` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Välisviide` varchar(2000) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Kommentaar` varchar(2000) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Allikas` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Nimekiri` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `kustuta` char(1) COLLATE utf8_estonian_ci DEFAULT NULL,
  `legend` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `KirjePersoon` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `KirjeJutt` text COLLATE utf8_estonian_ci DEFAULT NULL,
  `Elukoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Surma põhjus` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `Matmiskoht` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `Matmisaeg` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pub_emem` bit(1) NOT NULL DEFAULT b'0',
  `pub_kivi` bit(1) NOT NULL DEFAULT b'0',
  `pub_wwiiref` bit(1) NOT NULL DEFAULT b'0',
  `pub_evo` bit(1) NOT NULL DEFAULT b'0',
  `pub_mv` bit(1) NOT NULL DEFAULT b'0',
  `pub_isPerson` bit(1) NOT NULL DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`kirjekood`),
  KEY `persoon_persoon` (`persoon`),
  KEY `persoon_allikas` (`Allikas`),
  KEY `Perekood` (`RaamatuPere`),
  KEY `Sünd` (`Sünd`,`Eesnimi`),
  KEY `Eesnimi` (`Eesnimi`,`Sünd`),
  KEY `Perenimi` (`Perenimi`,`Eesnimi`) USING BTREE,
  CONSTRAINT `kirjed_allika_fk_allikas_kood` FOREIGN KEY (`Allikas`) REFERENCES `allikad` (`Kood`) ON UPDATE CASCADE,
  CONSTRAINT `kirjed_persoon_fk_kirjed_kirjekood` FOREIGN KEY (`persoon`) REFERENCES `kirjed` (`kirjekood`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;

    DECLARE msg VARCHAR(2000);

		 AND false THEN
      SELECT concat_ws(user(), '\n'
        , 'Kirjeid saab lisada ainult töölaualt.'
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;
    
    if NEW.persoon = '0'
    then
      SELECT LPAD(MAX(persoon)+1, 10, 0) INTO @new_persoon FROM repis.kirjed;
      SET NEW.persoon = @new_persoon;
      SET NEW.kirjekood = @new_persoon;
      SET NEW.allikas = 'Persoon';
    END if;

    if 'emi' IN (NEW.persoon, NEW.kirjekood)
    then
      SELECT MAX(persoon) INTO @new_persoon FROM repis.kirjed;
      SELECT CONCAT('EMI-', lpad(RIGHT(MAX(kirjekood), 6)+1, 6, '0')) 
		  INTO @new_kirjekood 
		  FROM repis.kirjed 
		 WHERE allikas = 'EMI';

      SET NEW.persoon = @new_persoon;
      SET NEW.kirjekood = @new_kirjekood;
      SET NEW.allikas = 'EMI';
    END if;

    if 'ts' IN (NEW.persoon, NEW.kirjekood)
    then
      SELECT MAX(persoon) INTO @new_persoon FROM repis.kirjed;
      SELECT CONCAT('TS-', lpad(RIGHT(MAX(kirjekood), 7)+1, 7, '0')) 
		  INTO @new_kirjekood
		  FROM repis.kirjed 
		 WHERE allikas = 'TS';

      SET NEW.persoon = @new_persoon;
      SET NEW.kirjekood = @new_kirjekood;
      SET NEW.allikas = 'TS';
    END if;

  END */;;
DELIMITER ;
DELIMITER ;;

	INSERT IGNORE INTO z_queue (`kirjekood1`, `kirjekood2`, `task`) 
	VALUES (NEW.persoon, '', 'proc_NK_refresh');
	
END */;;
DELIMITER ;
DELIMITER ;;

    DECLARE msg VARCHAR(2000);

    IF current_user() NOT IN ('michelek@localhost', 'ylle@localhost', 'queue@localhost') THEN
      SELECT concat_ws(current_user(), '\n'
        , 'Kirjeid saab muuta ainult töölaual.'
      ) INTO msg;
      SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    IF OLD.persoon = OLD.kirjekood AND OLD.persoon <> NEW.persoon AND 1 THEN
      INSERT INTO repis.z_queue (task, params)
		VALUES ('repis.merge_persons', CONCAT("'", NEW.persoon, "', '", OLD.persoon, "'"));
      -- SET NEW.persoon = OLD.persoon;
    END IF;

    IF NEW.allikas = 'EMI' THEN
      SET NEW.kirje = concat_ws('. ', 
                                if(NEW.KirjePersoon = '', NULL, NEW.KirjePersoon), 
                                if(NEW.kirjeJutt = '', NULL, NEW.kirjeJutt));
    END IF;

    IF NEW.allikas = 'TS' THEN
      SET NEW.KirjePersoon = repis.func_TS_KirjePersoon(NEW.kirjekood);
      SET NEW.kirje = concat_ws('. ', 
                                if(NEW.KirjePersoon = '', NULL, NEW.KirjePersoon), 
                                if(NEW.kirjeJutt = '', NULL, NEW.kirjeJutt));
    END IF;

    IF NEW.allikas = 'ELK' THEN
      SET NEW.kirje = func_person_text(NEW.kirjekood);
    END IF;

  END */;;
DELIMITER ;
DELIMITER ;;

	if false then
	  leave proc_label;
	END if;

	if NEW.persoon   <> OLD.persoon
	OR NEW.kirje     <> OLD.kirje
	OR NEW.Eesnimi   <> OLD.Eesnimi
	OR NEW.Perenimi  <> OLD.Perenimi
	OR NEW.Emanimi   <> OLD.Emanimi
	OR NEW.Isanimi   <> OLD.Isanimi
	OR NEW.Sünd      <> OLD.Sünd
	OR NEW.Surm      <> OLD.Surm
	OR NEW.Sünnikoht <> OLD.Sünnikoht
	OR NEW.Surmakoht <> OLD.Surmakoht
	OR NEW.EiArvesta <> OLD.EiArvesta
	OR NEW.Peatatud  <> OLD.Peatatud
	OR NEW.pub_emem     <> OLD.pub_emem
	OR NEW.pub_kivi     <> OLD.pub_kivi
	OR NEW.pub_wwiiref  <> OLD.pub_wwiiref
	OR NEW.pub_evo      <> OLD.pub_evo
	OR NEW.pub_isPerson <> OLD.pub_isPerson
	OR NEW.updated_at <> OLD.updated_at
	THEN

		INSERT IGNORE INTO z_queue (`kirjekood1`, `kirjekood2`, `task`) 
		VALUES (NEW.persoon, '', 'proc_NK_refresh');
		-- CALL repis.proc_NK_refresh(NEW.persoon);
		
		IF NEW.persoon <> OLD.persoon THEN
			INSERT IGNORE INTO z_queue (`kirjekood1`, `kirjekood2`, `task`) 
			VALUES (OLD.persoon, '', 'proc_NK_refresh');
			--	CALL proc_NK_refresh(OLD.persoon);
		END IF;

	END IF;

END */;;
DELIMITER ;
DELIMITER ;;
 if FALSE then
 
	if OLD.allikas = 'RK' then
		UPDATE import.repr_kart rk SET rk.persoon = NULL WHERE rk.isikukood = OLD.kirjekood;
	ELSEIF OLD.allikas = 'RR' then
		UPDATE import.rahvastikuregister rr SET rr.persoon = NULL WHERE rr.kirjekood = OLD.kirjekood;
	ELSEIF OLD.allikas = 'RPT' then
		UPDATE import.pensionitoimikud pt SET pt.persoon = NULL WHERE pt.kirjekood = OLD.kirjekood;
	END if;

 END if;
END */;;
DELIMITER ;
DELIMITER ;;

		INSERT IGNORE INTO z_queue (`kirjekood1`, `kirjekood2`, `task`) 
		VALUES (OLD.persoon, '', 'proc_NK_refresh');
	
END */;;
DELIMITER ;

--
-- Temporary table structure for view `kirjed_v`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `kirjekood`,
  1 AS `Kirje`,
  1 AS `kirjed`,
  1 AS `Perenimed`,
  1 AS `Perenimi`,
  1 AS `Eesnimi`,
  1 AS `Isanimi`,
  1 AS `Emanimi`,
  1 AS `Sünd`,
  1 AS `Sünnikoht`,
  1 AS `Surm`,
  1 AS `Surmakoht`,
  1 AS `Allikas`,
  1 AS `Allikad`,
  1 AS `Lipikud`,
  1 AS `Sildid`,
  1 AS `RaamatuPere`,
  1 AS `LeidPere`,
  1 AS `Sugu`,
  1 AS `Rahvus`,
  1 AS `Välisviide`,
  1 AS `Kommentaar`,
  1 AS `Puudulik`,
  1 AS `EkslikKanne`,
  1 AS `Peatatud`,
  1 AS `EiArvesta`,
  1 AS `kustuta`,
  1 AS `legend`,
  1 AS `KirjePersoon`,
  1 AS `KirjeJutt`,
  1 AS `Elukoht`,
  1 AS `Surma põhjus`,
  1 AS `Matmiskoht`,
  1 AS `Matmisaeg`,
  1 AS `pub_emem`,
  1 AS `pub_kivi`,
  1 AS `pub_wwiiref`,
  1 AS `pub_evo`,
  1 AS `pub_mv`,
  1 AS `pub_isPerson`,
  1 AS `created_at`,
  1 AS `created_by`,
  1 AS `updated_at`,
  1 AS `updated_by` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kirjete_toimikud`
--

CREATE TABLE `kirjete_toimikud` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `toimik` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `viide` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `säilik` varchar(8) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `fond` varchar(5) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kirjekood` (`kirjekood`),
  KEY `toimik` (`toimik`) USING BTREE,
  KEY `persoon` (`persoon`),
  KEY `säilik` (`säilik`) USING BTREE,
  KEY `fond` (`fond`),
  CONSTRAINT `kirjete_toimikud_ibfk_1` FOREIGN KEY (`kirjekood`) REFERENCES `kirjed` (`kirjekood`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `log_msg`
--

CREATE TABLE `log_msg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `k` varchar(255) COLLATE utf8_estonian_ci DEFAULT '',
  `msg` varchar(255) COLLATE utf8_estonian_ci DEFAULT '',
  `src` varchar(25) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `usr` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `tm` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `Index 2` (`src`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `massuuendused`
--

CREATE TABLE `massuuendused` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `valmis` timestamp NULL DEFAULT NULL,
  `ülesanne` text CHARACTER SET utf8 DEFAULT NULL,
  `SQL` text CHARACTER SET utf8 DEFAULT NULL,
  `silt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `lipik` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `my_desktop`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `kirjekood`,
  1 AS `valmis`,
  1 AS `jutt`,
  1 AS `perenimi`,
  1 AS `eesnimi`,
  1 AS `isanimi`,
  1 AS `emanimi`,
  1 AS `sünd`,
  1 AS `sünnikoht`,
  1 AS `surm`,
  1 AS `surmakoht`,
  1 AS `matmisaeg`,
  1 AS `elukoht`,
  1 AS `matmiskoht`,
  1 AS `surma põhjus`,
  1 AS `Peatatud`,
  1 AS `EiArvesta`,
  1 AS `lipik`,
  1 AS `lipikud`,
  1 AS `silt`,
  1 AS `sildid`,
  1 AS `kirje`,
  1 AS `legend`,
  1 AS `välisviide`,
  1 AS `allikas`,
  1 AS `EkslikKanne`,
  1 AS `Kustuta`,
  1 AS `created_at`,
  1 AS `created_by` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nimekirjad`
--

CREATE TABLE `nimekirjad` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL,
  `isPerson` bit(1) NOT NULL DEFAULT b'0',
  `kivi` bit(1) NOT NULL DEFAULT b'0',
  `emem` bit(1) NOT NULL DEFAULT b'1',
  `evo` bit(1) NOT NULL DEFAULT b'0',
  `wwiiref` bit(1) NOT NULL DEFAULT b'0',
  `kirjed` longtext COLLATE utf8_estonian_ci NOT NULL DEFAULT '[]',
  `pereseosed` longtext COLLATE utf8_estonian_ci NOT NULL DEFAULT '[]',
  PRIMARY KEY (`persoon`) USING BTREE,
  CONSTRAINT `FK_nimekirjad_repis.kirjed` FOREIGN KEY (`persoon`) REFERENCES `kirjed` (`kirjekood`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (json_valid(`kirjed`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='Persoonide kuulumine erinevatesse avaldatud nimekirjadesse';

--
-- Temporary table structure for view `persoonide_represseerimised`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `kirje`,
  1 AS `kirjekood`,
  1 AS `repressioon`,
  1 AS `kp` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `persoonikirjed`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `perenimi`,
  1 AS `eesnimi`,
  1 AS `isanimi`,
  1 AS `emanimi`,
  1 AS `sünd`,
  1 AS `surm`,
  1 AS `kirjed`,
  1 AS `group_concat(distinct ks.silt)` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `r86persoonid`
--

CREATE TABLE `r86persoonid` (
  `persoonikood` varchar(255) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`persoonikood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `represseerimised`
--

CREATE TABLE `represseerimised` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `repressioon` enum('Arreteerimine','Küüditamine','Mitteküüditatud') COLLATE utf8_estonian_ci NOT NULL DEFAULT 'Arreteerimine',
  `kp` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kirjekood` (`kirjekood`,`repressioon`,`kp`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Temporary table structure for view `represseeritud`
--

SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
 1 AS `persoon`,
  1 AS `kirjekood`,
  1 AS `Kirjed`,
  1 AS `Perenimi`,
  1 AS `Eesnimi`,
  1 AS `Isanimi`,
  1 AS `Emanimi`,
  1 AS `Sünd`,
  1 AS `repressioonid`,
  1 AS `Surm`,
  1 AS `Sildid`,
  1 AS `Lipikud`,
  1 AS `RaamatuPere`,
  1 AS `LeidPere`,
  1 AS `Sugu`,
  1 AS `Rahvus`,
  1 AS `Välisviide`,
  1 AS `Kommentaar`,
  1 AS `Puudulik`,
  1 AS `EkslikKanne`,
  1 AS `Peatatud`,
  1 AS `EiArvesta`,
  1 AS `kustuta`,
  1 AS `legend` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `seosed`
--

CREATE TABLE `seosed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kirjekood1` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `seos` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `vastasseos` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  `kirjekood2` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kirjekood1` (`kirjekood1`,`seos`,`vastasseos`,`kirjekood2`),
  KEY `seos` (`seos`),
  KEY `vastasseos` (`vastasseos`),
  KEY `kirjekood2` (`kirjekood2`),
  KEY `kirjekood1_2` (`kirjekood1`,`kirjekood2`,`seos`),
  CONSTRAINT `seosed_ibfk_1` FOREIGN KEY (`seos`) REFERENCES `c_seoseliigid` (`seoseliik`) ON UPDATE CASCADE,
  CONSTRAINT `seosed_ibfk_4` FOREIGN KEY (`vastasseos`) REFERENCES `c_seoseliigid` (`seoseliik`) ON UPDATE CASCADE,
  CONSTRAINT `seosed_ibfk_5` FOREIGN KEY (`kirjekood1`) REFERENCES `kirjed` (`kirjekood`) ON UPDATE CASCADE,
  CONSTRAINT `seosed_ibfk_6` FOREIGN KEY (`kirjekood2`) REFERENCES `kirjed` (`kirjekood`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `sugulased`
--

CREATE TABLE `sugulased` (
  `persoon` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `seos` varchar(25) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `sugulane` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `created_by` varchar(20) COLLATE utf8_estonian_ci NOT NULL DEFAULT '-',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`persoon`,`seos`,`sugulane`),
  KEY `sugulane` (`sugulane`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
DELIMITER ;;

	CALL pub.2pub(new.persoon);
	CALL pub.2pub(new.sugulane);

END */;;
DELIMITER ;
DELIMITER ;;

	CALL pub.2pub(new.persoon);
	CALL pub.2pub(new.sugulane);

END */;;
DELIMITER ;

--
-- Table structure for table `v_kirjelipikud`
--

CREATE TABLE `v_kirjelipikud` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `lipik` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `aeg` varchar(21) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_by` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kirjekood`,`lipik`,`aeg`,`deleted_at`),
  KEY `lipik` (`lipik`),
  CONSTRAINT `v_kirjelipikud_ibfk_1` FOREIGN KEY (`lipik`) REFERENCES `c_lipikud` (`lipik`),
  CONSTRAINT `v_kirjelipikud_ibfk_2` FOREIGN KEY (`kirjekood`) REFERENCES `kirjed` (`kirjekood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `v_kirjesildid`
--

CREATE TABLE `v_kirjesildid` (
  `kirjekood` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `silt` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_by` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`kirjekood`,`silt`,`deleted_at`),
  KEY `silt` (`silt`),
  CONSTRAINT `v_kirjesildid_ibfk_1` FOREIGN KEY (`silt`) REFERENCES `c_sildid` (`silt`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `v_kirjesildid_ibfk_2` FOREIGN KEY (`kirjekood`) REFERENCES `kirjed` (`kirjekood`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `z_datefix`
--

CREATE TABLE `z_datefix` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `re` varchar(255) COLLATE utf8_estonian_ci NOT NULL DEFAULT '^[0-9]{4}\\\\-[0-9]{2}\\\\-[0-9]{2}$',
  `sep` char(1) COLLATE utf8_estonian_ci NOT NULL DEFAULT '-',
  `y` tinyint(4) NOT NULL DEFAULT 1,
  `m` tinyint(4) NOT NULL DEFAULT 2,
  `d` tinyint(4) NOT NULL DEFAULT 3,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Table structure for table `z_queue`
--

CREATE TABLE `z_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kirjekood1` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `kirjekood2` char(10) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `task` varchar(50) COLLATE utf8_estonian_ci NOT NULL,
  `params` varchar(500) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(50) COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `erred_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `msg` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kirjekood1` (`kirjekood1`,`kirjekood2`,`task`,`params`,`erred_at`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Current Database: `repis`
--

USE `repis`;

--
-- Final view structure for view `RR_kanded`
--


--
-- Final view structure for view `a_persoonid`
--


--
-- Final view structure for view `kirjed_v`
--


--
-- Final view structure for view `my_desktop`
--


--
-- Final view structure for view `persoonide_represseerimised`
--


--
-- Final view structure for view `persoonikirjed`
--


--
-- Final view structure for view `represseeritud`
--


