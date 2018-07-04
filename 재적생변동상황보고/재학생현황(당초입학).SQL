// *** 재학생현황 : 당초입학( 입학이후 학적변동이 없는 자) ***
select 학과명, 주야구분, decode(hj_haknyun, '1', '  1', '2', '  2', '학년계') 학년, count(*) 인원
from ac12011,ac1121, tbl학과
where hj_state = '01' 
and hj_jhgbn < '51'
and hj_hgcode = hg_code and hg_mcode = 학과코드 
and hj_hakbun not in (select distinct hc_hakbun from ac1202 where hc_hakbun = hj_hakbun)
group by cube(학과명, 주야구분, hj_haknyun)
