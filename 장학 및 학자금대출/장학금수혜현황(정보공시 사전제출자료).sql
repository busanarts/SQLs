SELECT a.*, b.scholarship �������б�,
f_feestatenm(b.state) ���α���, c.changedt ����������, f_hakjuknm(c.changecd) ���������� FROM
(SELECT �г⵵, �б�, �й�, MAX(DECODE(�����ܱ���, '����', ���б�)) �������б�, MAX(DECODE(�����ܱ���, '����', ���б�)) �������б�
FROM
(SELECT �г⵵, �б�, �й�, �����ܱ���, SUM(�ݾ�) ���б�
FROM ���б�������Ȳ_��������
GROUP by �г⵵, �б�, �й�, �����ܱ���)
GROUP BY �г⵵, �б�, �й�) a , TDFEEGOJI b, tdschoolchg c
WHERE �г⵵ = b.schoolyear
AND �б�= b.semester
AND �й� = b.hakbun
AND b.schoolyear = c.schoolyear(+)
AND b.semester = c.semester(+)
AND b.hakbun = c.hakbun(+)
AND studentgbn <> '30304000'
AND �г⵵ = '2013'
