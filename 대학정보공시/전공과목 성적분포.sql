SELECT sj_year 기준년도, 학과명,
sj_hakgi 학기, DECODE(sj_dunggub, 'A+', 'A', 'A', 'B',
								  'B+', 'D', 'B', 'E',
                                  'C+', 'G', 'C', 'H',
                                  'D+', 'J', 'D', 'K',
                                  'F', 'M') 점수코드,
sj_dunggub 점수 , COUNT(*) 인원수
--FROM psutis.AC1401, psutis.AC1303, psutis.AC1121, psutis.TBL학과
FROM psutis.AC1401, psutis.AC1303, psutis.TBL학과
WHERE sj_year = :학년도
AND SUBSTR(sj_isugbm,1,1) = '2'
AND sj_year = gg_year
AND sj_hakgi = gg_hakgi
AND sj_gggmcode = gg_gmcode
--AND sj_hgcode = hg_code and hg_mcode = 학과코드
AND sj_hgcode = 학과코드
GROUP BY sj_year, sj_hakgi, 학과명, sj_dunggub
