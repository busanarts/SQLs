
SELECT --CEIL(ROWNUM / 4) AS c0,
       schoolyear, semester, hakbun, 
       MAX(DECODE(MOD(ROWNUM, 4), 1, janghakcd,' '))  AS janghakcd1,
       MAX(DECODE(MOD(ROWNUM, 4), 1, scholarship,0)) AS scholarship1,
       MAX(DECODE(MOD(ROWNUM, 4), 2, janghakcd,' '))  AS janghakcd2,
       MAX(DECODE(MOD(ROWNUM, 4), 2, scholarship,0)) AS scholarship2,
       MAX(DECODE(MOD(ROWNUM, 4), 3, janghakcd,' '))  AS janghakcd3,
       MAX(DECODE(MOD(ROWNUM, 4), 3, scholarship,0)) AS scholarship3,
       MAX(DECODE(MOD(ROWNUM, 4), 4, janghakcd,' '))  AS janghakcd4,
       MAX(DECODE(MOD(ROWNUM, 4), 4, scholarship,0)) AS scholarship4               
  FROM TDJANGHAK
 --WHERE hakbun = 'A0825068'  
 GROUP BY schoolyear, semester, hakbun--,CEIL(ROWNUM / 4)
 HAVING COUNT(*) > 1
 ORDER BY  hakbun
 