SELECT a.schoolyear �г⵵, a.semester �б�, �й�, �� || �̸� ����, a.lvl �г�, �а���,
DECODE(janghakgbn, '10', '����', '20', '����', '30', '����') ���б���,
janghaknm ���и�, a.scholarship ���б�, DECODE(TRIM(gbn), '1', '������', '2', '������') ���ޱ���,
confirm Ȯ������, DECODE(state, '77', '���', '88', 'ȯ��', '11', '�̵��', '33', '��������', '22', '�κг�', '55', '�°�') ��Ͽ���, f_hjstate(�й�) ��������
FROM TDJANGHAK a, tm���� ����, tm�а� �а�, tmscholarship b, TDFEEGOJI c
WHERE a.schoolyear = :�г⵵ AND a.semester = :�б�
AND a.hakbun = �й�
AND a.CLASS = �а�.�а��ڵ�
AND a.janghakcd = b.JANGHAKCD
AND a.SCHOOLYEAR = c.SCHOOLYEAR AND a.SEMESTER = c.SEMESTER AND a.HAKBUN = c.HAKBUN
AND c.STUDENTGBN <> '30304000'