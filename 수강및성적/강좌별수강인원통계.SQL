SELECT COUNT(*) FROM
(select gg_hgcode 학과코드, 학과명 || decode(hg_juya, '1', '', '(야)') 학과명, gg_haknyun 학년,
gg_gmcode 과목코드, gg_kname 과목명, count(sj_hakbun) 수강인원
from ac1303, ac1401, ac1121, tbl학과
where gg_year = '2009' and gg_hakgi = '2'
and gg_year = sj_year and gg_hakgi = sj_hakgi
and gg_hgcode = sj_gghgcode(+) and gg_gmcode = sj_gggmcode(+)
--and gg_haknyun = sj_gghaknyun(+)
and gg_hgcode = hg_code and hg_mcode = 학과코드
group by gg_hgcode, 학과명, hg_juya, gg_haknyun, gg_kname, gg_gmcode)
--WHERE 수강인원 < 20
--WHERE 수강인원 >= 20 AND 수강인원 < 50
--WHERE 수강인원 >= 50 AND 수강인원 < 100
--WHERE 수강인원 >= 100 AND 수강인원 < 200
WHERE 수강인원 >= 200
