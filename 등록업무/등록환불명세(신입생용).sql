
SELECT �������.Schoolyear �г⵵, �������.SEMESTER �б�, �������.lvl �г�, �а���, �������.HAKBUN �й�, �� || �̸� ����, TRIM(F_STATENM(��������)) ��������,
ADMISSIONFEE ���б�, TUITION ������, SCHOLARSHIP �������б�,

F_janghaknm(janghakcd1) ���и�1, SCHOLARSHIP1 ����1�ݾ�,
F_janghaknm(janghakcd2) ���и�2, SCHOLARSHIP2 ����2�ݾ�,
F_janghaknm(janghakcd3) ���и�3, SCHOLARSHIP3 ����3�ݾ�,
F_janghaknm(janghakcd4) ���и�4, SCHOLARSHIP4 ����4�ݾ�,

--(NVL(SCHOLARSHIP1,0) + NVL(SCHOLARSHIP2,0) + NVL(SCHOLARSHIP3,0) + NVL(SCHOLARSHIP4,0)) ����SUM,

SCHOLARSHIP -(NVL(SCHOLARSHIP1,0) + NVL(SCHOLARSHIP2,0) + NVL(SCHOLARSHIP3,0) + NVL(SCHOLARSHIP4,0)) ����,

prefee ��ġ��,
ADMISSIONFEE + TUITION - SCHOLARSHIP - NVL(PREFEE,0) �����ݾ�, NVL(�����ݾ�,0) �����ݾ�,
DECODE(NVL(�����ݾ�,0), 0, 0, NVL(�����ݾ�,0) - NVL(ȯ�ұݾ�,0)) �ǳ��αݾ�, NVL(ȯ�ұݾ�,0) ȯ�ұݾ�,
DECODE(�������.state, '77', '�ϳ�', '11', '�̳�', '33', '��������', '22', '�κг�', '55', '�°�', '88', 'ȯ��') ���α���, ��������, ȯ������,
DECODE(�������.state, '11', 0, -(ADMISSIONFEE + TUITION - SCHOLARSHIP - NVL(�����ݾ�,0) + NVL(ȯ�ұݾ�,0))) �ݾ׿���üũ,
DECODE(�������.state, '11', DECODE(rcvamt, 0, '', '����')) ���α��п���,
bigo ���


FROM TDFEEGOJI �������, TM���� ����, tm�а� �а�, tdjanghaksum,
(SELECT schoolyear, semester, HAKBUN, SUM(NVL(FEE,0)+nvl(etcfee,0)) ȯ�ұݾ�, MAX(receivedt) ȯ������ FROM TDFEERECEIVE
WHERE  schoolyear = :�г⵵
AND studentgbn <> '30404000' -- ��ġ�� ����
and state = '88'
GROUP BY  schoolyear, semester,HAKBUN) ȯ�Ҹ��,
(SELECT schoolyear, semester, HAKBUN, SUM(NVL(fee,0) + nvl(etcfee,0)) �����ݾ�, MAX(RECEIVEDT) �������� FROM TDFEERECEIVE
WHERE  schoolyear = :�г⵵
AND state <> '88'
AND studentgbn <> '30404000'
GROUP BY  schoolyear, semester,HAKBUN) ��ϸ��
WHERE �������.schoolyear = :�г⵵
AND �������.SEMESTER = :�б�

AND �������.SCHOOLYEAR = tdjanghaksum.SCHOOLYEAR(+)
AND �������.semester = tdjanghaksum.SEMESTER(+)
AND �������.hakbun = tdjanghaksum.HAKBUN(+)

AND �������� = '00'
AND �������.studentgbn <> '30304000'
AND �������.schoolyear = ��ϸ��.schoolyear(+)
AND �������.semester = ��ϸ��.semester(+)
AND �������.hakbun = ��ϸ��.hakbun(+)
AND �������.schoolyear = ȯ�Ҹ��.schoolyear(+)
AND �������.semester = ȯ�Ҹ��.semester(+)
AND �������.hakbun = ȯ�Ҹ��.hakbun(+)
AND �������.hakbun = ����.�й� AND �������.CLASS = �а�.�а��ڵ�




ORDER BY �������.SCHOOLYEAR, �������.SEMESTER, �������.LVL, �������.HAKBUN

