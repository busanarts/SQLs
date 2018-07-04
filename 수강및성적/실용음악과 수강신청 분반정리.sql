--UPDATE AC1401 SET sj_ggban = (SELECT 분반 FROM tbl분반 WHERE 학번 = sj_hakbun)
SELECT * FROM AC1401
WHERE sj_year = :학년도
AND sj_hakbun LIKE 'A' || substr(:학년도,3,2) || '%'
AND sj_hakgi = '1'
AND sj_haknyun = '1'
AND sj_hakbun IN (SELECT 학번 FROM tbl분반)