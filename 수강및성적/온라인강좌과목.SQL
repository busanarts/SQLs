select gg_gmcode 과목코드, gm_kname 과목명, gg_haknyun 개설학년, gg_hgcode 개설학과 from ac1303, ac1302
where gg_year = &학년도 and gg_hakgi = &학기
and gg_gmcode = gm_code
and gm_kname in ('생활영어', '공연예술의 이해와 감상', '음악의 이해와 감상', '일본어')