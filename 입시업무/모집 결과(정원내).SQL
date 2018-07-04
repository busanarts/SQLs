-- <서식2> 정원내 전형 학과별 모집 결과
select a.hg_name 학과명, 일반전형모집정원, max(decode(b.전형구분, '2', 지원자수)) 일반지원자수,
		   max(decode(c.전형구분, '2', 합격자수)) 일반합격자수,
            특별전형모집정원, max(decode(b.전형구분, '3', 지원자수)) 특별지원자수,
            	   max(decode(c.전형구분, '3', 합격자수)) 특별합격자수
from (select ij_year, ij_hgcode, hg_name, sum(ij_ibjung) 일반전형모집정원, sum(ij_tbjung) 특별전형모집정원
	from ipsi105, ipsi104 where ij_year = :입시연도 and ij_hgcode = hg_code
	group by ij_year, ij_hgcode, hg_name) a,
(select iw_year, iw_jwhgcode1, hg_name, substr(iw_jhgubun,1,1) 전형구분, count(*) 지원자수
	from ipsi201, ipsi104
	where iw_year = :입시연도 and iw_jwhgcode1 = hg_code
	group by iw_year, iw_jwhgcode1, hg_name, substr(iw_jhgubun,1,1)
) b,
(select iw_year, iw_jwhgcode1, substr(iw_jhgubun,1,1) 전형구분, count(*) 합격자수
	from ipsi201, ipsi104
	where iw_year = :입시연도
  AND iw_year = hg_year and iw_jwhgcode1 = hg_code
 	and iw_result IN ( '1', '5') -- 1 = 합격, 2 = 충원합격
	group by iw_year, iw_jwhgcode1, substr(iw_jhgubun,1,1)
) c
where ij_year = :입시연도
and ij_year = b.iw_year and ij_year = c.iw_year
and ij_hgcode = b.iw_jwhgcode1 and ij_hgcode = c.iw_jwhgcode1

group by a.hg_name, 일반전형모집정원, 특별전형모집정원
--ORDER BY a.hg_name, 일반전형모집정원, 특별전형모집정원

UNION

select '합계' 학과명, 일반전형모집정원, max(decode(b.전형구분, '2', 지원자수)) 일반지원자수,
		   max(decode(c.전형구분, '2', 합격자수)) 일반합격자수,
            특별전형모집정원, max(decode(b.전형구분, '3', 지원자수)) 특별지원자수,
            	   max(decode(c.전형구분, '3', 합격자수)) 특별합격자수
from (select ij_year, sum(ij_ibjung) 일반전형모집정원, sum(ij_tbjung) 특별전형모집정원
	from ipsi105 where ij_year = :입시연도
	group by ij_year ) a,
(select iw_year, substr(iw_jhgubun,1,1) 전형구분, count(*) 지원자수
	from ipsi201
	where iw_year = :입시연도
	group by iw_year, substr(iw_jhgubun,1,1)
) b,
(select iw_year, substr(iw_jhgubun,1,1) 전형구분, count(*) 합격자수
	from ipsi201
	where iw_year = :입시연도
 	and iw_result IN ( '1', '5') -- 1 = 합격, 2 = 충원합격
	group by iw_year, substr(iw_jhgubun,1,1)
) c
where ij_year = :입시연도
and ij_year = b.iw_year and ij_year = c.iw_year
group by 일반전형모집정원, 특별전형모집정원
