SELECT * FROM TDJANGHAK m
WHERE (schoolyear, semester, hakbun)
IN (SELECT schoolyear, semester, hakbun FROM TDJANGHAKSUM d
WHERE d.SCHOOLYEAR = m.SCHOOLYEAR
AND d.SEMESTER = m.SEMESTER
AND d.HAKBUN = m.HAKBUN
AND d.JANGHAKCD1 = m.JANGHAKCD
AND d.SCHOLARSHIP1 <> m.SCHOLARSHIP)
UNION
SELECT * FROM TDJANGHAK m
WHERE (schoolyear, semester, hakbun)
IN (SELECT schoolyear, semester, hakbun FROM TDJANGHAKSUM d
WHERE d.SCHOOLYEAR = m.SCHOOLYEAR
AND d.SEMESTER = m.SEMESTER
AND d.HAKBUN = m.HAKBUN
AND d.JANGHAKCD2 = m.JANGHAKCD
AND d.SCHOLARSHIP2 <> m.SCHOLARSHIP)
UNION
SELECT * FROM TDJANGHAK m
WHERE (schoolyear, semester, hakbun)
IN (SELECT schoolyear, semester, hakbun FROM TDJANGHAKSUM d
WHERE d.SCHOOLYEAR = m.SCHOOLYEAR
AND d.SEMESTER = m.SEMESTER
AND d.HAKBUN = m.HAKBUN
AND d.JANGHAKCD3 = m.JANGHAKCD
AND d.SCHOLARSHIP3 <> m.SCHOLARSHIP)
UNION
SELECT * FROM TDJANGHAK m
WHERE (schoolyear, semester, hakbun)
IN (SELECT schoolyear, semester, hakbun FROM TDJANGHAKSUM d
WHERE d.SCHOOLYEAR = m.SCHOOLYEAR
AND d.SEMESTER = m.SEMESTER
AND d.HAKBUN = m.HAKBUN
AND d.JANGHAKCD4 = m.JANGHAKCD
AND d.SCHOLARSHIP4 <> m.SCHOLARSHIP)