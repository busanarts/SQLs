SELECT �а���,
max(DECODE(������, '2009', ����ڼ�,0)) "2009",
MAX(DECODE(������, '2010', ����ڼ�,0)) "2010",
MAX(DECODE(������, '2011', ����ڼ�,0)) "2011",
MAX(DECODE(������, '2012', ����ڼ�,0)) "2012",
MAX(DECODE(������, '2013', ����ڼ�,0)) "2013"
FROM
--(select SUBSTR(hj_jymd, 1, 4) ������, hg_kname �а���, count(*) �����ڼ�, SUM(DECODE(lr_result, 'Y', 1, 0)) ����ڼ�
(select lr_year ������, hg_kname �а���, count(*) �����ڼ�, SUM(DECODE(lr_result, 'Y', 1, 0)) ����ڼ�
from ac12011, ac1511, ac1121
where hj_hakbun = lr_hakbun(+)
--and SUBSTR(lr_date,1,4) >= '2009'
AND lr_year >= '2009'
and lr_result = 'Y'
and hj_hgcode = hg_code
--group by SUBSTR(lr_date,1, 4), hg_kname
group by lr_year, hg_kname
)
GROUP BY �а���
ORDER BY �а���