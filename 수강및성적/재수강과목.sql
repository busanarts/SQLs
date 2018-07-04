SELECT ����.hakbun, ����.gmcode, ����.gmkname, ����.schoolyear, ����.SEMESTER, ����.totjumsu
  FROM psutis.TDRESULT ����,
       psutis.TMGWAMOK ����,
       (SELECT hakbun, b.gmkname, COUNT(*) cnt
         FROM psutis.TDRESULT a,
              psutis.TMGWAMOK b
        WHERE injung = 'Y' --AND gradelvl <> 'F'
              AND a.gmcode = b.gmcode
              AND hakbun IN (SELECT �й� FROM TM���� WHERE �������� IN ( '01', '11', '12', '13', '14', '15') )
              --AND hakbun IN (SELECT �й� FROM TM���� WHERE �������� = '81')
        GROUP BY hakbun, b.gmkname
       HAVING COUNT(*) > 1
       ) �ߺ��������� -- 2�� �̻� ������ ����
 WHERE ����.hakbun = �ߺ���������.hakbun
       AND ����.gmcode = ����.gmcode --AND ����.hakbun = 'A1125087'
       AND ����.gmkname = �ߺ���������.gmkname
       order BY hakbun, gmkname, totjumsu desc