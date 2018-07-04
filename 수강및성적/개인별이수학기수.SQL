select a.hj_hakbun 학번, a.hj_kname 성명, count(*) 이수학기수 from (select distinct hj_hakbun,  hj_kname, hj_craddr, sj_year, sj_hakgi
from ac1401, ac12011
where SUBSTR(hj_state,1,1) in ('0') and hj_haknyun = '2' and hj_hakbun = sj_hakbun ) a
group by hj_hakbun, hj_kname
having count(*)  < 3