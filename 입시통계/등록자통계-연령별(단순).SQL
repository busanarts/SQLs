select hg_name 학과명, 
to_char(trunc(months_between(to_date('20060301','YYMMDD'), to_date('19' || iw_jcode1,'YYMMDD'))/12) -1, '99') 연령, 
decode(iw_sexgubun, '1', '남', '2', '여', '계') 성별, 
count(*) 인원
from ipsi201, ipsi104
where iw_year = '2006' and iw_dungrok = '1'
and iw_jwhgcode1 = hg_code
group by cube(hg_name, 
to_char(trunc(months_between(to_date('20060301','YYMMDD'), to_date('19' || iw_jcode1,'YYMMDD'))/12) -1, '99'), iw_sexgubun )
