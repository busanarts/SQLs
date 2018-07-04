	select hg_mcode, 학과명, 주야구분, hj_haknyun 학년, 
	decode(hj_sexgbn, '1', '남', '여') 성별, count(*) cnt
	from ac12011,ac1121, tbl학과
	where hj_state = '01' 
	--and hj_haknyun = '2' 
	and hj_hgcode = hg_code
	and hg_mcode = 학과코드
	and hj_jhgbn < '51'
	group by hg_mcode, 학과명, 주야구분, hj_haknyun, hj_sexgbn
