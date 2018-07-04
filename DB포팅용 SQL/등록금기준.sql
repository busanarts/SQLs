SELECT dg_hakgi 학기, hg_kname 학과, dg_haknyun 학년, dg_ihakg 입학금, dg_suryo 수업료, dg_gisbi 기타
FROM AC2701, AC1121
WHERE
dg_year = '2012' AND dg_hakgi = '2'
AND dg_hgcode = hg_code
ORDER BY hg_kname, dg_haknyun