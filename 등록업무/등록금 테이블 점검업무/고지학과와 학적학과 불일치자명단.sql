SELECT hakbun �й�, �а��ڵ�, F_CLASSNM(�а��ڵ�) �а��ڵ�, �г�, ��������,
CLASS, F_CLASSNM(CLASS) �����а�, lvl �����г�, DECODE(state, '77', '�ϳ�', '88', 'ȯ��', '11', '�̳�', state) ���λ���
FROM TDFEEGOJI a, tm����
--UPDATE TDFEEGOJI a SET CLASS = (SELECT �а��ڵ� FROM TM���� WHERE �й� = hakbun)
WHERE schoolyear = :�г⵵ AND semester = :�б�
AND �й� = a.hakbun AND a.CLASS <> �а��ڵ�
AND studentgbn <> '30304000'