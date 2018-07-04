-- *** 재학생현황 : 당초입학( 입학이후 학적변동이 없는 자) ***

select 학과명, max(decode(학년, '1', 인원)) "1학년", max(decode(학년, '2', 인원)) "2학년"
from
(select 학과명, hj_haknyun 학년, count(*) 인원
from ac12011_20141001, ac1121, tbl학과
where hj_state = '01'
and hj_jhgbn < '50'
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_hakbun not in (select distinct hc_hakbun from ac1202_20141001 where hc_hakbun = hj_hakbun)
group by 학과명, hj_haknyun)
group by cube(학과명)
ORDER BY 학과명
