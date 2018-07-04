SELECT ExamNumber �����ȣ, NAME ����, a.SocialNumber �ֹι�ȣ, Grade �г�, Term �б�,
OrganizationCode �����ڵ�, OrganizationName ������, SubjectName �����,
Unit �̼�����, Assessment ���뵵, RANK ����, OriginalScore ������, AvgScore ���, RankingGrade ���ŵ��
FROM PersonalInfo a, SubjectScore b
WHERE a.SocialNumber = b.SocialNumber
AND a.InvitationUnit = '����3��'
AND grade || term < '32' AND is_numeric(RankingGrade) = 1
--AND RankingGrade < 6
ORDER BY ExamNumber, Grade, Term