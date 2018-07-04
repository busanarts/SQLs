select iw_ggname 고등학교명, hg_name 학과명, iw_kname 성명, iw_shno 수험번호, 
iw_jcode1 || '-' || iw_jcode2 주민등록번호, iw_ggjyear 졸업년도, 
decode(iw_result, '1', '합격', '2', '예비합격', '3', '불합격') 합격여부,
decode(iw_dungrok, '1', '등록') 등록여부
from ipsi.ipsi201, ipsi.ipsi104
where iw_year = '2007'
and iw_jhgubun < '50'
and substr(iw_ggcode,4,7) <> '0000000'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
order by iw_ggname