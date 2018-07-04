SELECT iw_shno 수험번호, iw_kname 성명,
dr_suryo 수업료, dr_drtotal 등록금총계, dr_jhiphak 입학금감면, dr_jhsuryo 수업료감면,
dr_jhtotal 감면총액, dr_drtotal - dr_jhtotal 차액
FROM ipsi.IPSI203, ipsi.ipsi201
WHERE dr_year = '2011'
AND (dr_jhiphak + dr_jhsuryo <> dr_jhtotal)
AND dr_year = iw_year AND dr_shno = iw_shno
