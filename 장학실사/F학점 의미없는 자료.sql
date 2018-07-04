SELECT 학번, schoolyear, lvl, semester, gradelvl FROM tm학적 a, psutis.tdresult b
WHERE 학번 > 'A10'
AND 학번 = hakbun
AND SUBSTR(REPLACE(학번, 'A', ''), 1,2) > SUBSTR(schoolyear, 3,2)
AND gradelvl <> 'P'


--A1525077 A1225168