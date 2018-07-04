-- *** 재학중이면서 최종학적변동이 휴학, 제적 등등인 경우
select 학과명, 주야구분, hj_hakbun, hj_kname, hj_haknyun 학년, hc_scode 학적변동  from ac12011, (
	select hc_hakbun, hc_scode, hc_siymd from ac1202 a1
	where (hc_hakbun, hc_siymd) in (select hc_hakbun, max(hc_siymd) from ac1202
	where hc_hakbun = a1.hc_hakbun
	group by hc_hakbun)
), ac1121, tbl학과
where hj_state = '01' -- 재학
--and hj_jhgbn < '51' -- 정원내
and hj_hakbun = hc_hakbun
and hj_hgcode = hg_code and hg_mcode = 학과코드
and substr(hc_scode,1,1) in ('1', '2')
