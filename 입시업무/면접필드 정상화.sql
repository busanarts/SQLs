update IPSI201 SET iw_mjcheck = '1', iw_dungrok = '0', iw_result = '0', iw_panjung = '0'
WHERE iw_year = :입시연도 AND iw_chasu = :차수
AND (iw_mjcheck IS NULL)
