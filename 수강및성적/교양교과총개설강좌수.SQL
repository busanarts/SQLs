select '교양과목개설수 : ' || to_char(count(*)) from ac1303 -- 교육과정
where gg_year = '2001' and gg_hakgi = '2' and substr(gg_isugbm,1,1) = '1' --교양과목개설수
union
select '총개설강좌수   : ' || to_char(count(distinct sj_gghgcode || sj_gggmcode ||sj_ggban)) from ac1401 --수강/성적
where sj_year = '2001' and sj_hakgi = '2' and substr(sj_isugbm,1,1) = '1' --교양과목 총개설강좌수
union
select '총수강학생수   : ' || to_char(count(*)) from ac1401 --수강/성적
where sj_year = '2001' and sj_hakgi = '2' and substr(sj_isugbm,1,1) = '1' --교양과목 총수강학생수