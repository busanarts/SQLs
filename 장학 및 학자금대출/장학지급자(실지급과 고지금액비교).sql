SELECT b.�г⵵, b.�б�, b.�г�,
c.�а���, a.�й�, a.�� || a.�̸� ����, SUM(���бݾ�) ���бݾ�, SUM(ȯ�ұݾ�) ȯ�ұݾ�, SUM(scholarship) �������бݾ�
FROM tm���� a, �ӽ����д���� b, tm�а� c, TDFEEGOJI
WHERE a.�й� = b.�й�
AND a.�а��ڵ� = c.�а��ڵ�
AND �г⵵ = schoolyear(+) AND �б� = semester(+) AND b.�й� = hakbun(+)
AND ���б��� = '������'
--AND b.�б� = '2'
GROUP BY b.�г⵵, b.�б�, b.�г�, c.�а���, a.�й�, a.��, a.�̸�
ORDER BY b.�г⵵, b.�б�, b.�г�, c.�а���, a.�й�