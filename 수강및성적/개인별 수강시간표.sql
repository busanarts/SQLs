SELECT DECODE(시간표.TM_WEEK, '1', '전공실기', '2', '월', '3', '화', '4', '수', '5', '목', '6', '금', '7', '토') 요일,
       시간표.tm_time 교시,
       시간표.TM_KRKRROOM 강의실,
       강의실.RROOMNAME 강의실명,
       시간표.TM_GMCODE 과목코드,
       psutis.F_GWAMOKNM(시간표.TM_GMCODE) AS 과목명,
       시간표.TM_PFCODE 교수코드,
       교수.IS_KNAME 교수명
  FROM psutis.TDCOURSE 수강,
       psutis.TMTIMESCHEDULE 시간표,
       psutis.TMROOM 강의실,
       psutis.AC22011 교수
 WHERE 수강.SCHOOLYEAR = 시간표.TM_YEAR
       AND 수강.SEMESTER = 시간표.TM_HAKGI
       --AND 수강.LVL = 시간표.TM_HAKNYUN
       AND 수강.BANGBN = 시간표.TM_BAN
       AND 수강.GMCODE = 시간표.TM_GMCODE
       AND 수강.HAKBUN = :HAKBUN
       AND 시간표.TM_KRKRROOM = 강의실.RROOM(+)
       AND 시간표.TM_PFCODE = 교수.IS_ID (+)
ORDER BY 시간표.TM_WEEK,
       시간표.TM_TIME