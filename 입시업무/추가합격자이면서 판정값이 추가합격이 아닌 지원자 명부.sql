SELECT dr_shno 수험번호, iw_kname 성명, iw_rank2 예비순위, iw_chasu 차수  FROM IPSI203, IPSI201
--UPDATE IPSI203 SET dr_hstotal = dr_hakbi + dr_bangsong + dr_jolup
WHERE dr_year = &sYear
 AND dr_year = iw_year AND dr_shno = iw_shno
AND iw_chasu IN ('01', '02', '03')
AND iw_rank2 > 0 AND iw_result = '1' AND iw_panjung <> '5'
