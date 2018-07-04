SELECT ExamNumber 수험번호, NAME 성명, a.SocialNumber 주민번호, Grade 학년, Term 학기,
OrganizationCode 편제코드, OrganizationName 편제명, SubjectName 과목명,
Unit 이수단위, Assessment 성취도, RANK 석차, OriginalScore 원점수, AvgScore 평균, RankingGrade 내신등급
FROM PersonalInfo a, SubjectScore b
WHERE a.SocialNumber = b.SocialNumber
AND a.InvitationUnit = '정시3차'
AND grade || term < '32' AND is_numeric(RankingGrade) = 1
--AND RankingGrade < 6
ORDER BY ExamNumber, Grade, Term