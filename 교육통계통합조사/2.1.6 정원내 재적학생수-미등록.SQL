select 학과명, 학년,
max(decode(성별, '남', 인원)) "미등록(남)", max(decode(성별, '여', 인원)) "미등록(여)"
from (
	select 학과명, hj_haknyun 학년,
	decode(hj_sexgbn, '1', '남', '여') 성별, count(*) 인원
	from PSUTIS.ac12011_2013_04_01, PSUTIS.ac1121, PSUTIS.tbl학과, PSUTIS.AC1202_2013_04_01
	where hj_state = '21'
	--and hj_haknyun = '2'
	and hj_hgcode = hg_code
	and hg_mcode = 학과코드
	and hj_jhgbn < '50'
  AND HC_SIYMD >= :학년도 - 1 || '1001' AND HC_SIYMD <= :학년도 || '0331'
  AND HC_HAKBUN = HJ_HAKBUN
	group by hj_haknyun, 학과명, hj_sexgbn)
group by 학과명, 학년
