SELECT 학과명, 학년, 학번, 성 || 이름 성명, 집전화, 휴대전화
FROM tm학적 a, tm학과 b
WHERE 학적상태 = '01'
AND a.학과코드 = b.학과코드
AND 학번 NOT IN (SELECT hakbun FROM TDFEERECEIVE WHERE schoolyear = :학년도 AND semester = :학기 AND state <> '88')
ORDER BY 학과명, 학년, 학번