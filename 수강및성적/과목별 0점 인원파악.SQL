select sj_gggmcode 교과코드, gm_kname 교과명, sj_ggban 분반, count(*) 인원 from ac1302, ac1401
where sj_year = '2002' and sj_hakgi = '1' and gm_code = sj_gggmcode and sj_jumsu = 0
group by sj_gggmcode, gm_kname, sj_ggban
having count(*) >= 10