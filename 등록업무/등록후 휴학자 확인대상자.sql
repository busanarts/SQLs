SELECT hakbun, �� || �̸� ����, lvl �г�, semester �б�, COUNT(*) ���Ƚ��
FROM TDFEEGOJI, TM����
WHERE hakbun = �й�
AND SUBSTR(��������,1,1)  IN ('0')
AND admissionfee + tuition > 1000000
AND
GROUP BY hakbun, ��, �̸�, lvl, semester
HAVING COUNT(*) > 1
