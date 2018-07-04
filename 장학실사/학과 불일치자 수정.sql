UPDATE TDJANGHAK  a SET CLASS = (
SELECT 학과코드 FROM tm학적
WHERE 학번 = a.hakbun
)
--SELECT * FROM TDJANGHAK
WHERE hakbun IN (
SELECT DISTINCT 학번 FROM TDJANGHAK, tm학적
WHERE schoolyear = '2015'
AND semester = '1'
AND hakbun = 학번
AND CLASS <> 학과코드)
AND schoolyear = '2015'
AND semester = '1'