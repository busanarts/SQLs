SELECT hj_hakbun �й�, hj_kname ����, DEPTNAME(SUBSTR(hj_hakbun,4,2)) ���н��а�, �а��� ���а�, hc_siymd ��������,
sc_year �г⵵, sc_hakgi �б�, sc_pjavg �������
FROM AC1202, AC12011, AC1402, AC1121, tbl�а�
WHERE hc_scode = '31'
AND hc_year = '2008'
AND hc_hakbun = hj_hakbun
AND SUBSTR(hj_hakbun,4,2) IN ('40', '43')
AND hc_year = sc_year
AND hc_hakbun = sc_hakbun
AND sc_hakgi = '1'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
ORDER BY hc_hakbun