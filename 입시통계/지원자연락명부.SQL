select iw_jsno 접수번호, iw_shno 수험번호, hg_name 학과명, iw_jhgubun 전형구분, 
iw_sgcode 실기코드, iw_kname 성명, iw_jcode1 || '-' || iw_jcode2 주민번호, 
iw_ggname 고교명,
iw_hdtel 핸드폰, iw_telno1 || iw_telno2 || iw_telno3 전화번호,
--iw_bhname 보호자, iw_bhgwan 관계, iw_bhtelno 보호자전화번호, 
iw_ucode1 || '-' || iw_ucode2 우편번호, iw_addr1 || ' ' || iw_addr2 주소
from ipsi201, ipsi104
where iw_year = '2005' and iw_chasu = '93'
and iw_jwhgcode1 = hg_code
order by hg_name, iw_kname