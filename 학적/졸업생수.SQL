select decode(hj_state, '81', '전기졸업', '83', '후기졸업', '계') 졸업구분, hg_kname 학과명, 
decode(hj_juyagbn , '1', '주간', '2', '야간') 주야구분, 
decode(hj_sexgbn,'1','남','2', '여', '계') 성별, count(*) 인원
from ac12011, ac1121 
where hj_state in ('81', '83') and hj_jymd >= '200508' and hj_hgcode = hg_code
and substr(hj_iymd,1,4) > '1999'
group by cube(hj_state, hg_kname, hj_juyagbn, hj_sexgbn)