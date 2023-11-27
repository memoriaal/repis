 CREATE OR REPLACE table tmp.tmp SELECT ss.kirjekood, pr.isikukood
-- SELECT ss.kirjekood, ss.perekonnanimi, prp.perenimi4, ss.eesnimi, ss.kirje, ss.sünd, ss.surm, ss.pereregister, pr.*
FROM import.`R14-R16` ss
LEFT JOIN import.pr_synd prs ON prs.`sünd` = ss.`sünd`
LEFT JOIN import.pr_eesnimed pre ON pre.eesnimi4 = LEFT(ss.eesnimi, 4) AND pre.kirjekood = prs.kirjekood
LEFT JOIN import.pr_perenimed prp ON prp.perenimi4 = LEFT(ss.perekonnanimi, 4) AND prp.kirjekood = pre.kirjekood
LEFT JOIN import.pereregister pr ON pr.isikukood = prp.kirjekood
WHERE ss.pereregister IS NULL
  AND pr.isikukood IS NOT NULL
 GROUP BY ss.kirjekood
;

 UPDATE import.`R14-R16` ss
LEFT JOIN tmp.tmp tmp ON tmp.kirjekood = ss.kirjekood
SET ss.pereregister = tmp.isikukood
WHERE ss.pereregister IS NULL
AND tmp.isikukood IS NOT NULL
;

SELECT * FROM import.`R14-R16` ss
right JOIN tmp.tmp tmp ON tmp.kirjekood = ss.kirjekood
