select iw_chasu 차수, hg_name 학과명, 
decode(substr(iw_jhgubun,1,1), '2', '일반전형', '3', '특별전형', '5', '정원외') 전형구분, 
count(*) 지원자수
from ipsi201, ipsi104
where iw_year = '2006' and iw_chasu in ('91', '92', '93',  '01', '02', '03', '04')
--and iw_chasu = '02'
--and iw_result = '1'
--and iw_dungrok = '1'
and iw_jwhgcode1 = hg_code
group by cube(iw_chasu, hg_name, substr(iw_jhgubun,1,1))
