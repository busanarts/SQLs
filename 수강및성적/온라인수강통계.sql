SELECT gg_kname, COUNT(*) FROM AC1401, AC1303
WHERE sj_year = &�г⵵ AND sj_hakgi = &�б�
AND sj_year = gg_year AND sj_hakgi = gg_hakgi
AND sj_gggmcode = gg_gmcode
AND gg_open = '2'
--and gg_kname IN ('�Ϻ���', '���������� ���ؿ� ����')
GROUP BY gg_kname