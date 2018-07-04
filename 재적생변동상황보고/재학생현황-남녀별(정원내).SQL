// 재학생현황( 정원외)
select 학과명, 주야구분, 학년,
max(decode(성별, '1', cnt, 0)) 남,
max(decode(성별, '2', cnt, 0)) 여,
max(decode(성별, '1', cnt, 0)) +
max(decode(성별, '2', cnt, 0)) 계
from (
	select 학과명, 주야구분, hj_haknyun 학년, 
	hj_sexgbn 성별, count(*) cnt
	from ac12011,ac1121, tbl학과
	where hj_state = '01' 
	--and hj_haknyun = '2' 
	and hj_hgcode = hg_code
	and hg_mcode = 학과코드
	and hj_jhgbn < '51'
	group by 학과명, 주야구분, hj_haknyun, hj_sexgbn
)
group by 학과명, 주야구분,학년