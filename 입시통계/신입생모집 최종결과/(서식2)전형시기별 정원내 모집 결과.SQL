// <서식2> 전형시기별 정원내 모집 결과
select decode(substr(ij_chasu,1,1), '9', '수시', '정시') || substr(ij_chasu,2,1) 모집시기, 
	decode(b.hg_jygubun, '1', '주', '야') 주야구분, 
	일반전형, max(decode(b.전형구분, '2', 지원자수)) 일반지원자수, 
		   max(decode(c.전형구분, '2', 등록자수)) 일반등록자수, 
            특별전형, max(decode(b.전형구분, '3', 지원자수)) 특별지원자수, 
            	   max(decode(c.전형구분, '3', 등록자수)) 특별등록자수
from (select ij_year, ij_chasu, hg_jygubun 주야구분, sum(ij_ibjung) 일반전형, sum(ij_tbjung) 특별전형
	from ipsi105, ipsi104 where ij_year = '2007' and ij_hgcode = hg_code
	group by ij_year, ij_chasu, hg_jygubun) a,
(select iw_year, iw_chasu, hg_jygubun, substr(iw_jhgubun,1,1) 전형구분, count(*) 지원자수 
	from ipsi201, ipsi104
	where iw_year = '2007' and iw_jwhgcode1 = hg_code
	group by iw_year, iw_chasu, hg_jygubun, substr(iw_jhgubun,1,1) 
) b,
(select iw_year, iw_chasu, hg_jygubun, substr(iw_jhgubun,1,1) 전형구분, count(*) 등록자수 
	from ipsi201, ipsi104
	where iw_year = '2007'  and iw_jwhgcode1 = hg_code
 	and iw_dungrok = '1'
	group by iw_year, iw_chasu, hg_jygubun, substr(iw_jhgubun,1,1) 
) c
where ij_year = '2007'
and ij_year = b.iw_year and ij_year = c.iw_year
and ij_chasu = b.iw_chasu and ij_chasu = c.iw_chasu
group by ij_chasu, b.hg_jygubun, 일반전형, 특별전형
order by 모집시기