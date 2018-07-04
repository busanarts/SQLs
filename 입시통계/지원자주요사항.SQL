select iw_jwhgcode1 학과코드, iw_jsno 접수번호, iw_shno 수험번호, iw_kname 성명, 
iw_jcode1 || '-' || iw_jcode2 주민번호, iw_ggjyear 고교졸업년도,
iw_jhgubun 전형구분, iw_sgcode 실기코드, 
iw_korisu1 국어1, iw_korisu2 국어2, iw_natisu1 윤리1, iw_natisu2 윤리2
from ipsi201
where iw_year = '2005' and iw_chasu = '93'
order by iw_jwhgcode1, iw_jsno
