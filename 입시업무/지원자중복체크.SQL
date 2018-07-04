select a.iw_year 입시년도, a.iw_jsno 접수번호, a.iw_kname 성명,
a.iw_jwhgcode1 지원학과코드, a.iw_chasu 차수,  a.iw_ipymd 지원일자,
decode(a.iw_result, '1', '합격', '불합격') 지원결과
from ipsi201 a, ipsi201 b
where a.iw_year = '2012' --and a.iw_chasu = '92'
and a.iw_year = b.iw_year
--and a.iw_chasu = b.iw_chasu
and a.iw_jcode1 = b.iw_jcode1
and a.iw_jcode2 = b.iw_jcode2
and a.rowid <> b.rowid
--and a.iw_jwhgcode1 <> b.iw_jwhgcode1
order by a.iw_year, a.iw_kname