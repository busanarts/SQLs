SELECT hakbun 학번, 학과코드, F_CLASSNM(학과코드) 학과코드, 학년, 학적상태,
CLASS, F_CLASSNM(CLASS) 고지학과, lvl 고지학년, DECODE(state, '77', '완납', '88', '환불', '11', '미납', state) 납부상태
FROM TDFEEGOJI a, tm학적
--UPDATE TDFEEGOJI a SET CLASS = (SELECT 학과코드 FROM TM학적 WHERE 학번 = hakbun)
WHERE schoolyear = :학년도 AND semester = :학기
AND 학번 = a.hakbun AND a.CLASS <> 학과코드
AND studentgbn <> '30304000'