SELECT 학자금융자학과코드, '11' 학적코드, IW_JCODE1 || IW_JCODE2 주민번호, DR_SHNO 학번, IW_KNAME 학생성명, '1' 학년,
DECODE(NVL(DR_DRNIYMD, '0'), '0', '1', '2') 등록금납부여부,
DECODE(NVL(DR_DRNIYMD,'0'), '0', &sYear || '0330', DR_DRNIYMD) 등록금마감일,  --'20090930' 등록금마감일,
'2' 수납계좌구분, '032' 수납계좌은행코드1, '036010337518' 수납계좌번호1, '부산예술대학 안원철' 수납계좌예금주1,
DECODE(JM_GUBUN, '2', JM_DCODE, '00') 장학코드1,
DECODE(JM_GUBUN, '2', dr_jhtotal, 0) 국가장학금1,
'' 장학코드2, 0 국가장학금2, '' 장학코드3, 0 국가장학금3,
--DECODE(JM_GUBUN, '0', DR_JHTOTAL + NVL(DR_YCGUM, 0), 0) 교내장학금, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) 교외장학금,
DECODE(JM_GUBUN, '0', DR_JHTOTAL, 0) 교내장학금, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) 교외장학금,
DR_SURYO 수업료, DR_GISBI 기성회비, DR_IPHAK 입학금,
JH_NAME 장학명, DR_DRTOTAL 등록금액
FROM IPSI.IPSI203, IPSI.IPSI204, IPSI.IPSI201, IPSI.IPSI104 A, IPSI.IPSI401, psutis.AC1121 AA, psutis.TBL학과, PSUTIS.AC1701
WHERE DR_YEAR = &sYear
AND DR_YEAR = IW_YEAR AND DR_SHNO = IW_SHNO
AND iw_year = si_year AND iw_shno = si_shno
AND IW_JWHGCODE1 = A.HG_CODE AND HG_GYCODE = AA.HG_CODE AND AA.HG_MCODE = 학과코드(+)
AND DR_YEAR = JH_YEAR(+) AND DR_SHNO = JH_SHNO(+)
AND JH_CODE = JM_CODE
union
SELECT 학자금융자학과코드, '11' 학적코드, IW_JCODE1 || IW_JCODE2 주민번호, DR_SHNO 학번, IW_KNAME 학생성명, '1' 학년,
DECODE(NVL(DR_DRNIYMD, '0'), '0', '1', '2') 등록금납부여부,
DECODE(NVL(DR_DRNIYMD,'0'), '0', &sYear || '0330', DR_DRNIYMD) 등록금마감일,  --'20090930' 등록금마감일,
'2' 수납계좌구분, '032' 수납계좌은행코드1, '036010337518' 수납계좌번호1, '부산예술대학 안원철' 수납계좌예금주1,
--'', 0, '', 0, '', 0, NVL(DR_YCGUM, 0), 0,
'' 장학코드1, 0 국가장학금1, '' 장학코드2, 0 국가장학금2, '' 장학코드3, 0 국가장학금3, 0 교내장학금, 0 교외장학금,
DR_SURYO, DR_GISBI, DR_IPHAK,
'', DR_DRTOTAL
FROM IPSI.IPSI203, IPSI.IPSI201, IPSI.IPSI104 A, IPSI.IPSI401, psutis.AC1121 AA, psutis.TBL학과
WHERE DR_YEAR = &sYear
AND DR_YEAR = IW_YEAR AND DR_SHNO = IW_SHNO
AND iw_year = si_year AND iw_shno = si_shno
AND IW_JWHGCODE1 = A.HG_CODE AND HG_GYCODE = AA.HG_CODE AND AA.HG_MCODE = 학과코드(+)
and iw_shno not in (select jh_shno from ipsi.ipsi204 where jh_year = &sYear)
