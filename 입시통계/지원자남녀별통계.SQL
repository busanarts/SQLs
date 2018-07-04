select hg_name 학과명, decode(iw_sexgubun, '1', '남', '2', '여') 성별, count(*) 지원자수 
from ipsi201, ipsi104 
where iw_year = '2005'  
--and iw_ggjyear < '2004' --고교졸업년도
and iw_jwhgcode1 = hg_code
--and (substr(iw_jhgubun,1,1) in ('2','3','4') or iw_jhgubun = '53') --정원외제외 농어촌포함
--and iw_jhgubun in ('51', '52', '54') --기타(정원외)
--and iw_jhgubun <> '23' --검정고시 제외
--and iw_jhgubun = '23' --검정고시자
--and iw_dungrok = '1' --등록자
group by cube(hg_name, iw_sexgubun)