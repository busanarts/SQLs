SELECT 학과명, 학년, MAX(DECODE(성별, '남', 미등록, 0)) 남, MAX(DECODE(성별, '여', 미등록, 0)) 여
FROM (
SELECT 학과명, hj_haknyun 학년, DECODE(hj_sexgbn, '1', '남', '2', '여', '') 성별, COUNT(*) 미등록
FROM TDFEEGOJI, psutis.ac12011_2012_10_01, psutis.ac1121, psutis.tbl학과
WHERE schoolyear = '2012'
AND semester = '2'
AND state = '11'
AND hakbun = hj_hakbun
AND SUBSTR(hj_state, 1, 1) IN ( '0', '1')
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
AND hj_jhgbn < '50'
GROUP BY 학과명, hj_haknyun, DECODE(hj_sexgbn, '1', '남', '2', '여', '')
)
GROUP BY 학과명, 학년
ORDER BY 학과명, 학년