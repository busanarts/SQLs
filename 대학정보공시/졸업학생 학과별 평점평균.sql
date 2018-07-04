SELECT 학과명, ROUND(SUM(평점평균) / COUNT(학과명), 2) "학과별 평점평균"
FROM
(select 학과명, 학번, 성명, 평점평균
from (select 학과명, hj_hakbun 학번, hj_kname 성명, round(sum(sj_pjum * sj_hjum) / sum(sj_hjum), 2) 평점평균
from psutis.ac12011, psutis.ac1401, ac1121, tbl학과
where hj_hakbun = sj_hakbun
and hj_hgcode = hg_code and hg_mcode = 학과코드
and substr(hj_state,1,1) = '8'
and hj_jymd >= '201008'
and sj_dunggub not in ('F')
group by 학과명, hj_hakbun, hj_kname)
)
GROUP BY 학과명