select hg_kname 학과명, hj_hakbun 학번, hj_kname 성명 ,hj_jcode1 || '-' || SUBSTR(hj_jcode2,1,1) || '******' 주민등록번호,
hj_haknyun 학년, USR_TOTELNO(hj_hshptel) 휴대전화, USR_TOTELNO(hj_hsghtel) 집전화
from psutis.ac12011, psutis.ac1121
where hj_state = '01' AND HJ_HAKBUN NOT LIKE 'T%'
--AND hj_haknyun = '2'
and hj_hgcode = hg_code
order by hg_kname, hj_hakbun