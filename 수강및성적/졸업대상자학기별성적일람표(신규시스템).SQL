select 학과명,학번, 성명,
max(decode(학년 || 학기, '11', 취득학점, 0)) "취득학점(1-1)",
max(decode(학년 || 학기, '11', 평점평균)) "평점평균(1-1)",
max(decode(학년 || 학기, '12', 취득학점, 0)) "취득학점(1-2)",
max(decode(학년 || 학기, '12', 평점평균)) "평점평균(1-2)",
max(decode(학년 || 학기, '21', 취득학점, 0)) "취득학점(2-1)",
max(decode(학년 || 학기, '21', 평점평균)) "평점평균(2-1)",
max(decode(학년 || 학기, '22', 취득학점, 0)) "취득학점(2-2)",
max(decode(학년 || 학기, '22', 평점평균)) "평점평균(2-2)",
max(decode(학년 || 학기, '11', 취득학점, 0))  +
max(decode(학년 || 학기, '12', 취득학점, 0))  +
max(decode(학년 || 학기, '21', 취득학점, 0))  +
max(decode(학년 || 학기, '22', 취득학점, 0)) "총취득학점",
max(decode(학년 || 학기, '44', 평점평균)) "총평점평균",
max(decode(학년 || 학기, '44', 백분율, '  0.00')) "총백분율점수"
from (select 학과명, 학번, 성 || 이름 성명, LVL 학년, SEMESTER 학기,
sum(GRADEJUM) 취득학점, round(sum(AVEJUMSU * GRADEJUM) / sum(GRADEJUM), 2) 평점평균,
round(sum(TOTJUMSU * GRADEJUM) / sum(GRADEJUM), 2) 백분율
from ciss.TM학적 S, psutis.TDRESULT, ciss.TM학과 D
where S.학과코드 = D.학과코드
and 학번 = HAKBUN and 학년 = '2' and 학적상태 = '01' --and GRADELVL not in ('F', 'P')
and  학번 in  (select distinct HAKBUN from psutis.TDRESULT where 학번 = HAKBUN and LVL = '2' and  SEMESTER = '2')
group by 학과명, 학번, 성 || 이름, LVL, SEMESTER
union
select 학과명, 학번, 성 || 이름 성명, '4' 학년, '4' 학기,
sum(GRADEJUM) 취득학점, round(sum(AVEJUMSU * GRADEJUM) / sum(GRADEJUM), 2) 평점평균,
round(sum(TOTJUMSU * GRADEJUM) / sum(GRADEJUM),2) 백분율
from ciss.TM학적 S, psutis.TDRESULT, ciss.TM학과 D
where S.학과코드 = D.학과코드
and 학번 = HAKBUN and 학년 = '2' and 학적상태 = '01' --and GRADELVL not in ('F', 'P')
and  학번 in  (select distinct HAKBUN from psutis.TDRESULT where 학번 = HAKBUN and LVL = '2' and  SEMESTER = '2')
group by 학과명, 학번, 성 || 이름)
group by 학과명, 학번, 성명
order by 학과명, 총평점평균 desc, 총백분율점수 desc