select distinct tm_hgcode 학과코드, hg_kname || decode(hg_juya, '1', '', '(야)' ) 학과명, tm_haknyun 학년, 
tm_gmcode 과목코드, gg_kname 과목명, tm_ban 분반, tm_pfcode 교수코드, is_kname 성명
from ac1303, ac1121, ac1304, ac22011
where tm_year = '2004' and tm_hakgi = '2' 
and tm_year = gg_year and tm_hakgi = gg_hakgi and tm_gmcode = gg_gmcode 
-- and tm_year = sj_year and tm_hakgi = sj_hakgi and tm_gmcode = sj_gggmcode 
and tm_hgcode = hg_code and tm_pfcode = is_id
--order by tm_hgcode, hg_kname || hg_juya, tm_haknyun, tm_gmcode, gg_kname,  tm_ban, tm_pfcode, is_kname
