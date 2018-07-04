select hj_wthgcode, hg_kname, hj_hakbun, hj_kname, hj_craddr, hj_hsghtel, hj_hshptel 
from ac12011,ac1121 
where hj_state = '01' and hj_haknyun = '2' and hj_wthgcode = hg_code
order by hj_wthgcode, hj_hakbun