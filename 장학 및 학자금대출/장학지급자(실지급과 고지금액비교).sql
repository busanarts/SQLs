SELECT b.학년도, b.학기, b.학년,
c.학과명, a.학번, a.성 || a.이름 성명, SUM(장학금액) 장학금액, SUM(환불금액) 환불금액, SUM(scholarship) 고지장학금액
FROM tm학적 a, 임시장학대상자 b, tm학과 c, TDFEEGOJI
WHERE a.학번 = b.학번
AND a.학과코드 = c.학과코드
AND 학년도 = schoolyear(+) AND 학기 = semester(+) AND b.학번 = hakbun(+)
AND 장학구분 = '선감면'
--AND b.학기 = '2'
GROUP BY b.학년도, b.학기, b.학년, c.학과명, a.학번, a.성, a.이름
ORDER BY b.학년도, b.학기, b.학년, c.학과명, a.학번