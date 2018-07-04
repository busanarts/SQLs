SELECT 학번, 성 || 이름 성명, f_deptnm(고지서.class) 등록학과명,고지서.LVL 등록학년, admissionfee + tuition 총등록금액, scholarship 장학금액,
       직전학기취득학점,
       TRUNC(직전학기백분위점수,0) 직전학기백분위점수,
       SUBSTR(최종학년학기, 1, 4) 최종성적취득년도,
       SUBSTR(최종학년학기, 5, 1) 최종성적취득학기

FROM TDFEEGOJI 고지서, tm학적_20150401,
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
                     --AND 학적상태 = '01'
                     AND Injung = 'Y'
                     AND schoolyear || semester  < :학년도 || :학기
               GROUP BY Hakbun
              ) B
        WHERE a.Hakbun = b.Hakbun
              AND a.Schoolyear = SUBSTR(최종학년학기, 1, 4)
              AND a.Semester = SUBSTR(최종학년학기, 5, 1)
        GROUP BY a.Hakbun,
              최종학년학기
       ) 성적

WHERE 고지서.schoolyear = :학년도
AND 고지서.semester = :학기
AND 고지서.hakbun = 학번
       AND 학번 = 성적.Hakbun(+)
       AND 고지서.SCHOOLYEAR = :학년도
       AND 고지서.SEMESTER = :학기
       AND 고지서.studentgbn <> '30304000' --AND HJ_HAKBUN IN('A1377023', 'A1427048', 'A1427049', 'A1425161', 'A0481056', 'A0925066', 'A1075030')
       AND 학적상태 = '01'
AND 주민등록번호 NOT IN (SELECT 주민등록번호 FROM tm국가장학신청학생)