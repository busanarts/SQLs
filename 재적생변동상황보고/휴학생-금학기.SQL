// *** 휴학생 : 금학기 ***
select 학과명, 주야구분, hj_haknyun 학년, count(*) 인원  from ac12011, (
	select hc_hakbun, hc_scode, hc_siymd from ac1202 a1 
	where (hc_hakbun, hc_siymd) in (select hc_hakbun, max(hc_siymd) from ac1202 
	where hc_hakbun = a1.hc_hakbun
	group by hc_hakbun) 
), ac1121, tbl학과
where substr(hj_state,1,1) = '1' -- 휴학
and hj_jhgbn < '51' -- 정원내
and hj_hakbun = hc_hakbun
and hc_scode  in ('11', '12', '14')
and hc_siymd >= '20051001' and hc_siymd <= '20060331'
and hj_hgcode = hg_code and hg_mcode = 학과코드
group by cube(학과명, 주야구분, hj_haknyun)
