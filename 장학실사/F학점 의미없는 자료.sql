SELECT �й�, schoolyear, lvl, semester, gradelvl FROM tm���� a, psutis.tdresult b
WHERE �й� > 'A10'
AND �й� = hakbun
AND SUBSTR(REPLACE(�й�, 'A', ''), 1,2) > SUBSTR(schoolyear, 3,2)
AND gradelvl <> 'P'


--A1525077 A1225168