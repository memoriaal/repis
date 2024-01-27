-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: repis
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `repis`
--


USE `repis`;

--
-- Dumping routines for database 'repis'
--
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `backups.desktop_next_id`(
	`_allikas` VARCHAR(50)
) RETURNS char(10) CHARSET utf8
func_label:BEGIN

    SELECT lühend INTO @c FROM repis.allikad WHERE kood = _allikas;

    -- CALL log_msg('@c', @c);
    SET @max_k = NULL;
    SELECT ifnull(max(kirjekood), 0) INTO @max_k
    FROM repis.kirjed
    WHERE allikas = _allikas;
    -- CALL log_msg('@max_k', @max_k);

    SET @max_d = NULL;
    SELECT ifnull(max(kirjekood), 0) INTO @max_d
    FROM repis.desktop
    WHERE allikas = _allikas;
    -- CALL log_msg('@max_d', @max_d);

    SET @id = lpad(
      RIGHT(IF(@max_k >= @max_d, @max_k, @max_d), 9-length(@c)) + 1,
      10,
      if(_allikas = 'Persoon',
        rpad('0', 10, '0'),
        concat_ws('-', @c, rpad('0', 9-length(@c), '0'))
      )
    );
    -- CALL log_msg('@id', @id);

    RETURN @id;
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `desktop_next_id`(
	`_allikas` VARCHAR(50)
) RETURNS char(10) CHARSET utf8
func_label:BEGIN

    SELECT lühend INTO @c FROM repis.allikad WHERE kood = _allikas;

    -- CALL log_msg('@c', @c);
    SELECT ifnull(max(kirjekood), 0) INTO @max_k -- suurim selle allika kirjekood tabelis 'kirjed'
    FROM repis.kirjed
    WHERE allikas = _allikas;

    SELECT ifnull(max(kirjekood), 0) INTO @max_d -- suurim selle allika kirjekood tabelis 'desktop'
    FROM repis.desktop
    WHERE allikas = _allikas;
    -- CALL log_msg('@max_d', @max_d);
    
    SET @max_id = IF(@max_k >= @max_d, @max_k, @max_d);
    SET @num_of_digits = IF(@c = '', 10, 9-LENGTH(@c));
    SET @next_id = RIGHT(@max_id, @num_of_digits) + 1;
    SET @next_id_char = LPAD(@next_id, @num_of_digits, '0');
    
    RETURN RIGHT(CONCAT(@c, '-', @next_id_char), 10);

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `desktop_person_text`(
	`in_perenimi` VARCHAR(50),
	`in_eesnimi` VARCHAR(50),
	`in_isanimi` VARCHAR(50),
	`in_emanimi` VARCHAR(50),
	`in_sünd` VARCHAR(50),
	`in_surm` VARCHAR(50),
	`in_sünnikoht` VARCHAR(100),
	`in_surmakoht` VARCHAR(100)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    RETURN concat_ws('. ',
      concat_ws(', ',
        if(in_perenimi = '', NULL, in_perenimi),
        if(in_eesnimi  = '', NULL, in_eesnimi),
        if(in_isanimi  = '', NULL, CONCAT('isa ', in_isanimi)),
        if(in_emanimi  = '', NULL, CONCAT('ema ', in_emanimi))
      ),
      if(in_sünd       = '', NULL, CONCAT_WS(', ',
		   CONCAT('Sünd ', in_sünd),
			if(in_sünnikoht = '', NULL, in_sünnikoht)
		)),
      if(in_surm       = '', NULL, CONCAT_WS(', ', 
		   CONCAT('Surm ', in_surm),
			if(in_surmakoht = '', NULL, in_surmakoht)
		))
    );

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `emadisad_next_id`(
      _ei CHAR(1)
  ) RETURNS char(8) CHARSET utf8
func_label:BEGIN
    RETURN concat(_ei, LPAD(repis.func_next_id(_ei), 7, '0'));
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_aastad`(
	`aasta1` CHAR(4),
	`aasta2` CHAR(4)
) RETURNS char(9) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

	DECLARE aastad CHAR(9);
	SET aasta2 = IFNULL(aasta2, '');
	SET aasta2 = if(aasta2 = '', '†', aasta2);
	SELECT CONCAT(aasta1, '–', aasta2) INTO aastad;      
	RETURN aastad;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_capital_case`(
	`in_str` VARCHAR(255)
) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
 RETURN CONCAT(UPPER(SUBSTRING(in_str,1,1)),SUBSTRING(in_str,2));
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_ISO2ppkkaa`(
	`ISO_date` VARCHAR(100)
) RETURNS char(8) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
   SET @txt = LEFT(ISO_date, 10);
	RETURN CONCAT_WS( '.'
           , RIGHT(@txt, 2)
           , LEFT( RIGHT(@txt, 5), 2)
           , RIGHT( LEFT(@txt, 4), 2)
           );
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `func_kirje2persoon`(
      _kirjekood CHAR(10)
  ) RETURNS char(10) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SET @persoon = NULL;

    SELECT persoon INTO @persoon
    FROM repis.kirjed
    WHERE kirjekood = _kirjekood;

    RETURN @persoon;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `func_kirjelipikud`(
      _kirjekood CHAR(10)
  ) RETURNS text CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SET @omad_lipikud = NULL, @teiste_lipikud = NULL;

    SELECT GROUP_CONCAT(kl.lipik SEPARATOR '; ') INTO @omad_lipikud
    FROM repis.v_kirjelipikud kl
    RIGHT JOIN repis.kirjed k ON k.kirjekood = kl.kirjekood
    RIGHT JOIN repis.kirjed k0 ON k0.persoon = k.persoon
    WHERE k0.kirjekood = _kirjekood
    AND kl.deleted_at = '0000-00-00 00:00:00'
    AND kl.kirjekood = k0.kirjekood
    GROUP BY kl.kirjekood;

    SELECT GROUP_CONCAT(concat_ws(':', k.kirjekood, kl.lipik) SEPARATOR '; ') INTO @teiste_lipikud
    FROM repis.v_kirjelipikud kl
    RIGHT JOIN repis.kirjed k ON k.kirjekood = kl.kirjekood
    RIGHT JOIN repis.kirjed k0 ON k0.persoon = k.persoon
    WHERE k0.kirjekood = _kirjekood
    AND kl.deleted_at = '0000-00-00 00:00:00'
    GROUP BY k0.persoon;

    RETURN concat_ws('\n', @omad_lipikud, @teiste_lipikud);

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `func_kirjesildid`(
      _kirjekood CHAR(10)
  ) RETURNS text CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SET @omad_sildid = NULL, @teiste_sildid = NULL;

    SELECT GROUP_CONCAT(ks.silt SEPARATOR '; ') INTO @omad_sildid
    FROM repis.v_kirjesildid ks
    RIGHT JOIN repis.kirjed k ON k.kirjekood = ks.kirjekood
    RIGHT JOIN repis.kirjed k0 ON k0.persoon = k.persoon
    WHERE k0.kirjekood = _kirjekood
    AND ks.deleted_at = '0000-00-00 00:00:00'
    AND ks.kirjekood = k0.kirjekood
    GROUP BY ks.kirjekood;

    SELECT GROUP_CONCAT(concat_ws(':', k.kirjekood, ks.silt) SEPARATOR '; ') INTO @teiste_sildid
    FROM repis.v_kirjesildid ks
    RIGHT JOIN repis.kirjed k ON k.kirjekood = ks.kirjekood
    RIGHT JOIN repis.kirjed k0 ON k0.persoon = k.persoon
    WHERE k0.kirjekood = _kirjekood
    AND ks.deleted_at = '0000-00-00 00:00:00'
    GROUP BY k0.persoon;

    RETURN concat_ws('\n', @omad_sildid, @teiste_sildid);

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_kivitekst`(
	`_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    DECLARE _persoon CHAR(10);
    DECLARE persoon_text VARCHAR(2000);

	 SELECT persoon
	 INTO _persoon
	 FROM repis.kirjed
	 WHERE kirjekood = _kirjekood;

    SELECT concat_ws(' ',
        IF(eesnimi  = '', NULL, trim(eesnimi)),
        IF(perenimi = '', NULL, trim(perenimi)),
        concat_ws('–',
            LEFT(sünd, 4),
            if(surm='', '†', LEFT(surm, 4))
        ),
        CONCAT('[', import.kiviaadress(_kirjekood), ']')
    )
    INTO persoon_text
    FROM repis.kirjed
    WHERE persoon = _persoon AND kirjekood = _persoon;

    RETURN persoon_text;
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_new_kirjekood`(
	`allikas_in` VARCHAR(10)
) RETURNS char(10) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
  SELECT MAX(kirjekood) INTO @mkood FROM repis.kirjed WHERE allikas = allikas_in;
  SELECT SUBSTRING_INDEX(@mkood,'-',1) INTO @lcode;
  SELECT SUBSTRING_INDEX(@mkood,'-',-1) INTO @rcode;
  SELECT LENGTH(@rcode) INTO @clen;
  SELECT CONCAT_WS('-', @lcode, LPAD(@rcode+1, @clen, '0')) INTO @ukood;
  return @ukood;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `func_next_id`(
	`in_name` VARCHAR(20)
) RETURNS int(10) unsigned
func_label:BEGIN

    DECLARE _ret_val INT(10) UNSIGNED;

    INSERT INTO repis.counter (id, value) VALUES (in_name, 1)
    ON DUPLICATE KEY UPDATE value = value + 1;

    SELECT value INTO _ret_val FROM repis.counter WHERE id = in_name;

    RETURN _ret_val;
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_order_est`(
	`_word` VARCHAR(100)
) RETURNS varchar(200) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN

    DECLARE i INTEGER;
    DECLARE _out VARCHAR(200);
    SET i = 0;
    SET _out = '';

    SET _out = UPPER(_word);

    SET _out = REPLACE(_out, ' ', '00');
    SET _out = REPLACE(_out, '-', '00');
    SET _out = REPLACE(_out, 'A', '01');
    SET _out = REPLACE(_out, 'B', '02');
    SET _out = REPLACE(_out, 'C', '03');
    SET _out = REPLACE(_out, 'D', '04');
    SET _out = REPLACE(_out, 'E', '05');
    SET _out = REPLACE(_out, 'F', '06');
    SET _out = REPLACE(_out, 'G', '07');
    SET _out = REPLACE(_out, 'H', '08');
    SET _out = REPLACE(_out, 'I', '09');
    SET _out = REPLACE(_out, 'J', '10');
    SET _out = REPLACE(_out, 'K', '11');
    SET _out = REPLACE(_out, 'L', '12');
    SET _out = REPLACE(_out, 'M', '13');
    SET _out = REPLACE(_out, 'N', '14');
    SET _out = REPLACE(_out, 'O', '15');
    SET _out = REPLACE(_out, 'P', '16');
    SET _out = REPLACE(_out, 'Q', '17');
    SET _out = REPLACE(_out, 'R', '18');
    SET _out = REPLACE(_out, 'S', '19');
    SET _out = REPLACE(_out, 'Š', '20');
    SET _out = REPLACE(_out, 'Z', '21');
    SET _out = REPLACE(_out, 'Ž', '22');
    SET _out = REPLACE(_out, 'T', '23');
    SET _out = REPLACE(_out, 'U', '24');
    SET _out = REPLACE(_out, 'V', '25');
    SET _out = REPLACE(_out, 'W', '26');
    SET _out = REPLACE(_out, 'Õ', '27');
    SET _out = REPLACE(_out, 'Ä', '28');
    SET _out = REPLACE(_out, 'Ö', '29');
    SET _out = REPLACE(_out, 'Ü', '30');
    SET _out = REPLACE(_out, 'X', '31');
    SET _out = REPLACE(_out, 'Y', '32');    

    RETURN(_out);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `func_person_text`(
	`_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    DECLARE person_text VARCHAR(2000);

    if LEFT(_kirjekood, 4) = 'ELK-' then
      -- see on jamps - elk kirjete puhul ei peaks siia sattumagi
      SELECT kirje INTO person_text FROM import.el_kart WHERE kirjekood = _kirjekood;
      
    ELSE
     SELECT concat_ws('. ',
      concat_ws(', ',
        if(perenimi = '', NULL, perenimi),
        if(eesnimi  = '', NULL, eesnimi),
        if(isanimi  = '', NULL, concat('isa ', isanimi)),
        if(emanimi  = '', NULL, concat('ema ', emanimi))
      ),

      if(sünd       = '', NULL, CONCAT_WS(', ',
		   concat('Sünd ', sünd),
		   if(sünnikoht = '', NULL, sünnikoht)
		)),

      if(surm       = '', NULL, CONCAT_WS(', ',
		   concat('Surm ', surm),
		   if(surmakoht = '', NULL, surmakoht)
		))
     )
     INTO person_text
     FROM repis.kirjed
     WHERE kirjekood = _kirjekood;
    END if;

    RETURN person_text;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `func_persoonikirjed`(
      _persoonid VARCHAR(1000)
  ) RETURNS varchar(4000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    DECLARE _rval VARCHAR(4000) DEFAULT NULL;
    DECLARE _ret_val VARCHAR(4000) DEFAULT NULL;
    DECLARE _persoon CHAR(10) DEFAULT NULL;

    do_this: LOOP
      SET _persoon = SUBSTRING_INDEX(_persoonid, ',', 1);

      SELECT group_concat(k0.kirjekood, ': ', k0.kirje SEPARATOR '\n') INTO _rval
      FROM repis.kirjed k0
      WHERE k0.persoon = _persoon
      GROUP BY k0.persoon;

      SET _ret_val = concat_ws('\n==\n', _ret_val, _rval);

      SET _persoonid = SUBSTRING(_persoonid, 12);

      IF _persoonid = '' THEN
        LEAVE do_this;
      END IF;
    END LOOP do_this;

    RETURN replace(_ret_val, '\r', '');
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`localhost` FUNCTION `func_proper`( str VARCHAR(255) ) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
      DECLARE chr VARCHAR(1) DEFAULT ' ';
      DECLARE lStr VARCHAR(255) DEFAULT '';
      DECLARE oStr VARCHAR(255) DEFAULT '';
      DECLARE i INT DEFAULT 1;
      DECLARE bool INT DEFAULT 1;

      WHILE i <= LENGTH( str ) DO
        BEGIN
          SET chr = SUBSTRING( str, i, 1 );
          IF LOCATE( chr, punct ) > 0 THEN
            BEGIN
              SET bool = 1;
              SET oStr = concat(oStr, chr);
            END;
          ELSEIF bool=1 THEN
            BEGIN
              SET oStr = concat(oStr, UCASE(chr));
              SET bool = 0;
            END;
          ELSE
            BEGIN
              SET oStr = concat(oStr, LCASE(chr));
            END;
          END IF;
          SET i = i+1;
        END;
      END WHILE;

      RETURN oStr;
    END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_rr_aadress`(
	`_aadress` VARCHAR(500)
) RETURNS varchar(500) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

   RETURN REGEXP_REPLACE(
				  REGEXP_REPLACE(_aadress, '\\|+', ', ')
				, ', $', '');

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_rr_normalize_text`(
	`text_in` VARCHAR(255)
) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

	DECLARE ostr VARCHAR(255);
	
	SET ostr = text_in;
	
	SET ostr = REGEXP_REPLACE(ostr, '\\\\', '');
	SET ostr = REGEXP_REPLACE(ostr, 'Ã•', 'Õ');
	SET ostr = REGEXP_REPLACE(ostr, 'Ã„', 'Ä');
	SET ostr = REGEXP_REPLACE(ostr, 'Ãœ', 'Ü');
	
   RETURN ostr;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_TS_KirjePersoon`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
  SELECT CONCAT_WS( ', '
   , nullif(k0.Perenimi, '')
   , nullif(k0.Eesnimi, '')
   , if(k0.Isanimi = '', NULL, CONCAT('isa ', k0.Isanimi))
   , if(k0.Emanimi = '', NULL, CONCAT('ema ', k0.Emanimi))
   , if( (k0.Sünd = '' AND k0.Sünnikoht = '')
	    , NULL
	    , CONCAT ( 'sünd '
			 , CONCAT_WS( ', '
	                  , if(k0.sünd = '', NULL, k0.sünd)
	                  , if(k0.sünnikoht = '', NULL, k0.sünnikoht)
	                  )
	       )
	   )
   , if( (k0.Surm = '' AND k0.Surmakoht = '')
	    , NULL
	    , CONCAT ( 'surm '
			 , CONCAT_WS( ', '
	                  , if(k0.surm = '', NULL, k0.surm)
	                  , if(k0.surmakoht = '', NULL, k0.surmakoht)
	                  )
	       )
	   )
    )
    INTO @kirje_persoon
  FROM repis.kirjed k0
  WHERE k0.kirjekood = in_kirjekood;
  
  SET @kirje_persoon = CONCAT(UCASE(LEFT(@kirje_persoon, 1)), SUBSTRING(@kirje_persoon, 2));
                             
  RETURN @kirje_persoon;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_unrepeat`(
      _word VARCHAR(100)
  ) RETURNS varchar(100) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN

      DECLARE i INTEGER;
      DECLARE _out VARCHAR(100);
      SET i = 0;
      SET _out = '';

    SET _word = UPPER(_word);

      SET _word = REPLACE(_word, ' ', '');
      SET _word = REPLACE(_word, '-', '');
      SET _word = REPLACE(_word, 'TH', 'T');
      SET _word = REPLACE(_word, 'SH', 'S');
      SET _word = REPLACE(_word, 'CH', 'S');
      SET _word = REPLACE(_word, 'ZH', 'Z');
      SET _word = REPLACE(_word, 'TZ', 'Z');
      -- IF _level = 'hard' THEN
        SET _word = REPLACE(_word, 'S' , 'S');
        SET _word = REPLACE(_word, 'W' , 'V');
        SET _word = REPLACE(_word, 'Z' , 'S');
        SET _word = REPLACE(_word, 'Ž' , 'S');
        SET _word = REPLACE(_word, 'C' , 'S');
        SET _word = REPLACE(_word, 'A', 'A');
        SET _word = REPLACE(_word, 'E', 'A');
        SET _word = REPLACE(_word, 'I', 'A');
        SET _word = REPLACE(_word, 'O', 'A');
        SET _word = REPLACE(_word, 'U', 'A');
        SET _word = REPLACE(_word, 'Õ', 'A');
        SET _word = REPLACE(_word, 'Ä', 'A');
        SET _word = REPLACE(_word, 'Ö', 'A');
        SET _word = REPLACE(_word, 'Ü', 'A');
      -- END IF;

      myloop: WHILE (i <= LENGTH(_word)) DO
            SET _out = concat(_out, SUBSTRING(_word, i, 1));
          END IF;
          SET i = i + 1;
      END WHILE;

      RETURN(_out);

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `json_episoodid`(
	`in_persoon` CHAR(10)
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
  DECLARE _ret JSON;

  DECLARE _kirjekood CHAR(10);
  DECLARE _aeg CHAR(10);
  DECLARE _asukoht VARCHAR(100);
  DECLARE _episood VARCHAR(50);
  DECLARE _episoodi_väärtus VARCHAR(255);

  DECLARE finished INTEGER DEFAULT 0;
  DECLARE cur1 CURSOR for
	SELECT ep.kirjekood, ep.aeg, ak.Nimetus, ep.Nimetus, ep.väärtus
	FROM repis.kirjed k0
	LEFT JOIN repis.episoodid ep ON ep.kirjekood = k0.kirjekood
	LEFT JOIN repis.asukohad ak ON ak.id = ep.Asukoht
	WHERE persoon = in_persoon
	AND ep.Nimetus IS NOT null
   ORDER BY ep.aeg, ep.Nimetus 
	; 
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  
  SET _ret = JSON_ARRAY();
  OPEN cur1;
  read_loop: loop
    fetch cur1 INTO _kirjekood, _aeg, _asukoht, _episood, _episoodi_väärtus;
    IF finished = 1 THEN
      LEAVE read_loop;
    END IF;
    SET _ret = JSON_ARRAY_APPEND(_ret, '$', JSON_OBJECT(
	   "kirjekood", _kirjekood,
		"aeg", _aeg,
		"asukoht", _asukoht,
		"nimetus", _episood,
		"väärtus", _episoodi_väärtus
	 ));
  END LOOP;
  CLOSE cur1;
  SET finished = 0;
  
  RETURN _ret;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `json_pereseosed`(
	`_persoon` CHAR(10)
) RETURNS longtext CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
  DECLARE _p_persoon CHAR(10);
  DECLARE _pere JSON;
  DECLARE _kirje TEXT;
  DECLARE _ret JSON;

  DECLARE finished INTEGER DEFAULT 0;
  DECLARE cur1 CURSOR for
    SELECT DISTINCT k0.persoon, repis.func_person_text(k0.persoon), repis.json_persoonikirjed(k0.persoon)
    FROM repis.kirjed k0
    RIGHT JOIN repis.kirjed kp ON kp.raamatupere = k0.raamatupere 
	                           AND kp.persoon <> k0.persoon
    WHERE kp.persoon = _persoon
      AND kp.RaamatuPere IS NOT null
      AND k0.EkslikKanne = ''
      AND k0.Peatatud = ''
      AND k0.Puudulik = ''
	 ; 
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  
  SET _ret = JSON_ARRAY();
  OPEN cur1;
  read_loop: loop
    fetch cur1 INTO _p_persoon, _kirje, _pere;
    IF finished = 1 THEN
      LEAVE read_loop;
    END IF;
    SET _ret = JSON_ARRAY_APPEND(_ret, '$', JSON_OBJECT(
	   "persoon", _p_persoon,
	   "kirje", _kirje,
		"kirjed", json_extract(_pere, '$')
	 ));
  END LOOP;
  CLOSE cur1;
  SET finished = 0;
  
  RETURN _ret;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `json_persoonikirjed`(
	`in_persoon` CHAR(10)
) RETURNS longtext CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
  DECLARE _kirjekood CHAR(10);
  DECLARE _kirje TEXT;
  DECLARE _viide VARCHAR(2000);
  DECLARE _ret JSON;
  DECLARE _allikas VARCHAR(255);
  DECLARE _allika_nimetus VARCHAR(255);
  DECLARE finished INTEGER DEFAULT 0;
  DECLARE cur1 CURSOR for
    SELECT k0.kirjekood, k0.kirje, k0.Välisviide, a.Allikas, a.Nimetus
    FROM repis.kirjed k0
    LEFT JOIN repis.allikad a ON a.Kood = k0.Allikas
    WHERE k0.persoon = in_persoon
      AND a.nonPerson = 0
      AND k0.EkslikKanne = ''
      AND k0.Peatatud = ''
      AND k0.Puudulik = ''
    ORDER BY a.prioriteetKirje DESC
	 ; 
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
  
  SET _ret = JSON_ARRAY();
  OPEN cur1;
  read_loop: loop
    fetch cur1 INTO _kirjekood, _kirje, _viide, _allikas, _allika_nimetus;
    IF finished = 1 THEN
      LEAVE read_loop;
    END IF;
    SET _ret = JSON_ARRAY_APPEND(_ret, '$', JSON_OBJECT(
	   "kirjekood", _kirjekood,
		"kirje", _kirje,
		"viide", _viide,
		"allikas", _allikas,
		"allika_nimetus", _allika_nimetus
	 ));
  END LOOP;
  CLOSE cur1;
  SET finished = 0;
  
  RETURN _ret;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `json_tahvlikirje`(
	`in_persoon` CHAR(10)
) RETURNS longtext CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
  DECLARE _persoon CHAR(10);
  DECLARE _kirjekood CHAR(10);
  DECLARE _ret JSON;
  
  SET _persoon = repis.func_kirje2persoon(in_persoon);
  
  SELECT kirjekood INTO _kirjekood
    FROM repis.kirjed
   WHERE persoon = _persoon
     AND allikas = 'KIVI';

  SELECT JSON_OBJECT(
      'kirjekood', kirjekood, 'kirje', kirje
	 , 'eesnimi', eesnimi, 'perenimi', perenimi, 'isanimi', isanimi, 'aastad', aastad
	 , 'tahvel', tahvel, 'tiib', tiib, 'tahvlinr', tahvlinr, 'tulp', tulp, 'rida', rida) INTO _ret
    FROM import.memoriaal_kivitahvlid
   WHERE kirjekood = _kirjekood;
  
  if _ret is NULL
  then
    SELECT max(pub_kivi) INTO @pub_kivi FROM repis.kirjed WHERE persoon = in_persoon;
    if @pub_kivi
    then
      SELECT JSON_OBJECT(
          'kirjekood', kirjekood, 'kirje', repis.func_kivitekst(_persoon)
        , 'eesnimi', eesnimi, 'perenimi', perenimi, 'isanimi', isanimi, 'aastad', repis.func_aastad(left(sünd,4), left(surm,4))
        , 'tahvel', 'X', 'tiib', 'L') INTO _ret
        FROM repis.kirjed
       WHERE kirjekood = _persoon;
    END if;
  END if;
  
  RETURN _ret;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_std_persoon`(
	`_perenimi` VARCHAR(50),
	`_eesnimi` VARCHAR(50),
	`_isanimi` VARCHAR(50),
	`_emanimi` VARCHAR(50),
	`_sünd` VARCHAR(50),
	`_surm` VARCHAR(50),
	`_sünnikoht` VARCHAR(500),
	`_surmakoht` VARCHAR(500)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
    NO SQL
BEGIN
    RETURN concat_ws('. ',
      concat_ws(', ',
        if(_perenimi = '', NULL, _perenimi),
        if(_eesnimi  = '', NULL, _eesnimi),
        if(_isanimi  = '', NULL, concat('isa ', _isanimi)),
        if(_emanimi  = '', NULL, concat('ema ', _emanimi))
      ),
      if(_sünd='' AND _sünnikoht='', NULL,
        concat_ws(', ',
          if(_sünd      ='', NULL, concat('Sünd: ', _sünd)),
          if(_sünnikoht ='', NULL, repis.func_rr_aadress(_sünnikoht))
        )
      ),
      if(_surm='' AND _surmakoht='', NULL,
        concat_ws(', ',
          if(_surm      ='', NULL, concat('Surm: ', _surm)),
          if(_surmakoht ='', NULL, repis.func_rr_aadress(_surmakoht))
        )
      )
    );
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` FUNCTION `leidperelaud_next_id`() RETURNS int(10) unsigned
func_label:BEGIN

    SET @max_k = NULL;
    SELECT max(LeidPere) INTO @max_k
    FROM repis.kirjed;

    SET @max_d = NULL;
    SELECT max(LeidPere) INTO @max_d
    FROM repis.leidperelaud;

    RETURN if(@max_d < @max_k, @max_k + 1, @max_d + 1);
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `aggr_kirjed`(IN _kirjekood CHAR(10))
proc_label:BEGIN

    SET @persoon = NULL, @kirjed = NULL;

    SELECT k.persoon, group_concat(concat(vk.kirjekood, ': ', vk.kirje) SEPARATOR '\n') AS Kirjed
    INTO @persoon, @kirjed
    FROM repis.kirjed k
    WHERE k.kirjekood = _kirjekood;

    IF @kirjed IS NULL THEN
      DELETE FROM repis.a_kirjed WHERE Persoon = @persoon;
    ELSE
      INSERT INTO repis.a_kirjed (persoon, kirjed)
      VALUES (@persoon, @kirjed)
      ON DUPLICATE KEY UPDATE persoon = @persoon, kirjed = @kirjed;
    END IF;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `aggr_lipikud`(IN _kirjekood CHAR(10))
proc_label:BEGIN

    SET @persoon = NULL, @lipikud = NULL;

    SELECT k.persoon, group_concat(DISTINCT vl.lipik SEPARATOR '; \n') AS Lipikud
    INTO @persoon, @lipikud
    FROM repis.v_kirjelipikud vl
    RIGHT JOIN repis.kirjed k ON vl.kirjekood IN (k.kirjekood, k.persoon)
    WHERE k.kirjekood = _kirjekood;

    IF @lipikud IS NULL THEN
      DELETE FROM repis.a_lipikud WHERE Persoon = @persoon;
    ELSE
      INSERT INTO repis.a_lipikud (persoon, lipikud)
      VALUES (@persoon, @lipikud)
      ON DUPLICATE KEY UPDATE persoon = @persoon, lipikud = @lipikud;
    END IF;

    -- CALL repis.aggr_persoonid(@persoon);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `aggr_persoonid`(IN _persoon CHAR(10))
proc_label:BEGIN

    SELECT kn.persoon, kn.perenimi, kn.eesnimi, kn.isanimi, kn.emanimi, kn.sünd, kn.surm
         , k.kirjed AS Kirjed
         , l.lipikud AS Lipikud
         , s.sildid AS Sildid
    INTO @persoon, @perenimi, @eesnimi, @isanimi, @emanimi, @sünd, @surm
         , @kirjed, @lipikud, @sildid
    FROM kirjed kn
    LEFT JOIN a_kirjed k ON k.persoon = kn.persoon
    LEFT JOIN a_lipikud l ON l.persoon = kn.persoon
    LEFT JOIN a_sildid s ON s.persoon = kn.persoon
    WHERE kn.kirjekood = _persoon;

    INSERT INTO repis.a_persoonid
    VALUES (@persoon, @perenimi, @eesnimi
         , @isanimi, @emanimi, @sünd, @surm
         , @kirjed, @lipikud, @sildid)
    ON DUPLICATE KEY
    UPDATE persoon = @persoon, perenimi = @perenimi, eesnimi = @eesnimi
         , isanimi = @isanimi, emanimi = @emanimi, sünd = @sünd, surm = @surm
         , kirjed = @kirjed, lipikud = @lipikud, sildid = @sildid;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `aggr_sildid`(IN _kirjekood CHAR(10))
proc_label:BEGIN

    SET @persoon = NULL, @sildid = NULL;

    SELECT k.persoon, group_concat(DISTINCT vl.silt SEPARATOR '; \n') AS Sildid
    INTO @persoon, @sildid
    FROM repis.v_kirjesildid vl
    RIGHT JOIN repis.kirjed k ON vl.kirjekood IN (k.kirjekood, k.persoon)
    WHERE k.kirjekood = _kirjekood;


    IF @sildid IS NULL THEN
      DELETE FROM repis.a_sildid WHERE Persoon = @persoon;
    ELSE
      INSERT INTO repis.a_sildid (persoon, sildid)
      VALUES (@persoon, @sildid)
      ON DUPLICATE KEY UPDATE persoon = @persoon, sildid = @sildid;
    END IF;

    -- CALL repis.aggr_persoonid(@persoon);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`localhost` PROCEDURE `backup`()
BEGIN
	CALL repis.backup_table('kirjed');
	CALL repis.backup_table('v_kirjelipikud');
	CALL repis.backup_table('v_kirjesildid');

	CALL aruanded.statistika();
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `backup_table`(IN tn VARCHAR(50))
BEGIN
	SET @dt = REPLACE(REPLACE(REPLACE(NOW(), '-', '_'), ' ', '_'), ':', '_');

	SET @c = CONCAT('CREATE TABLE backups.`', @dt, '_', tn, '` SELECT * FROM ', tn);
	PREPARE stmt FROM @c;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`localhost` PROCEDURE `debug_msg`(enabled INTEGER, msg VARCHAR(255))
BEGIN
  IF enabled THEN
    select concat('** ', msg) AS '** DEBUG:';
  END IF;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `fix_dates`(
    IN _table varCHAR(100),
    IN _column varCHAR(100)
)
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE _re VARCHAR(255) DEFAULT '^[0-9]{4}\\/[0-9]{1,2}\\/[0-9]{1,2}$';
    DECLARE _sep CHAR(1) DEFAULT '-';
    DECLARE _y tinyint DEFAULT 10;
    DECLARE _m tinyint DEFAULT 20;
    DECLARE _d tinyint DEFAULT 30;

    DEClARE curReplace
        CURSOR FOR
            SELECT re, sep, y, m, d FROM repis.z_datefix;

    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET finished = 1;

    OPEN curReplace;

    doReformat: LOOP
        FETCH curReplace INTO _re, _sep, _y, _m, _d;
        IF finished = 1 THEN
            LEAVE doReformat;
        END IF;

        -- reformat the dates
        set @c = CONCAT(
            "UPDATE ", _table, " SET `", _column , "` = "
            , "concat_ws( '-'
                    , lpad(substring_index(substring_index(`", _column, "`, '", _sep, "', ", _y, "), '", _sep, "', -1), 4, '1900')
                    , lpad(substring_index(substring_index(`", _column, "`, '", _sep, "', ", _m, "), '", _sep, "', -1), 2, '0')
                    , lpad(substring_index(substring_index(`", _column, "`, '", _sep, "', ", _d, "), '", _sep, "', -1), 2, '0')
                    )
            WHERE `", _column , "` regexp '", _re, "';"
            );

--         SELECT @c;
        PREPARE stmt FROM @c;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

    END LOOP doReformat;
    CLOSE curReplace;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `flush_vorm_kirjed`(
  IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
  IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

  DELETE FROM repis.vorm_kirjed;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`localhost` PROCEDURE `log_msg`(
	IN `_key` VARCHAR(255),
	IN `_msg` VARCHAR(255),
	IN `_source` VARCHAR(25)
)
BEGIN
  INSERT INTO log_msg (k, src, msg, usr)
  VALUES (_key, _source, _msg, SYSTEM_USER());
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `merge_persons`(
	IN `_person0` CHAR(10),
	IN `_person2` CHAR(10)
)
proc_label:BEGIN
	if _person0 = _person2 then
		LEAVE proc_label;
	END if;

   UPDATE repis.kirjed 
	   SET persoon = _person0
	 WHERE persoon = _person2;

   UPDATE import.memoriaal_kivitahvlid
      SET persoon = _person0
	 WHERE persoon = _person2;

   UPDATE repis.kirjed 
	   SET kirje = ''
	 WHERE kirjekood = _person2;
	CALL pub.2pub(_person2);
	
	CALL repis.proc_NK_refresh(_person0, null);

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `process_queue`()
    SQL SECURITY INVOKER
proc_label: BEGIN
    DECLARE _id INT(11) UNSIGNED;
    DECLARE _kirjekood1 CHAR(10);
    DECLARE _kirjekood2 CHAR(10);
    DECLARE _task VARCHAR(30);
    DECLARE _params VARCHAR(200);
    DECLARE _created_at TIMESTAMP;
    DECLARE _created_by VARCHAR(50);
    
    DECLARE finished INTEGER DEFAULT 0;

    -- Declare variables to hold diagnostics area information
    DECLARE code CHAR(5) DEFAULT '00000';
    DECLARE msg TEXT;

    DECLARE cur1 CURSOR FOR
      SELECT id, kirjekood1, kirjekood2, task, params, created_by
      FROM repis.z_queue WHERE erred_at = '0000-00-00 00:00:00'
       LIMIT 130
      ;

    -- Declare exception handler for failed insert
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
        GET DIAGNOSTICS CONDITION 1
          code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        CALL repis.log_msg(code, msg, 'Process queue');
--        INSERT INTO z_queue (task, params, erred_at) values (code, msg, now());
      END;
    
    SELECT COUNT(1) INTO @pcnt FROM INFORMATION_SCHEMA.PROCESSLIST
	 ; -- SQL Security = Invoker,
	   -- othervise the processlist looks empty
	 
    IF @pcnt > 25 THEN
      CALL repis.log_msg(@pcnt, 'Too many running processes', 'process_queue');
      LEAVE proc_label;
    END IF;

    OPEN cur1;
    read_loop: LOOP
      -- LEAVE read_loop;
      FETCH cur1 INTO _id, _kirjekood1, _kirjekood2, _task, _params, _created_by;
      IF finished = 1 THEN
          LEAVE read_loop;
      END IF;

      UPDATE repis.z_queue SET erred_at = now() WHERE id = _id;
      SELECT concat(_id, ': CALL repis.q_', _task, '(\'',_kirjekood1,'\', \'',_kirjekood2,'\', \'',_task,'\', \'',_params,'\', \'',_created_by,'\');');

      IF _task = 'desktop_flush' THEN
        CALL repis.q_desktop_flush(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'desktop_collect' THEN
        CALL repis.q_desktop_collect(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'desktop_NK_refresh' THEN
        UPDATE repis.z_queue SET msg = concat('CALL repis.q_desktop_NK_refresh(\'',_kirjekood1,'\', \'',_kirjekood2,'\', \'',_task,'\', \'',_params,'\', \'',_created_by,'\');') WHERE id = _id;
        CALL repis.q_desktop_NK_refresh(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'proc_NK_refresh' THEN
        UPDATE repis.z_queue SET msg = concat('CALL repis.proc_NK_refresh(\'',_kirjekood1,'\', \'',_kirjekood2,'\');') WHERE id = _id;
        CALL repis.proc_NK_refresh(_kirjekood1, _kirjekood2);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'desktop_PR_import' THEN
        UPDATE repis.z_queue SET msg = concat('CALL repis.q_desktop_PR_import(\'',_kirjekood1,'\', \'',_kirjekood2,'\', \'',_task,'\', \'',_params,'\', \'',_created_by,'\');') WHERE id = _id;
        CALL repis.q_desktop_PR_import(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'desktop_RK_import' THEN
        UPDATE repis.z_queue SET msg = concat('CALL repis.q_desktop_RK_import(\'',_kirjekood1,'\', \'',_kirjekood2,'\', \'',_task,'\', \'',_params,'\', \'',_created_by,'\');') WHERE id = _id;
        CALL repis.q_desktop_RK_import(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'desktop_RR_import' THEN
        UPDATE repis.z_queue SET msg = concat('CALL repis.q_desktop_RR_import(\'',_kirjekood1,'\', \'',_kirjekood2,'\', \'',_task,'\', \'',_params,'\', \'',_created_by,'\');') WHERE id = _id;
        CALL repis.q_desktop_RR_import(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'desktop_join_persons' THEN
        CALL repis.q_desktop_join_persons(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'leidperelaud_collect' THEN
        CALL repis.q_leidperelaud_collect(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'leidperelaud_flush' THEN
        CALL repis.q_leidperelaud_flush(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'perelaud_flush' THEN
        CALL repis.q_perelaud_flush(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'emaisalaud_flush' THEN
        CALL repis.q_emaisalaud_flush(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'add2emaisa' THEN
        CALL repis.q_emaisa_add(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'raamatupere2emaisa' THEN
        CALL repis.q_emaisa_raamatupere(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSEIF _task = 'emaisalaud_replace' THEN
        CALL repis.q_emaisa_replace(_kirjekood1, _kirjekood2, _task, _params, _created_by);
        -- DELETE FROM repis.z_queue WHERE id = _id;
      ELSE
        SET @sql = CONCAT('CALL ', _task, '(', _params, ');');
        CALL repis.log_msg('sql', @SQL, 'Process queue');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
      END IF;

    END LOOP;
    CLOSE cur1;
    SET finished = 0;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `proc_bulk_refresh`(
	IN `_allikas` VARCHAR(20)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE _persoon char(10) DEFAULT NULL;

	DEClARE curPerson
		CURSOR FOR 
			SELECT distinct persoon FROM repis.kirjed
			 WHERE allikas = _allikas
			   AND persoon IS NOT null;

	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	OPEN curPerson;
    	getPerson: LOOP
    		FETCH curPerson INTO _persoon;
    		IF finished = 1 THEN 
    			LEAVE getPerson;
    		END IF;
    		CALL repis.proc_NK_refresh(_persoon);
    	END LOOP getPerson;
	CLOSE curPerson;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `proc_clear_newline`()
BEGIN

UPDATE repis.kirjed 
SET kirjejutt = REPLACE(kirjejutt, '\r', '\n')
  , kirjepersoon = REPLACE(kirjepersoon, '\r', '\n');

UPDATE repis.kirjed 
SET kirjejutt = REPLACE(kirjejutt, '\n\n', '\n')
  , kirjepersoon = REPLACE(kirjepersoon, '\n\n', '\n');

UPDATE repis.kirjed 
SET kirjejutt = trim(CHAR(10) FROM kirjejutt)
WHERE kirjejutt REGEXP ('\n$');

UPDATE repis.kirjed 
SET kirjepersoon = trim(CHAR(10) FROM kirjepersoon)
WHERE kirjepersoon REGEXP ('\n$');

SELECT persoon, kirjekood, kirjejutt, trim(CHAR(10) FROM kirjejutt)
FROM repis.kirjed
WHERE kirje REGEXP ('\n$')
OR kirje LIKE '%\n\n%';

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `proc_new_kirje`(
	IN `_allikas` VARCHAR(10),
	IN `_persoon` CHAR(10),
	IN `_eesnimi` VARCHAR(50),
	IN `_perenimi` VARCHAR(50),
	IN `_sünd` VARCHAR(10),
	IN `_surm` VARCHAR(10),
	IN `_sünnikoht` VARCHAR(100),
	IN `_surmakoht` VARCHAR(100),
	IN `_kirje` TEXT
)
BEGIN
  INSERT INTO repis.kirjed (persoon, kirjekood, eesnimi, perenimi, sünd, surm, sünnikoht, surmakoht, kirje, kirjejutt, allikas)
  VALUES ( _persoon, func_new_kirjekood(_allikas)
         , _eesnimi, _perenimi, _sünd, _surm, sünnikoht, _surmakoht, _kirje, _kirje, _allikas
			);
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `proc_NK_refresh`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
proc_label:BEGIN

    -- Declare variables to hold diagnostics area information
    DECLARE code CHAR(5) DEFAULT '00000';
    DECLARE msg TEXT;
    -- Declare exception handler for failed insert
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
        GET DIAGNOSTICS CONDITION 1
          code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        CALL repis.log_msg(code, ifnull(in_persoon, 'in_persoon NULL'), 'NK_refresh');
        CALL repis.log_msg(code, msg, 'NK_refresh');
      END;

	 -- CALL repis.log_msg(NULL, in_persoon, 'NK_refresh');
    UPDATE repis.kirjed k_u LEFT JOIN
    (
      SELECT k0.persoon
      , SUBSTRING_INDEX(group_concat(
          if(k0.perenimi = ''   OR a.prioriteetPerenimi = 0,
            NULL, UPPER(k0.perenimi))
          ORDER BY a.prioriteetPerenimi DESC SEPARATOR ';'), ';', 1)
          AS perenimi
      , SUBSTRING_INDEX(group_concat(
          if(k0.eesnimi = ''    OR a.prioriteetEesnimi  = 0,
            NULL, UPPER(k0.eesnimi))
          ORDER BY a.prioriteetEesnimi  DESC SEPARATOR ';'), ';', 1)
          AS eesnimi
      , SUBSTRING_INDEX(group_concat(
          if(k0.isanimi = ''    OR a.prioriteetIsanimi  = 0,
            NULL, UPPER(k0.isanimi))
          ORDER BY a.prioriteetIsanimi  DESC SEPARATOR ';'), ';', 1)
          AS isanimi
      , SUBSTRING_INDEX(group_concat(
          if(k0.emanimi = ''    OR a.prioriteetEmanimi  = 0,
            NULL, UPPER(k0.emanimi))
          ORDER BY a.prioriteetEmanimi  DESC SEPARATOR ';'), ';', 1)
          AS emanimi
      , SUBSTRING_INDEX(group_concat(
          if(k0.sünd = ''       OR a.prioriteetSünd     = 0,
            NULL, k0.sünd)
          ORDER BY CHAR_LENGTH(SUBSTRING_INDEX(k0.Sünd,';',1)) DESC, a.prioriteetSünd DESC SEPARATOR ';'), ';', 1)
          AS sünd
      , SUBSTRING_INDEX(group_concat(
          if(k0.surm = ''       OR a.prioriteetSurm     = 0,
            NULL, k0.surm)
          ORDER BY CHAR_LENGTH(SUBSTRING_INDEX(k0.Surm,';',1)) DESC, a.prioriteetSurm DESC SEPARATOR ';'), ';', 1)
          AS surm
      , SUBSTRING_INDEX(group_concat(
          if(k0.sünnikoht REGEXP '^\\?*$' OR a.prioriteetSünd     = 0,
            NULL, k0.sünnikoht)
          ORDER BY a.prioriteetSünd     DESC SEPARATOR '$€'), '$€', 1)
          AS sünnikoht
      , SUBSTRING_INDEX(group_concat(
          if(k0.surmakoht REGEXP '^\\?*$' OR a.prioriteetSurm     = 0,
            NULL, k0.surmakoht)
          ORDER BY a.prioriteetSurm     DESC SEPARATOR '$€'), '$€', 1)
          AS surmakoht
      FROM repis.kirjed k0
      LEFT JOIN allikad a ON a.kood = k0.allikas
      WHERE k0.persoon = in_persoon
      GROUP BY k0.persoon
    ) AS nimekuju ON nimekuju.persoon = k_u.persoon
    SET k_u.perenimi = ifnull(nimekuju.perenimi, '')
      , k_u.eesnimi = ifnull(nimekuju.eesnimi, '')
      , k_u.isanimi = ifnull(nimekuju.isanimi, '')
      , k_u.emanimi = ifnull(nimekuju.emanimi, '')
      , k_u.sünd = ifnull(if(nimekuju.sünd = '-', '', nimekuju.sünd), '')
      , k_u.surm = ifnull(if(nimekuju.surm = '-', '', nimekuju.surm), '')
      , k_u.sünnikoht = ifnull(nimekuju.sünnikoht, '')
      , k_u.surmakoht = ifnull(nimekuju.surmakoht, '')
      , k_u.kirje = repis.desktop_person_text(
          nimekuju.perenimi, nimekuju.eesnimi,
          nimekuju.isanimi, nimekuju.emanimi,
          nimekuju.sünd, nimekuju.surm,
          nimekuju.sünnikoht, nimekuju.surmakoht
        ) COLLATE utf8_estonian_ci
      , k_u.Perenimed = import.func_pr_perenimed(k_u.persoon)
    WHERE k_u.kirjekood = in_persoon
    ;
    CALL maintenance.update_wwiiref(in_persoon);
    CALL pub.2pub(in_persoon);
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `prop_set_pub_kivi_from`(
	IN `in_kirjekood` CHAR(10)
)
BEGIN
  -- Kui on pub_kivi ja on persoonikirje
  --   - ei tee midagi
  -- Kui on pub_kivi ja ei ole persoonikirje
  --   - määran persoonikirje pub_kivi = true
  -- Kui ei ole pub_kivi ja on persoonikirje
  --   - määran kõik persoonikirjed pub_kivi = false
  -- Kui ei ole pub_kivi ja ei ole persoonikirje
  --   - määran persoonikirje pub_kivi = OR ( kõigi persooni mittepersoonikirjete pub_kivi )
  
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_desktop_collect`(
	IN `_persoon` CHAR(10),
	IN `_kirjekood2` CHAR(10),
	IN `_task` VARCHAR(50),
	IN `_params` VARCHAR(200),
	IN `_created_by` VARCHAR(50)
)
proc_label:BEGIN

    -- INSERT INTO z_queue (kirjekood1, kirjekood2, task, params) values (_persoon, _persoon, 'log', 'foo');


      SET @p_id = '' -- COLLATE utf8_estonian_ci
      ;
      SELECT persoon INTO @p_id FROM repis.kirjed WHERE kirjekood = _persoon;

	  -- INSERT INTO z_queue (kirjekood1, kirjekood2, task, params) values (_persoon, _persoon, 'log', 'foo1.2');
      DELETE FROM repis.desktop WHERE persoon = _persoon AND allikas IS NULL AND created_by = _created_by;

      INSERT IGNORE INTO repis.desktop
      (persoon, kirjekood, perenimi, eesnimi, isanimi, emanimi, sünd, sünnikoht, surm, surmakoht
        -- , lipikud
        -- , sildid
        , kirje, legend, allikas, välisviide, EkslikKanne, Peatatud, EiArvesta, created_by
        , jutt)
      SELECT persoon, kirjekood, perenimi, eesnimi, isanimi, emanimi, sünd, sünnikoht, surm, surmakoht
        -- , repis.func_kirjelipikud(kirjekood)
        -- , repis.func_kirjesildid(kirjekood)
        , kirje, legend, allikas, välisviide, EkslikKanne, Peatatud, EiArvesta, _created_by
        , IF(allikas IN ('EMI', 'TS'),
            kirjeJutt,
            ' - - - '
          ) jutt
      FROM repis.kirjed k
      WHERE k.persoon = @p_id;


      SELECT repis.func_person_text(k.kirjekood)
--      SELECT repis.desktop_person_text(k.perenimi, k.eesnimi, k.isanimi, k.emanimi, k.sünd, k.surm)
        INTO @jutt
        FROM repis.kirjed k
       WHERE k.kirjekood = _kirjekood2;

      DELETE FROM repis.desktop WHERE kirjekood = _kirjekood2 AND allikas IS NULL AND created_by = _created_by;
      INSERT IGNORE INTO repis.desktop
      (persoon, kirjekood, perenimi, eesnimi, isanimi, emanimi, sünd, sünnikoht, surm, surmakoht
        -- , lipikud
        -- , sildid
        , kirje, legend, allikas, välisviide, EkslikKanne, Peatatud, EiArvesta, created_by
        , jutt)
      SELECT persoon, kirjekood, perenimi, eesnimi, isanimi, emanimi, sünd, sünnikoht, surm, surmakoht
        -- , repis.func_kirjelipikud(kirjekood)
        -- , repis.func_kirjesildid(kirjekood)
        , kirje, legend, allikas, välisviide, EkslikKanne, Peatatud, EiArvesta, _created_by
        , IF(allikas IN ('TS','EMI'),
            IF(kirje LIKE concat(@jutt, '. %') , -- COLLATE utf8_estonian_ci,
              REPLACE(
                kirje,
                concat(@jutt, '. ') , -- COLLATE utf8_estonian_ci,
                ''
              ),
              kirje
            ),
            ' - - - '
          )
      FROM repis.kirjed k
      WHERE k.kirjekood = _kirjekood2;
    END IF;

    -- INSERT INTO z_queue (task, params) values ('log', 'foo2');

    INSERT IGNORE INTO repis.desk_lipikud (desktop_id, lipik)
    SELECT d.id, kl.lipik
    FROM repis.desktop d
    LEFT JOIN repis.v_kirjelipikud kl ON kl.kirjekood = d.kirjekood
    WHERE kl.kirjekood IS NOT NULL
      AND d.created_by = _created_by;

    INSERT IGNORE INTO repis.desk_sildid (desktop_id, silt)
    SELECT d.id, ks.silt
    FROM repis.desktop d
    LEFT JOIN repis.v_kirjesildid ks ON ks.kirjekood = d.kirjekood
    WHERE ks.kirjekood IS NOT NULL
      AND d.created_by = _created_by;

    UPDATE repis.desktop d
    LEFT JOIN (
      SELECT desktop_id
           , group_concat(DISTINCT lipik ORDER BY lipik SEPARATOR '; ') AS lipikud
        FROM repis.desk_lipikud GROUP BY desktop_id
      ) AS dl ON dl.desktop_id = d.id
    LEFT JOIN (
      SELECT desktop_id
           , group_concat(DISTINCT silt ORDER BY silt SEPARATOR '; ') AS sildid
        FROM repis.desk_sildid GROUP BY desktop_id
      ) AS ds ON ds.desktop_id = d.id
    SET d.lipikud = dl.lipikud
      , d.sildid  = ds.sildid
    WHERE d.created_by = _created_by;

    -- INSERT INTO z_queue (task, params) values ('log', 'foo3');

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_desktop_flush`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    DELETE FROM repis.desktop
    WHERE created_by = _created_by;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_desktop_join_persons`(
	IN `_old_person` CHAR(10),
	IN `_new_person` CHAR(10),
	IN `_task` VARCHAR(50),
	IN `_params` VARCHAR(200),
	IN `_created_by` VARCHAR(50)
)
proc_label:BEGIN

	CALL repis.merge_persons(_new_person, _old_person);

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_desktop_NK_refresh`(
	IN `_persoon` CHAR(10),
	IN `_kirjekood2` CHAR(10),
	IN `_task` VARCHAR(50),
	IN `_params` VARCHAR(200),
	IN `_created_by` VARCHAR(50)
)
proc_label:BEGIN

    -- Declare variables to hold diagnostics area information
    DECLARE code CHAR(5) DEFAULT '00000';
    DECLARE msg TEXT;
    -- Declare exception handler for failed insert
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
        GET DIAGNOSTICS CONDITION 1
          code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        INSERT INTO z_queue (task, params) values (code, concat_ws('; ', 'desktop_NK_refresh', msg));
      END;

    -- INSERT INTO z_queue (task, params, erred_at) values (_created_by, user(), now());

    SET @allikas = '';
    SELECT allikas INTO @allikas FROM repis.desktop
    WHERE created_by = _created_by
      AND kirjekood = _persoon;

    THEN
        SELECT concat(
          , '\n', _persoon
          , '\n', @allikas
        ) INTO msg;
        SIGNAL SQLSTATE '03100' SET MESSAGE_TEXT = msg;
    END IF;

    UPDATE repis.desktop d LEFT JOIN
    (
      SELECT d0.persoon
      , SUBSTRING_INDEX(group_concat(
          if(d0.perenimi = ''   OR a.prioriteetPerenimi = 0,
            NULL, UPPER(d0.perenimi))
          ORDER BY a.prioriteetPerenimi DESC SEPARATOR ';'), ';', 1)
          AS perenimi
      , SUBSTRING_INDEX(group_concat(
          if(d0.eesnimi = ''    OR a.prioriteetEesnimi  = 0,
            NULL, UPPER(d0.eesnimi))
          ORDER BY a.prioriteetEesnimi  DESC SEPARATOR ';'), ';', 1)
          AS eesnimi
      , SUBSTRING_INDEX(group_concat(
          if(d0.isanimi = ''    OR a.prioriteetIsanimi  = 0,
            NULL, UPPER(d0.isanimi))
          ORDER BY a.prioriteetIsanimi  DESC SEPARATOR ';'), ';', 1)
          AS isanimi
      , SUBSTRING_INDEX(group_concat(
          if(d0.emanimi = ''    OR a.prioriteetEmanimi  = 0,
            NULL, UPPER(d0.emanimi))
          ORDER BY a.prioriteetEmanimi  DESC SEPARATOR ';'), ';', 1)
          AS emanimi
      , SUBSTRING_INDEX(group_concat(
          if(d0.sünd = ''       OR a.prioriteetSünd     = 0,
            NULL, d0.sünd)
          ORDER BY a.prioriteetSünd     DESC SEPARATOR ';'), ';', 1)
          AS sünd
      , SUBSTRING_INDEX(group_concat(
          if(d0.surm = ''       OR a.prioriteetSurm     = 0,
            NULL, d0.surm)
          ORDER BY a.prioriteetSurm     DESC SEPARATOR ';'), ';', 1)
          AS surm
      , SUBSTRING_INDEX(group_concat(
          if(d0.sünnikoht = ''       OR a.prioriteetSünd     = 0,
            NULL, d0.sünnikoht)
          ORDER BY a.prioriteetSünd     DESC SEPARATOR ';'), ';', 1)
          AS sünnikoht
      , SUBSTRING_INDEX(group_concat(
          if(d0.surmakoht = ''       OR a.prioriteetSurm     = 0,
            NULL, d0.surmakoht)
          ORDER BY a.prioriteetSurm     DESC SEPARATOR ';'), ';', 1)
          AS surmakoht
      FROM repis.desktop d0
      LEFT JOIN allikad a ON a.kood = d0.allikas
      WHERE d0.persoon = _persoon
        AND d0.created_by = _created_by
      GROUP BY d0.persoon
    ) AS nimekuju ON nimekuju.persoon = d.persoon
    SET d.perenimi = ifnull(nimekuju.perenimi, '')
      , d.eesnimi = ifnull(nimekuju.eesnimi, '')
      , d.isanimi = ifnull(nimekuju.isanimi, '')
      , d.emanimi = ifnull(nimekuju.emanimi, '')
      , d.sünd = ifnull(if(nimekuju.sünd = '-', '', nimekuju.sünd), '')
      , d.surm = ifnull(if(nimekuju.surm = '-', '', nimekuju.surm), '')
      , d.sünnikoht = ifnull(if(nimekuju.sünnikoht = '-', '', nimekuju.sünnikoht), '')
      , d.surmakoht = ifnull(if(nimekuju.surmakoht = '-', '', nimekuju.surmakoht), '')
      , d.kirje = repis.desktop_person_text(
          nimekuju.perenimi, nimekuju.eesnimi,
          nimekuju.isanimi, nimekuju.emanimi,
          nimekuju.sünd, nimekuju.surm
        ) COLLATE utf8_estonian_ci
    WHERE d.kirjekood = _persoon
      AND d.created_by = _created_by;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_desktop_PR_import`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    SELECT concat_ws('. ',
      concat_ws(', ',
        concat_ws(';',
          if(pr.isik_perenimi='',NULL,pr.isik_perenimi),
          if(pr.isik_perenimi_endine1='',NULL,pr.isik_perenimi_endine1),
          if(pr.isik_perenimi_endine2='',NULL,pr.isik_perenimi_endine2),
          if(pr.isik_perenimi_endine3='',NULL,pr.isik_perenimi_endine3),
          if(pr.isik_perenimi_endine4='',NULL,pr.isik_perenimi_endine4)
        ),
        concat_ws(';',
          if(pr.isik_eesnimi='',NULL,pr.isik_eesnimi),
          if(pr.isik_eesnimi_endine1='',NULL,pr.isik_eesnimi_endine1),
          if(pr.isik_eesnimi_endine2='',NULL,pr.isik_eesnimi_endine2)
        ),
        if(pr.isa_eesnimi='',NULL,concat('isa eesnimi ',pr.isa_eesnimi)),
        if(pr.ema_eesnimi='',NULL,concat('ema eesnimi ',pr.ema_eesnimi)),
        if(pr.isik_sugu='',NULL,pr.isik_sugu)
      ),
      concat_ws(', ',
        if(pr.isik_synniaasta='',NULL,concat('Sünd: ', concat_ws('-',
          pr.isik_synniaasta,
          if(pr.isik_synnikuu='',NULL,LPAD(pr.isik_synnikuu, 2, '00')),
          if(pr.isik_synnipaev='',NULL,LPAD(pr.isik_synnipaev, 2, '00'))
        ))),
        if(pr.isik_synnikoht='',NULL,pr.isik_synnikoht),
        if(pr.isik_synniriik='',NULL,pr.isik_synniriik)
      ),
      if(pr.isik_surmaaasta='' AND pr.isik_surmakoht='' AND pr.isik_surmariik='', NULL,
        concat_ws(', ',
          if(pr.isik_surmaaasta='',NULL,concat('Surm: ', concat_ws('-',
            pr.isik_surmaaasta,
            if(pr.isik_surmakuu='',NULL,LPAD(pr.isik_surmakuu, 2, '00')),
            if(pr.isik_surmapaev='',NULL,LPAD(pr.isik_surmapaev, 2, '00'))
          ))),
          if(pr.isik_surmakoht='',NULL,pr.isik_surmakoht),
          if(pr.isik_surmariik='',NULL,pr.isik_surmariik)
        )
      ),
      concat('Raamat: ', pr.raamatu_omavalitsus, ' kd ', pr.koite_nr, ' lk ', pr.lk_nr),
      ''
    ) INTO @_kirje
    FROM import.pereregister pr
    WHERE pr.isikukood = _kirjekood2 COLLATE utf8_estonian_ci;

    UPDATE repis.desktop d
    LEFT JOIN import.pereregister pr on pr.isikukood = d.kirjekood
    SET
      d.kirje = @_kirje,
      d.perenimi = pr.isik_perenimi,
      d.eesnimi = pr.isik_eesnimi,
      d.isanimi = pr.isa_eesnimi,
      d.emanimi = pr.ema_eesnimi,
      d.sünd = ifnull(concat_ws('-',
        if(pr.isik_synniaasta = '', NULL, pr.isik_synniaasta),
        if(pr.isik_synnikuu = '', NULL, pr.isik_synnikuu),
        if(pr.isik_synnipaev = '', NULL, pr.isik_synnipaev)
      ), ''),
      d.surm = ifnull(concat_ws('-',
        if(pr.isik_surmaaasta = '', NULL, pr.isik_surmaaasta),
        if(pr.isik_surmakuu = '', NULL, pr.isik_surmakuu),
        if(pr.isik_surmapaev = '', NULL, pr.isik_surmapaev)
      ), ''),
      d.created_by = _created_by
    WHERE pr.isikukood = _kirjekood2 COLLATE utf8_estonian_ci
      AND d.persoon = '';

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_desktop_PT_import`(
	IN `_kirjekood1` CHAR(10),
	IN `_kirjekood2` CHAR(10),
	IN `_task` VARCHAR(50),
	IN `_params` VARCHAR(200),
	IN `_created_by` VARCHAR(50)
)
proc_label:BEGIN

    SELECT     concat_ws('. ',
      concat_ws(', ',
        concat_ws(';',
          if(pt.perenimi='',NULL,pt.perenimi),
          if(pt.muuperenimi='',NULL,pt.muuperenimi)
        ),
        concat_ws(';',
          if(pt.eesnimi='',NULL,pt.eesnimi),
          if(pt.muueesnimi='',NULL,pt.muueesnimi)
        )
      ),
      concat_ws(', ',
        if(pt.sünd='',NULL,concat('Sünd: ', pt.sünd)),
        if(pt.synnikoht='',NULL,repis.func_rr_aadress(pt.synnikoht))
      ),
      if(pt.surm='' AND pt.surmakoht='', NULL,
        concat_ws(', ',
          if(pt.surm='',NULL,concat('Surm: ', pt.surm)),
          if(pt.surmakoht='',NULL,repis.func_rr_aadress(pt.surmakoht))
        )
      ),
      pt.paragrahv,
      if(pt.isaeesnimi='',NULL,concat('Isa ', CONCAT_WS(' ', pt.isaeesnimi, pt.isaperenimi))),
      if(pt.emaeesnimi='',NULL,concat('Ema ', CONCAT_WS(' ', pt.emaeesnimi, pt.emaperenimi))),
      CONCAT('[',pt.toimik,']')
    )
    INTO @_kirje
    FROM import.pensionitoimikud pt
    WHERE pt.kirjekood = _kirjekood2 COLLATE utf8_estonian_ci;

    UPDATE repis.desktop d
    LEFT JOIN import.pensionitoimikud pt on pt.kirjekood = d.kirjekood
    SET
      d.kirje = @_kirje,
      d.perenimi = pt.perenimi,
      d.eesnimi = pt.eesnimi,
      d.isanimi = pt.isaeesnimi,
      d.emanimi = pt.emaeesnimi,
      d.sünd = ifnull(pt.sünd, ''),
      d.surm = ifnull(pt.Surm, ''),
      d.created_by = _created_by
    WHERE pt.kirjekood = _kirjekood2 COLLATE utf8_estonian_ci
      AND d.persoon = '';

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_desktop_RK_import`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    SELECT concat_ws('. ',
      concat_ws(', ',
        concat_ws(';', rk.PERENIMI),
        concat_ws(';', rk.EESNIMI)
      )
    ) INTO @_kirje
    FROM import.repr_kart rk
    WHERE rk.isikukood = _kirjekood2 COLLATE utf8_estonian_ci;

    UPDATE repis.desktop d
    LEFT JOIN import.repr_kart rk on rk.isikukood = d.kirjekood
    SET
      d.kirje = @_kirje,
      d.perenimi = rk.PERENIMI,
      d.eesnimi = rk.EESNIMI,
      d.sünd = rk.SA,
      d.surm = rk.Surm,
      d.legend = rk.otmetki,
      d.created_by = _created_by
    WHERE rk.isikukood = _kirjekood2 COLLATE utf8_estonian_ci
      AND d.persoon = '';

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_desktop_RR_import`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    SELECT concat_ws('. ',
      concat_ws(', ',
        concat_ws(';', rr.PERENIMI),
        concat_ws(';', rr.EESNIMI),
        if(rr.isanimi='',NULL,concat('isa eesnimi ',rr.isanimi))
      ),
      if(rr.sünd='',NULL,concat('Sünd: ',rr.sünd)),
      if(rr.surm='',NULL,concat('Surm: ',rr.surm))
    ) INTO @_kirje
    FROM import.rahvastikuregister rr
    WHERE rr.kirjekood = _kirjekood2 COLLATE utf8_estonian_ci;

    UPDATE repis.desktop d
    LEFT JOIN import.rahvastikuregister rr on rr.kirjekood = d.kirjekood
    SET
      d.kirje = @_kirje,
      d.perenimi = rr.perenimi,
      d.eesnimi = rr.eesnimi,
      d.sünd = rr.sünd,
      d.surm = rr.surm,
      d.legend = concat_ws('; '
        , if(rr.sünnikoht='',NULL,concat('Sünnikoht: ',rr.sünnikoht))
        , if(rr.surmakoht='',NULL,concat('Surmakoht: ',rr.surmakoht))
        , if(rr.allika_id='',NULL,concat('Isikukood: ',rr.allika_id))
      ),
      d.created_by = _created_by
    WHERE rr.kirjekood = _kirjekood2 COLLATE utf8_estonian_ci
      AND d.persoon = '';

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_emaisalaud_flush`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    DELETE FROM repis.emaisalaud;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_emaisa_add`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    INSERT IGNORE INTO repis.emaisalaud (persoon, created_by)
    SELECT
      SUBSTRING_INDEX(SUBSTRING_INDEX(foo.sid, ',', numbers.n), ',', -1) AS "s_id", _created_by
    FROM
      (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL
       SELECT 4   UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL
       SELECT 7   UNION ALL SELECT 8 UNION ALL SELECT 9) numbers
    INNER JOIN ( SELECT _params AS sid ) foo
        ON CHAR_LENGTH(foo.sid) - CHAR_LENGTH(REPLACE(foo.sid, ',', '')) >= numbers.n-1
    ORDER BY numbers.n
    ;
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_emaisa_raamatupere`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    INSERT IGNORE INTO repis.emaisalaud (persoon, created_by)
    SELECT DISTINCT k1.persoon, _created_by
    FROM repis.kirjed k0
    LEFT JOIN repis.kirjed k1 ON k1.raamatupere = k0.raamatupere
      AND k0.persoon = _kirjekood1;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_emaisa_replace`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

      DELETE FROM repis.emaisalaud WHERE persoon = _kirjekood1;
      INSERT INTO repis.emaisalaud (persoon, created_by) VALUES (_kirjekood2, _created_by);
    -- END IF;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_leidperelaud_collect`(
    IN _persoon CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    IF _persoon = '' THEN
      LEAVE proc_label;
    END IF;

    INSERT IGNORE INTO repis.leidperelaud(persoon, created_by)
    SELECT DISTINCT k1.persoon, _created_by
      FROM repis.kirjed AS k
      LEFT JOIN repis.kirjed k1 ON k.leidpere = k1.leidpere
     WHERE k.persoon = _persoon
       AND k.leidpere IS NOT NULL;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_leidperelaud_flush`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    DELETE FROM repis.leidperelaud
    WHERE created_by = _created_by;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `q_perelaud_flush`(
    IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
    IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    DELETE FROM repis.perelaud
    WHERE created_by = _created_by;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `recreate_sildid`()
proc_label: BEGIN
    DECLARE _persoon CHAR(10);

    DECLARE finished INTEGER DEFAULT 0;

    -- Declare variables to hold diagnostics area information
    DECLARE CODE CHAR(5) DEFAULT '00000';
    DECLARE msg TEXT;

    DECLARE cur1 CURSOR FOR
      SELECT DISTINCT persoon FROM repis.kirjed
--       LIMIT 10000
      ;

    -- Declare exception handler for failed insert
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
        GET DIAGNOSTICS CONDITION 1
          CODE = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        INSERT INTO z_queue (task, params, erred_at) VALUES (CODE, msg, now());
      END;

    -- LEAVE proc_label;

    OPEN cur1;
    read_loop: LOOP
      -- LEAVE read_loop;
      FETCH cur1 INTO _persoon;
      IF finished = 1 THEN
          LEAVE read_loop;
      END IF;

      CALL repis.aggr_sildid(_persoon);

    END LOOP;
    CLOSE cur1;
    SET finished = 0;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`localhost` PROCEDURE `select_teadmata`()
BEGIN

SELECT DISTINCT k1.*
FROM repis.kirjed k0
LEFT JOIN repis.kirjed k1 ON k0.persoon = k1.kirjekood
RIGHT JOIN repis.kirjed kv ON kv.persoon = k0.persoon
WHERE k1.surm = ''
AND (
   k0.kirje REGEXP '([Aa]rr(\\.|et)|[Ss]urmaotsus)'
   OR k0.allikas IN ('r42','r5','r61','r62','r63','r64','r65')
)
AND kv.sildid NOT LIKE '%V - Vabanenud%'
AND kv.sildid NOT LIKE '%x - mitterelevantne%'
AND kv.sildid NOT LIKE '%x - kivi%'
AND kv.lipikud NOT LIKE '%vabanenud%'
;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `temp_NK_refresh`()
proc_label:BEGIN

    DECLARE _persoon CHAR(10);
    DECLARE finished INTEGER DEFAULT 0;
    -- Declare variables to hold diagnostics area information
    DECLARE code CHAR(5) DEFAULT '00000';
    DECLARE msg TEXT;
    DECLARE cur1 CURSOR FOR
        SELECT DISTINCT persoon FROM repis.kirjed;
    -- Declare exception handler for failed insert
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
        GET DIAGNOSTICS CONDITION 1
          code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        INSERT INTO z_queue (task, params) values (code, msg);
      END;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN cur1;
    read_loop: LOOP
      SET _persoon = NULL;
      FETCH cur1 INTO _persoon;
      CALL repis.proc_NK_refresh(_persoon);
      IF finished = 1 THEN
          LEAVE read_loop;
      END IF;
    END LOOP;
    CLOSE cur1;
    SET finished = 0;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `unrepeat_kirjed`()
BEGIN

    UPDATE repis.kirjed SET eesnimiC = repis.func_unrepeat(upper(eesnimi), 'hard');
    UPDATE repis.kirjed SET perenimiC = repis.func_unrepeat(upper(perenimi), 'hard');
    UPDATE repis.kirjed SET isanimiC = repis.func_unrepeat(upper(isanimi), 'hard');
    UPDATE repis.kirjed SET emanimiC = repis.func_unrepeat(upper(emanimi), 'hard');

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `vorm_kirjed_collect`(
  IN _persoon CHAR(10), IN _kirjekood2 CHAR(10),
  IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

    SELECT persoon INTO @p FROM repis.kirjed WHERE kirjekood = _persoon;

    DELETE FROM repis.vorm_kirjed WHERE persoon = _persoon AND allikas IS NULL;
    INSERT INTO repis.vorm_kirjed
    (persoon, kirjekood, perenimi, eesnimi, isanimi, emanimi, sünd, surm, kirje, allikas)
    SELECT persoon, kirjekood, perenimi, eesnimi, isanimi, emanimi, sünd, surm, kirje, allikas
    FROM repis.kirjed k
    WHERE k.persoon = @p
    ON DUPLICATE KEY UPDATE
      persoon = k.persoon, kirjekood = k.kirjekood,
      perenimi = k.perenimi, eesnimi = k.eesnimi,
      isanimi = k.isanimi, emanimi = k.emanimi,
      sünd = k.sünd, surm = k.surm,
      kirje = k.kirje, allikas = k.allikas;
    INSERT INTO repis.vorm_kirjed
    (persoon, kirjekood, perenimi, eesnimi, isanimi, emanimi, sünd, surm, kirje, allikas)
    SELECT persoon, kirjekood, perenimi, eesnimi, isanimi, emanimi, sünd, surm, kirje, allikas
    FROM repis.kirjed k
    WHERE k.kirjekood = _kirjekood2
    ON DUPLICATE KEY UPDATE
      persoon = k.persoon, kirjekood = k.kirjekood,
      perenimi = k.perenimi, eesnimi = k.eesnimi,
      isanimi = k.isanimi, emanimi = k.emanimi,
      sünd = k.sünd, surm = k.surm,
      kirje = k.kirje, allikas = k.allikas;
  END IF;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`queue`@`localhost` PROCEDURE `vorm_kirjed_flush`(
  IN _kirjekood1 CHAR(10), IN _kirjekood2 CHAR(10),
  IN _task VARCHAR(50), IN _params VARCHAR(200), IN _created_by VARCHAR(50))
proc_label:BEGIN

  DELETE FROM repis.vorm_kirjed;

END ;;
DELIMITER ;

