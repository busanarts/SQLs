--SELECT * FROM TDFEEGOJI, TM����
UPDATE TDFEEGOJI a SET CLASS = (SELECT �а��ڵ� FROM TM���� WHERE �й� = hakbun)
WHERE hakbun IN (SELECT �й� FROM TM���� WHERE �й� = a.hakbun AND a.CLASS <> �а��ڵ�)