SELECT ���ڱ��ڵ� ���ڱ������а��ڵ�, '11' �����ڵ�, �ֹε�Ϲ�ȣ, �й� �����ȣ, �� || �̸� ����,
'1' �г�, DECODE(state, '77', '2', '11', '1', '0') ��ϳ��δ�󱸺�,
:�Խó⵵ || :��ϸ����� �������帶������,
'1' ���м������±���1, '032' �������������ڵ�1, F_GETVNO(�й�, '301002') ����������¹�ȣ1, �� || �̸� �������¿����ָ�1,
'1' ���м������±���2, '011' �������������ڵ�2, F_GETVNO(�й�, '301003') ����������¹�ȣ2, �� || �̸� �������¿����ָ�2,
DECODE(J.JANGHAKCD1, '30', F_GETDCODE(J.JANGHAKCD1), '') ��ܼ�������1�ڵ�,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '30', NVL(J.SCHOLARSHIP1, 0), 0) ��ܼ�������1�ݾ�,
DECODE(J.JANGHAKCD2, '30', F_GETDCODE(J.JANGHAKCD2), '') ��ܼ�������2�ڵ�,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '30', NVL(J.SCHOLARSHIP2, 0), 0) ��ܼ�������2�ݾ�,
DECODE(J.JANGHAKCD3, '30', F_GETDCODE(J.JANGHAKCD3), '') ��ܼ�������3�ڵ�,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '30', NVL(J.SCHOLARSHIP3, 0), 0) ��ܼ�������3�ݾ�,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '10', NVL(J.SCHOLARSHIP1, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '10', NVL(J.SCHOLARSHIP2, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '10', NVL(J.SCHOLARSHIP3, 0), 0) �������б�,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '20', NVL(J.SCHOLARSHIP1, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '20', NVL(J.SCHOLARSHIP2, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '20', NVL(J.SCHOLARSHIP3, 0), 0) �������б�,
0 ��ġ��, -- ������ 0 ó��
admissionfee ���б�, tuition - prefee ������, 0 �⼺ȸ��
FROM TDFEEGOJI D, TDJANGHAKSUM J, TM���� S, TM�а� H --, TMSCHOLARSHIP C
WHERE D.schoolyear = :�Խó⵵
--AND D.studentgbn = '30303120'
AND D.SCHOOLYEAR = J.SCHOOLYEAR(+)
AND D.SEMESTER = J.SEMESTER(+)
AND D.HAKBUN = J.HAKBUN(+)
AND d.SCHOOLYEAR = SUBSTR(s.��������,1,4)
AND D.HAKBUN = �й� AND D.class = H.�а��ڵ�
--AND studentgbn = '3030' || DECODE(:����, '01', '3110', '02', '3120', '03', '3130')
-- 3030300 = ����1��, 30303112 = ����1�� �߰��հ�2, 30303120 = ����2��
AND STUDENTGBN <> '30304000'
--AND substr(studentgbn,5,4) = '3112
