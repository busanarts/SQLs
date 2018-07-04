select a.iw_chasu 차수, a.iw_jwhgcode1 지원학과, a.iw_shno 수험번호, iw_kname 성명, 
a.iw_jcode1 || '-' || a.iw_jcode2 주민번호, iw_result 지원결과, iw_dungrok 등록여부
from ipsi201 a,
(select iw_jcode1, iw_jcode2, count(*) from ipsi201
where iw_year = '2006'
group by iw_jcode1, iw_jcode2
having count(*) > 1) s
where a.iw_year = '2006' 
and a.iw_jcode1 = s.iw_jcode1 and a.iw_jcode2 = s.iw_jcode2
