SELECT �г�, �а���,
max(DECODE(����, '��', �����ο�)) "�����ο�(��)", max(DECODE(����, '��', �����ο�)) "�����ο�(��)",
max(DECODE(����, '��', �����ο�)) "�����ο�(��)", max(DECODE(����, '��', �����ο�)) "�����ο�(��)",
max(DECODE(����, '��', �����ο�)) "�����ο�(��)", max(DECODE(����, '��', �����ο�)) "�����ο�(��)"
FROM
(SELECT DISTINCT a.�г� �г�, b.�а��� �а���, ����,
count(�г�) OVER (PARTITION BY a.�г�, b.�а���, ����) �����ο�,
SUM(DECODE(��������, '01', 1, 0)) OVER (PARTITION BY a.�г�, b.�а���, ����) �����ο�,
SUM(DECODE(��������, '01', 0, 1)) OVER (PARTITION BY a.�г�, b.�а���, ����) �����ο�
FROM tm���� a, tm�а� b
WHERE ((�������� = '01') OR (SUBSTR(��������,1,1) = '1'))
AND a.�а��ڵ� = b.�а��ڵ�)
GROUP BY �г�, �а���
ORDER BY �г�, �а���