SELECT �а�, �г�,
MAX(DECODE(��������, '2', �ο�)) ����,
MAX(DECODE(��������, '5', �ο�)) ��������
FROM
(SELECT hg_kname �а�, hc_haknyun �г�, SUBSTR(hc_scode,1,1) ��������, COUNT(*) �ο�
FROM psutis.AC1202, psutis.AC1121, psutis.AC1104, psutis.AC12011
WHERE hc_siymd >= :���ۿ����� AND hc_siymd <= :���Ῥ����
AND hc_scode IN ('21','22', '23', '24', '52', '53')
AND hc_scode = hb_code
AND hc_hakbun = hj_hakbun
AND hj_hgcode = hg_code
GROUP BY hg_kname, hc_haknyun, SUBSTR(hc_scode,1,1))
GROUP BY �а�, �г�
ORDER BY �а�, �г�