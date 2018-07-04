SELECT hg_name �а�, COUNT(*) �ο�,
SUM(dr_drtotal - dr_jhtotal) ���δ��ݾ�, SUM(dr_nbtotal) ���εȱݾ�, SUM(dr_drtotal - dr_jhtotal - dr_ycgum - dr_nbtotal) �̳���
FROM ipsi.IPSI203, ipsi.IPSI401, ipsi.IPSI104
WHERE dr_year = &�Խó⵵
AND dr_Year = si_year
AND dr_shno = si_shno
AND si_hgcode = hg_gycode(+)
AND dr_drniymd IS NOT NULL
GROUP BY CUBE(hg_name)
ORDER BY hg_name