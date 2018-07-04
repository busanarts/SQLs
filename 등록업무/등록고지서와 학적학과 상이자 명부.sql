SELECT hakbun 학번, 성 || 이름 성명, schoolyear 고지학년도, semester 고지학기, lvl 고지학년, 학과코드 현학과, CLASS 고지학과
FROM TDFEEGOJI, tm학적
--UPDATE TDFEEGOJI SET CLASS = (SELECT 학과코드 FROM tm학적
--WHERE 학번 = hakbun AND 학과코드 <> class)
WHERE schoolyear = :학년도 --AND semester = :학기
AND 학번 = hakbun AND 학과코드 <> class