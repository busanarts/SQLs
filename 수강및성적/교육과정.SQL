SELECT gg_haknyun 학년,  hg_kname 학과, gg_hgcode 학과코드,
gg_kname 교과명, is_fname 이수구분명, gg_hjum 학점, gg_irtime 이론시수, gg_sstime 실습시수
FROM AC1303, AC1121, AC1105
WHERE gg_year = &sYear AND gg_hakgi = &sHakgi
AND gg_hgcode = hg_code AND gg_isugbm = is_code
ORDER BY hg_kname, gg_haknyun, gg_isugbm