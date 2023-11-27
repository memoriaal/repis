DROP VIEW aruanded.uued_kivikirjed
;
create VIEW aruanded.uued_kivikirjed as
SELECT ks_k.kirjekood AS persoon,
       repis.func_kivitekst(k2.persoon) AS kivitekst,
		 k2.Perenimi AS perenimi,
		 k2.Eesnimi AS eesnimi,
		 k2.Isanimi AS isanimi,
		 k2.Emanimi AS emanimi,
		 k2.Sünd AS sünd,
		 k2.Surm AS surm,
		 repis.func_persoonikirjed(ks_k.kirjekood) AS kirjed,
		 if(ks_k.kirjekood <> k2.persoon OR k2.Kirje = '','vaata töölaual üle','ok') AS test
		 , k1.Sildid
FROM ((repis.v_kirjesildid ks_k
LEFT JOIN repis.kirjed k1 ON(k1.kirjekood = ks_k.kirjekood))
LEFT JOIN repis.kirjed k2 ON(k2.persoon = k1.persoon AND k2.persoon = k2.kirjekood))
WHERE ks_k.silt = 'x - kivi' AND ks_k.deleted_at = '0000-00-00 00:00:00' AND !(ks_k.kirjekood in (
SELECT k0.persoon
FROM (repis.kirjed k0
LEFT JOIN repis.v_kirjesildid ks_pk ON(ks_pk.kirjekood = k0.kirjekood AND ks_pk.silt = 'Pime kivi' AND ks_pk.deleted_at = '0000-00-00 00:00:00'))
WHERE k0.Allikas = 'KIVI' AND ks_pk.kirjekood IS NULL
GROUP BY k0.persoon))