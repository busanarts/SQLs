SELECT hakbun �й�, �� || �̸� ����, �а���, lvl �г�, fee ����ȯ�ұݾ�, etcfee ��ġ��, DECODE(STATE, '77', '�ϳ�', '55', '�°�', '88', 'ȯ��') ���ο���
FROM TDFEERECEIVE, TM���� a, tm�а� b
WHERE SCHOOLYEAR = '2013' AND SEMESTER = '2'
AND CLASS = b.�а��ڵ� AND  hakbun= �й�
--AND STATE <> '88'
UNION
SELECT hakbun �й�, �� || �̸� ����, �а���, lvl �г�, fee ����ȯ�ұݾ�, etcfee ��ġ��, DECODE(STATE, '77', '�ϳ�', '55', '�°�', '88', 'ȯ��') ���ο���
FROM TDFEERECEIVE_���⵵�հ���, TM���� a, tm�а� b
WHERE SCHOOLYEAR = '2013' AND SEMESTER = '2'
AND CLASS = b.�а��ڵ� AND  hakbun= �й�
--AND STATE <> '88'