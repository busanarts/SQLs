--SELECT * FROM TDFEEGOJI
UPDATE TDFEEGOJI SET CLASS = (SELECT �а��ڵ� FROM tm����
WHERE �й� = hakbun AND �а��ڵ� <> class)
WHERE schoolyear = :�г⵵ AND semester = :�б�
AND hakbun IN (SELECT �й� FROM TM����
WHERE �й� = hakbun AND �а��ڵ� <> class)