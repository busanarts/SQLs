SELECT a.schoolyear �г⵵, a.semester �б�, janghaknm ���и�, DECODE(janghakgbn, '10', '����', '20', '����', '30', '����') ���б���,
a.hakbun �й�, �� || �̸� ����, �а���, a.lvl �г�, a.scholarship ���б�, confirm ����, ��Ī ��������,
DECODE(state, '77', '�ϳ�', '88', 'ȯ��', state) ��ϱݳ��λ���
FROM TDJANGHAK a, TM����, tm�а� c, tm�����ڵ�, TMSCHOLARSHIP d, TDFEEGOJI e
WHERE a.schoolyear = '2013'
AND a.hakbun = �й� AND a.CLASS = c.�а��ڵ� AND �������� = �����ڵ� AND a.JANGHAKCD = d.JANGHAKCD
AND a.SCHOOLYEAR = e.SCHOOLYEAR AND a.SEMESTER = e.SEMESTER AND a.HAKBUN = e.HAKBUN
AND e.studentgbn <> '30304000'