SELECT iw_jwhgcode1 �а��ڵ�, iw_jhgubun ��������, iw_shno �����ȣ, iw_rank1 ����������, sj_totjum �Խ�����, a3.���� ����3����, a2.���� ����2����, a1.���� ����1����,
       RANK() OVER(PARTITION BY iw_jwhgcode1, SUBSTR(iw_jhgubun,1,1) ORDER BY sj_totjum DESC, nvl(a3.����,0), nvl(a2.����,0), nvl(a1.����,0)) �������
  FROM ipsi201, IPSI202,
       (SELECT iw_shno shno, sum(�̼����� * �������) ����, round(sum(�̼����� * �������) /sum(�̼�����),2) ����
         FROM
              (SELECT SocialNumber , trim(Subjectname) �����, Unit �̼�����, RankingGrade �������,
                     row_number() over (partition BY SocialNumber ORDER BY rankingGrade, to_number(unit)) ����
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
              AND ���� <= 3
              AND socialnumber = iw_jcode1 || iw_jcode2
        GROUP BY iw_shno
       ) a3,
       (SELECT iw_shno shno, sum(�̼����� * �������) ����, round(sum(�̼����� * �������) /sum(�̼�����),2) ����
         FROM
              (SELECT SocialNumber , trim(Subjectname) �����, Unit �̼�����, RankingGrade �������,
                     row_number() over (partition BY SocialNumber ORDER BY rankingGrade, to_number(unit)) ����
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
              AND ���� <= 2
              AND socialnumber = iw_jcode1 || iw_jcode2
        GROUP BY iw_shno
       ) a2,
       (SELECT iw_shno shno, sum(�̼����� * �������) ����, round(sum(�̼����� * �������) /sum(�̼�����),2) ����
         FROM
              (SELECT SocialNumber , trim(Subjectname) �����, Unit �̼�����, RankingGrade �������,
                     row_number() over (partition BY SocialNumber ORDER BY rankingGrade, to_number(unit)) ����
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
              AND ���� <= 1
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
