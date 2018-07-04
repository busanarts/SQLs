SELECT sc_name, COUNT(*) FROM IPSI201, ipsi109
WHERE iw_year = '2011' AND iw_chasu = '02'
AND iw_jwhgcode1 = '01'
AND iw_sgcode = sc_code
GROUP BY sc_name
