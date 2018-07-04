SELECT 학과명, 학년,
MAX(DECODE(성별, '1', cnt, 0)) 남, max(DECODE(성별, '2', cnt, 0)) 여
from (
select 학과명, hj_haknyun 학년, hj_sexgbn 성별, count(*) cnt
	from ac12011_20141001, AC1121, TBL학과, ciss.TDFEEGOJI
	where hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
  AND HJ_HGCODE = hg_code AND hg_mcode = 학과코드
  AND hj_hakbun = hakbun AND schoolyear = '2014' AND semester = '2'
  AND state IN ('11', '22')
	group by 학과명, hj_haknyun, hj_sexgbn
)
GROUP BY 학과명, 학년
ORDER BY 학과명, 학년