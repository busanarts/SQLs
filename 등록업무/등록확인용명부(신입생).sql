SELECT hg_name 학과, si_hakbun 학번, si_shno 수험번호, si_name 성명, dr_chasu 차수,
dr_drtotal - dr_jhtotal 납부대상금액, dr_nbtotal 납부된금액, dr_ycgum 예치금, dr_wbycgum 예치금환불,
dr_drtotal - dr_jhtotal - dr_nbtotal - dr_ycgum 미납금, dr_drniymd 납입일자,
DECODE(dr_nbtotal, 0, '', DECODE(SIGN(dr_drtotal - dr_jhtotal - (dr_ycgum - dr_wbycgum) - dr_nbtotal), -1, '초과납부', 1, '부분납부')) 비고
FROM ipsi.IPSI203, ipsi.ipsi401, ipsi.ipsi104
WHERE dr_year = &학년도
AND dr_Year = si_year
AND dr_shno = si_shno
AND si_hgcode = hg_gycode
--AND dr_drniymd IS NOT NULL
--AND dr_nbtotal = 0
UNION
SELECT hg_name 학과, '' 학번, '' 수험번호, '' 성명, '' 차수,
sum(dr_drtotal - dr_jhtotal) 납부대상금액, SUM(dr_nbtotal) 납부된금액, SUM(dr_ycgum) 예치금, SUM(dr_wbycgum) 예치금환불,
SUM(dr_drtotal - dr_jhtotal - dr_nbtotal - dr_ycgum) 미납금,
'' 납입일자, '' 비고
FROM ipsi.IPSI203, ipsi.ipsi401, ipsi.ipsi104
WHERE dr_year = &학년도
AND dr_Year = si_year
AND dr_shno = si_shno
AND si_hgcode = hg_gycode
GROUP BY CUBE(hg_name)