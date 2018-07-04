select 학과명, hj_hakbun 학번, hj_kname 성명, hj_jcode1 || '-' || SUBSTR(hj_jcode2,1,1) || '******' 주민번호,
hj_haknyun 학년, usr_hjname(hj_state) 학적상태, hc_siymd 학적변동일자, hc_scode 학적변동코드, hb_name 학적변동
from psutis.ac12011, psutis.ac1121, psutis.tbl학과, psutis.ac1202, psutis.ac1104
where
--hc_scode NOT IN ('51', '52', '53', '61', '31')
hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_hakbun  = hc_hakbun
and hc_scode = hb_code
and hc_siymd >= :변동시작일 and hc_siymd <= :변동종료일
order by 학과명, hj_hakbun