SELECT DISTINCT rd_jcode1, rd_jcode2 FROM ipsi301
WHERE
(rd_jcode1, rd_jcode2) NOT IN (SELECT iw_jcode1, iw_jcode2 FROM IPSI201
WHERE iw_year = '2010')