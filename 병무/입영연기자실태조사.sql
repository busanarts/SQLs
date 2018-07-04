SELECT 연번, 학교소재지, 학교코드, 학교명, 주민번호, 성명, 입학년도, 학년, 학력, 전공코드, 전공학과,
hj_haknyun 현재학년, 학과명 현전공학과, hb_name, 학적변동일,
--case WHEN TRIM(전공학과) = TRIM(현전공학과) THEN '변동사항없음'
--     ELSE '전공학과 상이자' END
     비고
FROM TBL입영연기자 a, AC12011, AC1121, tbl학과, ac1104 ,
(SELECT hc_hakbun, MAX(hc_siymd) 학적변동일
FROM AC1202 WHERE SUBSTR(hc_scode,1,1) IN ('1', '2', '3', '7', '8')
GROUP BY hc_hakbun)
WHERE 주민번호 = hj_jcode1 || hj_jcode2
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
AND hj_state = hb_code
AND hj_hakbun = hc_hakbun(+)
