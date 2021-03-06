// <서식3> 전형시기별 정원외 모집 결과
select decode(substr(ij_chasu,1,1), '9', '수시', '정시') || substr(ij_chasu,2,1) 모집시기,
	decode(hg_jygubun, '1', '주', '야') 주야구분, 
	대졸, 
		 max(decode(b.전형구분, '52', 지원자수)) 전문대졸지원자수, 
		 max(decode(c.전형구분, '52', 등록자수)) 전문대졸등록자수, 
		 max(decode(b.전형구분, '51', 지원자수)) 대졸지원자수, 
		 max(decode(c.전형구분, '51', 등록자수)) 대졸등록자수, 
	농어촌,
		 max(decode(b.전형구분, '53', 지원자수)) 농어촌지원자수, 
		 max(decode(c.전형구분, '53', 등록자수)) 농어촌등록자수 
from (select ij_year, ij_chasu, hg_jygubun 주야구분, sum(ij_jmjung) 대졸, sum(ij_ncjung) 농어촌
	from ipsi105, ipsi104 where ij_year = '2007' and ij_hgcode = hg_code
	group by ij_year, ij_chasu, hg_jygubun) a,
(select iw_year, iw_chasu, hg_jygubun, iw_jhgubun 전형구분, count(*) 지원자수 
	from ipsi201, ipsi104
	where iw_year = '2007' and iw_jwhgcode1 = hg_code
	group by iw_year, iw_chasu, hg_jygubun, iw_jhgubun
) b,
(select iw_year, iw_chasu, iw_jhgubun 전형구분, count(*) 등록자수 
	from ipsi201, ipsi104
	where iw_year = '2007'  and iw_jwhgcode1 = hg_code
 	and iw_dungrok = '1'
	group by iw_year, iw_chasu, hg_jygubun, iw_jhgubun 
) c
where ij_year = '2007'
and ij_year = b.iw_year and ij_year = c.iw_year
and ij_chasu = b.iw_chasu and ij_chasu = c.iw_chasu
group by ij_chasu, hg_jygubun, 대졸, 농어촌
order by 모집시기
