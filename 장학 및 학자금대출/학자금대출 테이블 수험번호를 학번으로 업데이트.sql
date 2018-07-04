--SELECT * FROM tm학자금대출실행정보
UPDATE tm학자금대출실행정보 d SET 학번 = (SELECT 학번 FROM tm학적 WHERE 수험번호 = d.학번 AND 주민등록번호 = d.주민번호)
WHERE (학번, 주민번호) IN (SELECT 수험번호, 주민등록번호 FROM tm학적)
