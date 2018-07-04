SELECT iw_year, iw_chasu, iw_shno, iw_jhgubun, hj_jhgbn FROM AC12011, ipsi.ipsi201
WHERE hj_iymd > '2002'
AND hj_jcode1 = iw_jcode1 AND hj_jcode2 = iw_jcode2
AND SUBSTR(hj_iymd,1,4) = iw_year
AND hj_shno = iw_shno
AND hj_jhgbn <> iw_jhgubun