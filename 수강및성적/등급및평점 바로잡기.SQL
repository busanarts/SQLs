update ac1401 set sj_dunggub =
           CASE
             WHEN sj_jumsu >= 95  AND sj_jumsu <= 100  THEN 'A+'
             WHEN sj_jumsu >= 90  AND sj_jumsu < 95 THEN 'A'
             WHEN sj_jumsu >= 85  AND sj_jumsu < 90 THEN 'B+'
             WHEN sj_jumsu >= 80  AND sj_jumsu < 85 THEN 'B'
             WHEN sj_jumsu >= 75  AND sj_jumsu < 80 THEN 'C+'
             WHEN sj_jumsu >= 70  AND sj_jumsu < 75 THEN 'C'
             WHEN sj_jumsu >= 65  AND sj_jumsu < 70 THEN 'D+'
             WHEN sj_jumsu >= 60  AND sj_jumsu < 65 THEN 'D'
             WHEN sj_jumsu < 60 THEN 'F'
           END, sj_pjum =            CASE
             WHEN sj_jumsu >= 95  AND sj_jumsu <= 100  THEN 4.5
             WHEN sj_jumsu >= 90  AND sj_jumsu < 95 THEN 4.0
             WHEN sj_jumsu >= 85  AND sj_jumsu < 90 THEN 3.5
             WHEN sj_jumsu >= 80  AND sj_jumsu < 85 THEN 3.0
             WHEN sj_jumsu >= 75  AND sj_jumsu < 80 THEN 2.5
             WHEN sj_jumsu >= 70  AND sj_jumsu < 75 THEN 2.0
             WHEN sj_jumsu >= 65  AND sj_jumsu < 70 THEN 1.5
             WHEN sj_jumsu >= 60  AND sj_jumsu < 65 THEN 1.0
             WHEN sj_jumsu < 60 THEN 0
           END

where sj_year = &학년도 and sj_hakgi = &학기
--and sj_dunggub = 'F' AND sj_jumsu >= 60

