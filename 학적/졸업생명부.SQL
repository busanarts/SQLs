--select hg_kname 학과, hj_hakbun 학번, hj_kname 성명, hj_jcode1 || '-' || hj_jcode2 주민번호,
select hg_kname 학과, hj_hakbun 학번, hj_kname 성명, hj_jcode1 || '-' || SUBSTR(hj_jcode2,1,1) || '******' 주민번호,
substr(hj_iymd, 1,4)  입학년도,
substr(hj_jymd, 1,6)  졸업년월,
hj_crucode1 || '-' || hj_crucode2 우편번호, hj_craddr1 || ' ' || hj_craddr2 주소,
substr(hj_hshptel,1,3) || '-' || substr(hj_hshptel,4,4) || '-' || substr(hj_hshptel,8,4) 휴대전화
--substr(hj_hsghtel,1,3) || '-' || substr(hj_hsghtel,4,3) || '-' || substr(hj_hsghtel,7,4) 자택전화
from psutis.ac12011, psutis.ac1121
where hj_state in ('81', '82', '83') and hj_jymd >= :졸업일자
--or hj_jymd is null)
and hj_hgcode = hg_code
order by hj_jymd, hg_kname, hj_kname, hj_hakbun
