SELECT semester �б�, �а���, lvl �г�, SUM(tuition) ������, SUM(admissionfee) ���б�, SUM(scholarship) ���б�, SUM(prefee) ��ġ��, SUM(rcvamt) �ǳ��Ա�
FROM TDFEEGOJI, tm�а�
WHERE schoolyear = :�г⵵ AND semester = :�б�
AND CLASS = �а��ڵ�
--AND hakbun IN (SELECT �й� FROM TM���� WHERE �������� = '01')
--GROUP  BY semester, CUBE(�а���, lvl)
GROUP  BY semester, �а���, lvl
ORDER BY semester, lvl, �а���
