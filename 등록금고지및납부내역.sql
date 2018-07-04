SELECT 학과명, 학번, aa.lvl 학년, 성 || 이름 성명, admissionfee 입학금, tuition 수업료, aa.etcfee 예치금, scholarship 장학금,
aa.admissionfee + aa.tuition + aa.etcfee - scholarship 고지금액, rcvamt 납부금액, rcvdt 납부일자, bb.state 학적상태,
bb.RECEIVEDT 납부일, bb.fee 실납부금액
FROM TDFEEGOJI aa, tm학과 c, TM학적 a, TDFEERECEIVE bb
WHERE aa.schoolyear = '2012'
AND aa.semester = '1'
AND aa.hakbun = 학번 AND a.학과코드 = c.학과코드
AND aa.SCHOOLYEAR = bb.SCHOOLYEAR
AND aa.SEMESTER = bb.SEMESTER
AND aa.HAKBUN = bb.HAKBUN
