SELECT dr_hgname 학과, SUM(dr_iphak) 입학금, SUM(dr_suryo) 수업료, SUM(dr_drtotal) 등록금계,
SUM(dr_jhiphak) 입학금면제, SUM(dr_jhsuryo) 수업료면제, SUM(dr_jhtotal) 장학금계,
SUM(dr_hakbi) 학생회비, SUM(dr_bangsong) 방송비, SUM(dr_hakbobi) 학보비, SUM(dr_jolup) OT비
FROM IPSI203
WHERE dr_year = '2012'
group by dr_hgname