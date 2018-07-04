SELECT a.schoolyear 학년도, a.semester 학기, a.lvl 학년, a.hakbun 학번, a.admissionfee 입학금, a.tuition 수업료, a.scholarship 장학금, a.prefee 예치금,
DECODE(sign(admissionfee + tuition - scholarship - prefee), -1, 0, admissionfee + tuition - scholarship - prefee) 고지금액, rcvamt 납입금계, fee 납입누계
FROM TDFEEGOJI a,
(SELECT schoolyear, semester, lvl, hakbun, SUM(DECODE(state, '88', -fee, '55', 0, fee)) fee  FROM
TDFEERECEIVE WHERE
--state = '88'
studentgbn <> '30304000'
GROUP BY schoolyear, semester, lvl, hakbun) b
WHERE a.schoolyear = :학년도
AND a.studentgbn <> '30304000'
AND a.state = '77'
--AND prefee > 0
--AND (admissionfee+ tuition- scholarship) <> (prefee+rcvamt+NVL(fee,0))
--AND (prefee+rcvamt <> NVL(fee,0))
AND rcvamt <> fee
AND a.schoolyear = b.SCHOOLYEAR(+)
AND a.SEMESTER = b.SEMESTER(+)
AND a.HAKBUN = b.HAKBUN(+)
