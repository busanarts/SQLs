UPDATE IPSI401
SET si_jhgubun = (SELECT iw_jhgubun FROM IPSI201 WHERE iw_year = &NowYear AND iw_year = si_year
AND iw_jcode1 = si_jcode1 AND iw_jcode2 = si_jcode2)
WHERE si_year = &NowYear
--SELECT hj_hakbun, hj_jhgbn, si_jhgubun FROM IPSI401, psutis.ac12011
--WHERE si_year = &NowYear
--AND hj_hakbun = si_hakbun
--AND (hj_jhgbn <> si_jhgubun OR hj_jhgbn IS null)

