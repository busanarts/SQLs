SELECT dd_hakgi, COUNT(*) ���ο�, SUM(dd_suryo) ��ϱ�, SUM(dd_ihakg) ���б�, SUM(dd_nipgum) ������
FROM AC2711
WHERE dd_year = '2011'
AND dd_nidate IS NOT NULL
AND dd_nidate < '20110301'
GROUP BY CUBE(dd_hakgi)
ORDER BY dd_hakgi