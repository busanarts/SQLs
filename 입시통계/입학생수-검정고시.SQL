// *** 입학생 - 검정고시출신자  ***
select 학과명,
max(decode(성별, '남', cnt, 0)) 남,
max(decode(성별, '여', cnt, 0)) 여
from
(
	select hg_name 학과명, decode(iw_sexgubun,'1','남','2', '여', '계') 성별, 
	count(*) cnt from ipsi201, ipsi104
	where iw_year = '2006' --and iw_ggjyear < '2006'  
	and iw_dungrok = '1'
	and iw_jwhgcode1 = hg_code 
	and iw_jhgubun = '23' --검정고시
	group by hg_name, iw_sexgubun
)
group by 학과명