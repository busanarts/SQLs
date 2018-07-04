select iw_chasu 차수, hg_name 학과명, 
decode(iw_jhgubun, '31', '동일계', '32', '자격증소지자', '33', '예능특기자', 
'34', '산업체근무', '35', '학원경영자', '36', '고교졸업5년경과', '37', '국가유공자', 
'38', '효행상', '39', '학과별범위', '3A', '전업주부및만학도' ) 전형구분, 
count(*) 지원자수
from ipsi201, ipsi104
where iw_year = '2006' and iw_chasu in ('91', '92', '93',  '01', '02', '03', '04')
and substr(iw_jhgubun,1,1) = '3'
and iw_jwhgcode1 = hg_code
group by cube(iw_chasu, hg_name, iw_jhgubun)