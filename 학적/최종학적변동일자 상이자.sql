SELECT �й�, ��������, �������������ڵ�, usr_lcscode(�й�) FROM tm����
--WHERE �������������ڵ� <> usr_lcscode(�й�)
WHERE ���������������� <> usr_lcdate(�й�)
AND �������� NOT IN ('81', '82', '83', '21', '22', '23', '24')
AND usr_lcscode(�й�) NOT IN( 'N/A', '51', '61', '31')
