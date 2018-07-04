// *** 휴학생 : 총인원 ***
select 학과명, 주야구분, 학년, 
max(decode(성별, '남', cnt, 0)) 남,
max(decode(성별, '여', cnt, 0)) 여, 
max(decode(성별, '남', cnt, 0)) +
max(decode(성별, '여', cnt, 0)) 계
from (
select 학과명, 주야구분, decode(hj_haknyun, '1', '1', '2', '2', '계') 학년, 
decode(hj_sexgbn,'1','남','2', '여') 성별, count(*) cnt
from ac12011, ac1121, tbl학과
where hj_state like '1%' and hj_hgcode = hg_code
and hg_mcode = 학과코드
and hj_jhgbn < '51' -- 정원내
--and hj_jhgbn >= '51' -- 정원외
group by cube(학과명, 주야구분, hj_haknyun, hj_sexgbn)
) aa
group by 학과명, 주야구분, 학년

