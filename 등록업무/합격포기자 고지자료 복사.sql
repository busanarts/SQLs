INSERT INTO TDFEEGOJI_���⵵�հ���
SELECT a.* FROM TDFEEGOJI a, tm����
WHERE a.schoolyear = :�г⵵
AND a.HAKBUN = �й�
AND �������� = '00';
--DELETE FROM TDFEEGOJI
--WHERE a.schoolyear = :�г⵵
--AND a.HAKBUN IN (select �й� FROM tm���� where �������� = '00');
INSERT INTO TDFEERECEIVE_���⵵�հ���
SELECT a.* FROM TDFEERECEIVE a, tm����
WHERE a.schoolyear = :�г⵵
AND a.HAKBUN = �й�
AND �������� = '00';
--INSERT INTO TM����_���⵵�հ���
SELECT * FROM TM����
WHERE �������� = '00';