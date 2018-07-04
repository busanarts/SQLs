select hj_hgcode 학과, hg_kname 학과명,  hj_haknyun 학년, hj_sexgbn 성별, count(*)
from ac12011,ac1202, ac1121, ac1104
where hj_hakbun = hc_hakbun  and hj_hgcode = hg_code 
and hc_scode = hb_code 
--and hc_scode in ('21','22','23','24') --제적
--and hc_scode in ('51')  --복학
and hc_scode in ('11','12','14')  --휴학(휴학연기 및 입대전환제외)
and (hj_hgcode >= '01' and hj_hgcode <= '98')
and hc_siymd >= '20040401' and hc_siymd <= '20040931'
group by hj_hgcode, hg_kname, hj_haknyun, hj_sexgbn