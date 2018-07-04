SELECT a.hakbun 학번, b.SEMESTER 학기,
f_janghaknm(b.JANGHAKCD1) 장학명1, b.SCHOLARSHIP1 장학금1, gbn1 장학구분1,
f_janghaknm(b.JANGHAKCD2) 장학명2, b.SCHOLARSHIP2 장학금2, gbn2 장학구분2,
f_janghaknm(b.JANGHAKCD3) 장학명3, b.SCHOLARSHIP3 장학금3, gbn3 장학구분3,
f_feestatenm(c.state) 납부구분,
c.ADMISSIONFEE 입학금, c.TUITION 수업료, c.SCHOLARSHIP 고지장학금,
f_feercvamt(c.hakbun, c.schoolyear, c.SEMESTER) 최종수납금액,
f_feertnamt(c.hakbun, c.schoolyear, c.SEMESTER) 환불금액
FROM TDSCHOOLCHG a, TDJANGHAKsum b, TDFEEGOJI c
WHERE changedt >= '20130201' AND changedt <= '20140130'
AND SUBSTR(changecd,1,1) = '2'
AND a.SCHOOLYEAR = b.SCHOOLYEAR
AND a.HAKBUN = b.HAKBUN
AND b.SCHOOLYEAR = c.SCHOOLYEAR
AND b.SEMESTER = c.SEMESTER
AND b.HAKBUN = c.HAKBUN
AND c.STUDENTGBN <> '30304000'
AND b.SCHOOLYEAR = '2013'