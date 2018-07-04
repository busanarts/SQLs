SELECT * FROM TDFEEGOJI
WHERE schoolyear = :학년도 AND semester = :학기
AND hakbun NOT IN (SELECT hakbun FROM TMVIRTUALNO)
