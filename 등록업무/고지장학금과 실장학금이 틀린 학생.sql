SELECT a.hakbun �й�, �� || �̸� ����, a.admissionfee ���б�, a.tuition ������, a.SCHOLARSHIP �������б�,
(NVL(b.SCHOLARSHIP1,0) + NVL(b.SCHOLARSHIP2,0) + NVL(b.SCHOLARSHIP3,0) + NVL(b.SCHOLARSHIP4,0)) ���б�
FROM TDFEEGOJI a, TDJANGHAKSUM  b, TM����
WHERE a.schoolyear = :�г⵵
AND a.semester = :�б�
AND a.studentgbn <> '30304000'
AND a.SCHOOLYEAR = b.SCHOOLYEAR(+)
AND a.SEMESTER = b.SEMESTER(+)
AND a.hakbun = b.hakbun(+)
AND a.hakbun = �й�
AND a.SCHOLARSHIP <> (NVL(b.SCHOLARSHIP1,0) + NVL(b.SCHOLARSHIP2,0) + NVL(b.SCHOLARSHIP3,0) + NVL(b.SCHOLARSHIP4,0))
;


SELECT SUM(SCHOLARSHIP) FROM TDJANGHAK
WHERE schoolyear = '2015' AND semester = '2'
AND confirm = 'Y'
AND hakbun IN (SELECT �й� FROM TM���� WHERE �������� = '01');
;
--AND hakbun = 'A1578006';

SELECT SUM(NVL(SCHOLARSHIP1,0) + NVL(SCHOLARSHIP2,0) + NVL(SCHOLARSHIP3,0) + NVL(SCHOLARSHIP4,0))  FROM TDJANGHAKSUM
WHERE schoolyear = '2015' AND semester = '2'
AND hakbun IN (SELECT �й� FROM TM���� WHERE �������� = '01');;
--AND hakbun = 'A1578006'
