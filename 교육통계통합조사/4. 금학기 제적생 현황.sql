-- 12) ���б� ������ ��Ȳ
SELECT �а���, �г�, MAX(DECODE(hb_name, '�̵��', �ο�, 0)) �̵��,
MAX(DECODE(hb_name, '�̺���', �ο�, 0)) �̺���, MAX(DECODE(hb_name, '����', �ο�, 0)) ����,
MAX(DECODE(hb_name, '�л�����', �ο�, 0)) �л�����
from
(SELECT �а���, HJ_HAKNYUN �г�, HB_NAME, COUNT(*) �ο�
FROM AC12011_&���������, AC1104, ac1202_&���������, AC1121, TBL�а�
WHERE HJ_HAKBUN = HC_HAKBUN
AND hc_scode = hb_code
AND hj_hakbun NOT LIKE 'T%'
AND SUBSTR(HC_SCODE,1,1) = '2'
AND HC_SIYMD >= DECODE(SUBSTR(&���������,5,2), '04',
  									SUBSTR(&���������,1,4) - 1 || '1001',
                    SUBSTR(&���������,1,4) || '0401')
  AND HC_SIYMD <= DECODE(SUBSTR(&���������,5,2), '04',
  									SUBSTR(&���������,1,4) || '0331',
                    SUBSTR(&���������,1,4) || '0931')
AND HJ_HGCODE = HG_CODE AND HG_MCODE = �а��ڵ�
GROUP BY �а���, HJ_HAKNYUN, HB_NAME)
GROUP BY �а���, �г�
ORDER BY �а���, �г�