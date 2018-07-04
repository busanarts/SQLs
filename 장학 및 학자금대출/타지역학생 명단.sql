SELECT hj_hakbun 학번, DEPTNAME(hj_hgcode) 학과,hj_kname 성명,
hj_jcode1 || '-' || hj_jcode2 주민번호, hj_craddr1 || ' ' || hj_craddr2 주소,
USR_TOTELNO(hj_hshptel) 핸드폰
FROM AC12011
WHERE hj_state = '01' AND hj_haknyun = '1'
AND hj_craddr1 NOT LIKE '부산%'
ORDER BY hj_hgcode, hj_kname