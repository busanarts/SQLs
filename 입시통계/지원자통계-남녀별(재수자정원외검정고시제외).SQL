select hg_name 학과명, iw_sexgubun 성별, 
count(*) 지원자수 from ipsi201, ipsi104 
where iw_year = '2004'  // 졸업예정자 남녀별 지원자수
and iw_jwhgcode1 = hg_code
and substr(iw_jhgubun,1,1) in ('2','3','4') //정원외 제외
group by cube(hg_name, iw_sexgubun)