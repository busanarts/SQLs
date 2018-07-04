SELECT 학번, 성 || 이름 성명, '19' || SUBSTR(주민등록번호,1,6) 생년월일, 학과명, 학년
FROM TM학적 a, tm학과 b
WHERE a.학과코드 = b.학과코드
AND 학적상태 = '01'
--WHERE 학번 IN
--(SELECT HAKBUN FROM TDJANGHAKSUM
--WHERE SCHOOLYEAR = '2015'
--AND HAKBUN NOT LIKE 'A%')
