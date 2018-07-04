--UPDATE IPSI201 SET iw_dungrok = '0'
--WHERE iw_year = :입시연도;

UPDATE ipsi.IPSI201 SET iw_dungrok = '1'
WHERE iw_year = :입시연도
AND (iw_year, iw_shno) IN ( SELECT schoolyear, hakbun FROM ciss.TDFEEGOJI
WHERE schoolyear = :입시연도
--AND studentgbn <> '30304000'
AND state IN ('77', '22', '33'));   -- 77 = 완납, 22 = 유예

UPDATE ipsi.IPSI201 SET iw_dungrok = '4'
WHERE iw_year = :입시연도
AND (iw_year, iw_shno) IN ( SELECT schoolyear, hakbun FROM ciss.TDFEEGOJI
WHERE schoolyear = :입시연도
--AND studentgbn <> '30304000'
AND state IN ('88'));   -- 77 = 완납, 22 = 유예

