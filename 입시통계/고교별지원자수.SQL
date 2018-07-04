select iw_ggcode 고교코드, iw_ggname 학교명, go_addr 주소, count(*) 지원자수 
from ipsi201,ipsi101 
where iw_year = '2001' and iw_ggcode = go_code
and go_addr like '경상남도%'
group by iw_ggcode, iw_ggname, go_addr
order by count(*) desc