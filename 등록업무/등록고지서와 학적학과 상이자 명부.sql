SELECT hakbun �й�, �� || �̸� ����, schoolyear �����г⵵, semester �����б�, lvl �����г�, �а��ڵ� ���а�, CLASS �����а�
FROM TDFEEGOJI, tm����
--UPDATE TDFEEGOJI SET CLASS = (SELECT �а��ڵ� FROM tm����
--WHERE �й� = hakbun AND �а��ڵ� <> class)
WHERE schoolyear = :�г⵵ --AND semester = :�б�
AND �й� = hakbun AND �а��ڵ� <> class