SELECT gg_kname, COUNT(*) FROM AC1401, AC1303
WHERE sj_year = &학년도 AND sj_hakgi = &학기
AND sj_year = gg_year AND sj_hakgi = gg_hakgi
AND sj_gggmcode = gg_gmcode
AND gg_open = '2'
--and gg_kname IN ('일본어', '공연예술의 이해와 감상')
GROUP BY gg_kname