SELECT 성적.hakbun, 성적.gmcode, 과목.gmkname, 성적.schoolyear, 성적.SEMESTER, 성적.totjumsu
  FROM psutis.TDRESULT 성적,
       psutis.TMGWAMOK 과목,
       (SELECT hakbun, b.gmkname, COUNT(*) cnt
         FROM psutis.TDRESULT a,
              psutis.TMGWAMOK b
        WHERE injung = 'Y' --AND gradelvl <> 'F'
              AND a.gmcode = b.gmcode
              AND hakbun IN (SELECT 학번 FROM TM학적 WHERE 학적상태 IN ( '01', '11', '12', '13', '14', '15') )
              --AND hakbun IN (SELECT 학번 FROM TM학적 WHERE 학적상태 = '81')
        GROUP BY hakbun, b.gmkname
       HAVING COUNT(*) > 1
       ) 중복수강과목 -- 2번 이상 수강한 과목
 WHERE 성적.hakbun = 중복수강과목.hakbun
       AND 성적.gmcode = 과목.gmcode --AND 성적.hakbun = 'A1125087'
       AND 과목.gmkname = 중복수강과목.gmkname
       order BY hakbun, gmkname, totjumsu desc