-- ���� : ���л� ��ϱ� �����۾��Ϸ��Ŀ� �����ϱ� �ٶ�

SELECT DISTINCT �а�.�а���,
       ����.�ֹε�Ϲ�ȣ,
       ����.�й�,
       �� || �̸� �л�����,
       �����б��������,
       ROUND(�����б��������,2) �����б��������,
       F���������,
       --���������,
       --ROUND(���������,2) ���������,
       TRUNC(�����б���������,0) �����б���������
       --TRUNC(�ѹ��������,0) �ѹ��������,
  FROM TM���� ����, TM�а� �а�, tmp�������а��� ��������,
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
                     AND Injung = 'Y'
               GROUP BY Hakbun
              ) B
        WHERE a.Hakbun = b.Hakbun
              AND a.Schoolyear = SUBSTR(�����г��б�, 1, 4)
              AND a.Semester = SUBSTR(�����г��б�, 5, 1)
        GROUP BY a.Hakbun,
              �����г��б�
       ) ����

 WHERE --�������� = '01'
       ����.�а��ڵ� = �а�.�а��ڵ�
       AND ����.�й� = ����.Hakbun(+)
       AND ����.�й� = ��������.�й�

ORDER BY �а���, �й� --AND ������_TOTGUM - ������_TGMGUM > 0