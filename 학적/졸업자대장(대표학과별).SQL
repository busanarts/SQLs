select hj_jolupno 졸업증서번호, 학과명 ||  decode(hg_juya, '2', ' (야)') 학과 , hj_hakbun 학번,
hj_kname 성명, hj_jcode1 || '-' || hj_jcode2 주민등록번호,
substr(hj_iymd, 1,4) || '.' || substr(hj_iymd, 5,2) || '.' || substr(hj_iymd, 7, 2) 입학일자,
substr(hj_jymd, 1,4) || '.' || substr(hj_jymd, 5,2) || '.' || substr(hj_jymd, 7, 2) 졸업일자,
hj_hakwino 학위번호
from ac12011,ac1121, tbl학과
where hj_state in ('83') and hj_jymd > '2009'
and hj_hgcode = hg_code and hg_mcode = 학과코드
order by hj_state, 학과명, hj_juyagbn, hj_hakbun
