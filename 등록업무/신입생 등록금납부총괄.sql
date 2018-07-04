SELECT schoolyear 학년도, semester 학기,
CLASS 학과코드, 학과명, hakbun 학번, 수험번호, 성 || 이름 성명, f_statenm(학적상태) 학적상태,
goji 고지금액, sunap 수납금액, hanbul  환불금액, lastdte 최종일자
FROM VIW고지수납집계, tm학과 b, TM학적 c
WHERE schoolyear = '2013'
AND lvl = 1
AND hakbun LIKE 'A13%'
AND studentgbn <> '30304000'
AND CLASS = b.학과코드
AND hakbun = 학번
ORDER BY 학과명, hakbun