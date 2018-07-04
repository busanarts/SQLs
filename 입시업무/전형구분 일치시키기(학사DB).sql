UPDATE psutis.ac12011_2013_04_01
SET hj_jhgbn = (SELECT iw_jhgubun
FROM ipsi.IPSI201, ipsi.ipsi401
WHERE iw_year = '2013' AND iw_year = si_year AND iw_shno = si_shno AND si_hakbun = hj_hakbun)
WHERE hj_hakbun LIKE 'A13%' AND hj_jhgbn IS null
