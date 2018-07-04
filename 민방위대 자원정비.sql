SELECT hj_kname 성명, hj_jcode1 || '-' || SUBSTR(hj_jcode2,1,1) || '******' 주민등록번호, '부산예술대학' 학교명, hg_kname 학과명, hj_haknyun 학년,
hj_craddr1 주소, hb_name 비고
FROM psutis.AC12011, (SELECT hc_hakbun, MAX(hc_siymd) hc_siymd FROM psutis.ac1202 GROUP BY hc_hakbun), psutis.AC1104, psutis.AC1121
WHERE AGE(hj_jcode1) >=20
AND AGE(hj_jcode1) <=40
AND SUBSTR(hj_jcode2,1,1) IN ('1', '3')
AND (SUBSTR(hj_state,1,1) IN ( '2', '1', '8')
AND hc_siymd > &학년도 || '01' OR hj_state = '01')
AND hj_hgcode = hg_code
AND hj_state = hb_code
AND hj_hakbun = hc_hakbun(+)
