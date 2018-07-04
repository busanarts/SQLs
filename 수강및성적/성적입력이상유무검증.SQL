select sj_year 연도, sj_hakgi 학기, sj_haknyun 학년, sj_gggmcode 교과코드, gm_kname 교과명, sj_ggban 분반,
	sj_hakbun 학번, sj_jumsu 점수, sj_dunggub 등급, sj_pjum 평점
from 	ac1302, ac1401
where sj_year = '2011' and sj_hakgi = '1'
	and gm_code = sj_gggmcode
	and (
	(sj_dunggub = 'A+' and sj_jumsu < 95.0 )
	or (sj_dunggub = 'A' and not (sj_jumsu >=90 and sj_jumsu < 95) )
	or (sj_dunggub = 'B+' and not (sj_jumsu >=85 and sj_jumsu < 90) )
	or (sj_dunggub = 'B' and not (sj_jumsu >=80 and sj_jumsu < 85) )
	or (sj_dunggub = 'C+' and not (sj_jumsu >=75 and sj_jumsu < 80) )
	or (sj_dunggub = 'C' and not (sj_jumsu >=70 and sj_jumsu < 75) )
	or (sj_dunggub = 'D+' and not (sj_jumsu >=65 and sj_jumsu < 70) )
	or (sj_dunggub = 'D' and not (sj_jumsu >=60 and sj_jumsu < 65) )
	or (sj_dunggub = 'F' and sj_jumsu >= 60)
	)







