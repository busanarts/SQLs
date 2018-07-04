select sj_gghgcode 개설학과, sj_gggmcode 과목코드, gm_kname 과목명, sj_ggban 분반, hg_kname 학과명, hj_hakbun 학번, hj_kname 성명, hj_haknyun 학년
from ac1401, ac1121, ac12011, ac1302
where sj_year = '2011' and sj_hakgi = '1'  and hj_wthgcode = hg_code and sj_gggmcode = gm_code
and hj_hakbun = sj_hakbun --and hj_wthgcode = '37'
and sj_gghgcode  <> hj_wthgcode --and sj_gghgcode <> '23'--in ('1113002', '1213002','1313002', '1413002', '1513002', '2313002')
order by hg_kname, sj_ggban, hj_haknyun, hj_hakbun
