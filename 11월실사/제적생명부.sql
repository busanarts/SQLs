SELECT �а���, hj_hakbun �й�, hj_kname ����, decode(substr(hj_jcode2,1,1), '1', '��', '��') ����, hc_haknyun �г�, hc_siymd ����������, hb_name ����������
FROM AC1202, AC12011, AC1121, tbl�а�, AC1104
WHERE  hc_siymd >= '20100301' --AND hc_siymd < '20070301'
AND SUBSTR(hc_scode,1,1) IN ('2')
AND hc_hakbun = hj_hakbun
AND hc_scode = hb_code
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
ORDER BY hc_haknyun, �а���