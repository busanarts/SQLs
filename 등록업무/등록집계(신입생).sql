SELECT hg_name 학과, COUNT(*) 인원,
SUM(dr_drtotal - dr_jhtotal) 납부대상금액, SUM(dr_nbtotal) 납부된금액, SUM(dr_drtotal - dr_jhtotal - dr_ycgum - dr_nbtotal) 미납금
FROM ipsi.IPSI203, ipsi.IPSI401, ipsi.IPSI104
WHERE dr_year = &입시년도
AND dr_Year = si_year
AND dr_shno = si_shno
AND si_hgcode = hg_gycode(+)
AND dr_drniymd IS NOT NULL
GROUP BY CUBE(hg_name)
ORDER BY hg_name