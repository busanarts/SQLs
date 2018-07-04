select hj_hakbun 학번, hg_kname ||  decode(hg_juya, '2', ' (야)') 학과명 ,
hj_kname 성명, hj_jcode1 || '-' || hj_jcode2 주민등록번호, '19' || substr(hj_jcode1, 1, 2) 생년,
decode(hj_sexgbn, '1', '남', '여') 성별, hj_haknyun 학년, decode(hj_state, '81', '졸업', '후기졸업') 졸업구분,
USR_TODATE(hj_iymd) 입학일자, USR_TODATE(hj_jymd) 졸업일자, hj_hakwino 학위번호, hj_jolupno 졸업증서번호,
hj_craddr1 || ' ' || hj_craddr2 주소,
--substr(hj_hsghtel,1,3) || '-' || substr(hj_hsghtel,4,4) || '-' || substr(hj_hsghtel,8,4) 자택전화,
USR_TOTELNO(hj_hsghtel) 자택전화,
--substr(hj_hshptel,1,3) || '-' || substr(hj_hshptel,4,4) || '-' || substr(hj_hshptel,8,4) 휴대전화
USR_TOTELNO(hj_hshptel) 휴대전화
from psutis.ac12011,psutis.ac1121
where hj_state in ('81', '83') and hj_jymd > :학년도 || DECODE(:학기, '1', '0101', '2', '0701') and hj_hgcode = hg_code
order by hj_state, hg_kname, hj_juyagbn, hj_hakbun
