select 학과명, hj_hakbun 학번, hj_kname 성명, count(sj_gggmcode) 신청과목수
from ac12011, ac1121, tbl학과, (select * from ac1401 where sj_year = '2007' and sj_hakgi = '1') a
where hj_state = '01'
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_hakbun = sj_hakbun(+)
group by 학과명, hj_hakbun, hj_kname