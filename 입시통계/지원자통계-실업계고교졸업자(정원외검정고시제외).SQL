// *** 지원자통계 : 실업계고교졸업자  ***
select hg_name 학과명, decode(iw_sexgubun,'1','남','2', '여', '계') 성별, 
count(*) 지원자수 from ipsi201, ipsi104, 고등학교코드
where iw_year = '2006' --and iw_ggjyear = '2006'  
and iw_jwhgcode1 = hg_code
and iw_ggcode = neis학교코드 
and 일반실업구분 = '실업계'
and substr(iw_jhgubun,1,1) in ('2','3','4') //정원외 제외
and iw_jhgubun <> '23' //검정고시 제외
group by cube(hg_name, iw_sexgubun)
