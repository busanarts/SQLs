SELECT b.*, c.학과명, a.성 || a.이름 성명, a.성별
FROM tm학적 a, 임시장학대상자 b, tm학과 c
WHERE b.학기 = '2'
AND a.학번 = b.학번
AND a.학과코드 = c.학과코드
