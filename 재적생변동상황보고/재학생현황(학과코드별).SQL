select hj_hgcode 학과, hg_kname 학과명, 
max(decode(학년, '1', cnt, 0)) 제1학년, 
max(decode(학년, '2', cnt, 0)) 제2학년,
max(decode(학년, '전체', cnt, 0)) 전체
from (
	select hj_hgcode, hg_kname, hj_haknyun 학년, count(*) cnt
	from ac12011,ac1121 
	where hj_state = '01' and hj_haknyun = '1' and hj_hgcode = hg_code
	group by hj_hgcode, hg_kname, hj_haknyun
	union
	select hj_hgcode, hg_kname, hj_haknyun 학년, count(*) cnt
	from ac12011,ac1121 
	where hj_state = '01' and hj_haknyun = '2' and hj_hgcode = hg_code
	group by hj_hgcode, hg_kname, hj_haknyun
	union
	select hj_hgcode, hg_kname, '전체' 학년, count(*) cnt
	from ac12011,ac1121 
	where hj_state = '01' and hj_hgcode = hg_code
	group by hj_hgcode, hg_kname
) aa
group by hj_hgcode, hg_kname