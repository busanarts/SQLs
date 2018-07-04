SELECT 학자금융자학과코드 학과코드, '11' 학적코드, IW_JCODE1 || IW_JCODE2 주민번호, DR_SHNO 학번, IW_KNAME 학생명, '1' 학년,
DECODE(NVL(DR_DRNIYMD, '0'), '0', '1', '2') 등록금납부대상구분,
DECODE(NVL(DR_DRNIYMD,'0'), '0', &입시년도 || '0330', DR_DRNIYMD) 수납원장마감일자,
'2' 수납계좌구분1, '032' 수납계좌은행코드1, '036010337518' 수납계좌번호1, '부산예술대학 안원철' 수납계좌예금주1,
'' 수납계좌구분2, '' 수납계좌은행코드2, '' 수납계좌번호2, '' 수납계좌예금주2,
DECODE(JM_GUBUN, '2', JM_DCODE, '00') 장학코드1,
DECODE(JM_GUBUN, '2', dr_jhtotal, 0) 국가장학금1,
'' 장학코드2, 0 국가장학금2, '' 장학코드3, 0 국가장학금3,
--DECODE(JM_GUBUN, '0', DR_JHTOTAL + NVL(DR_YCGUM, 0), 0) 교내장학금, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) 교외장학금,
DECODE(JM_GUBUN, '0', DR_JHTOTAL, 0) 교내장학금, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) 교외장학금,
DR_IPHAK 입학금, DR_SURYO 수업료, DR_GISBI 기성회비
--JH_NAME 장학명, DR_DRTOTAL 등록금액
FROM IPSI.IPSI203, IPSI.IPSI204, IPSI.IPSI201, IPSI.IPSI104 A, psutis.AC1121 AA, psutis.TBL학과, PSUTIS.AC1701
where iw_year = &입시년도
AND iw_result = '1'
AND (iw_chasu = &차수 OR (iw_chasu <= &차수 AND iw_rank2 > 0))
AND iw_jwhgcode1 = a.hg_code
and hg_gycode = aa.hg_code and hg_mcode  = 학과코드
AND iw_year = dr_year AND iw_shno = dr_shno
AND DR_YEAR = JH_YEAR(+) AND DR_SHNO = JH_SHNO(+)
AND JH_CODE = JM_CODE(+)


--SELECT DR_SHNO 학번, IW_JCODE1 || IW_JCODE2 주민번호, IW_KNAME 학생성명, 학자금융자학과코드, '1' 소속군,
--'11' 학적구분, '1' 학년코드, DECODE(NVL(DR_DRNIYMD, '0'), '0', '1', '2') 등록금납부여부,
--DECODE(NVL(DR_DRNIYMD,'0'), '0', '20110330', DR_DRNIYMD) 등록금마감일,  --'20090930' 등록금마감일,
--'0' 수납계좌구분, '032' 수납계좌은행코드, '036010337518' 수납계좌번호, '부산예술대학 안원철' 수납계좌예금주,
--DECODE(JM_GUBUN, '2', JM_DCODE, '00') 장학코드,
--DECODE(JM_GUBUN, '2', dr_jhtotal, 0) 국가장학금1,
--'' 장학코드2, 0 국가장학금2, '' 장학코드3, 0 국가장학금3,
--DECODE(JM_GUBUN, '0', DR_JHTOTAL + NVL(DR_YCGUM, 0), 0) 교내장학금, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) 교외장학금,
--DR_SURYO 수업료, DR_GISBI 기성회비, DR_IPHAK 입학금,
--JH_NAME 장학명, DR_DRTOTAL 등록금액
--FROM IPSI.IPSI203, IPSI.IPSI204, IPSI.IPSI201, IPSI.IPSI104 A, psutis.AC1121 AA, psutis.TBL학과, PSUTIS.AC1701
--WHERE DR_YEAR = '2011' and dr_chasu = '02'
--AND DR_YEAR = IW_YEAR
--AND DR_SHNO = IW_SHNO
--AND IW_JWHGCODE1 = A.HG_CODE AND HG_GYCODE = AA.HG_CODE AND AA.HG_MCODE = 학과코드(+)
--AND DR_YEAR = JH_YEAR AND DR_SHNO = JH_SHNO
--AND JH_CODE = JM_CODE
--union
--SELECT DR_SHNO 학번, IW_JCODE1 || IW_JCODE2 주민번호, IW_KNAME 학생성명, 학자금융자학과코드, '1' 소속군,
--'11' 학적구분, '1' 학년코드, DECODE(NVL(DR_DRNIYMD, '0'), '0', '1', '2') 등록금납부여부,
--DECODE(NVL(DR_DRNIYMD,'0'), '0', '20110330', DR_DRNIYMD) 등록금마감일,  --'20090930' 등록금마감일,
--'0' 수납계좌구분, '032' 수납계좌은행코드, '036010337518' 수납계좌번호, '부산예술대학 안원철' 수납계좌예금주,
--'', 0, '', 0, '', 0, NVL(DR_YCGUM, 0), 0,
--DR_SURYO, DR_GISBI, DR_IPHAK,
--'', DR_DRTOTAL
--FROM IPSI.IPSI203, IPSI.IPSI201, IPSI.IPSI104 A, psutis.AC1121 AA, psutis.TBL학과
--WHERE DR_YEAR = '2011'  and dr_chasu = '02'
--AND DR_YEAR = IW_YEAR
--AND DR_SHNO = IW_SHNO
--AND IW_JWHGCODE1 = A.HG_CODE AND HG_GYCODE = AA.HG_CODE AND AA.HG_MCODE = 학과코드(+)
--and iw_shno not in (select jh_shno from ipsi.ipsi204 where jh_year = '2011')
