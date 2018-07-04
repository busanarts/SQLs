SELECT 학과명, COUNT(*) 대상인원, SUM(admissionfee) 입학금계, SUM(tuition) 수업료계, SUM(scholarship) 장학금계, SUM(prefee) 예치금계
FROM TDFEEGOJI, TM학과
WHERE schoolyear = :학년도 AND semester = :학기
AND CLASS = 학과코드
AND studentgbn <> '30304000'
GROUP BY CUBE(학과명)
ORDER BY 학과명
