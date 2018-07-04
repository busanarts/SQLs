select 졸업구분, hg_kname 학과명,
	max(decode(gender, '1', cnt, 0)) 남,
	max(decode(gender, '2', cnt, 0)) 여
from ( 	select DECODE(hj_state, '81', '전기', '83', '후기') 졸업구분, hg_kname,  hj_sexgbn gender, count(*) cnt
	from ac12011, ac1121
	where hj_hgcode = hg_code
	and hj_jymd > '201008'
	and hj_state in ('81', '83')
group by hj_state, hg_kname, hj_sexgbn)
group by 졸업구분, hg_kname
ORDER BY 졸업구분, hg_kname

