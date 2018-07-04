INSERT INTO tm등록금기준
SELECT dg_year, dg_hakgi, dg_haknyun, hg_mcode, dg_ihakg, dg_suryo, dg_gisbi
FROM psutis.ac2701, psutis.ac1121
WHERE dg_hgcode = hg_code
and dg_year > '2010'