select sj_gggmcode 과목코드, gm_kname 과목명, sj_ggban 분반, count(*) 수강인원 
from ac1401, ac1302
where sj_year = '2002' and sj_hakgi = '1' and sj_gggmcode = gm_code and sj_isugbm in ('11','12','13','31')
group by sj_gggmcode, gm_kname, sj_ggban