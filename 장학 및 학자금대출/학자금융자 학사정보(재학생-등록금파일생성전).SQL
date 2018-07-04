-- 주의 : 복학생 등록금 고지작업완료후에 실행하기 바람

SELECT DISTINCT 학자금코드 학과코드,
       DECODE(ChangeCD, '52', '15', '53', '14', '19') 학적코드, -- 11: 신입, 14: 편입, 15: 재입학, 19: 재학
       주민등록번호,
       학번,
       성 || 이름 학생성명,
       SUBSTR(입학일자, 1, 4) 입학년도,
       DECODE(ChangeCD, '11', '64', '12', '65', '13', '65', '24', '66', '31', '18', '81', '69', '51', '16', '52', '13', '53', '13', '14') 학적상태코드,
       -- 13: 입학예정, 14: 재학중, 15: 입학취소, 16: 복학, 17: 유급, 18: 전과, 19: 교환, 20: 제적(학사징계)
       -- 64: 일반휴학, 65: 군입대휴학, 66: 자퇴, 67: 제적, 68: 등록포기(복학취소포함), 69: 졸업

--       DECODE(최종학적변동코드, '51','16','61','22','14') 학적상태코드,

       학년,


--       DECODE(고지서.STATE, '11', '1', '88', '0', '2') 등록대상여부,
				'1' 등록대상여부,


       ADMISSIONFEE + TUITION 등록금액,
       :학년도 || :등록마감일 등록마감일, --:학년도 || DECODE(:학기, '1', '0330', '2', '0928') 등록마감일,
       DECODE(ChangeCD, '52', '11', '53', '11', '17') 성적유형,
       'N' 계절학기,
       -- 11: 고교내신, 12: 수능등급, 13: 검정고시, 14: 해외고교졸업, 15: 북한이탈주민, 16: 석차비율, 17: 이수학점
       --DECODE(ChangeCD, '51', 4.5, 0) 학생만점기준, DECODE(ChangeCD, '51', 직전학기취득학점, 0) 직전학기취득학점,
       4.5 학생만점기준,
       '15' 최소이수학점,
       직전학기취득학점,
       ROUND(직전학기평점평균,2) 직전학기평점평균,
       F학점과목수,
       총취득학점,
       ROUND(총평점평균,2) 총평점평균,
       TRUNC(직전학기백분위점수,0) 직전학기백분위점수,
       TRUNC(총백분위점수,0) 총백분위점수,
       'Y' 성적유형통과여부,
       SUBSTR(최종학년학기, 1, 4) 최종성적취득년도,
       SUBSTR(최종학년학기, 5, 1) 최종성적취득학기,
       DECODE(:학기, '1', 'N', 'Y') 졸업학기여부,
       입학일자,


       'Y' 입학당시신입생여부
  FROM TM학적 학적,
       TM학과 학과,
      TMFEEMAST mst,
       TMFEEDTL ,

       (SELECT s1.*
         FROM TDSCHOOLCHG s1,
              (SELECT hakbun,
                     max(changedt) lcdate
                FROM tdschoolchg
               WHERE changedt > DECODE(:학기, '1', :학년도 - 1 || '12', '2', :학년도 || '07')
               GROUP BY hakbun
              ) 최종변동 --WHERE ChangeCD IN ('51', '52', '53') AND HC_SIYMD > DECODE(:학기, '1', :학년도 - 1 || '12', '2', :학년도 || '07')
        WHERE changedt > DECODE(:학기, '1', :학년도 - 1 || '12', '2', :학년도 || '07')
              AND s1.hakbun = 최종변동.hakbun
              AND s1.changedt = 최종변동.lcdate --AND ChangeCD = '31'
       ) 학적변동, -- 복학자료 가져오기
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
                     AND 학적상태 = '01'
                     AND Injung = 'Y'
               GROUP BY Hakbun
              ) B
        WHERE a.Hakbun = b.Hakbun
              AND a.Schoolyear = SUBSTR(최종학년학기, 1, 4)
              AND a.Semester = SUBSTR(최종학년학기, 5, 1)
        GROUP BY a.Hakbun,
              최종학년학기
       ) 성적,
       (SELECT HAKBUN,
              SUM(DECODE(Gradelvl, 'F', 0, GradeJum)) 총취득학점,
              SUM(DECODE(Gradelvl, 'P', 0, AVEJumsu) * GradeJum) / DECODE(SUM(DECODE(Gradelvl, 'P', 0, GradeJum)), 0, 1, SUM(DECODE(Gradelvl, 'P', 0, GradeJum))) 총평점평균,
              SUM(DECODE(Gradelvl, 'P', 0, totJumsu) * GradeJum) / DECODE(SUM(DECODE(Gradelvl, 'P', 0, GradeJum)), 0, 1, SUM(DECODE(Gradelvl, 'P', 0, GradeJum))) 총백분위점수
         FROM Psutis.TDresult,
              tm학적
        WHERE Hakbun = 학번
              AND 학적상태 = '01'
              AND Injung = 'Y'
        GROUP BY Hakbun
       ) D
 WHERE 학적상태 = '01'
       AND 학적.학과코드 = 학과.학과코드
       AND 학번 = 성적.Hakbun(+)
       AND 학번 = D.Hakbun(+)
       AND 학번 = 학적변동.HAKBUN(+) --AND HJ_HAKBUN = 학적변동.HC_HAKBUN

       AND mst.SEQNO = tmfeedtl.SEQNO

       AND mst.schoolyear = :학년도
       AND mst.semester = :학기



       AND 학적.학과코드 = tmfeedtl.CLASS
       AND 학적.학년 = tmfeedtl.LVL





--       AND 고지서.SCHOOLYEAR = 수납파일.SCHOOLYEAR(+)
--       AND 고지서.SEMESTER = 수납파일.SEMESTER(+)
--       AND 고지서.HAKBUN = 수납파일.HAKBUN(+) --AND 고지서.studentgbn = '3030' || DECODE(:학적상태, '0', '1000', '5', '2000')
--       AND 고지서.studentgbn <> '30304000' --AND HJ_HAKBUN IN('A1377023', 'A1427048', 'A1427049', 'A1425161', 'A0481056', 'A0925066', 'A1075030')

ORDER BY 학과코드, 학번 --AND 고지서_TOTGUM - 고지서_TGMGUM > 0