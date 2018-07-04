-- 12) 금학기 제적생 현황
SELECT 학과명,
MAX(DECODE(hb_name, '미등록', DECODE(hj_sexgbn, '1', 인원, 0), 0)) "미등록(남)",
MAX(DECODE(hb_name, '미등록', DECODE(hj_sexgbn, '2', 인원, 0), 0)) "미등록(여)",
MAX(DECODE(hb_name, '미복학', DECODE(hj_sexgbn, '1', 인원, 0), 0)) "미복학(남)",
MAX(DECODE(hb_name, '미복학', DECODE(hj_sexgbn, '2', 인원, 0), 0)) "미복학(여)",
MAX(DECODE(hb_name, '자퇴', DECODE(hj_sexgbn, '1', 인원, 0), 0)) "자퇴(남)",
MAX(DECODE(hb_name, '자퇴', DECODE(hj_sexgbn, '2', 인원, 0), 0)) "자퇴(여)",
MAX(DECODE(hb_name, '학사제적', DECODE(hj_sexgbn, '1', 인원, 0), 0)) "학사제적(남)",
MAX(DECODE(hb_name, '학사제적', DECODE(hj_sexgbn, '2', 인원, 0), 0)) "학사제적(여)"
from
(SELECT 학과명, HB_NAME, hj_sexgbn, COUNT(*) 인원  FROM AC12011_&조사기준일, (
	SELECT HC_HAKBUN, HC_SCODE, HB_NAME, HC_SIYMD FROM AC1202_&조사기준일 A1, AC1104
	WHERE (HC_HAKBUN, HC_SIYMD) IN (SELECT HC_HAKBUN, MAX(HC_SIYMD) FROM AC1202_&조사기준일
	WHERE HC_HAKBUN = A1.HC_HAKBUN
	GROUP BY HC_HAKBUN)
	AND HC_SCODE = HB_CODE
), AC1121, TBL학과
WHERE --SUBSTR(HJ_STATE,1,1) = '2' -- 제적
HJ_HAKBUN = HC_HAKBUN --AND hj_jhgbn < '50'
AND SUBSTR(HC_SCODE,1,1) = '2'
AND HC_SIYMD >= SUBSTR(&조사기준일,1,4) - 1 || '0301' AND HC_SIYMD <= SUBSTR(&조사기준일,1,4) || '0229'
AND HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
GROUP BY 학과명, HB_NAME, hj_sexgbn)
GROUP BY 학과명
ORDER BY 학과명