select gg_hgcode 학과코드, hg_kname || decode(hg_juya, '1', '', '(야)') 학과명, gg_isugbm 이수구분코드, is_fname 이수구분, count(*) 개설교과목수, sum(gg_hjum) 학점수
from ac1303, ac1121, ac1105 -- 교육과정, 학과, 이수구분코드
where gg_year = &학년도 and gg_hakgi = &학기 --and gg_isugbm = '11' --교양필수
and gg_hgcode = hg_code and gg_isugbm = is_code
group by gg_hgcode, hg_kname, hg_juya, gg_isugbm, is_fname