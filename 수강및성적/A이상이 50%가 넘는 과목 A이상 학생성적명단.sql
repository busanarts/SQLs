--SELECT 과목명, 과목코드, 개설학과, sj_hakbun 학번, sj_haknyun 학년, sj_jumsu 점수, sj_pjum 평점
SELECT 과목명, sj_hakbun 학번, sj_haknyun 학년, sj_jumsu 점수, sj_pjum 평점
FROM psutis.ac1401 a,
(--SELECT gg_kname 과목명, sj_gggmcode 과목코드, hg_kname 개설학과,
SELECT gg_kname 과목명,
sum(DECODE(SIGN(sj_jumsu-90), 1, 1, 0)) A이상, COUNT(*) 수강인원
FROM PSUTIS.AC1401, PSUTIS.AC1303, PSUTIS.AC1121
WHERE sj_year = :학년도
AND sj_hakgi = :학기
AND sj_year = gg_year AND sj_hakgi = gg_hakgi
AND sj_gggmcode = gg_gmcode AND sj_gghaknyun = gg_haknyun
AND gg_hgcode = hg_code
--GROUP BY gg_kname, sj_gggmcode, hg_kname
GROUP BY gg_kname
HAVING sum(DECODE(SIGN(sj_jumsu-90), 1, 1, 0)) / COUNT(*) >= 0.5) aa
WHERE sj_year = :학년도
AND sj_hakgi = :학기
--AND a.sj_gggmcode = aa.과목코드
AND sj_jumsu >= 90
--ORDER BY 과목명, 과목코드, 개설학과, sj_jumsu DESC
ORDER BY 과목명, sj_jumsu DESC