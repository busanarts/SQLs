--SELECT * FROM TDFEEGOJI
UPDATE TDFEEGOJI SET CLASS = (SELECT 학과코드 FROM tm학적
WHERE 학번 = hakbun AND 학과코드 <> class)
WHERE schoolyear = :학년도 AND semester = :학기
AND hakbun IN (SELECT 학번 FROM TM학적
WHERE 학번 = hakbun AND 학과코드 <> class)