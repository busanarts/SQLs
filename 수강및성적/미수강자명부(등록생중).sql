SELECT hj_hakbun �й�, hj_kname ����, statename(hj_state) ��������, USR_TODATE(USR_LCDATE(hj_hakbun)) ��������������
FROM AC2711, AC12011
WHERE dd_year = &�г⵵ AND dd_hakgi = &�б�
AND dd_nidate IS NOT NULL
AND dd_hakbun = hj_hakbun
AND dd_hakbun NOT IN (SELECT DISTINCT sj_hakbun FROM AC1401
WHERE sj_year = dd_year AND sj_hakgi = dd_hakgi)
