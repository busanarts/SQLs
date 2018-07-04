select hg_kname 학과, hj_haknyun 학년, hj_hakbun 학번, hj_kname 성명, 
hj_jcode1 || '-' || hj_jcode2 주민번호, hj_craddr1 || ' ' || hj_craddr2 주소,
hj_hshptel 이동전화, hj_hsghtel 자택전화
from ac12011, ac1121
where hj_state = '01'
and hj_hgcode = hg_code
and hj_sexgbn = '1' --and hj_haknyun = '1'
and hj_hakbun in (select hc_hakbun from
ac1202 where hc_scode = '51' and hc_siymd > '2006')
order by hg_kname, hj_haknyun