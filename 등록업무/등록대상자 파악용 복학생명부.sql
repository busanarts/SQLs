SELECT hj_haknyun 학년, hg_kname 학과, hj_hakbun 학번, hj_kname 성명,
substr(hj_hshptel,1,3) || '-' || substr(hj_hshptel,4,4) || '-' || substr(hj_hshptel,8,4) 휴대전화,
substr(hj_hsghtel,1,3) || '-' || substr(hj_hsghtel,4,3) || '-' || substr(hj_hsghtel,7,4) 자택전화
FROM psutis.AC12011, psutis.AC1121
--WHERE hj_haknyun = '1'
WHERE  hj_state = '01'
AND hj_hakbun IN (SELECT hc_hakbun FROM psutis.AC1202 WHERE hc_siymd > '201301' AND SUBSTR(hc_scode,1,1) = '5')
AND hj_hgcode = hg_code
ORDER BY hj_haknyun, hg_kname