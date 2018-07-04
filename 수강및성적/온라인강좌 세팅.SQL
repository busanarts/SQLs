--update ac1303 set gg_open = '2'
SELECT * FROM AC1303
where gg_year = &sYear and gg_hakgi = &sHakgi
and gg_gmcode in
(select gm_code from  ac1303, ac1302
where gg_year = &sYear and gg_hakgi = &sHakgi
and gg_gmcode = gm_code
and gm_kname in ('생활영어', '공연예술의 이해와 감상', '음악의 이해와 감상', '일본어', '미술의 이해와 감상'))
