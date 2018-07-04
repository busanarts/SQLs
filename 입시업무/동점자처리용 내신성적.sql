    SELECT iw_shno 수험번호, iw_kname 성명, 학년, 학기, 과목명, 이수단위, 석차등급, 순서
      FROM
           (SELECT SocialNumber , grade 학년, term 학기, trim(Subjectname) 과목명, Unit 이수단위, RankingGrade 석차등급,
                  row_number() over (partition BY SocialNumber ORDER BY rankingGrade, to_number(unit)) 순서
             FROM SubjectScore b
            WHERE mogib1 = SUBSTR(:차수,1,1) and mogib2 = SUBSTR(:차수,2,1) and b.grade = 2  and to_number(unit) > 1
                  AND RankingGrade BETWEEN '1' AND '9'
           ) b, ipsi201
     WHERE iw_year = :입시연도 AND iw_chasu = :차수
     AND socialnumber = iw_jcode1 || iw_jcode2
     AND 순서 <= 3
     --AND 학기 = '1'
    --and iw_shno = :shno