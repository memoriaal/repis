-- SELECT * FROM repis.kirjed WHERE persoon IN ('0000218311','0000205564');

UPDATE import.pensionitoimikud rpt
left JOIN repis.kirjed k0
       ON k0.kirjekood = rpt.kirjekood
SET rpt.persoon = k0.persoon
where k0.persoon <> rpt.persoon
;
UPDATE import.pereregister pr
left JOIN repis.kirjed k0
       ON k0.kirjekood = pr.isikukood
SET pr.persoon = k0.persoon
where k0.persoon <> pr.persoon
;
UPDATE import.repr_kart rk
left JOIN repis.kirjed k0
       ON k0.kirjekood = rk.isikukood
SET rk.persoon = k0.persoon
where k0.persoon <> rk.persoon
;

-- CALL backups.backup_table('import.pereregister');