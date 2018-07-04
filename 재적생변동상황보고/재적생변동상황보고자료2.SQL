select hj_hgcode 학과, hg_kname 학과명,  hj_haknyun 학년, hb_name , count(*)
from ac12011,ac1202, ac1121, ac1104
where hj_hakbun = hc_hakbun  and hj_hgcode = hg_code 
and hc_scode = hb_code 
-- and hc_scode in('31')  --전과
--and hc_scode in ('21','22','23','24') --제적
--and hc_scode in ('51')  --복학
--and hc_scode in('24')  --자퇴
-- and hc_scode in ('11','12','14') --휴학(휴학연기 및 입대전환제외)
--and hc_scode in('13') --입대전환
and hc_scode in('15') --휴학연기
and (hj_hgcode >= '01' and hj_hgcode <= '98')
and hc_siymd >= '20050401' and hc_siymd <= '20050930'
group by hj_hgcode, hg_kname, hj_haknyun, hb_name