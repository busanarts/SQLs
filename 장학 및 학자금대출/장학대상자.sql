SELECT a.schoolyear 학년도, a.semester 학기, 학번, 성 || 이름 성명, a.lvl 학년, 학과명,
DECODE(janghakgbn, '10', '교내', '20', '교외', '30', '국가') 장학구분,
janghaknm 장학명, a.scholarship 장학금, DECODE(TRIM(gbn), '1', '선감면', '2', '후지급') 지급구분,
confirm 확정여부, DECODE(state, '77', '등록', '88', '환불', '11', '미등록', '33', '납부유예', '22', '부분납', '55', '승계') 등록여부, f_hjstate(학번) 학적상태
FROM TDJANGHAK a, tm학적 학적, tm학과 학과, tmscholarship b, TDFEEGOJI c
WHERE a.schoolyear = :학년도 AND a.semester = :학기
AND a.hakbun = 학번
AND a.CLASS = 학과.학과코드
AND a.janghakcd = b.JANGHAKCD
AND a.SCHOOLYEAR = c.SCHOOLYEAR AND a.SEMESTER = c.SEMESTER AND a.HAKBUN = c.HAKBUN
AND c.STUDENTGBN <> '30304000'