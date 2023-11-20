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
-- Dumping routines for database 'pub'
--
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `2pub`(
	IN `in_persoon` CHAR(10)
)
proc_label: BEGIN
  -- CALL repis.log_msg(NOW(), in_persoon, '2pub in');

  SELECT persoon INTO @real_persoon FROM repis.kirjed WHERE kirjekood = in_persoon;

  --
  -- A: in_persoon is a reference record - lets work with the real person
  --
  IF in_persoon <> @real_persoon THEN
    SET @@SESSION.max_sp_recursion_depth = 1;
    CALL pub.2pub(@real_persoon);
    leave proc_label;
  END IF;

  --
  -- B: in_persoon is a real deal
  --
  SELECT MAX(kp.pub_isPerson)
      , MAX(kp.pub_emem)
      , MAX(kp.pub_wwiiref)
      , MAX(kp.pub_kivi)
      , MAX(kp.pub_evo)
      , MAX(kp.pub_mv)
    INTO @max_isPerson
      , @max_pub_emem
      , @max_pub_wwiiref
      , @max_pub_kivi
      , @max_pub_evo
      , @max_pub_mv
  FROM repis.kirjed kp
  WHERE kp.persoon = @real_persoon
  ;

  -- Reset all reference records of the person
  REPLACE into pub.nimekirjad (persoon, redirect, isPerson, emem, wwiiref, kivi, evo, mv) 
  SELECT k0.kirjekood, @real_persoon, @max_isPerson, @max_pub_emem, @max_pub_wwiiref, @max_pub_kivi, @max_pub_evo, @max_pub_mv
  FROM repis.kirjed k0 
  WHERE k0.persoon = @real_persoon
    AND k0.allikas = 'persoon' 
--  on duplicate key update
--    redirect = @real_persoon,
--    isPerson = @max_isPerson,
--    emem = @max_pub_emem,
--    wwiiref = @max_pub_wwiiref,
--    kivi = @max_pub_kivi,
--    evo = @max_pub_evo,
--    mv = @max_pub_mv
  ;

  SELECT kirje INTO @evo 
  FROM import.memoriaal_evo 
  WHERE persoon = @real_persoon;

  -- Reset main record of the person
  REPLACE INTO pub.nimekirjad (
    persoon, kirje, evokirje, perenimi, eesnimi, isanimi, emanimi
  , sünd, surm, sünnikoht, surmakoht
  , kirjed, pereseosed, tahvlikirje, episoodid
  , isPerson, emem, wwiiref, kivi, evo, mv
  ) 
  SELECT 
    in_persoon, kirje, @evo, perenimi, eesnimi, isanimi, emanimi
  , sünd, surm, sünnikoht, surmakoht
  , repis.json_persoonikirjed(persoon), JSON_ARRAY()
  , ifnull(repis.json_tahvlikirje(persoon), JSON_OBJECT())
  , repis.json_episoodid(persoon)
  , @max_isPerson, @max_pub_emem, @max_pub_wwiiref, @max_pub_kivi, @max_pub_evo, @max_pub_mv
    FROM repis.kirjed
    WHERE allikas = 'persoon'
      AND kirjekood = @real_persoon
      AND persoon = @real_persoon
  ;

  CALL pub.proc_sugulased_nimekirja(@real_persoon);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `proc_pereseosed_nimekirja`(
	IN `in_persoon` CHAR(10)
)
BEGIN
  DECLARE _persoon CHAR(10);
  DECLARE _pereliige CHAR(10);
  DECLARE _perekirje TEXT;
  DECLARE _perekirjekood CHAR(10);
  DECLARE _allikas VARCHAR(20);
  DECLARE _raamatupere VARCHAR(25);
  DECLARE _kirjed JSON;

  DECLARE finished INTEGER DEFAULT 0;
  DECLARE cur1 CURSOR for
      SELECT DISTINCT k0.persoon AS persoon
			, kp.persoon AS pereliige, kp.kirje AS perekirje, kp.kirjekood AS perekirjekood
      	, kp.allikas, kp.raamatupere
      FROM repis.kirjed k0
      LEFT JOIN repis.kirjed kp ON kp.raamatupere = k0.raamatupere
      WHERE k0.RaamatuPere IS NOT null
        AND k0.Allikas <> 'Persoon'
        AND kp.EkslikKanne = ''
        AND kp.Peatatud = ''
        AND kp.Puudulik = ''
        AND kp.Allikas <> 'Persoon'
        AND (k0.persoon = in_persoon OR in_persoon IS NULL)
      ORDER BY kp.kirjekood, kp.raamatupere, kp.persoon
	 ;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  
  OPEN cur1;
  read_loop: loop
    fetch cur1 INTO _persoon, _pereliige, _perekirje, _perekirjekood, _allikas, _raamatupere;
    IF finished = 1 THEN
      LEAVE read_loop;
    END IF;
    UPDATE pub.nimekirjad 
	    SET pereseosed = JSON_ARRAY_APPEND(
		   pereseosed, '$', JSON_OBJECT(
			  'persoon', _pereliige
			, 'kirje', _perekirje
			, 'kirjekood', _perekirjekood
			, 'allikas', _allikas
			, 'raamatupere', _raamatupere
		   )
		 )
	  WHERE persoon = _persoon;
  END LOOP;
  CLOSE cur1;
  SET finished = 0;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `proc_propagate_pub_kivi`()
BEGIN

      UPDATE repis.kirjed k0
  RIGHT JOIN repis.kirjed kpk ON kpk.persoon = k0.kirjekood
         SET k0.pub_kivi = 1
       WHERE kpk.pub_kivi
         AND NOT k0.pub_kivi
  ;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `proc_sugulased_nimekirja`(
	IN `in_persoon` CHAR(10)
)
BEGIN
  DECLARE _sugulane CHAR(10);
  DECLARE _seos VARCHAR(25);
  DECLARE _suund INT(2);
  DECLARE _kirje VARCHAR(250);
  DECLARE _kirjed JSON;

  DECLARE finished INTEGER DEFAULT 0;
  DECLARE cur1 CURSOR for
		SELECT 1 as suund, su.seos, su.sugulane, repis.func_person_text(su.sugulane), repis.json_persoonikirjed(su.sugulane)
		FROM repis.sugulased su
		RIGHT JOIN repis.kirjed k0 ON k0.persoon = su.persoon
		WHERE k0.kirjekood = in_persoon AND su.sugulane IS NOT null
		UNION all
		SELECT -1 as suund, su.seos, su.persoon, repis.func_person_text(su.persoon), repis.json_persoonikirjed(su.persoon)
		FROM repis.sugulased su
		RIGHT JOIN repis.kirjed k0 ON k0.persoon = su.sugulane
		WHERE k0.kirjekood = in_persoon AND su.persoon IS NOT null
		;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  
  -- CALL repis.log_msg(NOW(), in_persoon, 'PUB sugulased in');

  OPEN cur1;
  read_loop: loop
    fetch cur1 INTO _suund, _seos, _sugulane, _kirje, _kirjed;
    IF finished = 1 THEN
      LEAVE read_loop;
    END IF;

    IF _suund = -1 AND _seos = 'abikaasa' THEN
      ITERATE read_loop;
    END IF;
--    IF _suund = -1 AND left(_seos,1) = 'R' THEN
--      ITERATE read_loop;
--    END IF;
    IF _suund = -1 AND _seos IN ('ema', 'isa') THEN
      SET _seos = 'laps';
      SET _suund = 1;
    END IF;

    -- CALL repis.log_msg(NOW(), _sugulane, 'PUB sugulased loop');

    UPDATE pub.nimekirjad 
	    SET pereseosed = JSON_ARRAY_APPEND(
		   pereseosed, '$', JSON_OBJECT(
			  'persoon', _sugulane
			, 'seos', _seos
			, 'suund', _suund
			, 'kirje', _kirje
			, 'kirjed', json_extract(_kirjed, '$')
		   )
		 )
	  WHERE persoon = in_persoon;
  END LOOP;
  CLOSE cur1;
  SET finished = 0;
  -- CALL repis.log_msg(NOW(), in_persoon, 'PUB sugulased out');
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `repub`(
	IN `num_records` INT
)
BEGIN

  DECLARE _persoon CHAR(10);
  DECLARE finished INTEGER DEFAULT 0;
  DECLARE cur1 CURSOR for
      SELECT DISTINCT k0.kirjekood
      FROM repis.kirjed k0
      LEFT JOIN pub.nimekirjad p ON p.persoon = k0.persoon AND p.kirje <> ''
      WHERE k0.persoon > '0000000000'
      AND k0.allikas = 'persoon'
      AND p.kirje IS NOT null
		ORDER BY p.updated
		LIMIT num_records
	 ;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  
  OPEN cur1;
  read_loop: loop

    FETCH cur1 INTO _persoon;
    
    IF finished = 1 THEN
      LEAVE read_loop;
    END IF;

    CALL repis.proc_NK_refresh(_persoon, _persoon);

  END LOOP;
  CLOSE cur1;
  SET finished = 0;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `repub_all`()
BEGIN

  DECLARE _persoon CHAR(10);

  DECLARE finished INTEGER DEFAULT 0;
  DECLARE cur1 CURSOR for
      SELECT DISTINCT kirjekood
      FROM repis.kirjed
      WHERE persoon > '0000000000'
      AND allikas = 'persoon'
		ORDER BY kirjekood
	 ;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  
  OPEN cur1;
  read_loop: loop

    FETCH cur1 INTO _persoon;
    
    IF finished = 1 THEN
      LEAVE read_loop;
    END IF;

    CALL repis.proc_NK_refresh(_persoon);

  END LOOP;
  CLOSE cur1;
  SET finished = 0;

END ;;
DELIMITER ;

