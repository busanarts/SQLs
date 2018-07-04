INSERT INTO TDFEERECEIVE
SELECT schoolyear, semester, studentgbn, :등록일자, hakbun, state, CLASS, lvl, 0, 0, '2000', '', '', 0,
'강제등록처리', 'sahn', sysdate, 'sahn', sysdate
FROM TDFEEGOJI
WHERE (admissionfee + tuition - scholarship) = 0
AND hakbun NOT in (SELECT hakbun FROM TDFEERECEIVE
WHERE schoolyear = '2012' AND semester = '2' AND state = '77')