SELECT a.�й�, a.��, �й� FROM tm���� a, tbl�й� b
--UPDATE tm���� a SET �� = (SELECT �й� FROM tbl�й� b WHERE b.�й� = a.�й�)
WHERE a.�й� IN (SELECT �й� FROM tbl�й�)
AND a.�й� = b.�й� --������Ʈ ����ô� �ּ�ó�� �Ұ�
