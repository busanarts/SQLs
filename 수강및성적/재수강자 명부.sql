SELECT �ߺ�����.�й�, MAX(DECODE(���������, 'N', �����ڵ�)) �����ڵ�, MAX(DECODE(���������, 'N', �����)) �����,
MAX(DECODE(���������, 'N', �г⵵ || '-' || �б�)) ���⵵, MAX(DECODE(���������, 'N', ���)) ���, MAX(DECODE(���������, 'N', ������������)) ������������,
MAX(DECODE(���������, 'Y', �г⵵ || '-' || �б�)) �ݳ⵵, MAX(DECODE(���������, 'Y', ���)) ���, MAX(DECODE(���������, 'Y', ������������)) ������������
FROM
(SELECT ����.hakbun �й�, ����.schoolyear �г⵵, ����.semester �б�, ����.gmcode �����ڵ�, GMKNAME �����, gradelvl ���, recourseyn ���������, injung ������������
FROM psutis.TDresult ����, psutis.TMGWAMOK ����, psutis.tdcourse ����
WHERE (����.hakbun, ����.gmcode) IN (
SELECT hakbun, gmcode FROM psutis.TDCOURSE a
WHERE a.schoolyear = :�г⵵
AND a.semester = :�б�
AND recourseyn = 'Y'
)
AND ����.hakbun = ����.hakbun
AND ����.schoolyear = ����.schoolyear
AND ����.semester = ����.semester
AND ����.gmcode = ����.gmcode
AND ����.gmcode = ����.gmcode
ORDER BY ����.hakbun, ����.gmcode, ����.schoolyear, ����.SEMESTER) �ߺ�����
GROUP BY �ߺ�����.�й�