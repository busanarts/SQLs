UPDATE TM���� SET �й� =  F_GETHAKBUN(�ֹε�Ϲ�ȣ,:�г⵵)
WHERE �������� >= :�г⵵ || '0225'  AND �������� = '00';
UPDATE TDFEEGOJI SET HAKBUN = (SELECT �й� FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �����ȣ = HAKBUN)
WHERE SCHOOLYEAR = :�г⵵
AND HAKBUN IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �������� = '00');
UPDATE TDFEERECEIVE SET HAKBUN = (SELECT �й� FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �����ȣ = HAKBUN)
WHERE SCHOOLYEAR = :�г⵵
AND HAKBUN IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �������� = '00');
UPDATE TDJANGHAK SET HAKBUN = (SELECT �й� FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �����ȣ = HAKBUN)
WHERE SCHOOLYEAR = :�г⵵
AND HAKBUN IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �������� = '00');
UPDATE TDJANGHAKSUM SET HAKBUN = (SELECT �й� FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �����ȣ = HAKBUN)
WHERE SCHOOLYEAR = :�г⵵
AND HAKBUN IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �������� = '00');
UPDATE TDPAYGOJI SET HAKBUN = (SELECT �й� FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �����ȣ = HAKBUN)
WHERE SCHOOLYEAR = :�г⵵
AND HAKBUN IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �������� = '00');
UPDATE TDPAYRECEIVE SET HAKBUN = (SELECT �й� FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �����ȣ = HAKBUN)
WHERE SCHOOLYEAR = :�г⵵
AND HAKBUN IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �������� = '00');
UPDATE TMVIRTUALNO SET HAKBUN = (SELECT �й� FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �����ȣ = HAKBUN)
WHERE HAKBUN IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �������� = '00');
UPDATE TM������� B SET �й� = (SELECT �й� FROM TM���� A WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �����ȣ = B.�й�)
WHERE �й� IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' AND �������� = '00');
--SELECT �й� FROM TM�������
--WHERE �й� IN (SELECT �����ȣ FROM TM���� WHERE �й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%'));

