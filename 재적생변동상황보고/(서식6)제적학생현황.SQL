// *** <서식6> 제적학생 현황
select 학년, 
max(decode(학적변동사유, '미등록', cnt, 0)) 미등록,
max(decode(학적변동사유, '미복학', cnt, 0)) 미복학,
max(decode(학적변동사유, '자퇴', cnt, 0)) 자퇴,
max(decode(학적변동사유, '미등록', cnt, 0)) +
max(decode(학적변동사유, '미복학', cnt, 0)) +
max(decode(학적변동사유, '자퇴', cnt, 0)) 계
from (
select hj_haknyun 학년, hb_name 학적변동사유, 
count(*) cnt
from ac12011,ac1202, ac1104
where hj_hakbun = hc_hakbun  
and hc_scode = hb_code 
and hc_scode in ('21','22','23','24') --제적
and hc_siymd >= '20051001' and hc_siymd <= '20060331'
group by cube(hj_haknyun, hb_name)
)
group by 학년
