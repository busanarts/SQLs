SELECT 고유번호, 학과명, 성명, 주민등록번호, 학년, 지번주소 || ' ' || 상세주소 주소
FROM tm기숙생명부, TM학적 a, tm학과 c
WHERE 성명 = 성(+) || 이름(+)
AND 학적상태 = '01'
AND a.학과코드 = c.학과코드
ORDER BY TO_NUMBER(고유번호)