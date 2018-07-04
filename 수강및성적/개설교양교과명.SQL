select gg_hgcode 학과코드, hg_kname || decode(hg_juya, '1', '', '(야)') 학과명, gg_kname 교양교과명 from ac1303, ac1121  -- 교육과정, 학과, 이수구분코드
where gg_year = '2010' and gg_hakgi = '1' and gg_isugbm in ('11','12','13')
and gg_hgcode = hg_code
order by gg_hgcode,gg_haknyun
