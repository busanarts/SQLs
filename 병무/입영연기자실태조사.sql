SELECT ����, �б�������, �б��ڵ�, �б���, �ֹι�ȣ, ����, ���г⵵, �г�, �з�, �����ڵ�, �����а�,
hj_haknyun �����г�, �а��� �������а�, hb_name, ����������,
--case WHEN TRIM(�����а�) = TRIM(�������а�) THEN '�������׾���'
--     ELSE '�����а� ������' END
     ���
FROM TBL�Կ������� a, AC12011, AC1121, tbl�а�, ac1104 ,
(SELECT hc_hakbun, MAX(hc_siymd) ����������
FROM AC1202 WHERE SUBSTR(hc_scode,1,1) IN ('1', '2', '3', '7', '8')
GROUP BY hc_hakbun)
WHERE �ֹι�ȣ = hj_jcode1 || hj_jcode2
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
AND hj_state = hb_code
AND hj_hakbun = hc_hakbun(+)
