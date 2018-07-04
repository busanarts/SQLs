select 학과명, hj_haknyun 학년, hj_hakbun 학번, hj_kname 성명, count(sj_gggmcode) 신청과목수, sum(sj_hjum) 신청학점
from ac12011, ac1401, ac1121, tbl학과 
where hj_state = '01'
and sj_hgcode = hg_code and hg_mcode = 학과코드
and hj_hakbun = sj_hakbun
and sj_year = '2007' and sj_hakgi = '2'
group by 학과명, hj_haknyun, hj_hakbun, hj_kname
having sum(sj_hjum) < 18


