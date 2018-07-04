SELECT *
  FROM
       (SELECT SocialNumber , Year, grade, term, Subjectname, Unit, RankingGrade,
              row_number() over (partition BY SocialNumber, term ORDER BY term, rankingGrade, unit desc) rnk
         FROM SubjectScore b
        WHERE b.grade = 2
              AND RankingGrade BETWEEN '1' AND '9'
       )
 WHERE rnk <=2
--AND rankinggrade = '.'