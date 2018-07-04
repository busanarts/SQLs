select gg_hgcode 학과코드, hg_kname 학과명, gg_haknyun 학년,
gg_isugbm 이수구분코드, is_fname 이수구분, gg_gmcode 과목코드,
gg_kname 과목명, gg_hjum 학점, (gg_irtime + gg_sstime) 시수, '       ' 비고
from ac1303, ac1105, ac1121
where gg_year = '2010' and gg_hakgi = '2' and gg_isugbm = is_code
and  gg_hgcode = hg_code
order by gg_hgcode, gg_haknyun, gg_isugbm, gg_gmcode