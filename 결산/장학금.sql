SELECT dd_hakbun, dd_gmihakg 입학금감면, dd_gmsuryo 수업료감면,
dd_gmihakg + dd_gmsuryo 총감면액, dd_nipgum 납입금, dd_modgum 미납금, dd_nidate 납입일자
FROM AC2711, AC1711
WHERE dd_year = '2011'
--AND dd_hakgi = '1'
AND dd_year = jd_year
AND dd_hakgi = jd_hakgi
AND dd_hakbun = jd_hakbun
AND dd_nidate IS NOT NULL
--AND dd_gmihakg + dd_gmsuryo <> dd_tgmgum