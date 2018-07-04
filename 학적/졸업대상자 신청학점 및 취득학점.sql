SELECT 학과명, sj_hakbun 학번, hj_kname 성명, hj_jcode1 || hj_jcode2 주민번호, COUNT(DISTINCT sj_year || sj_hakgi) 수업학기,
신청학점, SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) 취득학점,
DECODE(SIGN(SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) - 80), 1, '졸업가능', 0, '졸업가능') 졸업가능여부
FROM psutis.AC1401, psutis.AC12011 aa, psutis.AC1121, psutis.tbl학과,
(select hj_hakbun, sum(sj_hjum) 신청학점
from psutis.ac12011, psutis.ac1401
where hj_hakbun = sj_hakbun and hj_haknyun = '2' and hj_state = '01'
AND SJ_YEAR = :학년도 AND SJ_HAKNYUN = '2' AND SJ_HAKGI = :학기
group by hj_hakbun, hj_kname) cc
WHERE sj_hakbun = aa.hj_hakbun
AND hj_haknyun = '2'
AND hj_state = '01'
--AND sj_dunggub <> 'F'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
AND aa.hj_hakbun = cc.hj_hakbun
GROUP BY 학과명, sj_hakbun, hj_kname, hj_jcode1 || hj_jcode2, 신청학점
HAVING COUNT(DISTINCT sj_year || sj_hakgi) >= 4
