SELECT hj_hakbun �й�, hj_kname ����, hj_jcode1 || SUBSTR(hj_jcode2, 1,1) || '******' �ֹι�ȣ,
hg_kname �а�, hj_haknyun �г�, hb_name ��������, usr_TODATE(hc_siymd) ����������
FROM psutis.ac12011, psutis.ac1202, psutis.ac1121, psutis.ac1104
WHERE hc_siymd > :��������
and hc_scode in ('21', '24')
AND hj_hakbun = hc_hakbun
AND hj_hgcode = hg_code
AND hc_scode = hb_code
ORDER BY hc_siymd