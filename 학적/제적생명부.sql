SELECT hc_year �г⵵, hc_hakgi �б�, DEPTNAME(HJ_HGCODE) �а�, HJ_HAKBUN �й�, HJ_KNAME ����,
STATENAME(hc_scode) ��������, USR_TODATE(HC_SIYMD) ��������
FROM AC12011, AC1202
WHERE HJ_HAKBUN = HC_HAKBUN
AND SUBSTR(HC_SCODE,1,1) = '2' AND HC_SIYMD >= :�������� AND hc_siymd <= :��������
ORDER BY HC_SIYMD