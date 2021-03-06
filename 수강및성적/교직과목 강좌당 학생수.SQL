SELECT gg_year 학년도 , gg_hakgi 학기, GG_HGCODE 학과코드, 학과명 , GG_HAKNYUN 학년,
GG_GMCODE 과목코드, GG_KNAME 과목명, SJ_GGBAN 분반, CNT 수강인원
FROM PSUTIS.AC1303,
(SELECT SJ_YEAR, SJ_HAKGI, SJ_GGHGCODE, SJ_GGGMCODE, SJ_GGBAN, COUNT(*) CNT
FROM PSUTIS.AC1401
WHERE SJ_YEAR >= &학년도 --AND SJ_HAKGI = &학기
AND SUBSTR(sj_isugbm,1,1) = '3'
GROUP BY SJ_YEAR, SJ_HAKGI, SJ_GGHGCODE, SJ_GGGMCODE, SJ_GGBAN),
PSUTIS.AC1121, PSUTIS.TBL학과
WHERE GG_YEAR >= &학년도 --AND GG_HAKGI = &학기
AND GG_YEAR = SJ_YEAR(+) AND GG_HAKGI = SJ_HAKGI(+)
AND GG_HGCODE = SJ_GGHGCODE(+) AND GG_GMCODE = SJ_GGGMCODE(+)
AND SUBSTR(gg_isugbm,1,1) = '3'
--AND GG_HAKNYUN = SJ_GGHAKNYUN(+)
AND GG_HGCODE = HG_CODE AND HG_MCODE = 학과코드
--AND CNT >= :최저수강학생수 AND CNT < :최고수강학생수
ORDER BY gg_year, gg_hakgi, GG_HGCODE, 학과명, GG_HAKNYUN, GG_KNAME, GG_GMCODE






