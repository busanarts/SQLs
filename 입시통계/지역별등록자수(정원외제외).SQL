select  일반실업구분, count(*) 등록자수 
from ipsi201, (select distinct NEIS학교코드, 일반실업구분 from 고등학교코드) aa
where iw_year = '2004' and iw_ggcode = NEIS학교코드(+)
and iw_dungrok = '1'
and substr(iw_jhgubun,1,1) <> '5'
and iw_chasu not in ('99')
--and go_addr like '경상남도%'
group by rollup(일반실업구분)
