SELECT * FROM TDFEEGOJI
WHERE schoolyear = :�г⵵ AND semester = :�б�
AND hakbun NOT IN (SELECT hakbun FROM TMVIRTUALNO)
