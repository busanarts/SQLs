--insert into TBL이수구분검증
select c.학과명, sj_hakbun 학번, b.학과명 개설학과, sj_gggmcode 교과코드, gg_kname 교과명,
DECODE(sj_isugbm, '11', '교필', '12', '교선', '21', '전필', '22', '전선', '31', '교직') 이수구분,
DECODE(gg_isugbm, '11', '교필', '12', '교선', '21', '전필', '22', '전선', '31', '교직') 원이수구분,
a.학과명 수강당시학과명, sj_year 수강년도, sj_haknyun 수강학년, sj_hakgi 수강학기
from (select * from ac1401,ac1121, tbl학과
where sj_hgcode = hg_code and hg_mcode = 학과코드) a,
(select * from ac1303, ac1121, tbl학과
where gg_hgcode = hg_code and hg_mcode = 학과코드) b,
(select * from ac12011, ac1121, tbl학과
where hj_hgcode = hg_code and hg_mcode = 학과코드) c
where hj_hakbun = sj_hakbun
and sj_gggmcode = gg_gmcode and sj_gghgcode = gg_hgcode
and sj_year = gg_year and sj_hakgi = gg_hakgi
and a.학과명 = b.학과명
--or (sj_hgcode <> sj_gghgcode and sj_ggban = 'N'))
and substr(sj_gggmcode,3,2) <> sj_isugbm  -- 개설과목의 이수구분과 신청이수구분이 틀리고
and sj_isugbm <> gg_isugbm
and  sj_isugbm <> '41' -- 신청 이수구분이 자유선택이 아닌 경우
--and  sj_isugbm = '41' -- 신청 이수구분이 자유선택인 경우
