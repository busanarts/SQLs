select hj_hakbun 학번, hg_kname  학과명, --hg_juya 주야구분, 
hj_kname 성명, hj_jcode1 || '-' || hj_jcode2 주민등록번호, --'19' || substr(hj_jcode1, 1, 2) 생년, 
hj_sexgbn 성별 --, decode(hj_state, '81', '졸업', '후기졸업') 졸업구분, 
--hj_jymd 졸업년월일, hj_craddr1 || ' ' || hj_craddr2 주소, hj_hshptel 핸드폰, hj_hsghtel 전화번호
from ac12011,ac1121 
where hj_state in ('81', '83') and hj_jymd > '20050101' and hj_hgcode = hg_code
and hj_sexgbn = '1'
order by hj_hgcode,hj_hakbun
