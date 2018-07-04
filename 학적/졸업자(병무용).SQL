select hg_kname 학과, hj_hakbun 학년, hj_kname 성명, 
hj_jcode1 || '-' || hj_jcode2 주민등록번호, hj_craddr1 || ' ' || hj_craddr2 주소
from ac12011,ac1121 
where hj_wthgcode = hg_code and hj_jymd = '20040213' and substr(hj_jcode2,1,1) = '1'
order by hg_kname, hj_jcode1, hj_jcode2