delete  FROM tm학적
WHERE 학적상태 = '00'
AND 학번 IN (SELECT 수험번호 FROM tm학적
WHERE 학번 LIKE 'A17%')