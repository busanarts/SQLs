SELECT ���ڱ��ڵ�  �а��ڵ�, '19' �����ڵ�, �ֹε�Ϲ�ȣ, �й�, �� || �̸� �л���, �г�,
'1' ��ϱݳ��δ�󱸺�, '20120930' �������帶������,
'1' ���м������±���1, '032' �������������ڵ�1, F_GETVNO(�й�, '301002') ����������¹�ȣ1, �� || �̸� �������¿����ָ�1,
'1' ���м������±���2, '011' �������������ڵ�2, F_GETVNO(�й�, '301003') ����������¹�ȣ2, �� || �̸� �������¿����ָ�2,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '30', F_GETDCODE(J.JANGHAKCD1), '') ||
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '30', F_GETDCODE(J.JANGHAKCD2), '') ||
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '30', F_GETDCODE(J.JANGHAKCD3), '') ���л�ǰ�ڵ�1,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '30', NVL(J.SCHOLARSHIP1, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '30', NVL(J.SCHOLARSHIP2, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '30', NVL(J.SCHOLARSHIP3, 0), 0) �������б�1,
'' ���л�ǰ�ڵ�2, '' �������б�2, '' ���л�ǰ�ڵ�3, '' �������б�3,
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD1), '10', NVL(J.SCHOLARSHIP1, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD2), '10', NVL(J.SCHOLARSHIP2, 0), 0) +
DECODE(F_GETJANGHAKGBN(J.JANGHAKCD3), '10', NVL(J.SCHOLARSHIP3, 0), 0) �������б�,
0 �������б�, ADMISSIONFEE ���б�, TUITION ������, '' �⼺ȸ��
FROM TDFEEGOJI D, TDJANGHAKSUM J, TM���� S, TM�а� H --, TMSCHOLARSHIP C
WHERE D.SCHOOLYEAR = J.SCHOOLYEAR(+)
AND D.SEMESTER = J.SEMESTER(+)
AND D.HAKBUN = J.HAKBUN(+)
AND D.HAKBUN = �й� AND S.�а��ڵ� = H.�а��ڵ�

