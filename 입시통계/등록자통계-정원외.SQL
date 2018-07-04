// *** 등록자통계 : 정원외 ***
select hg_name 학과명, 
decode(iw_jhgubun, '51', '대졸', '52', '전문대졸', '53', '농어촌') 전형구분, 
decode(iw_sexgubun, '1', '남', '2', '여', '계') 성별,
count(*) 지원자수
from ipsi201, ipsi104
where iw_year = '2006' 
and iw_jhgubun > '50'
and iw_dungrok = '1'
and iw_jwhgcode1 = hg_code
group by cube(hg_name, iw_jhgubun, iw_sexgubun)