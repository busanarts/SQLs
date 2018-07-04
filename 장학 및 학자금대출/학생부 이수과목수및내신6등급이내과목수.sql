SELECT si_hakbun 학번, ExamNumber 수험번호, NAME 성명, a.SocialNumber 주민번호,
COUNT(*) 이수과목수, SUM(DECODE(SIGN(TO_NUMBER(RankingGrade) - 7), -1, 1, 0)) 내신6등급이내,
DECODE(SIGN(COUNT(*) - SUM(DECODE(SIGN(TO_NUMBER(RankingGrade) - 7), -1, 1, 0)) * 2), 1, '', '학자금대출가능') 대출가능여부
FROM PersonalInfo a, SubjectScore b, ipsi401
WHERE si_year = &입시학년도
AND a.SocialNumber = b.SocialNumber
AND a.ExamNumber = si_shno
--AND a.InvitationUnit = '정시3차'
AND grade || term < '32' AND is_numeric(RankingGrade) = 1
--AND RankingGrade < 6
GROUP BY si_hakbun, ExamNumber, NAME, a.SocialNumber
