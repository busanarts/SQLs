--SELECT * FROM TM����
UPDATE TMSCHOOLDTL SET degreeno = (SELECT hj_hakwino FROM psutis.ac12011 WHERE hj_hakbun = hakbun),
graduateno = (SELECT hj_jolupno FROM psutis.ac12011 WHERE hj_hakbun = hakbun)
WHERE hakbun IN (SELECT �й� FROM TM���� WHERE �й� LIKE 'A%' AND SUBSTR(��������,1,1) = '8' )