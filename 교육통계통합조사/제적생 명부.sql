SELECT �а���, HJ_HAKNYUN �г�, hj_hakbun �й�, hj_kname ����,
DECODE(hj_sexgbn, '1', '��', '��') ����, DECODE(substr(hj_jhgbn,1,1), '5', '������', '������') ��������, HB_NAME ��������, USR_TODATE(USR_LCDATE(hj_hakbun, '20140401')) ����������
FROM AC12011_&���������, AC1104, ac1202_&���������, AC1121, TBL�а�
WHERE HJ_HAKBUN = HC_HAKBUN
AND hc_scode = hb_code
AND hj_hakbun NOT LIKE 'T%'
AND SUBSTR(HC_SCODE,1,1) = '2'
AND HC_SIYMD >= SUBSTR(&���������,1,4)-1 || '0401'
AND HC_SIYMD <= SUBSTR(&���������,1,4) || '0331'
AND HJ_HGCODE = HG_CODE AND HG_MCODE = �а��ڵ�