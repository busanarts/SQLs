SELECT *
FROM AC2711
WHERE dd_year = &sYear AND dd_hakgi = &sHakgi
AND dd_hakbun IN
(SELECT hj_hakbun
FROM AC12011, AC2711, AC2701, ac1202
WHERE hj_hakbun = dd_hakbun
AND dd_year = &sYear AND dd_hakgi = &sHakgi
AND dd_year = dg_year AND dd_hakgi = dg_hakgi
AND dd_haknyun = dg_haknyun
AND hj_hgcode = dg_hgcode
AND dg_suryo <> dd_suryo
AND hj_hakbun = hc_hakbun
AND hc_siymd > &sYear || '0101' AND hc_scode = '31'
)