delimiter ;;

CREATE OR replace FUNCTION `func_rr_aadress`(
	`_aadress` VARCHAR(500)
)
RETURNS VARCHAR(500) CHARSET utf8 COLLATE utf8_estonian_ci
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
func_label:BEGIN

   RETURN REGEXP_REPLACE(
				  REGEXP_REPLACE(_aadress, '\\|+', ', ')
				, ', $', '');

END;;
  
delimiter ;
