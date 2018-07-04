--UPDATE AC2711 SET dd_modgum = dd_totgum - dd_tgmgum - dd_nipgum
SELECT hg_kname 학과, dd_haknyun 학년, dd_hakbun 학번, hj_kname 성명,
dd_totgum 등록금계, dd_tgmgum 감면금액계, dd_totgum - dd_tgmgum 실등록금,
dd_nipgum 납부계, dd_modgum 미납계,
NVL(a.JD_IHAKG, 0) + NVL(a.JD_SURYO, 0) + NVL(a.JD_GISBI, 0) + NVL(a.JD_ETCGM, 0) 일반장학금,
NVL(b.JD_ETCGM, 0) 국가장학유형1,  NVL(c.JD_ETCGM, 0) 국가장학유형2
,dd_totgum - dd_tgmgum - (dd_nipgum + dd_modgum) "등록금검증",
dd_totgum - (dd_ihakg + dd_suryo + dd_gisbi) "등록금검증2",
dd_tgmgum - (NVL(a.JD_IHAKG, 0) + NVL(a.JD_SURYO, 0) + NVL(a.JD_GISBI, 0) + NVL(a.JD_ETCGM, 0) +
NVL(b.JD_ETCGM, 0) + NVL(c.JD_ETCGM, 0)) 장학금검증
FROM AC2711, AC12011, AC1121, AC1711 a, AC1712 b, AC1713 c
WHERE dd_year = &sYear AND dd_hakgi = &sHakgi
AND dd_hakbun = hj_hakbun AND hj_hgcode = hg_code
AND dd_hakbun = a.jd_hakbun(+) AND dd_year = a.jd_year(+) AND dd_hakgi = a.JD_HAKGI(+)
AND dd_hakbun = b.jd_hakbun(+) AND dd_year = b.jd_year(+) AND dd_hakgi = b.JD_HAKGI(+)
AND dd_hakbun = c.jd_hakbun(+) AND dd_year = c.jd_year(+) AND dd_hakgi = c.JD_HAKGI(+)
--AND (dd_totgum - dd_tgmgum) <>  (dd_nipgum + dd_modgum)
ORDER BY hg_kname, dd_haknyun, dd_hakbun