select iw_jwhgcode1 학과코드, hg_name 학과명, iw_kname 성명,
iw_jcode1 || '-' || iw_jcode2 주민번호, iw_ggcode 고교코드,
iw_ggname 고교명, iw_ggjyear 졸업년도, iw_jhgubun 전형구분, iw_chasu 차수
from ipsi201, ipsi104
where iw_year = '2010'
and iw_jwhgcode1 = hg_code
and iw_dungrok = '1'
order by iw_jwhgcode1, iw_chasu, iw_jhgubun