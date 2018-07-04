SELECT hj_haknyun �г�, hg_kname �а�, hj_hakbun �й�, hj_kname ����,
substr(hj_hshptel,1,3) || '-' || substr(hj_hshptel,4,4) || '-' || substr(hj_hshptel,8,4) �޴���ȭ,
substr(hj_hsghtel,1,3) || '-' || substr(hj_hsghtel,4,3) || '-' || substr(hj_hsghtel,7,4) ������ȭ
FROM psutis.AC12011, psutis.AC1121
--WHERE hj_haknyun = '1'
WHERE  hj_state = '01'
AND hj_hakbun IN (SELECT hc_hakbun FROM psutis.AC1202 WHERE hc_siymd > '201301' AND SUBSTR(hc_scode,1,1) = '5')
AND hj_hgcode = hg_code
ORDER BY hj_haknyun, hg_kname