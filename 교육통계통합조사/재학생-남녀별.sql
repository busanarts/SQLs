SELECT �а���, �г�,
MAX(DECODE(����, '1', cnt, 0)) ��, max(DECODE(����, '2', cnt, 0)) ��
from (
select �а���, hj_haknyun �г�, hj_sexgbn ����, count(*) cnt
	from ac12011_20141001, AC1121, TBL�а�
	where hj_state = '01' and hj_jhgbn < '50' AND HJ_HAKBUN NOT LIKE 'T%'
  AND HJ_HGCODE = hg_code AND hg_mcode = �а��ڵ�
	group by �а���, hj_haknyun, hj_sexgbn
)
GROUP BY �а���, �г�
ORDER BY �а���, �г�