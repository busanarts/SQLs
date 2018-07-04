SELECT iw_year 입시연도, iw_chasu 차수, iw_kname 성명, iw_shno 수험번호, hg_name 지원학과
FROM ipsi.ipsi201, ipsi.IPSI104
WHERE iw_year = :입시연도 AND iw_chasu = :차수
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
AND iw_jcode1 || iw_jcode2 IN
(SELECT iw_jcode1 || iw_jcode2 주민번호 FROM
(SELECT iw_jcode1, iw_jcode2, COUNT(*) FROM ipsi.ipsi201
WHERE iw_year = :입시연도 AND iw_chasu = :차수
GROUP BY iw_jcode1, iw_jcode2
HAVING COUNT(*) > 1))