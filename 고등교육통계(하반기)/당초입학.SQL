-- *** 재학생현황 : 당초입학( 입학이후 학적변동이 없는 자) ***

select 학과명,
max(DECODE(전형구분, '정원내', decode(학년, '1', 인원, 0))) "1학년(정원내)",
max(DECODE(전형구분, '정원내', decode(학년, '2', 인원, 0))) "2학년(정원내)",
max(DECODE(전형구분, '정원외', decode(학년, '1', 인원, 0))) "1학년(정원외)",
max(DECODE(전형구분, '정원외', decode(학년, '2', 인원, 0))) "2학년(정원외)"
from
(select DECODE(SUBSTR(hj_jhgbn,1,1), '5', '정원외', '2', '정원내', '3', '정원내', '오류') 전형구분,
학과명, hj_haknyun 학년, count(*) 인원
from ac12011_2012_10_01,ac1121, tbl학과  -- AC12011테이블 주의
where hj_state = '01'
AND hj_hakbun NOT LIKE 'T%'
--and hj_jhgbn < '50'
and hj_hgcode = hg_code and hg_mcode = 학과코드
and hj_hakbun not in (select distinct hc_hakbun from ac1202 where hc_hakbun = hj_hakbun)
group by CUBE(DECODE(SUBSTR(hj_jhgbn,1,1), '5', '정원외', '2', '정원내', '3', '정원내', '오류'), 학과명, hj_haknyun))
group by 학과명
ORDER BY 학과명
