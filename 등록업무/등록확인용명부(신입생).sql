SELECT hg_name �а�, si_hakbun �й�, si_shno �����ȣ, si_name ����, dr_chasu ����,
dr_drtotal - dr_jhtotal ���δ��ݾ�, dr_nbtotal ���εȱݾ�, dr_ycgum ��ġ��, dr_wbycgum ��ġ��ȯ��,
dr_drtotal - dr_jhtotal - dr_nbtotal - dr_ycgum �̳���, dr_drniymd ��������,
DECODE(dr_nbtotal, 0, '', DECODE(SIGN(dr_drtotal - dr_jhtotal - (dr_ycgum - dr_wbycgum) - dr_nbtotal), -1, '�ʰ�����', 1, '�κг���')) ���
FROM ipsi.IPSI203, ipsi.ipsi401, ipsi.ipsi104
WHERE dr_year = &�г⵵
AND dr_Year = si_year
AND dr_shno = si_shno
AND si_hgcode = hg_gycode
--AND dr_drniymd IS NOT NULL
--AND dr_nbtotal = 0
UNION
SELECT hg_name �а�, '' �й�, '' �����ȣ, '' ����, '' ����,
sum(dr_drtotal - dr_jhtotal) ���δ��ݾ�, SUM(dr_nbtotal) ���εȱݾ�, SUM(dr_ycgum) ��ġ��, SUM(dr_wbycgum) ��ġ��ȯ��,
SUM(dr_drtotal - dr_jhtotal - dr_nbtotal - dr_ycgum) �̳���,
'' ��������, '' ���
FROM ipsi.IPSI203, ipsi.ipsi401, ipsi.ipsi104
WHERE dr_year = &�г⵵
AND dr_Year = si_year
AND dr_shno = si_shno
AND si_hgcode = hg_gycode
GROUP BY CUBE(hg_name)