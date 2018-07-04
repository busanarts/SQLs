SELECT * FROM tm학적
WHERE 학적상태 = '01'
AND 학년 = '1'
AND 학번 NOT IN (SELECT 학번 FROM t학적변동기록
WHERE 변동학년도 = :학년도 AND 변동학기 = :학기
AND SUBSTR(변동코드,1,1) = '5')