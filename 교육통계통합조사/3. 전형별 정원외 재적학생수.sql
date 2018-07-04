SELECT 학과명, 학년, '' 군위탁생, '' 산업체위탁생, '' 계약학과,
      NVL(MAX(DECODE(전형구분, '54', DECODE(학적구분, '재학', 인원))), 0) 외국인_재학,
	   	NVL(MAX(DECODE(전형구분, '54', DECODE(학적구분, '휴학', 인원))), 0) 외국인_휴학,
      NVL(MAX(DECODE(전형구분, '53', DECODE(학적구분, '재학', 인원))), 0) 농어촌_재학,
      NVL(MAX(DECODE(전형구분, '53', DECODE(학적구분, '휴학', 인원))), 0) 농어촌_휴학,
      NVL(MAX(DECODE(전형구분, '52', DECODE(학적구분, '재학', 인원))), 0) 전졸_재학,
      NVL(MAX(DECODE(전형구분, '52', DECODE(학적구분, '휴학', 인원))), 0) 전졸_휴학,
      NVL(MAX(DECODE(전형구분, '51', DECODE(학적구분, '재학', 인원))), 0) 대졸_재학,
      NVL(MAX(DECODE(전형구분, '51', DECODE(학적구분, '휴학', 인원))), 0) 대졸_휴학,
      NVL(MAX(DECODE(전형구분, '55', DECODE(학적구분, '재학', 인원))), 0) +
      NVL(MAX(DECODE(전형구분, '56', DECODE(학적구분, '재학', 인원))), 0) 기타_재학,
      NVL(MAX(DECODE(전형구분, '55', DECODE(학적구분, '휴학', 인원))), 0) +
      NVL(MAX(DECODE(전형구분, '56', DECODE(학적구분, '휴학', 인원))), 0) 기타_휴학
FROM
(SELECT hg_kname 학과명, hj_haknyun 학년, hj_jhgbn 전형구분,
DECODE(SUBSTR(hj_state,1,1), '0', '재학', '휴학') 학적구분, COUNT(*) 인원
FROM AC12011_&조사기준일, AC1121, TBL학과
WHERE SUBSTR(hj_state,1,1) IN ('0', '1') AND hj_jhgbn >= '50'
AND HJ_HAKBUN NOT LIKE 'T%'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
GROUP BY hg_kname, hj_haknyun, hj_jhgbn, SUBSTR(hj_state,1,1))
GROUP BY 학과명, 학년
ORDER BY 학과명, 학년