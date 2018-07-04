SELECT 학과명, 학년,
       MAX(DECODE(성별, '1', DECODE(학적구분, '재학', 인원))) 외인남_재학,
       MAX(DECODE(성별, '2', DECODE(학적구분, '재학', 인원))) 외인여_재학,
	     MAX(DECODE(성별, '1', DECODE(학적구분, '휴학', 인원))) 외인남_휴학,
       MAX(DECODE(성별, '2', DECODE(학적구분, '휴학', 인원))) 외인여_휴학
FROM
(SELECT 학과명, hj_haknyun 학년, hj_sexgbn 성별,
DECODE(SUBSTR(hj_state,1,1), '0', '재학', '휴학') 학적구분, COUNT(*) 인원
FROM AC12011_2012_10_01, AC1121, tbl학과
WHERE SUBSTR(hj_state,1,1) IN ('0', '1') AND hj_jhgbn = '54'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
GROUP BY 학과명, hj_haknyun, hj_sexgbn, DECODE(SUBSTR(hj_state,1,1), '0', '재학', '휴학'))
GROUP BY 학과명, 학년
ORDER BY 학과명, 학년