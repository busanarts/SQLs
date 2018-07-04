select gg_hgcode 학과코드, hg_kname || decode(hg_juya, '1', '', '(야)') 학과명, count(*) 개설교양교과목수, sum(gg_hjum) 학점수
from ac1303, ac1121 -- 교육과정, 학과, 이수구분코드
where gg_year = '2002' and gg_hakgi = '1' and substr(gg_isugbm,1,1) = '1' --교양
and gg_hgcode = hg_code 
group by gg_hgcode, hg_kname, hg_juya