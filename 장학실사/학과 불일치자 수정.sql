UPDATE TDJANGHAK  a SET CLASS = (
SELECT �а��ڵ� FROM tm����
WHERE �й� = a.hakbun
)
--SELECT * FROM TDJANGHAK
WHERE hakbun IN (
SELECT DISTINCT �й� FROM TDJANGHAK, tm����
WHERE schoolyear = '2015'
AND semester = '1'
AND hakbun = �й�
AND CLASS <> �а��ڵ�)
AND schoolyear = '2015'
AND semester = '1'