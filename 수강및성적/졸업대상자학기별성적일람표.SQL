select 학과명,학번, 성명,
max(decode(학년 || 학기, '11', 취득학점, 0)) "취득학점(1학년 1학기)",
max(decode(학년 || 학기, '11', 평점평균)) "평점평균(1학년 1학기)",
max(decode(학년 || 학기, '12', 취득학점, 0)) "취득학점(1학년 2학기)",
max(decode(학년 || 학기, '12', 평점평균)) "평점평균(1학년 2학기)",
max(decode(학년 || 학기, '21', 취득학점, 0)) "취득학점(2학년 1학기)",
max(decode(학년 || 학기, '21', 평점평균)) "평점평균(2학년 1학기)",
max(decode(학년 || 학기, '22', 취득학점, 0)) "취득학점(2학년 2학기)",
max(decode(학년 || 학기, '22', 평점평균)) "평점평균(2학년 2학기)",
max(decode(학년 || 학기, '11', 취득학점, 0))  +
max(decode(학년 || 학기, '12', 취득학점, 0))  +
max(decode(학년 || 학기, '21', 취득학점, 0))  +
max(decode(학년 || 학기, '22', 취득학점, 0)) "총취득학점",
max(decode(학년 || 학기, '44', 평점평균)) "총평점평균",
max(decode(학년 || 학기, '44', 백분율, '  0.00')) "총백분율점수"
from (select 학과명, hj_hakbun 학번, hj_kname 성명, sj_haknyun 학년, sj_hakgi 학기,
sum(sj_hjum) 취득학점, to_char(round(sum(sj_pjum * sj_hjum) / sum(sj_hjum), 2), '0.99') 평점평균,
to_char(round(sum(sj_jumsu * sj_hjum) / sum(sj_hjum), 2), '999.99') 백분율
from psutis.ac12011, psutis.ac1401, psutis.ac1121, psutis.tbl학과
where hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_hakbun = sj_hakbun and hj_haknyun = '2' and hj_state = '01' and sj_dunggub not in ('F', 'P')
and  hj_hakbun in  (select distinct sj_hakbun from psutis.ac1401 where hj_hakbun = sj_hakbun and sj_haknyun = '2' and  sj_hakgi = '2')
group by 학과명, hj_hakbun, hj_kname, sj_haknyun, sj_hakgi
union
select 학과명, hj_hakbun 학번, hj_kname 성명, '4' 학년, '4' 학기,
sum(sj_hjum) 취득학점, to_char(round(sum(sj_pjum * sj_hjum) / sum(sj_hjum), 2), '0.99') 평점평균,
to_char(round(sum(sj_jumsu * sj_hjum) / sum(sj_hjum), 2), '999.99') 백분율
from psutis.ac12011, psutis.ac1401, psutis.ac1121, psutis.tbl학과
where hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_hakbun = sj_hakbun and hj_haknyun = '2' and hj_state = '01' and sj_dunggub not in ('F', 'P')
and  hj_hakbun in  (select distinct sj_hakbun from psutis.ac1401 where hj_hakbun = sj_hakbun and sj_haknyun = '2' and  sj_hakgi = '2')
group by 학과명, hj_hakbun, hj_kname)
group by 학과명, 학번, 성명
order by 학과명, 총평점평균 desc, 총백분율점수 desc