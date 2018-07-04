SELECT 학번, COUNT(*) 중복수강과목수
FROM
(
SELECT aa.hakbun 학번, aa.schoolyear 학년도, aa.semester 학기, aa.gmcode 과목코드, 과목명, gradelvl 등급
FROM psutis.TDRESULT aa,
(SELECT hakbun 학번, 성 || 이름 성명, a.gmcode 과목코드, gmkname 과목명, COUNT(*) 수강횟수
FROM psutis.TDRESULT a, psutis.TMGWAMOK b, TM학적
--WHERE injung = 'Y'
--where gradelvl <> 'F'
where a.gmcode = b.gmcode
AND a.hakbun = 학번
AND hakbun IN (SELECT 학번 FROM TM학적 WHERE 학적상태 = '01')
GROUP BY hakbun, a.gmcode, gmkname, 성, 이름
HAVING COUNT(*) > 1 ) bb
WHERE aa.hakbun = 학번
AND aa.gmcode = 과목코드
--GROUP BY aa.hakbun, aa.gmcode
ORDER BY hakbun, gmcode
) ss
GROUP BY 학번