SELECT �а���, COUNT(*) ����ο�, SUM(admissionfee) ���бݰ�, SUM(tuition) �������, SUM(scholarship) ���бݰ�, SUM(prefee) ��ġ�ݰ�
FROM TDFEEGOJI, TM�а�
WHERE schoolyear = :�г⵵ AND semester = :�б�
AND CLASS = �а��ڵ�
AND studentgbn <> '30304000'
GROUP BY CUBE(�а���)
ORDER BY �а���
