select * from
(select aa.*, rank() over(partition by 학과명, 주야구분 order by 평점평균 desc) 순위
from
(select 학과명, 주야구분, sj_hakbun 학번, hj_kname 성명,
sum(sj_hjum) 신청학점, sum(decode(sj_dunggub, 'F', 0, sj_hjum)) 취득학점,
to_char(round(sum(decode(substr(sj_isugbm,2,1), '3', 0, sj_pjum * sj_hjum)) / sum(decode(substr(sj_isugbm,2,1), '3', 0, sj_hjum)),2), '9.99') 평점평균
from psutis.ac1401, psutis.ac12011, psutis.ac1121, psutis.tbl학과
where sj_hakbun = hj_hakbun
and hj_haknyun = '2' and hj_state = '01'
and hj_hgcode = hg_code and hg_mcode = 학과코드
group by 학과명,주야구분, sj_hakbun, hj_kname
having sum(sj_hjum) >= 80) aa)
where 순위 <=5
