SELECT hj_haknyun 학년, 학과명, aa.hj_hakbun 학번, hj_kname 성명, hj_jcode1 || '-' || hj_jcode2 주민번호,
COUNT(DISTINCT sj_year || sj_hakgi) 수업학기
FROM psutis.AC1401, psutis.AC12011 aa, psutis.AC1121, psutis.tbl학과,
(select hj_hakbun, sum(sj_hjum) 신청학점
from psutis.ac12011, psutis.ac1401
where hj_hakbun = sj_hakbun and hj_state = '01'
group by hj_hakbun, hj_kname) cc
WHERE sj_hakbun = aa.hj_hakbun
AND hj_state = '01' AND SUBSTR(hj_jcode2,1,1) IN ('1', '3')
AND aa.hj_hakbun NOT IN (SELECT ju_hakbun FROM AC1611 WHERE ju_jno IS NOT null)
--AND sj_dunggub <> 'F'
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
AND aa.hj_hakbun = cc.hj_hakbun
GROUP BY hj_haknyun, 학과명, aa.hj_hakbun, hj_kname, hj_jcode1, hj_jcode2, 신청학점
HAVING COUNT(DISTINCT sj_year || sj_hakgi) >= 4
