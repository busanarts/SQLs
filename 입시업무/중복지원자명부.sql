SELECT iw_shno, iw_kname, iw_jwhgcode1 FROM IPSI201 a,
(SELECT iw_jcode1, iw_jcode2, COUNT(*) FROM IPSI201
WHERE iw_year = &NowYear
AND iw_chasu = '92'
GROUP BY iw_jcode1, iw_jcode2
HAVING COUNT(*) > 1) b
WHERE a.iw_jcode1 = b.iw_jcode1 AND a.iw_jcode2 = b.iw_jcode2