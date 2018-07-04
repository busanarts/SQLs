--select * from (
select Name 성명, selescnm 전형구분, examNumber 수험번호, a.SocialNumber 주민번호,
Year 연도, grade 학년, term 학기, Subjectname 과목명, Unit 이수단위,
StudentCount 학생수, OriginalScore 원점수, AvgScore 평균, RankingGrade 등급
--,row_number() over (partition by examNumber, term order by term, rankingGrade, unit desc) 우선순위
from PersonalInfo a, SubjectScore b
where a.mogib1 = b.mogib1 and a.mogib2 = b.mogib2 and a.schoolcode = b.schoolcode
and a.SocialNumber = b.SocialNumber
and b.grade = 2 and RankingGrade <= '9'
--) where 우선순위 <=2