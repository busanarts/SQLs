UPDATE IPSI401
SET si_jhgubun = (SELECT iw_jhgubun FROM IPSI201 WHERE iw_year = '2011' AND iw_year = si_year AND iw_shno = si_shno)
WHERE si_year = '2011'
--SELECT hj_hakbun, hj_jhgbn, si_jhgubun FROM IPSI401, psutis.ac12011
--WHERE si_year = '2011'
--AND hj_hakbun = si_hakbun
--AND (hj_jhgbn <> si_jhgubun OR hj_jhgbn IS null)