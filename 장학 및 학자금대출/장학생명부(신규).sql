SELECT a.schoolyear 학년도, a.semester 학기, janghaknm 장학명, DECODE(janghakgbn, '10', '교내', '20', '교외', '30', '국가') 장학구분,
a.hakbun 학번, 성 || 이름 성명, 학과명, a.lvl 학년, a.scholarship 장학금, confirm 승인, 명칭 학적상태,
DECODE(state, '77', '완납', '88', '환불', state) 등록금납부상태
FROM TDJANGHAK a, TM학적, tm학과 c, tm학적코드, TMSCHOLARSHIP d, TDFEEGOJI e
WHERE a.schoolyear = '2013'
AND a.hakbun = 학번 AND a.CLASS = c.학과코드 AND 학적상태 = 학적코드 AND a.JANGHAKCD = d.JANGHAKCD
AND a.SCHOOLYEAR = e.SCHOOLYEAR AND a.SEMESTER = e.SEMESTER AND a.HAKBUN = e.HAKBUN
AND e.studentgbn <> '30304000'