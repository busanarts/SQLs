SELECT 학과명,학번, 성명
FROM (SELECT 학과명, HJ_HAKBUN 학번, HJ_KNAME 성명, SJ_HAKNYUN 학년, SJ_HAKGI 학기,
SUM(SJ_HJUM) 취득학점, SUM(SJ_PJUM * SJ_HJUM) 총평점, ROUND(SUM(SJ_PJUM * SJ_HJUM) / SUM(SJ_HJUM), 2) 평점평균
FROM PSUTIS.AC12011, PSUTIS.AC1401, PSUTIS.AC1121, PSUTIS.TBL학과
WHERE HJ_HGCODE = HG_CODE AND HG_MCODE = 학과코드
AND HJ_HAKBUN = SJ_HAKBUN AND HJ_HAKNYUN = '2' AND HJ_STATE = '01' AND SJ_DUNGGUB NOT IN ('F')
AND  HJ_HAKBUN IN  (SELECT DISTINCT SJ_HAKBUN FROM PSUTIS.AC1401 WHERE HJ_HAKBUN = SJ_HAKBUN AND SJ_HAKNYUN = '2' AND  SJ_HAKGI = '2')
GROUP BY 학과명, HJ_HAKBUN, HJ_KNAME, SJ_HAKNYUN, SJ_HAKGI)
GROUP BY 학과명, 학번, 성명
ORDER BY 학과명, 학번, 성명