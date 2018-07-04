SELECT a.*, b.scholarship 고지장학금,
f_feestatenm(b.state) 납부구분, c.changedt 학적변동일, f_hakjuknm(c.changecd) 학적변동명 FROM
(SELECT 학년도, 학기, 학번, MAX(DECODE(교내외구분, '교내', 장학금)) 교내장학금, MAX(DECODE(교내외구분, '교외', 장학금)) 교외장학금
FROM
(SELECT 학년도, 학기, 학번, 교내외구분, SUM(금액) 장학금
FROM 장학금지급현황_정보공시
GROUP by 학년도, 학기, 학번, 교내외구분)
GROUP BY 학년도, 학기, 학번) a , TDFEEGOJI b, tdschoolchg c
WHERE 학년도 = b.schoolyear
AND 학기= b.semester
AND 학번 = b.hakbun
AND b.schoolyear = c.schoolyear(+)
AND b.semester = c.semester(+)
AND b.hakbun = c.hakbun(+)
AND studentgbn <> '30304000'
AND 학년도 = '2013'
