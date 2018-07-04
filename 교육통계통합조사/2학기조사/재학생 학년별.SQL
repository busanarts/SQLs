select 학과명, max(decode(학년, '1', 인원)) "1학년", max(decode(학년, '2', 인원)) "2학년"
from (
	select 학과명, hj_haknyun 학년, count(*) 인원
	from ac12011_2011_10_01, ac1121, tbl학과
	where hj_state = '01'
    AND hj_hakbun NOT LIKE 'T%'
	--and hj_haknyun = '2'
	and hj_hgcode = hg_code
	and hg_mcode = 학과코드
	group by hj_haknyun, 학과명)
group by 학과명
ORDER BY 학과명