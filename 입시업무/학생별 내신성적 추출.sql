--select * from (
select Name ����, selescnm ��������, examNumber �����ȣ, a.SocialNumber �ֹι�ȣ,
Year ����, grade �г�, term �б�, Subjectname �����, Unit �̼�����,
StudentCount �л���, OriginalScore ������, AvgScore ���, RankingGrade ���
--,row_number() over (partition by examNumber, term order by term, rankingGrade, unit desc) �켱����
from PersonalInfo a, SubjectScore b
where a.mogib1 = b.mogib1 and a.mogib2 = b.mogib2 and a.schoolcode = b.schoolcode
and a.SocialNumber = b.SocialNumber
and b.grade = 2 and RankingGrade <= '9'
--) where �켱���� <=2