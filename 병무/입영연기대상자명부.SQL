select '부산예술대학' 학교명, 주민번호, 성명, 전공학과코드, 학과명, hj_haknyun 학년, 병무학과코드, hb_name 재학여부
from ac12011, 병무, ac1121, ac1104, tbl학과
where hj_jcode1 || hj_jcode2 = trim(주민번호) 
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_state = hb_code
--group by 주민번호, 성명, 병무학과코드, hg_kname, hj_haknyun, hb_name
