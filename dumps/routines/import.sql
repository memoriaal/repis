-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: import
-- ------------------------------------------------------
-- Server version	10.2.25-MariaDB


--
-- Current Database: `import`
--


USE `import`;

--
-- Dumping routines for database 'import'
--
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_pr_perenimed`(
	`in_persoon` INT
) RETURNS varchar(250) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
    return '';
    SELECT group_concat(distinct perenimed SEPARATOR ';') INTO @return_value
    FROM 
        (SELECT nullif(isik_perenimi,
            '') AS perenimed
        FROM import.pereregister
        WHERE persoon = in_persoon
        UNION
        SELECT nullif(isik_perenimi_endine1,
            '')
        FROM import.pereregister
        WHERE persoon = in_persoon
        UNION
        SELECT nullif(isik_perenimi_endine2,
            '')
        FROM import.pereregister
        WHERE persoon = in_persoon
        UNION
        SELECT nullif(isik_perenimi_endine3,
            '')
        FROM import.pereregister
        WHERE persoon = in_persoon
        UNION
        SELECT nullif(isik_perenimi_endine4,
            '')
        FROM import.pereregister

        WHERE persoon = in_persoon ) perenimed ;
    
    return ifnull(@return_value, '');
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_PR_sünnikoht`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
  SELECT CONCAT_WS( ', '
                  , if(pr.isik_synniriik = '', NULL, pr.isik_synniriik)
                  , if(pr.isik_synnikoht = '', NULL, pr.isik_synnikoht)
                  )
    INTO @sünnikoht
  FROM import.pereregister pr 
  WHERE pr.isikukood = in_kirjekood;
  
  RETURN @sünnikoht;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `func_PR_surmakoht`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_estonian_ci
BEGIN
  SELECT CONCAT_WS( ', '
                  , if(pr.isik_surmariik = '', NULL, pr.isik_surmariik)
                  , if(pr.isik_surmakoht = '', NULL, pr.isik_surmakoht)
                  )
    INTO @surmakoht
  FROM import.pereregister pr 
  WHERE pr.isikukood = in_kirjekood;
  
  RETURN @surmakoht;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_AA`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT concat_ws('. ',
      concat_ws(', ', nullif(aa.perenimi, ''), nullif(aa.eesnimi, '')),
      nullif(
        concat('Sünd: ', concat_ws(', ', nullif(aa.sünd, ''), nullif(aa.sünnikoht, ''))),
        'Sünd: , '
      ),
      nullif(
        concat('Surm: ', concat_ws(', ', nullif(aa.surm, ''), nullif(aa.surmakoht, ''))),
        'Surm: , '
      ),
      aa.elulugu
    ) INTO @_kirje
    from import.album_academicum aa
    WHERE aa.kirjekood = in_kirjekood COLLATE UTF8_ESTONIAN_CI;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_ELK`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT repis.kirje_std_persoon(
      elk.PERENIMI, elk.EESNIMI, NULL, NULL,
      elk.SündISO, elk.SurmISO, elk.`sünnikoht`, elk.surmakoht
    ) INTO @_kirje
    FROM import.el_kart elk
    WHERE elk.kirjekood = in_kirjekood COLLATE utf8_estonian_ci;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_KIRM`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT repis.kirje_std_persoon(
      k4.PERENIMI, k4.EESNIMI, null, null,
      k4.sünd, NULL, NULL, null
    ) INTO @_kirje
    FROM import.kirmus4 k4
    WHERE k4.kirjekood = in_kirjekood COLLATE utf8_estonian_ci;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_PF`(
	`_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT concat_ws('. ',
      concat_ws(', ',
          if(pf.perenimi='',NULL,pf.perenimi),
          if(pf.eesnimi='',NULL,pf.eesnimi)
      ),
      if(pf.synniaeg='',NULL,concat('Sünd: ', pf.synniaeg)),
      --  saabumisaeg|'', saabunud_kuhu|--, asukoht_laager|''
      if(pf.saabumisaeg='',NULL,concat('Saabumine: ', pf.saabumisaeg, ' ', pf.saabunud_kuhu)),
      if(pf.asukoht_laager='',NULL,concat('Põgenikelaager: ', pf.asukoht_laager))
    ) INTO @_kirje
    from import.polisforhor pf
    WHERE pf.kirjekood = _kirjekood COLLATE UTF8_ESTONIAN_CI;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_PR`(
	`_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

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
        )
      ),
      concat_ws(', ',
        if(pr.sünd='',NULL,concat('Sünd: ', pr.sünd)),
        if(pr.isik_synnikoht='',NULL,repis.func_rr_aadress(pr.isik_synnikoht))
      ),
      if(pr.surm='' AND pr.isik_surmakoht='', NULL,
        concat_ws(', ',
          if(pr.surm='',NULL,concat('Surm: ', pr.surm)),
          if(pr.isik_surmakoht='',NULL,repis.func_rr_aadress(pr.isik_surmakoht))
        )
      ),
      if(pr.isa_eesnimi='',NULL,concat('Isa ', CONCAT_WS(' ', pr.isa_eesnimi, pr.isa_synniaasta))),
      if(pr.ema_eesnimi='',NULL,concat('Ema ', CONCAT_WS(' ', pr.ema_eesnimi, pr.ema_synniaasta))),
      CONCAT('[',pr.raamatu_omavalitsus,' kd',pr.koite_nr,' lk',pr.lk_nr,']')
    ) INTO @_kirje
    from import.pereregister pr
    WHERE pr.isikukood = _kirjekood COLLATE utf8_estonian_ci;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_R1416`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT concat_ws('. ',
      concat_ws(', ',
        concat_ws(';',
          if(r14.isik_perenimi='',NULL,r14.isik_perenimi),
          if(r14.isik_perenimi_endine1='',NULL,r14.isik_perenimi_endine1),
          if(r14.isik_perenimi_endine2='',NULL,r14.isik_perenimi_endine2),
          if(r14.isik_perenimi_endine3='',NULL,r14.isik_perenimi_endine3),
          if(r14.isik_perenimi_endine4='',NULL,r14.isik_perenimi_endine4)
        ),
        concat_ws(';',
          if(r14.isik_eesnimi='',NULL,r14.isik_eesnimi),
          if(r14.isik_eesnimi_endine1='',NULL,r14.isik_eesnimi_endine1),
          if(r14.isik_eesnimi_endine2='',NULL,r14.isik_eesnimi_endine2)
        )
      ),
      concat_ws(', ',
        if(r14.sünd='',NULL,concat('Sünd: ', r14.sünd)),
        if(r14.isik_synnikoht='',NULL,repis.func_rr_aadress(r14.isik_synnikoht))
      ),
      if(r14.surm='' AND r14.isik_surmakoht='', NULL,
        concat_ws(', ',
          if(r14.surm='',NULL,concat('Surm: ', r14.surm)),
          if(r14.isik_surmakoht='',NULL,repis.func_rr_aadress(r14.isik_surmakoht))
        )
      ),
      if(r14.isa_eesnimi='',NULL,concat('Isa ', CONCAT_WS(' ', r14.isa_eesnimi, r14.isa_synniaasta))),
      if(r14.ema_eesnimi='',NULL,concat('Ema ', CONCAT_WS(' ', r14.ema_eesnimi, r14.ema_synniaasta))),
      CONCAT('[',r14.raamatu_omavalitsus,' kd',r14.koite_nr,' lk',r14.lk_nr,']')
    ) INTO @_kirje
    from import.`R14-R16` r14
    WHERE r14.isikukood = in_kirjekood COLLATE utf8_estonian_ci;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_RK`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT CASE WHEN rk.Sünniaeg = '' THEN rk.SA ELSE rk.Sünniaeg END INTO @_sünd
    FROM import.repr_kart rk
    WHERE rk.isikukood = in_kirjekood COLLATE utf8_estonian_ci;

    SELECT repis.kirje_std_persoon(
      rk.PERENIMI, rk.EESNIMI, rk.ISANIMI, rk.EMANIMI,
      @_sünd, rk.Surm, NULL, null
    ) INTO @_kirje
    FROM import.repr_kart rk
    WHERE rk.isikukood = in_kirjekood COLLATE utf8_estonian_ci;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_RPT`(
	`_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT concat_ws('. ',
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
    ) INTO @_kirje
    from import.pensionitoimikud pt
    WHERE pt.kirjekood = _kirjekood COLLATE utf8_estonian_ci;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_RR`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT repis.kirje_std_persoon(
      rr.PERENIMI, rr.EESNIMI, rr.ISANIMI, null,
      rr.sünd, rr.surm, rr.sünnikoht, rr.surmakoht
    ) INTO @_kirje
    FROM import.rahvastikuregister rr
    WHERE rr.kirjekood = in_kirjekood COLLATE utf8_estonian_ci;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_SDI`(
	`_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT concat_ws('. ',
      concat_ws(', ',
          if(sdi.surname='',NULL,sdi.surname),
          if(sdi.forename='',NULL,sdi.forename)
      ),
      if(sdi.born='',NULL,concat('Sünd: ', sdi.born)),
      if(sdi.dead='' AND sdi.placeofdeath='', NULL,
        concat_ws(', ',
          if(sdi.dead='',NULL,concat('Surm: ', sdi.dead)),
          if(sdi.placeofdeath='',NULL,repis.func_rr_aadress(sdi.placeofdeath))
        )
      )
    ) INTO @_kirje
    from import.swedish_death_index sdi
    WHERE sdi.kirjekood = _kirjekood COLLATE UTF8_ESTONIAN_CI;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kirje_VELK`(
	`in_kirjekood` CHAR(10)
) RETURNS varchar(2000) CHARSET utf8 COLLATE utf8_estonian_ci
func_label:BEGIN

    SELECT concat_ws('. ',
      concat_ws(', ',
          if(lk.perenimi='',NULL,lk.perenimi),
          if(lk.eesnimi='',NULL,lk.eesnimi)
      ),
      if(lk.sünd='' AND lk.sünnikoht='', NULL,
        concat_ws(', ',
          if(lk.sünd='',NULL,concat('Sünd: ', lk.sünd)),
          if(lk.sünnikoht='',NULL,repis.func_rr_aadress(lk.sünnikoht))
        )
      ),
      if(lk.surm='' AND lk.surmakoht='', NULL,
        concat_ws(', ',
          if(lk.surm='',NULL,concat('Surm: ', lk.surm)),
          if(lk.surmakoht='',NULL,repis.func_rr_aadress(lk.surmakoht))
        )
      )
    ) INTO @_kirje
    from import.leinakuulutused lk
    WHERE lk.kirjekood = in_kirjekood COLLATE UTF8_ESTONIAN_CI;

    RETURN @_kirje;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` FUNCTION `kiviaadress`(
	`kirjekood` CHAR(10)
) RETURNS varchar(15) CHARSET utf8 COLLATE utf8_estonian_ci
    COMMENT 'foo'
BEGIN
    DECLARE _ret_val VARCHAR(15);

    SELECT CONCAT_WS('.', 'KIVI', mk.tiib, mk.tahvlinr, mk.tulp, mk.rida) 
	 INTO _ret_val 
	 FROM import.memoriaal_kivitahvlid mk
	 WHERE mk.kirjekood = kirjekood;

    RETURN _ret_val;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `el_kart_import`()
proc_label:BEGIN

	DECLARE _new_persoon CHAR(10);
	DECLARE _kirjekood CHAR(10);
	DECLARE _perenimi VARCHAR(50);
	DECLARE _eesnimi VARCHAR(50);
	DECLARE _sünd VARCHAR(50);
	DECLARE _välisviide VARCHAR(2000);
	DECLARE _allikas VARCHAR(20) DEFAULT 'ELK';
	DECLARE _persoon CHAR(10);
	DECLARE finished INTEGER DEFAULT 0;

   -- Declare variables to hold diagnostics area information
   DECLARE code CHAR(5) DEFAULT '00000';
   DECLARE msg TEXT;
	
   DECLARE cur1 CURSOR FOR
		SELECT ifnull(ek.persoon, lpad(repis.func_next_id('persoon'), 10, '0')) AS elk_p
		     , ek.kirjekood, ek.perenimi, ek.eesnimi, ek.SündISO, ek.Viit
		     , k0.persoon AS persoon
		FROM import.el_kart ek
		LEFT JOIN repis.kirjed k0 ON k0.kirjekood = ek.persoon;

   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
         GET DIAGNOSTICS CONDITION 1
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
         INSERT INTO repis.z_queue (task, params, erred_at) values (code, msg, now());
      END;


	UPDATE repis.counter SET VALUE = 299999 WHERE id = 'persoon';

	OPEN cur1;
	read_loop: LOOP
		FETCH cur1 INTO _new_persoon, _kirjekood, _perenimi, _eesnimi, _sünd, _välisviide, _persoon;
		if _persoon IS NULL then
			SET _persoon = _new_persoon;
			INSERT INTO repis.kirjed (
				persoon, kirjekood, 
				Kirje, 
				Perenimi, Eesnimi, Sünd,
				Välisviide, Allikas, created_at, created_by)
			VALUES (
				_persoon, _persoon, 
				repis.kirje_std_persoon(_perenimi, _eesnimi, NULL, NULL, _sünd, NULL),
				_perenimi, _eesnimi, _sünd, 
				_välisviide, 'persoon', NOW(), 'import'); 
		END if; 
			
		INSERT INTO repis.kirjed (
			persoon, kirjekood, 
			Kirje, 
			Perenimi, Eesnimi, Sünd,
			Välisviide, Allikas, created_at, created_by)
		VALUES (
			_persoon, _kirjekood, 
			repis.kirje_std_persoon(_perenimi, _eesnimi, NULL, NULL, _sünd, NULL),
			_perenimi, _eesnimi, _sünd, 
			_välisviide, _allikas, NOW(), 'import');
			
		INSERT INTO repis.v_kirjesildid (kirjekood, silt, created_at, created_by)
		VALUES (_persoon, 'EMEM', NOW(), 'import');
		
		CALL repis.proc_NK_refresh(_persoon);
	
	END loop;
	close cur1;
	SET finished = 0;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`localhost` PROCEDURE `fix_pr`(
    IN _search CHAR(10),
    IN _replace CHAR(10)
)
proc_label:BEGIN

  SET @search = _search COLLATE utf8_estonian_ci;
  SET @replace = _replace COLLATE utf8_estonian_ci;
  
  UPDATE import.pereregister
  SET isik_eesnimi = REPLACE(isik_eesnimi, @search, @replace),
      isik_perenimi = REPLACE(isik_perenimi, @search, @replace),
      isa_eesnimi = REPLACE(isa_eesnimi, @search, @replace),
      isik_perenimi_endine1 = REPLACE(isik_perenimi_endine1, @search, @replace),
      isik_perenimi_endine2 = REPLACE(isik_perenimi_endine2, @search, @replace),
      isik_perenimi_endine3 = REPLACE(isik_perenimi_endine3, @search, @replace),
      isik_perenimi_endine4 = REPLACE(isik_perenimi_endine4, @search, @replace),
      isik_eesnimi_endine1 = REPLACE(isik_eesnimi_endine1, @search, @replace),
      isik_eesnimi_endine2 = REPLACE(isik_eesnimi_endine2, @search, @replace)
  ;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_AA`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
BEGIN

    SELECT import.kirje_AA(in_kirjekood) INTO @_kirje;

    DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi
           , Sünd, Sünnikoht, Surm, Surmakoht
           , Allikas)
    SELECT in_persoon, in_kirjekood, @_kirje
           , ifnull(aa.perenimi, ''), ifnull(aa.eesnimi, '')
           , aa.sünd, aa.sünnikoht, aa.surm, aa.surmakoht
           , 'AA'
    FROM import.album_academicum aa
    WHERE aa.kirjekood = in_kirjekood;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_ELK`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
proc_label:BEGIN

    SELECT import.kirje_ELK(in_kirjekood) INTO @_kirje;

    DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi, Isanimi, Emanimi
           , Sünd, Surm, Sünnikoht, Surmakoht
			  , Allikas)
    SELECT in_persoon, in_kirjekood, kirje
           , IFNULL(elk.perenimi, ''), IFNULL(elk.eesnimi, ''), '', ''
           , elk.SündISO, elk.SurmISO
			  , elk.`sünnikoht` as isik_synnikoht
			  , elk.surmakoht as isik_surmakoht
			  , 'ELK'
    FROM import.el_kart elk
    WHERE elk.kirjekood = in_kirjekood;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_KIRM`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
proc_label:BEGIN

    SELECT import.kirje_KIRM(in_kirjekood) INTO @_kirje;

    DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi, Isanimi, Emanimi
           , Sünd, Surm, Sünnikoht, Surmakoht
			  , Allikas)
    SELECT in_persoon, in_kirjekood, @_kirje
           , IFNULL(k4.perenimi, ''), IFNULL(k4.eesnimi, ''), '', ''
           , k4.Sünd, NULL
			  , '' as isik_synnikoht
			  , '' as isik_surmakoht
			  , 'KIRM'
    FROM import.kirmus4 k4
    WHERE k4.kirjekood = in_kirjekood;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_PF`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
BEGIN

    SELECT import.kirje_PF(in_kirjekood) INTO @_kirje;

    DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi
           , Sünd, Allikas)
    SELECT in_persoon, in_kirjekood, @_kirje
           , ifnull(pf.perenimi, ''), ifnull(pf.eesnimi, '')
           , pf.synniaeg, 'PF'
    FROM import.polisforhor pf
    WHERE pf.kirjekood = in_kirjekood;

    UPDATE repis.kirjed SET pub_wwiiref = 1 WHERE persoon = in_persoon;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_PR`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
proc_label:BEGIN

    SELECT import.kirje_PR(in_kirjekood) INTO @_kirje;

    DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi, Isanimi, Emanimi
           , Sünd, Surm, Sünnikoht, Surmakoht
			  , Allikas)
    SELECT in_persoon, in_kirjekood, @_kirje
           , ifnull(pr.isik_perenimi, ''), ifnull(pr.isik_EESNIMI, ''), ifnull(pr.isa_eesnimi, ''), ifnull(pr.ema_eesnimi, '')
           , pr.Sünd, pr.Surm
			  , case isik_synnikoht REGEXP "^[a-zA-ZõäöüÕÄÖÜ]" 
			    WHEN true THEN isik_synnikoht ELSE '' END as isik_synnikoht
			  , case isik_surmakoht REGEXP "^[a-zA-ZõäöüÕÄÖÜ]" 
			    WHEN true THEN isik_surmakoht ELSE '' END as isik_surmakoht
			  , 'PR'
    FROM import.pereregister pr
    WHERE pr.isikukood = in_kirjekood;

  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_RK`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
proc_label:BEGIN

   SELECT import.kirje_RK(in_kirjekood) INTO @_kirje;

   INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi, Isanimi, Emanimi
           , Sünd, Sünnikoht, Surm, Surmakoht, Allikas, legend
           , KirjePersoon)
   SELECT in_persoon, in_kirjekood, @_kirje
           , ifnull(rk.PERENIMI, ''), ifnull(rk.EESNIMI, ''), ifnull(rk.ISANIMI, ''), ifnull(rk.EMANIMI, '')
           , CASE WHEN length(rk.Sünniaeg) = 0 THEN rk.SA ELSE rk.Sünniaeg END, rk.`sünnilinn, vald, rajoon`
           , rk.Surm, rk.`Hukkamiskoht/surmakoht`, 'RK', rk.otmetki
           , @_kirje
   FROM import.repr_kart rk
   WHERE rk.isikukood = in_kirjekood;
   
   UPDATE repis.kirjed SET pub_emem = 1 WHERE persoon = in_persoon;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_RPT`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
proc_label:BEGIN

    SELECT import.kirje_RPT(in_kirjekood) INTO @_kirje;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi, Isanimi, Emanimi
           , Sünd, Surm, Sünnikoht, Surmakoht
			  , Allikas, legend
           , KirjePersoon)
    SELECT in_persoon, in_kirjekood, @_kirje
           , ifnull(pt.PERENIMI, ''), ifnull(pt.EESNIMI, ''), ifnull(pt.ISAEESNIMI, ''), ifnull(pt.EMAEESNIMI, '')
           , pt.Sünd, pt.Surm, pt.synnikoht, pt.surmakoht
			  , 'RPT', NULL
           , @kirje_persoon
    FROM import.pensionitoimikud pt
    WHERE pt.kirjekood = in_kirjekood;
  END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_RR`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
proc_label:BEGIN
  if TRUE then

    SELECT import.kirje_RR(in_kirjekood) INTO @_kirje;

    DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi, Isanimi, Emanimi
           , Sünd, Surm, Sünnikoht, Surmakoht
			  , Allikas)
    SELECT in_persoon, in_kirjekood, @_kirje
           , ifnull(rr.perenimi, ''), ifnull(rr.eesnimi, '')
			  , ifnull(rr.isanimi, ''), ''
           , rr.Sünd, rr.Surm
			  , repis.func_rr_aadress(sünnikoht) AS sünnikoht
			  , repis.func_rr_aadress(surmakoht) AS surmakoht
			  , 'RR'
    FROM import.rahvastikuregister rr
    WHERE rr.kirjekood = in_kirjekood;

  END IF;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_SDI`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
BEGIN

    SELECT import.kirje_SDI(in_kirjekood) INTO @_kirje;

    DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi
           , Sünd, Surm, Surmakoht
			  , Allikas)
    SELECT in_persoon, in_kirjekood, @_kirje
           , ifnull(sdi.surname, ''), ifnull(sdi.forename, '')
           , sdi.born, sdi.dead
			  , sdi.placeofdeath
			  , 'SDI'
    FROM import.swedish_death_index sdi
    WHERE sdi.kirjekood = in_kirjekood;

    UPDATE repis.kirjed SET pub_wwiiref = 1 WHERE persoon = in_persoon;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `import_velk`(
	IN `in_persoon` CHAR(10),
	IN `in_kirjekood` CHAR(10)
)
BEGIN

    SELECT import.kirje_VELK(in_kirjekood) INTO @_kirje;

    DELETE FROM repis.kirjed WHERE kirjekood = in_kirjekood;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje
           , Perenimi, Eesnimi
           , Sünd, Sünnikoht, Surm, Surmakoht
			  , Allikas)
    SELECT in_persoon, in_kirjekood, @_kirje
           , ifnull(lk.perenimi, ''), ifnull(lk.eesnimi, '')
           , lk.sünd, lk.sünnikoht, lk.surm, lk.surmakoht
			  , 'VELK'
    FROM import.leinakuulutused lk
    WHERE lk.kirjekood = in_kirjekood;

    UPDATE repis.kirjed SET pub_wwiiref = 1 WHERE persoon = in_persoon;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `kirmus_import`()
proc_label:BEGIN

	DECLARE _new_persoon CHAR(10);
	DECLARE _kirjekood CHAR(10);
	DECLARE _perenimi VARCHAR(50);
	DECLARE _eesnimi VARCHAR(50);
	DECLARE _sünd VARCHAR(50);
	DECLARE _välisviide VARCHAR(2000) DEFAULT '';
	DECLARE _allikas VARCHAR(20) DEFAULT 'kirm';
	DECLARE _persoon CHAR(10);
	DECLARE finished INTEGER DEFAULT 0;

   -- Declare variables to hold diagnostics area information
   DECLARE code CHAR(5) DEFAULT '00000';
   DECLARE msg TEXT;
	
   DECLARE cur1 CURSOR FOR
		SELECT ifnull(k4.persoon, lpad(repis.func_next_id('persoon'), 10, '0')) AS kirm_p
		     , k4.kirjekood, k4.perenimi, k4.eesnimi, k4.sünd
		     , k0.persoon AS persoon
		FROM import.kirmus4 k4
		LEFT JOIN repis.kirjed k0 ON k0.kirjekood = k4.persoon
		WHERE k4.sisestamata = 'EI'
		;

   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      BEGIN
         GET DIAGNOSTICS CONDITION 1
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
         INSERT INTO repis.z_queue (task, params, erred_at) values (code, msg, now());
      END;


	UPDATE repis.counter SET VALUE = 359999 WHERE id = 'persoon';

	OPEN cur1;
	read_loop: LOOP
		FETCH cur1 INTO _new_persoon, _kirjekood, _perenimi, _eesnimi, _sünd, _persoon;
		if _persoon IS NULL then
			SET _persoon = _new_persoon;
			INSERT INTO repis.kirjed (
				persoon, kirjekood, 
				Kirje, 
				Perenimi, Eesnimi, Sünd,
				Välisviide, Allikas, created_at, created_by)
			VALUES (
				_persoon, _persoon, 
				repis.kirje_std_persoon(_perenimi, _eesnimi, NULL, NULL, _sünd, NULL),
				_perenimi, _eesnimi, _sünd, 
				_välisviide, 'persoon', NOW(), 'import'); 
		END if; 
			
		INSERT INTO repis.kirjed (
			persoon, kirjekood, 
			Kirje, 
			Perenimi, Eesnimi, Sünd,
			Välisviide, Allikas, created_at, created_by)
		VALUES (
			_persoon, _kirjekood, 
			repis.kirje_std_persoon(_perenimi, _eesnimi, NULL, NULL, _sünd, NULL),
			_perenimi, _eesnimi, _sünd, 
			_välisviide, _allikas, NOW(), 'import');
			
	
	END loop;
	close cur1;
	SET finished = 0;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `kivi_import`(
	IN `_lisatahvel` CHAR(5)
)
proc_label:BEGIN

    INSERT ignore INTO repis.kirjed (
	         persoon, kirjekood, Kirje, Perenimi, Eesnimi, Isanimi,
            Sünd, Surm, Allikas,
            KirjePersoon)
    SELECT  mk.persoon, mk.kirjekood, mk.kirje,
            ifnull(mk.PERENIMI, ''),
            ifnull(mk.EESNIMI, ''),
            ifnull(mk.ISANIMI, ''),
            CASE WHEN left(mk.aastad, 4) REGEXP '^[0-9]+$' THEN left(mk.aastad, 4) ELSE '' END, 
				CASE WHEN right(mk.aastad, 4) REGEXP '^[0-9]+$' THEN right(mk.aastad, 4) ELSE '' END, 
				'KIVI',
            mk.nimi
    FROM import.memoriaal_kivitahvlid mk
    WHERE mk.tahvel = _lisatahvel;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`michelek`@`127.0.0.1` PROCEDURE `RK_import`(
	IN `_persoon` CHAR(10),
	IN `_kirjekood` CHAR(10)
)
proc_label:BEGIN

    SELECT CASE WHEN rk.Sünniaeg = '' THEN rk.SA ELSE rk.Sünniaeg END INTO @_sünd
    FROM import.repr_kart rk
    WHERE rk.isikukood = _kirjekood COLLATE utf8_estonian_ci;

    SELECT repis.desktop_person_text(
      rk.PERENIMI, rk.EESNIMI, rk.ISANIMI, rk.EMANIMI,
      @_sünd, rk.Surm
    ) INTO @_kirje_persoon
    FROM import.repr_kart rk
    WHERE rk.isikukood = _kirjekood COLLATE utf8_estonian_ci;

    UPDATE import.repr_kart rk
       SET rk.persoon = _persoon
     WHERE rk.isikukood = _kirjekood COLLATE utf8_estonian_ci;

    INSERT IGNORE INTO repis.kirjed (persoon, kirjekood, Kirje, Perenimi, Eesnimi, Isanimi, Emanimi,
            Sünd, Surm, Allikas, legend,
            KirjePersoon)
    SELECT _persoon, _kirjekood, @_kirje_persoon,
            ifnull(rk.PERENIMI, ''),
            ifnull(rk.EESNIMI, ''),
            ifnull(rk.ISANIMI, ''),
            ifnull(rk.EMANIMI, ''),
            CASE WHEN length(rk.Sünniaeg) = 0 THEN rk.SA ELSE rk.Sünniaeg END, rk.Surm, 'RK', rk.otmetki,
            @_kirje_persoon
    FROM import.repr_kart rk
    WHERE rk.isikukood = _kirjekood;
    
  END ;;
DELIMITER ;

