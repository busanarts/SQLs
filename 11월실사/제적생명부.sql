SELECT 학과명, hj_hakbun 학번, hj_kname 성명, decode(substr(hj_jcode2,1,1), '1', '남', '여') 성별, hc_haknyun 학년, hc_siymd 학적변동일, hb_name 학적변동명
FROM AC1202, AC12011, AC1121, tbl학과, AC1104
WHERE  hc_siymd >= '20100301' --AND hc_siymd < '20070301'
AND SUBSTR(hc_scode,1,1) IN ('2')
AND hc_hakbun = hj_hakbun
AND hc_scode = hb_code
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
ORDER BY hc_haknyun, 학과명