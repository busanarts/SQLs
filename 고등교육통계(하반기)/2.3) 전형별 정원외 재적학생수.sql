SELECT 학과명, 학년,
       MAX(DECODE(전형구분, '54', DECODE(학적구분, '재학', 인원))) 외인_재학,
	     MAX(DECODE(전형구분, '54', DECODE(학적구분, '휴학', 인원))) 외인_휴학,
       MAX(DECODE(전형구분, '53', DECODE(학적구분, '재학', 인원))) 농촌_재학,
       MAX(DECODE(전형구분, '53', DECODE(학적구분, '휴학', 인원))) 농촌_휴학,
       MAX(DECODE(전형구분, '51', DECODE(학적구분, '재학', 인원))) 대졸_재학,
       MAX(DECODE(전형구분, '51', DECODE(학적구분, '휴학', 인원))) 대졸_휴학,
       MAX(DECODE(전형구분, '52', DECODE(학적구분, '재학', 인원))) 전졸_재학,
       MAX(DECODE(전형구분, '52', DECODE(학적구분, '휴학', 인원))) 전졸_휴학,
       MAX(DECODE(전형구분, '55', DECODE(학적구분, '재학', 인원))) 성인_재학,
       MAX(DECODE(전형구분, '55', DECODE(학적구분, '휴학', 인원))) 성인_휴학,
       MAX(DECODE(전형구분, '56', DECODE(학적구분, '재학', 인원))) 기초_재학,
       MAX(DECODE(전형구분, '56', DECODE(학적구분, '휴학', 인원))) 기초_휴학
FROM
(SELECT 학과명, hj_haknyun 학년, hj_jhgbn 전형구분, jg_fname,
DECODE(SUBSTR(hj_state,1,1), '0', '재학', '휴학') 학적구분, COUNT(*) 인원
FROM AC12011_2012_10_01, AC1121, tbl학과, ipsi.ipsi108
WHERE SUBSTR(hj_state,1,1) IN ('0', '1') AND hj_jhgbn >= '50'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
AND hj_jhgbn = jg_code
GROUP BY 학과명, hj_haknyun, hj_jhgbn, jg_fname, DECODE(SUBSTR(hj_state,1,1), '0', '재학', '휴학'))
GROUP BY 학과명, 학년
ORDER BY 학과명, 학년