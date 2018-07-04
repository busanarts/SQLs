select hj_hakbun 학번, hg_kname ||  decode(hg_juya, '2', ' (야)') 학과명 ,
hj_kname 성명, hj_jcode1 || '-' || hj_jcode2 주민등록번호, '19' || substr(hj_jcode1, 1, 2) 생년,
decode(hj_sexgbn, '1', '남', '여') 성별, hj_haknyun 학년, decode(hj_state, '81', '졸업', '후기졸업') 졸업구분,
substr(hj_iymd, 1,4) || '.' || substr(hj_iymd, 5,2) || '.' || substr(hj_iymd, 7, 2) 입학일자,
substr(hj_jymd, 1,4) || '.' || substr(hj_jymd, 5,2) || '.' || substr(hj_jymd, 7, 2) 졸업일자,
hj_hakwino 학위번호, hj_jolupno 졸업증서번호,
hj_craddr1 || ' ' || hj_craddr2 주소,
substr(hj_hsghtel,1,3) || '-' || substr(hj_hsghtel,4,4) || '-' || substr(hj_hsghtel,8,4) 자택전화,
substr(hj_hshptel,1,3) || '-' || substr(hj_hshptel,4,4) || '-' || substr(hj_hshptel,8,4) 휴대전화
from ac12011,ac1121
where hj_state in ('83') and hj_jymd > '20110101' and hj_hgcode = hg_code
order by hj_state, hg_kname, hj_juyagbn, hj_hakbun
