--SELECT * FROM TM����
UPDATE tm���� SET ������ȣ = (SELECT hj_hakwino FROM psutis.ac12011 WHERE hj_hakbun = �й�),
����������ȣ = (SELECT hj_jolupno FROM psutis.ac12011 WHERE hj_hakbun = �й�),
�������� = (SELECT hj_jymd FROM psutis.ac12011 WHERE hj_hakbun = �й�)
WHERE SUBSTR(��������,1,1) = '8'
AND ������ȣ IS NULL AND �й� LIKE 'A%'