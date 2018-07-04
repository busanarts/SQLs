SELECT a.hakbun 학번, b.admissionfee 기준입학금, a.admissionfee 부여된입학금,
b.tuition 기준수업료, a.tuition 부여된수업료, USR_LCSCODE(a.hakbun) 최종학적변동코드
FROM TDFEEGOJI a, TMFEEDTL b
WHERE schoolyear = :학년도 AND semester = :학기
AND A.CLASS = B.CLASS AND a.lvl = b.lvl
AND (a.admissionfee <> b.admissionfee OR a.tuition <> b.tuition)