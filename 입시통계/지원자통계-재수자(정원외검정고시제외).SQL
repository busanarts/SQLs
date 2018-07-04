// *** 지원자 - 재수자  ***
select 학과명,
max(decode(성별, '남', cnt, 0)) 남,
max(decode(성별, '여', cnt, 0)) 여
from
(
	select hg_name 학과명, decode(iw_sexgubun,'1','남','2', '여', '계') 성별, 
	count(*) cnt from ipsi201, ipsi104
	where iw_year = '2006' and iw_ggjyear < '2006'  
	and iw_jwhgcode1 = hg_code 
	and substr(iw_jhgubun,1,1) in ('2','3','4') //정원외 제외
	and iw_jhgubun <> '23' //검정고시 제외
	group by hg_name, iw_sexgubun
)
group by 학과명
