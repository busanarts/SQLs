select hj_hakbun 학번, hj_kname 성명, hj_craddr1 || '' ||  hj_craddr2 주소,
학과명, hj_haknyun 학년,
hj_jcode1 || '-1******' 주민번호, hb_name 변동사유, hc_siymd 변동일자
from psutis.ac12011, psutis.ac1121, psutis.tbl학과, psutis.ac1202, psutis.ac1104
where substr(hj_jcode2,1,1) IN ( '1', '3')
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_hakbun = hc_hakbun
--and hc_scode not in ('31', '81', '82', '83')
and hc_scode not in ('31')
and hc_scode = hb_code
AND hc_siymd >= :변동시작일 AND hc_siymd < :변동종료일
UNION
select hj_hakbun 학번, hj_kname 성명, hj_craddr1 || '' ||  hj_craddr2 주소,
학과명, hj_haknyun 학년,
hj_jcode1 || '-1******' 주민번호, '졸업' 변동사유, hj_jymd 변동일자
from psutis.ac12011, psutis.ac1121, psutis.tbl학과
where substr(hj_jcode2,1,1) IN ( '1', '3')
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_state in ('81', '82', '83')
AND hj_jymd >= :변동시작일 AND hj_jymd < :변동종료일

