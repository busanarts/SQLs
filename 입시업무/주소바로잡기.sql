UPDATE IPSI201 SET iw_addr1 = (SELECT w_addr1 FROM copy_IPSI201 WHERE iw_year = w_year AND iw_chasu = w_chasu AND iw_shno = w_shno),
iw_addr2 = (SELECT w_addr2 FROM copy_IPSI201 WHERE iw_year = w_year AND iw_chasu = w_chasu AND iw_shno = w_shno)
WHERE iw_year = 2015 AND iw_chasu = 91 AND iw_shno IN (SELECT w_shno FROM COPY_IPSI201)