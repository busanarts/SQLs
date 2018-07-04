select 학과명, hj_hakbun 학번, hj_kname 성명, hj_haknyun 학년, USR_TODATE(hc_siymd) 복학일자
from psutis.ac12011, psutis.ac1121, psutis.tbl학과, psutis.ac1202
where hj_hakbun = hc_hakbun
AND hj_state = '01'
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hc_year >= :학년도 AND hc_hakgi = :학기
and hc_scode  = '51'