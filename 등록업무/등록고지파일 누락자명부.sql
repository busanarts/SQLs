SELECT �й�, �� || �̸� ����, �г�, f_statenm(��������) ��������,
USR_LCDATE(�й�) ��������������, F_STATENM(USR_LCSCODE(�й�)) ��������������
FROM ciss.tm����
WHERE --hj_hakbun IN ('A1225202', 'A1225201', 'A1075040', 'A0875020', 'A1225203', 'A1127020')
�������� = '01'
AND �й� NOT IN (SELECT hakbun FROM TDFEEGOJI
WHERE schoolyear = :�г⵵ AND semester = :�б�)
