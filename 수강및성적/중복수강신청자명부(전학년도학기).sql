SELECT �й�, COUNT(*) �ߺ����������
FROM
(
SELECT aa.hakbun �й�, aa.schoolyear �г⵵, aa.semester �б�, aa.gmcode �����ڵ�, �����, gradelvl ���
FROM psutis.TDRESULT aa,
(SELECT hakbun �й�, �� || �̸� ����, a.gmcode �����ڵ�, gmkname �����, COUNT(*) ����Ƚ��
FROM psutis.TDRESULT a, psutis.TMGWAMOK b, TM����
--WHERE injung = 'Y'
--where gradelvl <> 'F'
where a.gmcode = b.gmcode
AND a.hakbun = �й�
AND hakbun IN (SELECT �й� FROM TM���� WHERE �������� = '01')
GROUP BY hakbun, a.gmcode, gmkname, ��, �̸�
HAVING COUNT(*) > 1 ) bb
WHERE aa.hakbun = �й�
AND aa.gmcode = �����ڵ�
--GROUP BY aa.hakbun, aa.gmcode
ORDER BY hakbun, gmcode
) ss
GROUP BY �й�