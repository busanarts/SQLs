SELECT �й�, �� || �̸� ����, �ֹε�Ϲ�ȣ, �г�, ��������,
f_lcscode(�й�) �������������ڵ�, f_lcdate(�й�) ����������������
FROM tm����
WHERE SUBSTR(��������,1,1) = '1'
AND SUBSTR(f_lcscode(�й�),1,1) <> '1';
SELECT �й�, �� || �̸� ����, �ֹε�Ϲ�ȣ, �г�, ��������,
f_lcscode(�й�) �������������ڵ�, f_lcdate(�й�) ����������������
FROM tm����
WHERE SUBSTR(��������,1,1) = '1'
AND SUBSTR(f_lcscode(�й�),1,1) = '5';
SELECT �й�, �� || �̸� ����, �ֹε�Ϲ�ȣ, �г�, ��������,
f_lcscode(�й�) �������������ڵ�, f_lcdate(�й�) ����������������
FROM tm����
WHERE SUBSTR(��������,1,1) = '0'
AND SUBSTR(f_lcscode(�й�),1,1) IN ('1', '2');