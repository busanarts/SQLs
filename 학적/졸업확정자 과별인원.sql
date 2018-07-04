SELECT 학과명, COUNT(*) 인원
FROM AC12011, AC1611, AC1121, tbl학과
WHERE hj_state = '01'
AND hj_hakbun = ju_hakbun
--AND sj_dunggub <> 'F'
AND ju_jcheck = '0'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
GROUP BY 학과명
ORDER BY 학과명
--HAVING COUNT(DISTINCT sj_year || sj_hakgi) >= 4