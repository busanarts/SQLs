SELECT semester 학기, 학과명, lvl 학년, SUM(tuition) 수업료, SUM(admissionfee) 입학금, SUM(scholarship) 장학금, SUM(prefee) 예치금, SUM(rcvamt) 실납입금
FROM TDFEEGOJI, tm학과
WHERE schoolyear = :학년도 AND semester = :학기
AND CLASS = 학과코드
--AND hakbun IN (SELECT 학번 FROM TM학적 WHERE 학적상태 = '01')
--GROUP  BY semester, CUBE(학과명, lvl)
GROUP  BY semester, 학과명, lvl
ORDER BY semester, lvl, 학과명
