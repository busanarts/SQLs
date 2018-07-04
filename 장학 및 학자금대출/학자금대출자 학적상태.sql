SELECT 학과코드, 주민번호, 학번 대출학번, hj_hakbun 학번, 성명,
CASE hj_state
	WHEN '24' THEN '66'
  WHEN '21' THEN '67'
  WHEN '22' THEN '67'
  WHEN '23' THEN '67'
  WHEN '81' THEN '69'
  WHEN '82' THEN '69'
  WHEN '83' THEN '69'
END 학적상태코드,
SUBSTR(hj_iymd,1,6) 입학년월,
DECODE(SUBSTR(hj_state,1,1), '8', SUBSTR(hj_jymd,1,6), SUBSTR(hj_lcymd,1,6)) 학적변동년월,
DECODE(SUBSTR(hj_state,1,1), '8', hj_jymd, hj_lcymd) 학적변동일
FROM ac12011, tbl학자금대출자
--WHERE hj_hakbun(+) = 학번
WHERE hj_jcode1(+) || hj_jcode2(+) = 주민번호

