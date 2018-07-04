select iw_jwhgcode1 학과코드, hg_name 학과명, decode(iw_sexgubun,'1','남','여') 성별, 
count(*) 지원자수 from ipsi.ipsi201, ipsi.ipsi104 
where iw_year = '2003' 
and iw_jwhgcode1 = hg_code
and substr(iw_jhgubun,1,1) not in ('2','3','4') //정원외
group by iw_jwhgcode1, hg_name, iw_sexgubun
union
select '전체' 학과코드, ' ' 학과명, decode(iw_sexgubun,'1','남','여') 성별, 
count(*) 지원자수 from ipsi.ipsi201, ipsi.ipsi104 
where iw_year = '2003' 
and iw_jwhgcode1 = hg_code
and substr(iw_jhgubun,1,1) not in ('2','3','4') //정원외 
group by iw_sexgubun
