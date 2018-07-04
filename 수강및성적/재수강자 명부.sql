-- 2번이상 재수강시 문제발생 소지 있음

SELECT 학번, 성명, 과목명,
max(DECODE(recourseyn, 'N', 학년도 || '-' || 학기  )) 전학기수강기록,
max(DECODE(recourseyn, 'Y', 학년도 || '-' || 학기  )) 현학기수강신청
FROM (
SELECT 학번, 성 || 이름 성명, b.schoolyear 학년도, b.semester 학기, b.gmcode 과목코드, c.GMKNAME 과목명, recourseyn
FROM ciss.TM학적 a, psutis.TDCOURSE b, psutis.TMGWAMOK c
WHERE (hakbun, c.gmkname) IN (
SELECT hakbun, gmkname FROM psutis.TDCOURSE a, psutis.TMGWAMOK b
WHERE a.schoolyear = :학년도
AND a.semester = :학기
AND recourseyn = 'Y'
AND a.gmcode = b.GMCODE)
AND 학번 = hakbun
AND b.GMCODE= c.GMCODE
ORDER BY 학번, b.gmcode, b.schoolyear, b.semester
) GROUP BY 학번, 성명, 과목명
