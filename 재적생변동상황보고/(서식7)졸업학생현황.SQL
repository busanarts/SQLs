// *** <서식7> 졸업학생현황 ***
select decode(hg_juya, '1', '주', '2', '야') 주야구분, 
decode(substr(hj_jhgbn,1,1), '5', '정원외', '정원내') 전형구분 , 
count(*) 인원
from ac12011, ac1121
where hj_hgcode = hg_code 
and hj_state = '81'
and hj_jymd > '2006'
group by cube(hg_juya, decode(substr(hj_jhgbn,1,1), '5', '정원외', '정원내'))