SELECT 학과명, 학년,
MAX(DECODE(사유별, '군휴학', 인원, 0)) 군입대,
MAX(DECODE(사유별, '개인사정', 인원, 0)) 개인사정
FROM (
	SELECT 학과명, HJ_HAKNYUN 학년, DECODE(hj_state, '12', '군휴학', '개인사정') 사유별,
	COUNT(*) 인원
	FROM AC12011_2012_10_01, AC1121, TBL학과
	WHERE SUBSTR(HJ_STATE,1,1) = '1'
	--AND HJ_HAKNYUN = '2'
	AND HJ_HGCODE = HG_CODE
	AND HG_MCODE = 학과코드
	AND HJ_JHGBN >= '50'
	GROUP BY CUBE(HJ_HAKNYUN, 학과명,  DECODE(hj_state, '12', '군휴학', '개인사정')))
GROUP BY 학과명, 학년
ORDER BY 학과명, 학년