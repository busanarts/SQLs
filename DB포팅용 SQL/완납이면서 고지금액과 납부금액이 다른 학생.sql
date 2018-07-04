SELECT schoolyear 학년도, semester 학기, lvl 학년, hakbun 학번, 성 || 이름 성명,
admissionfee 입학금, tuition 수업료, etcfee 기타납부금, scholarship 장학금, prefee 예치금,
admissionfee + tuition + etcfee - scholarship - prefee 고지금액, rcvamt 납부누계액
FROM TDFEEGOJI, tm학적
WHERE schoolyear = '2013'
AND state = '77'
AND admissionfee + tuition + etcfee - scholarship - prefee <>  rcvamt
AND hakbun = 학번
