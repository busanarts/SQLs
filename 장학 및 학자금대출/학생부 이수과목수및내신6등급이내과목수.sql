SELECT si_hakbun �й�, ExamNumber �����ȣ, NAME ����, a.SocialNumber �ֹι�ȣ,
COUNT(*) �̼������, SUM(DECODE(SIGN(TO_NUMBER(RankingGrade) - 7), -1, 1, 0)) ����6����̳�,
DECODE(SIGN(COUNT(*) - SUM(DECODE(SIGN(TO_NUMBER(RankingGrade) - 7), -1, 1, 0)) * 2), 1, '', '���ڱݴ��Ⱑ��') ���Ⱑ�ɿ���
FROM PersonalInfo a, SubjectScore b, ipsi401
WHERE si_year = &�Խ��г⵵
AND a.SocialNumber = b.SocialNumber
AND a.ExamNumber = si_shno
--AND a.InvitationUnit = '����3��'
AND grade || term < '32' AND is_numeric(RankingGrade) = 1
--AND RankingGrade < 6
GROUP BY si_hakbun, ExamNumber, NAME, a.SocialNumber
