--SELECT * FROM TM학적
UPDATE TMSCHOOLDTL SET degreeno = (SELECT hj_hakwino FROM psutis.ac12011 WHERE hj_hakbun = hakbun),
graduateno = (SELECT hj_jolupno FROM psutis.ac12011 WHERE hj_hakbun = hakbun)
WHERE hakbun IN (SELECT 학번 FROM TM학적 WHERE 학번 LIKE 'A%' AND SUBSTR(학적상태,1,1) = '8' )