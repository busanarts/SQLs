SELECT ÇÐ°ú¸í,
max(DECODE(Á¹¾÷³â, '2009', ÃëµæÀÚ¼ö,0)) "2009",
MAX(DECODE(Á¹¾÷³â, '2010', ÃëµæÀÚ¼ö,0)) "2010",
MAX(DECODE(Á¹¾÷³â, '2011', ÃëµæÀÚ¼ö,0)) "2011",
MAX(DECODE(Á¹¾÷³â, '2012', ÃëµæÀÚ¼ö,0)) "2012",
MAX(DECODE(Á¹¾÷³â, '2013', ÃëµæÀÚ¼ö,0)) "2013"
FROM
--(select SUBSTR(hj_jymd, 1, 4) Á¹¾÷³â, hg_kname ÇÐ°ú¸í, count(*) Á¹¾÷ÀÚ¼ö, SUM(DECODE(lr_result, 'Y', 1, 0)) ÃëµæÀÚ¼ö
(select lr_year Á¹¾÷³â, hg_kname ÇÐ°ú¸í, count(*) Á¹¾÷ÀÚ¼ö, SUM(DECODE(lr_result, 'Y', 1, 0)) ÃëµæÀÚ¼ö
from ac12011, ac1511, ac1121
where hj_hakbun = lr_hakbun(+)
--and SUBSTR(lr_date,1,4) >= '2009'
AND lr_year >= '2009'
and lr_result = 'Y'
and hj_hgcode = hg_code
--group by SUBSTR(lr_date,1, 4), hg_kname
group by lr_year, hg_kname
)
GROUP BY ÇÐ°ú¸í
ORDER BY ÇÐ°ú¸í