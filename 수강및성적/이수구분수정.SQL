update ac1401 set sj_isugbm = (select gg_isugbm from ac1303 where sj_gghgcode = gg_hgcode and sj_gggmcode = gg_gmcode)
where sj_year = '2002' and sj_hakgi = '2' 
--and sj_gggmcode = gg_gmcode and sj_gghgcode = gg_hgcode
--and sj_year = gg_year and sj_hakgi = gg_hakgi
and sj_hgcode = sj_gghgcode  -- 학생소속학과와 개설학과가 같고
--or (sj_hgcode <> sj_gghgcode and sj_ggban = 'N'))
--and substr(sj_gggmcode,3,2) <> sj_isugbm  -- 개설과목의 이수구분과 신청이수구분이 틀리고
--and sj_isugbm <> gg_isugbm
--and  sj_isugbm <> '41' -- 신청 이수구분이 자유선택이 아닌 경우
and  sj_isugbm = '41' -- 신청 이수구분이 자유선택인 경우
