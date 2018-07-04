INSERT into AC2711 (dd_year, dd_haknyun, dd_hakgi, dd_hakbun, dd_ihakg,
dd_suryo, dd_gisbi, dd_gmihakg, dd_gmsuryo, dd_gmgisbi,
dd_totgum, dd_tgmgum, dd_nipgum, dd_modgum, dd_nidate,
dd_bigo, dd_nipgum1, dd_nipgum2, dd_nipgum3, dd_nidate2, dd_nidate3, dd_nidate1)
SELECT si_year 학년도, '1' 학년, '1' 학기, TRIM(si_hakbun) 학번, dr_iphak 입학금,
dr_suryo 수업료, dr_gisbi 기성회비, dr_jhiphak 장학입학금, dr_jhsuryo 장학수업료, dr_jhgisbi 기성회비면제,
--dr_drtotal 총금액, dr_jhtotal + decode(sign(dr_drtotal - dr_jhtotal), 0, 0, dr_ycgum) 감면총액, dr_nbtotal 납부총액,
dr_iphak + dr_suryo 총금액, dr_jhtotal 감면총액, dr_nbtotal +(dr_ycgum - dr_wbycgum) 납부총액,
dr_drtotal - dr_jhtotal - dr_nbtotal - (dr_ycgum) 미납금, dr_drniymd 납입일자,
--substr(TRIM(dr_bank) || '/' || TRIM(dr_jhname),1,20) 비고, dr_nbtotal 최초납입금, 0, 0, '',
TRIM(dr_jhname) 비고, dr_nbtotal 최초납입금, 0, 0, '',
'', dr_drniymd
FROM ipsi.ipsi401, ipsi.ipsi203, ac12011
WHERE si_year = &입시년도
AND si_year = dr_year
AND si_shno = dr_shno
AND si_hakbun = hj_hakbun
--order by dr_drniymd
order by si_hakbun
--AND dr_drhbymd  IS NOT null