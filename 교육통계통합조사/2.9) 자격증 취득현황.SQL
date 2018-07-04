SELECT 학과명, MAX(DECODE(성별, '1', 취득자수, 0)) 남, MAX(DECODE(성별, '2', 취득자수, 0)) 여
FROM
(select 학과명, hj_sexgbn 성별, count(*) 취득자수
from ac12011, ac1511, ac1121, tbl학과
where hj_hakbun = lr_hakbun
--and hj_jymd >= '20110801' AND hj_jymd <= '20120229'
AND lr_date >= '20110801' AND lr_date <= '20120229'
and lr_result = 'Y'
and hj_hgcode = hg_code and hg_mcode = 학과코드
group by CUBE(학과명, hj_sexgbn)
)
GROUP BY 학과명
ORDER BY 학과명