CREATE OR REPLACE TABLE tmp.tmp AS SELECT distinct kirjekood, isikukood, persoon FROM (
SELECT pr.isikukood, pr.persoon
-- , pre.eesnimi, prp.perenimi AS prp, prs.sünd AS prs, '|'
, aa.kirjekood, aae.eesnimi, aap.perenimi, aas.sünd
FROM import.pereregister pr
left join import.pr_eesnimed pre ON pre.kirjekood = pr.isikukood
LEFT JOIN import.pr_perenimed prp ON prp.kirjekood = pr.isikukood
LEFT JOIN import.pr_synd prs ON prs.kirjekood = pr.isikukood
LEFT JOIN import.aa_synd aas ON aas.sünd = prs.sünd
LEFT JOIN import.aa_perenimed aap ON aap.perenimi3 = prp.perenimi3 AND aap.kirjekood = aas.kirjekood
LEFT JOIN import.aa_eesnimed aae ON aae.eesnimi3 = pre.eesnimi3 AND aae.kirjekood = aas.kirjekood
LEFT JOIN import.album_academicum aa ON aa.kirjekood = aas.kirjekood

WHERE aa.kirjekood IS NOT NULL
  AND aae.kirjekood IS NOT NULL 
  AND aap.kirjekood IS NOT NULL 

  AND (
       aa.persoon IS NULL AND pr.persoon IS NOT NULL
    OR aa.kirjekood IS NULL AND pr.isikukood IS NOT NULL
      )

GROUP BY aa.kirjekood
) aaper
;


-- 369 pereregistrit
CREATE OR REPLACE TABLE tmp.tmp AS SELECT distinct isikukood, kirjekood FROM (
SELECT pr.isikukood, pre.eesnimi, prp.perenimi AS prp, prs.sünd AS prs
     , aa.kirjekood, aa.eesnimi_orig, aa.perenimi_orig, aa.sünd
FROM import.pereregister pr
left join import.pr_eesnimed pre ON pre.kirjekood = pr.isikukood
LEFT JOIN import.pr_perenimed prp ON prp.kirjekood = pr.isikukood
LEFT JOIN import.pr_synd prs ON prs.kirjekood = pr.isikukood
LEFT JOIN import.album_academicum aa ON aa.sünd = prs.sünd
WHERE TRUE
     AND aa.pereregister IS NULL  AND pr.isikukood IS NOT NULL
     AND aa.perenimi_orig like CONCAT('%', prp.perenimi, '%')
     AND aa.eesnimi_orig like CONCAT('%', pre.eesnimi, '%')
) aaper
;
-- Uuenda pereregistrit
UPDATE import.album_academicum aa
right JOIN tmp.tmp tmp ON tmp.kirjekood = aa.kirjekood
SET aa.pereregister = tmp.isikukood WHERE aa.pereregister IS null
;


-- 96 persooni
CREATE OR REPLACE TABLE tmp.tmp AS SELECT distinct kirjekood, persoon FROM (
SELECT pr.isikukood, pr.persoon, pre.eesnimi, prp.perenimi AS prp, prs.sünd AS prs
     , aa.kirjekood, aa.eesnimi_orig, aa.perenimi_orig, aa.sünd
FROM import.pereregister pr
left join import.pr_eesnimed pre ON pre.kirjekood = pr.isikukood
LEFT JOIN import.pr_perenimed prp ON prp.kirjekood = pr.isikukood
LEFT JOIN import.pr_synd prs ON prs.kirjekood = pr.isikukood
LEFT JOIN import.album_academicum aa ON aa.sünd = prs.sünd
WHERE TRUE
     AND aa.persoon IS NULL AND pr.persoon IS NOT NULL
     AND aa.perenimi_orig like CONCAT('%', prp.perenimi, '%')
     AND aa.eesnimi_orig like CONCAT('%', pre.eesnimi, '%')
) aaper
;
-- Uuenda persoone
UPDATE import.album_academicum aa
right JOIN tmp.tmp tmp ON tmp.kirjekood = aa.kirjekood
SET aa.persoon = tmp.persoon WHERE aa.persoon IS NULL
;


SELECT *
FROM import.pereregister pr
right JOIN import.album_academicum aa ON aa.persoon = pr.persoon
WHERE aa.pereregister IS NULL
  AND pr.isikukood IS NOT NULL
;


-- uuenda AA
UPDATE import.album_academicum aa
-- PR järgi ridadest, kus persoon klapib
LEFT JOIN import.pereregister pr ON aa.persoon = pr.persoon
-- kopeeri pereregistri kood
SET aa.pereregister = pr.isikukood
-- kui AA's puudub persoon
WHERE aa.pereregister IS NULL
-- ja PR'is on persoon olemas
  AND pr.isikukood IS NOT NULL
;
