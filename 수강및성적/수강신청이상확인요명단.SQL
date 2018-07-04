select 학과명, hj_hakbun 학번, hj_kname 성명, hj_haknyun 학년, hj_state, hc_scode,
수강과목수, 신청학점
from ac12011, ac1121, tbl학과, (SELECT * FROM AC1202 WHERE hc_year = '2011' AND hc_hakgi = '1'),
(SELECT sj_hakbun, COUNT(*) 수강과목수, SUM(sj_hjum) 신청학점
FROM AC1401 WHERE sj_year = '2011' and sj_hakgi = '1'
GROUP BY sj_hakbun )
where hj_state = '01'
AND hj_hakbun = hc_hakbun(+)
and hj_hakbun = sj_hakbun(+)
and hj_wthgcode = hg_code and hg_mcode = 학과코드
AND (신청학점 < 18 OR 신청학점 > 24 OR 신청학점 IS null)
ORDER BY hj_haknyun, 학과명, hj_hakbun
