select hg_name 학과명, 2004 - 1900 - to_number(substr(iw_jcode1,1,2)) 연령, 
count(*) 지원자수 from ipsi201, ipsi104 
where iw_year = '2004'  // 졸업예정자 남녀별 지원자수
and iw_jwhgcode1 = hg_code
and substr(iw_jhgubun,1,1) in ('2','3','4') //정원외 제외
group by cube(hg_name, substr(iw_jcode1,1,2))