    SELECT iw_shno �����ȣ, iw_kname ����, �г�, �б�, �����, �̼�����, �������, ����
      FROM
           (SELECT SocialNumber , grade �г�, term �б�, trim(Subjectname) �����, Unit �̼�����, RankingGrade �������,
                  row_number() over (partition BY SocialNumber ORDER BY rankingGrade, to_number(unit)) ����
             FROM SubjectScore b
            WHERE mogib1 = SUBSTR(:����,1,1) and mogib2 = SUBSTR(:����,2,1) and b.grade = 2  and to_number(unit) > 1
                  AND RankingGrade BETWEEN '1' AND '9'
           ) b, ipsi201
     WHERE iw_year = :�Խÿ��� AND iw_chasu = :����
     AND socialnumber = iw_jcode1 || iw_jcode2
     AND ���� <= 3
     --AND �б� = '1'
    --and iw_shno = :shno