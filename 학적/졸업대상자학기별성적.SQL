select hj_hakbun 학번, hj_kname 성명, sj_year 연도, sj_haknyun 학년, sj_hakgi 학기, 
sum(sj_hjum) 총신청학점, round(sum(sj_pjum * sj_hjum) / sum(sj_hjum), 2) 평점평균 
from psutis.ac12011, psutis.ac1401
where hj_hakbun = sj_hakbun and hj_haknyun = '2' and hj_state = '01' and sj_dunggub not in ('F')
and  hj_hakbun in  (select sj_hakbun from ac1401 where hj_hakbun = sj_hakbun and sj_haknyun = '2' and  sj_hakgi = '2')
group by hj_hakbun, hj_kname, sj_year, sj_haknyun, sj_hakgi