SELECT �а���, �й�, �� || �̸� ����, ����ȭ, �޴���ȭ, �����ּ� || ' ' || ���ּ� �ּ�, ���ڿ���, iw_ggname ��Ű�
FROM
TDFEEGOJI, tm���� a, ipsi.IPSI201, tm�а� b
WHERE schoolyear = :�г⵵
AND semester = '1'
AND studentgbn = '30304000'
AND state = '77'
AND hakbun = �й� AND �й� = iw_shno
AND iw_year = schoolyear
AND a.�а��ڵ� = b.�а��ڵ�