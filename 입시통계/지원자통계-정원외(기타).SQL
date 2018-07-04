// *** 지원자수 - 정원외(기타) ***
select 학과명,
max(decode(성별, '남', cnt, 0)) 남,
max(decode(성별, '여', cnt, 0)) 여
from
(
	select hg_name 학과명, decode(iw_sexgubun, '1', '남', '2', '여') 성별,
	count(*) cnt
	from ipsi201, ipsi104
	where iw_year = '2006' 
	and iw_jhgubun > '50'
	and iw_jwhgcode1 = hg_code
	group by hg_name, iw_sexgubun
)
group by 학과명