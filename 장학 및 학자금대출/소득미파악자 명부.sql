SELECT �й�, �� || �̸� ����, f_deptnm(������.class) ����а���,������.LVL ����г�, admissionfee + tuition �ѵ�ϱݾ�, scholarship ���бݾ�,
       �����б��������,
       TRUNC(�����б���������,0) �����б���������,
       SUBSTR(�����г��б�, 1, 4) �����������⵵,
       SUBSTR(�����г��б�, 5, 1) ������������б�

FROM TDFEEGOJI ������, tm����_20150401,
       (SELECT a.Hakbun,
              �����г��б�,
              SUM(DECODE(Gradelvl, 'F', 0, GradeJum)) �����б��������,
              sum(DECODE(Gradelvl, 'F', 1, 0)) F���������,
              SUM(DECODE(Gradelvl, 'P', 0, AVEJumsu) * GradeJum) / DECODE(SUM(DECODE(Gradelvl, 'P', 0, GradeJum)), 0, 1, SUM(DECODE(Gradelvl, 'P', 0, GradeJum))) �����б��������,
              SUM(DECODE(Gradelvl, 'P', 0, totJumsu) * GradeJum) / DECODE(SUM(DECODE(Gradelvl, 'P', 0, GradeJum)), 0, 1, SUM(DECODE(Gradelvl, 'P', 0, GradeJum))) �����б���������
         FROM Psutis.TDresult A,
              (SELECT Hakbun,
                     MAX(Schoolyear||Semester) �����г��б�
                FROM Psutis.TDresult,
                     tm����
               WHERE Hakbun = �й�
                     --AND �������� = '01'
                     AND Injung = 'Y'
                     AND schoolyear || semester  < :�г⵵ || :�б�
               GROUP BY Hakbun
              ) B
        WHERE a.Hakbun = b.Hakbun
              AND a.Schoolyear = SUBSTR(�����г��б�, 1, 4)
              AND a.Semester = SUBSTR(�����г��б�, 5, 1)
        GROUP BY a.Hakbun,
              �����г��б�
       ) ����

WHERE ������.schoolyear = :�г⵵
AND ������.semester = :�б�
AND ������.hakbun = �й�
       AND �й� = ����.Hakbun(+)
       AND ������.SCHOOLYEAR = :�г⵵
       AND ������.SEMESTER = :�б�
       AND ������.studentgbn <> '30304000' --AND HJ_HAKBUN IN('A1377023', 'A1427048', 'A1427049', 'A1425161', 'A0481056', 'A0925066', 'A1075030')
       AND �������� = '01'
AND �ֹε�Ϲ�ȣ NOT IN (SELECT �ֹε�Ϲ�ȣ FROM tm�������н�û�л�)