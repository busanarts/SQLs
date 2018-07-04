--INSERT INTO TDFEEGOJI
SELECT
schoolyear, semester, studentgbn, hakbun, CLASS,
lvl, 0, SUM(fee), 0, 0, 0,  '77',
'', '', '', '유급', '',
'', '', '', '', '',
'', 'sahn', SYSDATE, '', '',
0, '', '', SUM(fee)
FROM TDFEERECEIVE
--SELECT schoolyear, semester, studentgbn, hakbun, CLASS, lvl, fee FROM TDFEERECEIVE
WHERE
schoolyear = :학년도
AND semester = :학기
AND hakbun NOT IN (SELECT hakbun FROM TDFEEGOJI
WHERE schoolyear = :학년도 AND semester = :학기)
GROUP BY schoolyear, semester, studentgbn, hakbun, CLASS, lvl