SELECT �а���, �г�, �й�, �� || �̸� ����, ����ȭ, �޴���ȭ
FROM tm���� a, tm�а� b
WHERE �������� = '01'
AND a.�а��ڵ� = b.�а��ڵ�
AND �й� NOT IN (SELECT hakbun FROM TDFEERECEIVE WHERE schoolyear = :�г⵵ AND semester = :�б� AND state <> '88')
ORDER BY �а���, �г�, �й�