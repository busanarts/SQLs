SELECT a.학번, a.반, 분반 FROM tm학적 a, tbl분반 b
--UPDATE tm학적 a SET 반 = (SELECT 분반 FROM tbl분반 b WHERE b.학번 = a.학번)
WHERE a.학번 IN (SELECT 학번 FROM tbl분반)
AND a.학번 = b.학번 --업데이트 실행시는 주석처리 할것
