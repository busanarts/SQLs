SELECT gg_haknyun 학년, decode(substr(gg_gmcode,3,1), '1', '교양', decode(gg_hgcode, '42', '인문사회', '75', '체육', '예능')) 계열,
COUNT(*) 교과목수, SUM(gg_hjum) 학점수, sum(gg_irtime + gg_sstime) 시수
FROM psutis.AC1303, psutis.AC1121
WHERE gg_year = :학년도 AND gg_hakgi = :학기
AND gg_hgcode = hg_code
GROUP BY gg_haknyun, decode(substr(gg_gmcode,3,1), '1', '교양', decode(gg_hgcode, '42', '인문사회', '75', '체육', '예능'))
