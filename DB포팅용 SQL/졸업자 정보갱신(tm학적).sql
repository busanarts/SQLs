--SELECT * FROM TM학적
UPDATE tm학적 SET 학위번호 = (SELECT hj_hakwino FROM psutis.ac12011 WHERE hj_hakbun = 학번),
졸업증서번호 = (SELECT hj_jolupno FROM psutis.ac12011 WHERE hj_hakbun = 학번),
졸업일자 = (SELECT hj_jymd FROM psutis.ac12011 WHERE hj_hakbun = 학번)
WHERE SUBSTR(학적상태,1,1) = '8'
AND 학위번호 IS NULL AND 학번 LIKE 'A%'