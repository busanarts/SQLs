SELECT hg_kname 학과, hj_haknyun 학년, hj_hakbun 학번, hj_kname 성명, USR_TOTELNO(hj_hshptel) 전화번호
FROM AC12011, AC1121, AC2721
WHERE hj_state = '01'
AND hj_hakbun = dn_hakbun
AND dn_year = '2012' AND dn_hakgi = '1'
AND dn_nidate IS null
AND hj_hgcode = hg_code
ORDER BY hg_kname, hj_haknyun, hj_hakbun