SELECT �й�, �� || �̸� ����, �������������ڵ�, ��������, ��������  FROM tm����
WHERE SUBSTR(��������,1,1)  = '8'
AND �й� LIKE 'A%'
AND substr(��������,1,4) - ('20' ||  SUBSTR(�й�,2,2)) < 3
AND �й� IN (SELECT hakbun FROM TDSCHOOLCHG
WHERE changecd NOT IN ( '00', '81', '82', '83', '31', '61', '53'));


SELECT HAKBUN,  �� || �̸� ����,  MAX(SCHOOLYEAR) ���������⵵, MAX(��������) ��������
  FROM PSUTIS.TDRESULT A,
       TM���� B
  WHERE SCHOOLYEAR = (SELECT MAX(B.SCHOOLYEAR)FROM PSUTIS.TDRESULT B WHERE B.HAKBUN =A.HAKBUN)
    AND A.HAKBUN = B.�й�
   AND A.SCHOOLYEAR >= SUBSTR(��������, 1,4)
   AND SUBSTR(��������, 5,2) <> '08'
  GROUP BY HAKBUN, ��, �̸�, SCHOOLYEAR, ��������
  ORDER BY HAKBUN;





