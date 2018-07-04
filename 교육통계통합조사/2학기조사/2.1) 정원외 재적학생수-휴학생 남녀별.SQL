SELECT 학과명, 학년,
MAX(DECODE(성별, '남', 인원)) "휴학생(남)", MAX(DECODE(성별, '여', 인원)) "휴학생(여)"
FROM (
	SELECT 학과명, HJ_HAKNYUN 학년,
	DECODE(HJ_SEXGBN, '1', '남', '여') 성별, COUNT(*) 인원
	FROM AC12011_2010_10_01,AC1121, TBL학과
	WHERE SUBSTR(HJ_STATE,1,1) = '1'
	--AND HJ_HAKNYUN = '2'
	AND HJ_HGCODE = HG_CODE
	AND HG_MCODE = 학과코드
	AND HJ_JHGBN >= '50'
	GROUP BY HJ_HAKNYUN, 학과명, HJ_SEXGBN)
GROUP BY 학과명, 학년
