-- *** 제적생현황 : 기간별 ***
select 학과명, 주야구분, hj_haknyun 학년, hb_name, count(*) 인원  from ac12011, (
	select hc_hakbun, hc_scode, hb_name, hc_siymd from ac1202 a1, ac1104
	where (hc_hakbun, hc_siymd) in (select hc_hakbun, max(hc_siymd) from ac1202
	where hc_hakbun = a1.hc_hakbun
	group by hc_hakbun)
	and hc_scode = hb_code
), ac1121, tbl학과
where --substr(hj_state,1,1) = '2' -- 제적
--and hj_jhgbn < '51' -- 정원내
hj_hakbun = hc_hakbun
and substr(hc_scode,1,1) = '2'
and hc_siymd >= '20090101' and hc_siymd <= '20090931'
and hj_hgcode = hg_code and hg_mcode = 학과코드
group by 학과명, 주야구분, hj_haknyun, hb_name
