SELECT * FROM TM학적
--DELETE FROM tm학적
WHERE 학적상태 = '00'
AND TO_CHAR(작업일시, 'YYYYMMDD') > :일시
--AND 작업일시 IS null
--AND 학번 NOT IN (SELECT TRIM(hakbun) FROM TDFEEGOJI WHERE schoolyear = '2014' AND state IN ( '77'))