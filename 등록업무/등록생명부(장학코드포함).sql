SELECT 학과명, hj_haknyun 학년, hj_hakbun 학번, hj_kname 성명, USR_HJNAME(hj_state) 학적상태,
dd_totgum 원금액, DD_TOTGUM - DD_TGMGUM 대상금액, dd_tgmgum 감면금액, dd_nipgum 납입금계, dd_modgum 미납금,
dd_nidate 납입일자, jm_code 장학코드, jm_name 장학명
FROM AC2711, AC12011, AC1121, tbl학과,
(SELECT * FROM AC1711, AC1701
WHERE jd_year = &sYear AND jd_hakgi = &sHakgi AND jd_jmcode = jm_code)
WHERE dd_year = &sYear AND dd_hakgi = &sHakgi
AND dd_year = jd_year(+) AND dd_hakgi = jd_hakgi(+)
AND dd_hakbun = jd_hakbun(+)
--AND dd_totgum - dd_tgmgum > 0
--AND dd_nidate IS NULL
--AND dd_nipgum > 0
--AND dd_hakbun LIKE 'A12%'
AND dd_hakbun = hj_hakbun AND hj_hgcode = hg_code AND hg_mcode = 학과코드

ORDER BY hj_haknyun, 학과명, hj_hakbun