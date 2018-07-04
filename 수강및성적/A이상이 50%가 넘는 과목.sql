SELECT gg_kname 과목명, sj_gggmcode 과목코드, hg_kname 개설학과,
sum(DECODE(SIGN(sj_jumsu-90), 1, 1, 0)) A이상, COUNT(*) 수강인원
FROM PSUTIS.AC1401, PSUTIS.AC1303, PSUTIS.AC1121
WHERE sj_year = :학년도
AND sj_hakgi = :학기
AND sj_year = gg_year AND sj_hakgi = gg_hakgi
AND sj_gggmcode = gg_gmcode AND sj_gghaknyun = gg_haknyun
AND gg_hgcode = hg_code
GROUP BY gg_kname, sj_gggmcode, hg_kname
HAVING sum(DECODE(SIGN(sj_jumsu-90), 1, 1, 0)) / COUNT(*) >= 0.5