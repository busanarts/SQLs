--UPDATE AC1401 SET sj_ggban = (SELECT �й� FROM tbl�й� WHERE �й� = sj_hakbun)
SELECT * FROM AC1401
WHERE sj_year = :�г⵵
AND sj_hakbun LIKE 'A' || substr(:�г⵵,3,2) || '%'
AND sj_hakgi = '1'
AND sj_haknyun = '1'
AND sj_hakbun IN (SELECT �й� FROM tbl�й�)