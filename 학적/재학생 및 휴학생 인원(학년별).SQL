select 학과명,
max(decode(학년, '1', decode(학적구분, '0', cnt))) "1학년 재학생",
max(decode(학년, '2', decode(학적구분, '0', cnt))) "2학년 재학생",
max(decode(학년, '1', decode(학적구분, '1', cnt))) "1학년 휴학생",
max(decode(학년, '2', decode(학적구분, '1', cnt))) "2학년 휴학생"
from (
	select 학과명, hj_haknyun 학년,
	substr(hj_state,1,1) 학적구분, count(*) cnt
	from psutis.AC12011, psutis.AC1121, psutis.tbl학과
	where substr(hj_state,1,1) in ('0', '1')
	and hj_hgcode = hg_code and hg_mcode = 학과코드
	-- and hj_jhgbn < '51'
	group by CUBE(학과명, hj_haknyun, substr(hj_state,1,1))
)
group by 학과명
ORDER BY 학과명