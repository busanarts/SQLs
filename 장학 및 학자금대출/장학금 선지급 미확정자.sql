SELECT * FROM TDJANGHAK
--WHERE hakbun = 'A1625079'
WHERE schoolyear = :학년도
AND semester = :학기
AND confirm = 'N'
AND gbn = '1'