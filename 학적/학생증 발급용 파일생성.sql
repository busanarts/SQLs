SELECT �й�, �� || �̸� ����, '19' || SUBSTR(�ֹε�Ϲ�ȣ,1,6) �������, �а���, �г�
FROM TM���� a, tm�а� b
WHERE a.�а��ڵ� = b.�а��ڵ�
AND �������� = '01'
--WHERE �й� IN
--(SELECT HAKBUN FROM TDJANGHAKSUM
--WHERE SCHOOLYEAR = '2015'
--AND HAKBUN NOT LIKE 'A%')
