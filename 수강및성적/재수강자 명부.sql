-- 2���̻� ������� �����߻� ���� ����

SELECT �й�, ����, �����,
max(DECODE(recourseyn, 'N', �г⵵ || '-' || �б�  )) ���б�������,
max(DECODE(recourseyn, 'Y', �г⵵ || '-' || �б�  )) ���б������û
FROM (
SELECT �й�, �� || �̸� ����, b.schoolyear �г⵵, b.semester �б�, b.gmcode �����ڵ�, c.GMKNAME �����, recourseyn
FROM ciss.TM���� a, psutis.TDCOURSE b, psutis.TMGWAMOK c
WHERE (hakbun, c.gmkname) IN (
SELECT hakbun, gmkname FROM psutis.TDCOURSE a, psutis.TMGWAMOK b
WHERE a.schoolyear = :�г⵵
AND a.semester = :�б�
AND recourseyn = 'Y'
AND a.gmcode = b.GMCODE)
AND �й� = hakbun
AND b.GMCODE= c.GMCODE
ORDER BY �й�, b.gmcode, b.schoolyear, b.semester
) GROUP BY �й�, ����, �����
