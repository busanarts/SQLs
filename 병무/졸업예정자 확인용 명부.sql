SELECT 학교코드, 학교명, 주민번호, 성명, 학력코드, 병무학과코드,
hj_hakbun 학번, hj_haknyun 학년, SUBSTR(hj_iymd,1,4) 입학년도,
SUBSTR(hj_jymd,1,4) 졸업년도, SUM(sj_hjum) 졸업가능여부, SUBSTR(hj_jymd, 5,2) 졸업월
FROM tbl병무용졸업예정자, AC1121, tbl학과, AC12011, AC1401
WHERE
학력코드 = hg_code AND hg_mcode = 학과코드
AND 주민번호 = hj_jcode1 || hj_jcode2
AND hj_hakbun = sj_hakbun AND sj_pjum > 0
GROUP BY 학교코드, 학교명, 주민번호, 성명, 학력코드, 학과명, 병무학과코드,
hj_hakbun, hj_haknyun, SUBSTR(hj_iymd,1,4), SUBSTR(hj_jymd,1,4), SUBSTR(hj_jymd, 5,2)
ORDER BY 주민번호