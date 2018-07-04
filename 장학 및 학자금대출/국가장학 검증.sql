-- 주의 : 복학생 등록금 고지작업완료후에 실행하기 바람

SELECT DISTINCT 학과.학과명,
       학적.주민등록번호,
       학적.학번,
       성 || 이름 학생성명,
       직전학기취득학점,
       ROUND(직전학기평점평균,2) 직전학기평점평균,
       F학점과목수,
       --총취득학점,
       --ROUND(총평점평균,2) 총평점평균,
       TRUNC(직전학기백분위점수,0) 직전학기백분위점수
       --TRUNC(총백분위점수,0) 총백분위점수,
  FROM TM학적 학적, TM학과 학과, tmp국가장학검증 국가장학,
       (SELECT a.Hakbun,
              최종학년학기,
              SUM(DECODE(Gradelvl, 'F', 0, GradeJum)) 직전학기취득학점,
              sum(DECODE(Gradelvl, 'F', 1, 0)) F학점과목수,
              SUM(DECODE(Gradelvl, 'P', 0, AVEJumsu) * GradeJum) / DECODE(SUM(DECODE(Gradelvl, 'P', 0, GradeJum)), 0, 1, SUM(DECODE(Gradelvl, 'P', 0, GradeJum))) 직전학기평점평균,
              SUM(DECODE(Gradelvl, 'P', 0, totJumsu) * GradeJum) / DECODE(SUM(DECODE(Gradelvl, 'P', 0, GradeJum)), 0, 1, SUM(DECODE(Gradelvl, 'P', 0, GradeJum))) 직전학기백분위점수
         FROM Psutis.TDresult A,
              (SELECT Hakbun,
                     MAX(Schoolyear||Semester) 최종학년학기
                FROM Psutis.TDresult,
                     tm학적
               WHERE Hakbun = 학번
                     AND Injung = 'Y'
               GROUP BY Hakbun
              ) B
        WHERE a.Hakbun = b.Hakbun
              AND a.Schoolyear = SUBSTR(최종학년학기, 1, 4)
              AND a.Semester = SUBSTR(최종학년학기, 5, 1)
        GROUP BY a.Hakbun,
              최종학년학기
       ) 성적

 WHERE --학적상태 = '01'
       학적.학과코드 = 학과.학과코드
       AND 학적.학번 = 성적.Hakbun(+)
       AND 학적.학번 = 국가장학.학번

ORDER BY 학과명, 학번 --AND 고지서_TOTGUM - 고지서_TGMGUM > 0