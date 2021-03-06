select 학과명, 학년,
max(decode(성별, '남', 인원, 0)) "재학생(남)", max(decode(성별, '여', 인원, 0)) "재학생(여)",
max(decode(성별, '남', 인원, 0)) + max(decode(성별, '여', 인원, 0)) "계"
from (
	select 학과명, hj_haknyun 학년,
	decode(hj_sexgbn, '1', '남', '여') 성별, count(*) 인원
	from ac12011_2012_10_01, ac1121, tbl학과
	where hj_state = '01'
    AND hj_hakbun NOT LIKE 'T%'
	--and hj_haknyun = '2'
	and hj_hgcode = hg_code
	and hg_mcode = 학과코드
	and hj_jhgbn >= '50'
	group by CUBE(hj_haknyun, 학과명, decode(hj_sexgbn, '1', '남', '여')))
group by 학과명, 학년
ORDER BY 학과명, 학년