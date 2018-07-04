-- 등록금수입 = 납부인원 * (수업료 + 입학금)
-- 납부자중 미납부분은 미수처리?
SELECT 학과, 학기, 학년, COUNT(*) 인원,
인당입학금, SUM(입학금) 입학금계,
인당수업료,  SUM(수업료) 수업료계,
SUM(등록금) 등록금계
FROM (
SELECT hg_kname 학과, dd_hakgi 학기,  dd_haknyun 학년,
--dg_ihakg-dd_gmihakg 인당입학금, dd_ihakg 입학금,
--dg_suryo-dd_gmsuryo 인당수업료,  dd_suryo 수업료, dd_totgum-dd_tgmgum 고지금액계
dg_ihakg 인당입학금, dd_ihakg 입학금,
dg_suryo 인당수업료,  dd_suryo 수업료, dd_totgum 등록금
FROM AC2711, AC1121, AC12011,   (SELECT * FROM AC2701 WHERE dg_year = &학년도)
WHERE dd_year = &학년도
AND dd_hakbun = hj_hakbun AND hj_hgcode = hg_code
--AND dd_nidate IS NOT NULL --AND dd_bigo LIKE '%환불%'
AND dd_year = dg_year AND dd_hakgi = dg_hakgi AND dd_haknyun = dg_haknyun AND hj_hgcode = dg_hgcode
)
GROUP BY 학과, 학기, 학년, 인당수업료, 인당입학금
ORDER BY 학기, 학과, 학년