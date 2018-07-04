select 학과명,  주야구분, hj_haknyun 학년, 
hb_name 학적변동사유, count(*) 인원
from ac12011,ac1202, ac1121, ac1104, tbl학과
where hj_jhgbn < '51'
and hj_hakbun = hc_hakbun  and hj_hgcode = hg_code 
and hg_mcode = 학과코드
and hc_scode = hb_code 
--and hc_scode in('31')  --전과
--and hc_scode in('52')  --재입학
--and hc_scode in('61')  --유급
and hc_scode in ('21','22','23','24') --제적
--and hc_scode in ('51')  --복학
--and hc_scode in('24')  --자퇴
--and hc_scode in ('11','12','14') --휴학(휴학연기 및 입대전환제외)
--and hc_scode in('13') --입대전환
--and hc_scode in('15') --휴학연기
and hc_siymd >= '20051001' and hc_siymd <= '20060331'
group by 학과명, 주야구분, hj_haknyun, hb_name