SELECT a.schoolyear 학년도, a.SEMESTER 학기, a.hakbun 학번, a.SCHOLARSHIP 고지서장학금, 장학대상장학금
FROM TDFEEGOJI a, (SELECT schoolyear, semester, hakbun, sum(scholarship) 장학대상장학금 from TDJANGHAK
WHERE gbn = '1' AND schoolyear = :학년도
GROUP BY schoolyear, semester, hakbun) b
WHERE a.schoolyear = :학년도
AND a.STUDENTGBN <> '30304000'
AND a.SCHOOLYEAR = b.SCHOOLYEAR
AND a.SEMESTER = b.SEMESTER
AND a.hakbun = b.HAKBUN
AND a.SCHOLARSHIP <> 장학대상장학금
