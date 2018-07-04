SELECT a.hakbun 학번, 성 || 이름 성명, a.admissionfee 입학금, a.tuition 수업료, a.SCHOLARSHIP 고지장학금,
(NVL(b.SCHOLARSHIP1,0) + NVL(b.SCHOLARSHIP2,0) + NVL(b.SCHOLARSHIP3,0) + NVL(b.SCHOLARSHIP4,0)) 장학금
FROM TDFEEGOJI a, TDJANGHAKSUM  b, TM학적
WHERE a.schoolyear = :학년도
AND a.semester = :학기
AND a.studentgbn <> '30304000'
AND a.SCHOOLYEAR = b.SCHOOLYEAR(+)
AND a.SEMESTER = b.SEMESTER(+)
AND a.hakbun = b.hakbun(+)
AND a.hakbun = 학번
AND a.SCHOLARSHIP <> (NVL(b.SCHOLARSHIP1,0) + NVL(b.SCHOLARSHIP2,0) + NVL(b.SCHOLARSHIP3,0) + NVL(b.SCHOLARSHIP4,0))
;


SELECT SUM(SCHOLARSHIP) FROM TDJANGHAK
WHERE schoolyear = '2015' AND semester = '2'
AND confirm = 'Y'
AND hakbun IN (SELECT 학번 FROM TM학적 WHERE 학적상태 = '01');
;
--AND hakbun = 'A1578006';

SELECT SUM(NVL(SCHOLARSHIP1,0) + NVL(SCHOLARSHIP2,0) + NVL(SCHOLARSHIP3,0) + NVL(SCHOLARSHIP4,0))  FROM TDJANGHAKSUM
WHERE schoolyear = '2015' AND semester = '2'
AND hakbun IN (SELECT 학번 FROM TM학적 WHERE 학적상태 = '01');;
--AND hakbun = 'A1578006'
