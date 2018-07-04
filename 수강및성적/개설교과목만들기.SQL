insert into tbl개설교과목 
select distinct gg_year, gg_hakgi, sj_gghgcode, hg_kname, sj_gggmcode, gg_kname, sj_hjum, gg_haknyun, 
	sj_ggban, tm_pfcode, ''
	from ac1401, ac1303, ac1121, 
	(select distinct tm_year, tm_hakgi, tm_gmcode, tm_pfcode, tm_ban 
		from ac1304 where tm_year = '2002' and tm_hakgi = '1') aa
	where gg_year='2002' and gg_hakgi = '1' and sj_gghgcode = hg_code and sj_gggmcode = gg_gmcode and
	gg_haknyun = sj_haknyun and gg_year = sj_year and gg_hakgi = sj_hakgi and gg_gmcode = aa.tm_gmcode
	
