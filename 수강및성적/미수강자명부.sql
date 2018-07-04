SELECT 학과명, hj_haknyun 학년, hj_hakbun 학번, hj_kname 성명
FROM AC12011, AC1121, tbl학과
WHERE hj_state = '01'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
AND hj_hakbun NOT IN (SELECT distinct sj_hakbun FROM AC1401 WHERE sj_year = '2011' AND sj_hakgi = '2')
ORDER BY 학과명, 학년, 성명
