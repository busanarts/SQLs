--INSERT INTO TDFEEGOJI
SELECT
schoolyear, semester, studentgbn, hakbun, CLASS,
lvl, 0, SUM(fee), 0, 0, 0,  '77',
'', '', '', '����', '',
'', '', '', '', '',
'', 'sahn', SYSDATE, '', '',
0, '', '', SUM(fee)
FROM TDFEERECEIVE
--SELECT schoolyear, semester, studentgbn, hakbun, CLASS, lvl, fee FROM TDFEERECEIVE
WHERE
schoolyear = :�г⵵
AND semester = :�б�
AND hakbun NOT IN (SELECT hakbun FROM TDFEEGOJI
WHERE schoolyear = :�г⵵ AND semester = :�б�)
GROUP BY schoolyear, semester, studentgbn, hakbun, CLASS, lvl