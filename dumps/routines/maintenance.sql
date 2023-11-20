-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: maintenance
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `maintenance`
--


USE `maintenance`;

--
-- Dumping routines for database 'maintenance'
--
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `populate_sugu`()
BEGIN

 UPDATE repis.kirjed k0
-- SELECT * FROM  repis.kirjed k0
right join
(
  SELECT persoon, GROUP_CONCAT(distinct Sugu) sugu
  FROM repis.kirjed
  WHERE persoon > 0
  GROUP BY persoon
  HAVING LENGTH(sugu) > 1
) sood 
ON sood.persoon = k0.persoon
SET k0.Sugu = RIGHT(sood.sugu,1)
WHERE sood.sugu LIKE ',%'
;

UPDATE repis.kirjed k0
-- SELECT * FROM  repis.kirjed k0
right join
(
  SELECT persoon, GROUP_CONCAT(distinct Sugu) sugu
  FROM repis.kirjed
  WHERE persoon > 0
  GROUP BY persoon
  HAVING LENGTH(sugu) > 1
) sood 
ON sood.persoon = k0.persoon
 SET k0.Sugu = LEFT(sood.sugu,1)
WHERE sood.sugu LIKE '%,'
;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `update_wwiiref`(
	IN `in_persoon` CHAR(10)
)
BEGIN

  SELECT persoon 
  INTO @real_persoon 
  FROM repis.kirjed 
  WHERE kirjekood = in_persoon;

  SELECT MAX(pub_wwiiref)
  INTO @is_ref
  FROM repis.kirjed
  WHERE persoon = @real_persoon
  
  UPDATE repis.kirjed
  SET pub_wwiiref = @is_ref
  WHERE kirjekood = in_persoon;

END ;;
DELIMITER ;

