SELECT ����.�а�, hg_kname �а���, ���л���, Ż������, �����л���,
trunc((���л��� - NVL(Ż������,0) + NVL(�����л���,0)) / ���л��� * 100,2) ���л�������
FROM
(SELECT hj_hgcode �а�, COUNT(*) ���л���
FROM psutis.AC12011
WHERE hj_state = '01'
GROUP BY hj_hgcode) ����,
(SELECT hj_hgcode �а�, COUNT(*) Ż������
FROM psutis.AC1202, psutis.AC12011
WHERE SUBSTR(hc_scode,1,1) = '2' AND hc_siymd >= :���ۿ����� AND hc_siymd <= :���Ῥ����
AND hc_hakbun = hj_hakbun
GROUP BY hj_hgcode) ����,
(SELECT hj_hgcode �а�, COUNT(*) �����л���
FROM psutis.AC1202, psutis.AC12011
WHERE hc_scode = '52' AND hc_siymd >= :���ۿ����� AND hc_siymd <= :���Ῥ����
AND hc_hakbun = hj_hakbun
GROUP BY hj_hgcode) ������, psutis.AC1121
WHERE ����.�а� = ����.�а�(+) AND ����.�а� = ������.�а�(+)
AND ����.�а� = hg_code