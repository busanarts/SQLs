SELECT a.�а���, �����ο�, MAX(DECODE(�ߵ�Ż������, '�̵��', �ο�)) �̵��,
	   MAX(DECODE(�ߵ�Ż������, '�̺���', �ο�)) �̺���,
       MAX(DECODE(�ߵ�Ż������, '����', �ο�)) ����,
       MAX(DECODE(�ߵ�Ż������, '�л�����', �ο�)) ��Ÿ
FROM
(SELECT �а���, hb_name �ߵ�Ż������, COUNT(*) �ο�
FROM AC1202, AC12011, AC1121, TBL�а�, AC1104
WHERE hc_siymd >= '20120301' AND hc_siymd <= '20130228'
AND SUBSTR(hc_scode,1,1) = '2'
AND hc_hakbun = hj_hakbun
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
AND hc_scode = hb_code
GROUP BY �а���, hb_name) a,
(SELECT �а���, COUNT(*) �����ο� FROM AC12011_2012_04_01, AC1121, tbl�а�
WHERE SUBSTR(hj_state,1,1) IN ('0', '1')
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
GROUP BY �а���) b
WHERE a.�а��� = b.�а���
GROUP BY a.�а���, �����ο�