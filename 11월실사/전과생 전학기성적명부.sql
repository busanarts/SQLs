SELECT hj_hakbun 학번, hj_kname 성명, DEPTNAME(SUBSTR(hj_hakbun,4,2)) 입학시학과, 학과명 현학과, hc_siymd 전과일자,
sc_year 학년도, sc_hakgi 학기, sc_pjavg 평점평균
FROM AC1202, AC12011, AC1402, AC1121, tbl학과
WHERE hc_scode = '31'
AND hc_year = '2008'
AND hc_hakbun = hj_hakbun
AND SUBSTR(hj_hakbun,4,2) IN ('40', '43')
AND hc_year = sc_year
AND hc_hakbun = sc_hakbun
AND sc_hakgi = '1'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
ORDER BY hc_hakbun