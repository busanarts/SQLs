SELECT hg_kname �а�, hj_haknyun �г�, hj_hakbun �й�, hj_kname ����, USR_TOTELNO(hj_hshptel) ��ȭ��ȣ
FROM AC12011, AC1121, AC2721
WHERE hj_state = '01'
AND hj_hakbun = dn_hakbun
AND dn_year = '2012' AND dn_hakgi = '1'
AND dn_nidate IS null
AND hj_hgcode = hg_code
ORDER BY hg_kname, hj_haknyun, hj_hakbun