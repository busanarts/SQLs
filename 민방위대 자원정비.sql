SELECT hj_kname ����, hj_jcode1 || '-' || SUBSTR(hj_jcode2,1,1) || '******' �ֹε�Ϲ�ȣ, '�λ꿹������' �б���, hg_kname �а���, hj_haknyun �г�,
hj_craddr1 �ּ�, hb_name ���
FROM psutis.AC12011, (SELECT hc_hakbun, MAX(hc_siymd) hc_siymd FROM psutis.ac1202 GROUP BY hc_hakbun), psutis.AC1104, psutis.AC1121
WHERE AGE(hj_jcode1) >=20
AND AGE(hj_jcode1) <=40
AND SUBSTR(hj_jcode2,1,1) IN ('1', '3')
AND (SUBSTR(hj_state,1,1) IN ( '2', '1', '8')
AND hc_siymd > &�г⵵ || '01' OR hj_state = '01')
AND hj_hgcode = hg_code
AND hj_state = hb_code
AND hj_hakbun = hc_hakbun(+)
