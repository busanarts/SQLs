SELECT dd_hakgi 학기, 학과명, dd_haknyun 학년, dd_hakbun 학번, hj_kname 성명, dd_totgum 등록금, dd_tgmgum 감면금액,
DECODE(SIGN(dd_tgmgum), 1, NVL(jm_name, dd_bigo)) 면제사유, (dd_nipgum + dd_modgum) 납입금, DECODE(SIGN(dd_totgum - 2000000), -1, dd_totgum) 수강료,
DECODE(SIGN(dd_totgum - dd_tgmgum - dd_nipgum), 1, '금액불일치') 비고2
FROM AC2711, ac12011, AC1121, tbl학과,
(SELECT * FROM AC1711, AC1701 WHERE jd_year = '2008' AND jd_jmcode = jm_code)
WHERE dd_year = '2008'
AND dd_year = jd_year(+) AND dd_hakgi = jd_hakgi(+)
AND dd_hakbun = jd_hakbun(+)
AND dd_nidate IS NOT null
AND dd_hakbun = hj_hakbun
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
--AND dd_totgum < 2000000
ORDER BY dd_hakgi, 학과명, dd_haknyun, dd_hakbun