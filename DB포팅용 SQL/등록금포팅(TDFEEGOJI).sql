--INSERT INTO TMµî·Ï±Ý
INSERT INTO TDFEEgoji
SELECT dd_year, dd_hakgi, '3030100', dd_hakbun, hg_mcode, dd_haknyun,
dd_ihakg, dd_suryo, dd_gisbi, dd_tgmgum, 0, '77', dd_nidate, '', '', dd_bigo,
'', '', '', '', '', '', '','', '', '', '', ''
FROM psutis.ac2711, psutis.AC12011, psutis.ac1121
WHERE dd_hakbun = hj_hakbun --AND SUBSTR(hj_state,1,1) IN ('0', '1')
AND hj_hgcode = hg_code
AND dd_nidate IS NOT null
--AND dd_hakbun = 'A1048024'
--GROUP BY dd_year, dd_hakgi, dd_hakbun, dd_haknyun
--HAVING COUNT(*) > 1  --A1048024