select 학년도, 학기, 학과명, 학번, 성명, 성별, 평점평균, 백분위,
--select 학과명, 학번, 성명, 성별, 평점평균, 백분위,
case
	when 평점평균 = 4.5 then 'A+'
	when 평점평균 >= 4.0 and 평점평균 < 4.5 then 'A0'
    when 평점평균 >= 3.5 and 평점평균 < 4.0 then 'B+'
    when 평점평균 >= 3.0 and 평점평균 < 3.5 then 'B0'
    when 평점평균 >= 2.5 and 평점평균 < 3.0 then 'C+'
    when 평점평균 >= 2.0 and 평점평균 < 2.5 then 'C0'
    when 평점평균 >= 1.5 and 평점평균 < 2.0 then 'D+'
    when 평점평균 >= 1.0 and 평점평균 < 1.5 then 'D0'
    when 평점평균 < 1.0 then 'F'
end 등급
from (select schoolyear 학년도, semester 학기, 학과명, 학번, 성||이름 성명, 성별, round(sum(DECODE(gradelvl, 'P',  0, avejumsu * gradejum)) / sum(DECODE(gradelvl, 'P', 0, gradejum)), 3) 평점평균, round(SUM(totjumsu * gradejum) / SUM(gradejum),2) 백분위
--from (select schoolyear 학년도, semester 학기, 학과명, 학번, 성||이름 성명, 성별, round(sum(avejumsu * gradejum) / sum(gradejum), 3) 평점평균, round(SUM(totjumsu * gradejum) / SUM(gradejum),2) 백분위
from tm학적 학적, psutis.tdresult 성적, tm학과 학과
where 학적.학번 = 성적.hakbun
and 학적.학과코드 = 학과.학과코드
--and substr(학적상태,1,1) = '8'
--and 졸업일자 >= :학년도 || '08'
--and gradelvl not in ('F')
AND hakbun = 'A0021029'
group by schoolyear, semester, 학과명, 학적.학번, 성||이름, 성별)
--group by 학과명, 학적.학번, 성||이름, 성별)
ORDER BY 학년도, 학기