// *** <서식5> 정원외 전형별(학과별) ***
select decode(전형구분, '51', '4년제졸', '52', '전문대졸', '53', '농어촌', '54', '외국인') 전형구분, 
학과명, 주야구분, 학년, 
--max(decode(학적구분, '0', cnt, 0)) 재학,
max(decode(학적구분, '0', cnt, 0))  + max(decode(학적구분, '1', cnt, 0)) 재적,
max(decode(학적구분, '1', cnt, 0)) 휴학
from (
	select 학과명, 주야구분, hj_haknyun 학년, hj_jhgbn 전형구분, substr(hj_state,1,1) 학적구분,
	count(*) cnt
	from ac12011, ac1121, tbl학과
	where substr(hj_state,1,1) in ('0', '1') and hj_hgcode = hg_code
	and hg_mcode = 학과코드
	and hj_jhgbn >= '51' -- 정원외
	group by 학과명, 주야구분, hj_haknyun, hj_jhgbn, substr(hj_state,1,1) 
)
group by 전형구분, 학과명, 주야구분, 학년
