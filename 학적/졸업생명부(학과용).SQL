select hj_hakbun 학번, hj_kname 성명, decode(hj_sexgbn, '1', '남', '여') 성별,
substr(hj_iymd, 1,4)  입학년도,
substr(hj_jymd, 1,4)  졸업년도,
hj_crucode1 || '-' || hj_crucode2 우편번호, hj_craddr1 || ' ' || hj_craddr2 주소,
substr(hj_hshptel,1,3) || '-' || substr(hj_hshptel,4,4) || '-' || substr(hj_hshptel,8,4) 휴대전화,
--substr(hj_hsghtel,1,3) || '-' || substr(hj_hsghtel,4,3) || '-' || substr(hj_hsghtel,7,4) 자택전화
hj_hsghtel 자택전화
from ac12011,ac1121, tbl학과
where hj_state in ('81', '82', '83') and (hj_jymd > '2007' and hj_jymd < '2009')
--or hj_jymd is null)
and hj_hgcode = hg_code and hg_mcode = 학과코드
and 학과명 in ('실용무용과')
order by hj_jymd, hj_kname, hj_hakbun
