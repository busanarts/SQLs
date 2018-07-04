select iw_jwhgcode1 지원학과, hg_name 학과명, 
decode(substr(iw_jhgubun,1,1),'2', '일반전형', '특별전형') 전형구분,  
max(ns_dunggub) 내신최하등급 , round(avg(to_number(ns_dunggub)),1) 내신평균등급
from ipsi202, ipsi201, ipsi107, ipsi104_bak
where iw_year = '2004' 
and iw_year = sj_year and iw_jsno = sj_jsno and iw_chasu = sj_chasu
and iw_result = '1' and iw_chasu = '99' 
and iw_jwhgcode1 = hg_code
and sj_year = ns_year and sj_nstot = ns_hsjumsu
and substr(iw_jhgubun,1,1) = '2'
group by iw_jwhgcode1, hg_name, substr(iw_jhgubun,1,1)
having substr(iw_jhgubun,1,1) < '4'