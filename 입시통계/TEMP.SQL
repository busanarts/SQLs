select iw_jwhgcode1 학과코드, hg_name 학과명, decode(iw_sexgubun,'1','남','여') 성별,
count(*) 지원자수 from ipsi.ipsi201, ipsi.ipsi104, ac12011
where iw_year = '2007' and iw_ggjyear < '2003'  -- 기졸업자 남녀별 등록자수
and iw_jwhgcode1 = hg_code and iw_jcode1 = hj_jcode1 and iw_jcode2 = hj_jcode2 and iw_dungrok = '1'
and substr(hj_state,1,1) <> '2'
and iw_jhgubun = '23' --검정고시
group by iw_jwhgcode1, hg_name, iw_sexgubun
union
select '전체' 학과코드, ' ' 학과명, decode(iw_sexgubun,'1','남','여') 성별,
count(*) 지원자수 from ipsi.ipsi201, ipsi.ipsi104, ac12011
where iw_year = '2006' and iw_ggjyear < '2003'  -- 기졸업자 남녀별 등록자수
and iw_jwhgcode1 = hg_code and iw_jcode1 = hj_jcode1 and iw_jcode2 = hj_jcode2 and iw_dungrok = '1'
and substr(hj_state,1,1) <> '2'
and iw_jhgubun = '23' --검정고시
group by iw_sexgubun
/
