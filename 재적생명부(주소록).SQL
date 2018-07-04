select hg_kname 학과명, hj_hakbun 학번, hj_kname 성명 ,hj_jcode1 || '-' || hj_jcode2 주민등록번호,
hj_haknyun 학년, USR_HJNAME(hj_state) 학적상태, hj_craddr1 || ' ' || hj_craddr2 주소
from ac12011, ac1121
where SUBSTR(hj_state,1,1) IN ('0','1')
and hj_hgcode = hg_code
order by hg_kname, hj_hakbun