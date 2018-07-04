SELECT  시도, COUNT(*) 재학인원 FROM AC12011, ipsi.ipsi201,
(SELECT DISTINCT neis학교코드, 시도 FROM ipsi.고등학교코드)
--SELECT  hj_hakbun, hj_craddr1, iw_jhgubun, iw_ggcode, iw_ggname, 시도 FROM AC12011, ipsi.ipsi201, ipsi.고등학교코드
WHERE hj_hakbun LIKE 'A06%'
AND SUBSTR(hj_iymd,1,4) = iw_year
AND hj_shno = iw_shno
AND hj_jcode1 = iw_jcode1 AND hj_jcode2 = iw_jcode2
AND iw_ggcode = neis학교코드(+)
--AND 시도 IS null
GROUP BY cube(시도)