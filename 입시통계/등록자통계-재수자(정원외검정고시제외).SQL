select iw_jwhgcode1 학과코드, hg_name 학과명, decode(iw_sexgubun,'1','남','2', '여') 성별, 
count(*) 지원자수 from ipsi201, ipsi104
where iw_year = '2006' and iw_ggjyear < '2006'  // 기졸업자 남녀별 등록자수
and iw_dungrok = '1' and iw_jwhgcode1 = hg_code 
and substr(iw_jhgubun,1,1) in ('2','3','4') //정원외 제외
and iw_jhgubun <> '23' //검정고시 제외
group by iw_jwhgcode1, hg_name, iw_sexgubun
union
select '전체' 학과코드, ' ' 학과명, decode(iw_sexgubun,'1','남','여') 성별, 
count(*) 지원자수 from ipsi201, ipsi104
where iw_year = '2006' and iw_ggjyear < '2006'  // 기졸업자 남녀별 등록자수
and iw_dungrok = '1' and iw_jwhgcode1 = hg_code 
and substr(iw_jhgubun,1,1) in ('2','3','4') //정원외 제외
and iw_jhgubun <> '23' //검정고시 제외
group by iw_sexgubun
