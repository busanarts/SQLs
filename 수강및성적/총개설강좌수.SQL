select '총개설강좌수   : ' || to_char(count(distinct sj_gghgcode || sj_gggmcode ||sj_ggban))
from ac1401 --수강/성적
where sj_year = '2010' and sj_hakgi = '1'  -- 총개설강좌수
union
select '전공개설강좌수 : ' || to_char(count(distinct sj_gghgcode || sj_gggmcode ||sj_ggban))
from ac1401 --수강/성적
where sj_year = '2010' and sj_hakgi = '1' and substr(sj_gggmcode,3,1) = '2' -- 교양과목 총개설강좌수
union
select '교양개설강좌수 : ' || to_char(count(distinct sj_gghgcode || sj_gggmcode ||sj_ggban))
from ac1401 --수강/성적
where sj_year = '2010' and sj_hakgi = '1' and substr(sj_gggmcode,3,1) = '1' -- 교양과목 총개설강좌수
