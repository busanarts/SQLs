select a.iw_shno 수험번호, a.iw_kname 성명, a.iw_chasu 차수, 
a.iw_jwhgcode1 지원학과, decode(a.iw_result,'1', '합격', '2','예비합격','3','불합격') 지원결과,
decode(a.iw_dungrok, '1', '등록') 등록여부,
b.iw_chasu 전차수, b.iw_shno 전수험번호, b.iw_jwhgcode1 전지원학과,
decode(b.iw_result,'1', '합격', '2','예비합격','3','불합격') 전지원결과,
decode(b.iw_dungrok, '1', '등록') 전등록여부
from ipsi201 a, ipsi201 b
where a.iw_year = '2005' and a.iw_chasu in ('03')
and a.iw_year = b.iw_year and (a.iw_jcode1 = b.iw_jcode1 and a.iw_jcode2 = b.iw_jcode2) 
and (a.iw_chasu <> b.iw_chasu and a.iw_shno <> b.iw_shno)
and a.iw_chasu < b.iw_chasu