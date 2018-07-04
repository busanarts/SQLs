SELECT 학자금융자학과코드 학과코드,  DECODE(hc_scode, '52', '15', '53', '14', '19') 학적코드,
HJ_JCODE1 || HJ_JCODE2 주민등록번호, HJ_HAKBUN 학번, HJ_KNAME 학생명,
USR_JANGHAK(b.jd_JMcode) 장학상품코드1, b.jd_etcgm 국가장학금1,
USR_JANGHAK(c.JD_JMcode) 장학상품코드2, c.jd_etcgm 국가장학금2,
'' 장학상품코드3, '' 국가장학금3,
DECODE(USR_JHGUBUN(A.JD_JMCODE), '0', a.JD_IHAKG + a.jd_suryo + a.jd_etcgm + a.JD_GISBI, 0) 교내장학금,
DECODE(USR_JHGUBUN(A.JD_JMCODE), '1', a.JD_IHAKG + a.jd_suryo + a.jd_etcgm + a.JD_GISBI, 0) 교외장학금,
DD_IHAKG 입학금, DD_GISBI 기성회비, DD_SURYO 수업료
FROM PSUTIS.AC12011, PSUTIS.AC1121, PSUTIS.TBL학과, PSUTIS.AC2711, PSUTIS.AC1711 a, PSUTIS.AC1712 b, PSUTIS.AC1713 c,
(
	SELECT * FROM PSUTIS.AC1202
    	WHERE HC_SCODE IN ('51', '52', '53') AND HC_SIYMD > DECODE(&학기, '1', &학년도 - 1 || '12', '2', &학년도 || '07')
) bokhak -- 복학자료 가져오기
WHERE SUBSTR(HJ_STATE,1,1) in ('0', '1')
AND HJ_HAKBUN = HC_HAKBUN(+)
AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
AND DD_YEAR = &학년도 AND DD_HAKGI = &학기 AND HJ_HAKBUN = DD_HAKBUN
AND dd_year = a.jd_year(+) AND dd_hakgi = a.jd_hakgi(+) AND dd_hakbun = a.jd_hakbun(+)
AND dd_year = b.jd_year(+) AND dd_hakgi = b.jd_hakgi(+) AND dd_hakbun = b.jd_hakbun(+)
AND dd_year = c.jd_year(+) AND dd_hakgi = c.jd_hakgi(+) AND dd_hakbun = c.jd_hakbun(+)
--AND dd_totgum - dd_tgmgum > 0
