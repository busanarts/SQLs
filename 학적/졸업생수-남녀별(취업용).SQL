select ��������, hg_kname �а���,
	max(decode(gender, '1', cnt, 0)) ��,
	max(decode(gender, '2', cnt, 0)) ��
from ( 	select DECODE(hj_state, '81', '����', '83', '�ı�') ��������, hg_kname,  hj_sexgbn gender, count(*) cnt
	from ac12011, ac1121
	where hj_hgcode = hg_code
	and hj_jymd > '201008'
	and hj_state in ('81', '83')
group by hj_state, hg_kname, hj_sexgbn)
group by ��������, hg_kname
ORDER BY ��������, hg_kname

