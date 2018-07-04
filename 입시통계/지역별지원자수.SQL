select 시도, count(*) 지원자수 
from ipsi201,고등학교코드
where iw_year = '2004' and iw_ggcode = NEIS학교코드
and substr(iw_jhgubun,1,1) <> '5'
--and go_addr like '경상남도%'
group by rollup(시도)
