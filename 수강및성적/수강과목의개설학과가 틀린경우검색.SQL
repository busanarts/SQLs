select sj_hakbun 학번, sj_haknyun 학년, sj_gghgcode 수강학과, sj_gggmcode 수강교과코드, sj_isugbm 이수구분,
gg_hgcode 개설학과, gg_gmcode 개설교과코드, gg_haknyun 개설학년
from ac1401, ac1303
where sj_year = '2010' and sj_hakgi = '2'
and sj_year = gg_year and sj_hakgi = gg_hakgi
and sj_gggmcode = gg_gmcode and sj_gghgcode <> gg_hgcode
