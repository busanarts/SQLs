--INSERT INTO AC2711
SELECT dr_year, '1' 학년, '1' 학기, si_hakbun,
dr_iphak 입학금, dr_suryo 수업료, dr_gisbi 기성회비,
dr_jhiphak 입학금감면, dr_jhsuryo 수업료감면, dr_jhgisbi 기성회비감면,
dr_drtotal 등록금계, dr_jhtotal 감면액계, dr_nbtotal + dr_ycgum 실납부액, 0 미납금액,
dr_drniymd 납입일자, dr_bigo || DECODE(dr_drhbymd, NULL, '', '/환불/') 비고, 0 분납1, 0 분납2, 0 분납3, '' 분납2일자,'' 분납3일자, dr_drniymd 최초납입일
FROM ipsi.ipsi203, ipsi.ipsi401
WHERE dr_year = &sYear
AND dr_year = si_year AND dr_shno = si_shno
