--INSERT INTO TDFEERECEIVE
SELECT dd_year, dd_hakgi, '3030100', dd_nidate, dd_hakbun, '77', hg_mcode, dd_haknyun,
--SELECT dd_year, dd_hakgi, dd_hakbun, dd_haknyun, COUNT(*)
dd_nipgum, 0, '', '', '', 0, dd_bigo, 'sahn', '20120824', '', ''
FROM psutis.ac2711, psutis.AC12011, psutis.ac1121
WHERE dd_hakbun = hj_hakbun --AND SUBSTR(hj_state,1,1) IN ('0', '1')
AND hj_hgcode = hg_code
AND dd_nidate IS NOT null
--AND dd_hakbun = 'A1048024'
--GROUP BY dd_year, dd_hakgi, dd_hakbun, dd_haknyun
--HAVING COUNT(*) > 1  --A1048024