SELECT iw_jwhgcode1 학과코드, iw_jhgubun 전형구분, iw_shno 수험번호, iw_rank1 전형별순위, sj_totjum 입시총점, a3.평점 상위3과목, a2.평점 상위2과목, a1.평점 상위1과목,
       RANK() OVER(PARTITION BY iw_jwhgcode1, SUBSTR(iw_jhgubun,1,1) ORDER BY sj_totjum DESC, nvl(a3.평점,0), nvl(a2.평점,0), nvl(a1.평점,0)) 예비순위
  FROM ipsi201, IPSI202,
       (SELECT iw_shno shno, sum(이수단위 * 석차등급) 총점, round(sum(이수단위 * 석차등급) /sum(이수단위),2) 평점
         FROM
              (SELECT SocialNumber , trim(Subjectname) 과목명, Unit 이수단위, RankingGrade 석차등급,
                     row_number() over (partition BY SocialNumber ORDER BY rankingGrade, to_number(unit)) 순서
                FROM SubjectScore b
               WHERE mogib1 = substr(:Chasu,1,1)
                     AND mogib2 = substr(:Chasu,2,1)
                     AND b.grade = 2
                     AND to_number(unit) > 1
                     AND RankingGrade BETWEEN '1' AND '9'
              ) b,
              ipsi201
        WHERE iw_year = :Year
              AND iw_chasu = :Chasu
              AND 순서 <= 3
              AND socialnumber = iw_jcode1 || iw_jcode2
        GROUP BY iw_shno
       ) a3,
       (SELECT iw_shno shno, sum(이수단위 * 석차등급) 총점, round(sum(이수단위 * 석차등급) /sum(이수단위),2) 평점
         FROM
              (SELECT SocialNumber , trim(Subjectname) 과목명, Unit 이수단위, RankingGrade 석차등급,
                     row_number() over (partition BY SocialNumber ORDER BY rankingGrade, to_number(unit)) 순서
                FROM SubjectScore b
               WHERE mogib1 = substr(:Chasu,1,1)
                     AND mogib2 = substr(:Chasu,2,1)
                     AND b.grade = 2
                     AND to_number(unit) > 1
                     AND RankingGrade BETWEEN '1' AND '9'
              ) b,
              ipsi201
        WHERE iw_year = :Year
              AND iw_chasu = :Chasu
              AND 순서 <= 2
              AND socialnumber = iw_jcode1 || iw_jcode2
        GROUP BY iw_shno
       ) a2,
       (SELECT iw_shno shno, sum(이수단위 * 석차등급) 총점, round(sum(이수단위 * 석차등급) /sum(이수단위),2) 평점
         FROM
              (SELECT SocialNumber , trim(Subjectname) 과목명, Unit 이수단위, RankingGrade 석차등급,
                     row_number() over (partition BY SocialNumber ORDER BY rankingGrade, to_number(unit)) 순서
                FROM SubjectScore b
               WHERE mogib1 = substr(:Chasu,1,1)
                     AND mogib2 = substr(:Chasu,2,1)
                     AND b.grade = 2
                     AND to_number(unit) > 1
                     AND RankingGrade BETWEEN '1' AND '9'
              ) b,
              ipsi201
        WHERE iw_year = :Year
              AND iw_chasu = :Chasu
              AND 순서 <= 1
              AND socialnumber = iw_jcode1 || iw_jcode2
        GROUP BY iw_shno
       ) a1

 WHERE iw_year = :year
       AND iw_chasu = :chasu
       AND iw_result = '2'
       AND iw_jwhgcode1 = '01'
       AND iw_year = sj_year
       AND sj_jsno = iw_jsno
       AND iw_shno = a3.shno(+)
       AND iw_shno = a2.shno(+)
       AND iw_shno = a1.shno(+)
