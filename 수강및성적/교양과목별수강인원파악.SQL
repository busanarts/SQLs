select 학과코드, hg_kname 학과명, 학년, 개설과목.교과코드, gm_kname 과목명, is_id 교수코드, is_kname 교수명, 개설과목.분반, count(*) 수강인원
from 개설과목, ac1401, ac1302 , ac1121,  ac22011
where 개설과목.학과코드 = hg_code and 개설과목.교과코드 = gm_code and 개설과목.교수코드 = is_id(+)
and 개설과목.교과코드 = sj_gggmcode and sj_year = '2002' and sj_hakgi = '1' and 분반 = sj_ggban
and substr(sj_isugbm,1,1) = '1'
group by 학과코드, 학년, hg_kname, 개설과목.교과코드, gm_kname, 개설과목.분반, is_id, is_kname  --, tm_pfcode, is_kname