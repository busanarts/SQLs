-- 12) 금학기 제적생 현황
SELECT 학과명, 학년, MAX(DECODE(hb_name, '미등록', 인원, 0)) 미등록,
MAX(DECODE(hb_name, '미복학', 인원, 0)) 미복학, MAX(DECODE(hb_name, '자퇴', 인원, 0)) 자퇴,
MAX(DECODE(hb_name, '학사제적', 인원, 0)) 학사제적
from
(SELECT 학과명, HJ_HAKNYUN 학년, HB_NAME, COUNT(*) 인원
FROM AC12011_&조사기준일, AC1104, ac1202_&조사기준일, AC1121, TBL학과
WHERE HJ_HAKBUN = HC_HAKBUN
AND hc_scode = hb_code
AND hj_hakbun NOT LIKE 'T%'
AND SUBSTR(HC_SCODE,1,1) = '2'
AND HC_SIYMD >= DECODE(SUBSTR(&조사기준일,5,2), '04',
  									SUBSTR(&조사기준일,1,4) - 1 || '1001',
                    SUBSTR(&조사기준일,1,4) || '0401')
  AND HC_SIYMD <= DECODE(SUBSTR(&조사기준일,5,2), '04',
  									SUBSTR(&조사기준일,1,4) || '0331',
                    SUBSTR(&조사기준일,1,4) || '0931')
AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
GROUP BY 학과명, HJ_HAKNYUN, HB_NAME)
GROUP BY 학과명, 학년
ORDER BY 학과명, 학년