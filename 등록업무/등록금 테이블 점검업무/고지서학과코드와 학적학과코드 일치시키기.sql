--SELECT * FROM TDFEEGOJI, TM학적
UPDATE TDFEEGOJI a SET CLASS = (SELECT 학과코드 FROM TM학적 WHERE 학번 = hakbun)
WHERE hakbun IN (SELECT 학번 FROM TM학적 WHERE 학번 = a.hakbun AND a.CLASS <> 학과코드)