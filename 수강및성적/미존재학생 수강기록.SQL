select sj_hakbun, count(*) from ac1401
where sj_year = '201'
and sj_hakbun not in (select hj_hakbun from ac12011)
group by sj_hakbun

