INSERT INTO TDFEERECEIVE
SELECT schoolyear, semester, studentgbn, :�������, hakbun, state, CLASS, lvl, 0, 0, '2000', '', '', 0,
'�������ó��', 'sahn', sysdate, 'sahn', sysdate
FROM TDFEEGOJI
WHERE (admissionfee + tuition - scholarship) = 0
AND hakbun NOT in (SELECT hakbun FROM TDFEERECEIVE
WHERE schoolyear = '2012' AND semester = '2' AND state = '77')