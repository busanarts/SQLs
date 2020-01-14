SELECT 중복수강.학번, MAX(DECODE(재수강여부, 'N', 과목코드)) 과목코드, MAX(DECODE(재수강여부, 'N', 과목명)) 과목명,
MAX(DECODE(재수강여부, 'N', 학년도 || '-' || 학기)) 전년도, MAX(DECODE(재수강여부, 'N', 등급)) 등급, MAX(DECODE(재수강여부, 'N', 성적인정여부)) 성적인정여부,
MAX(DECODE(재수강여부, 'Y', 학년도 || '-' || 학기)) 금년도, MAX(DECODE(재수강여부, 'Y', 등급)) 등급, MAX(DECODE(재수강여부, 'Y', 성적인정여부)) 성적인정여부
FROM
(SELECT 성적.hakbun 학번, 성적.schoolyear 학년도, 성적.semester 학기, 성적.gmcode 과목코드, GMKNAME 과목명, gradelvl 등급, recourseyn 재수강여부, injung 성적인정여부
FROM psutis.TDresult 성적, psutis.TMGWAMOK 과목, psutis.tdcourse 수강
WHERE (성적.hakbun, 성적.gmcode) IN (
SELECT hakbun, gmcode FROM psutis.TDCOURSE a
WHERE a.schoolyear = :학년도
AND a.semester = :학기
AND recourseyn = 'Y'
)
AND 성적.hakbun = 수강.hakbun
AND 성적.schoolyear = 수강.schoolyear
AND 성적.semester = 수강.semester
AND 성적.gmcode = 수강.gmcode
AND 성적.gmcode = 과목.gmcode
ORDER BY 성적.hakbun, 성적.gmcode, 성적.schoolyear, 성적.SEMESTER) 중복수강
GROUP BY 중복수강.학번