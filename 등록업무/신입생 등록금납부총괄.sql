SELECT schoolyear �г⵵, semester �б�,
CLASS �а��ڵ�, �а���, hakbun �й�, �����ȣ, �� || �̸� ����, f_statenm(��������) ��������,
goji �����ݾ�, sunap �����ݾ�, hanbul  ȯ�ұݾ�, lastdte ��������
FROM VIW������������, tm�а� b, TM���� c
WHERE schoolyear = '2013'
AND lvl = 1
AND hakbun LIKE 'A13%'
AND studentgbn <> '30304000'
AND CLASS = b.�а��ڵ�
AND hakbun = �й�
ORDER BY �а���, hakbun