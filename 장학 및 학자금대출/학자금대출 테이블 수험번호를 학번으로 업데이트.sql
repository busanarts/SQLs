--SELECT * FROM tm���ڱݴ����������
UPDATE tm���ڱݴ���������� d SET �й� = (SELECT �й� FROM tm���� WHERE �����ȣ = d.�й� AND �ֹε�Ϲ�ȣ = d.�ֹι�ȣ)
WHERE (�й�, �ֹι�ȣ) IN (SELECT �����ȣ, �ֹε�Ϲ�ȣ FROM tm����)
