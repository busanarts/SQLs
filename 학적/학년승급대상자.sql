SELECT * FROM tm����
WHERE �������� = '01'
AND �г� = '1'
AND �й� NOT IN (SELECT �й� FROM t�����������
WHERE �����г⵵ = :�г⵵ AND �����б� = :�б�
AND SUBSTR(�����ڵ�,1,1) = '5')