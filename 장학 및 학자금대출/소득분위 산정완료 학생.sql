SELECT ����.�й� �����й�,��������.�й� ��û���й�, ����, ����.�ֹε�Ϲ�ȣ, ��������, ���λ���, ��û����, �ҵ����,f_deptnm(������.class) ����а���,������.LVL ����г�, admissionfee + tuition �ѵ�ϱݾ�, scholarship ���бݾ�,
DECODE(f_janghakgbn(janghakcd1),  '30', '����', '10', '����', '20', '�ܺ�', '') ���б���1, f_janghaknm(janghakcd1) ���и�1, scholarship1 ���б�1,
DECODE(f_janghakgbn(janghakcd2),  '30', '����', '10', '����', '20', '�ܺ�', '') ���б���2, f_janghaknm(janghakcd2) ���и�2, scholarship2 ���б�2,
DECODE(f_janghakgbn(janghakcd3),  '30', '����', '10', '����', '20', '�ܺ�', '') ���б���3, f_janghaknm(janghakcd3) ���и�3, scholarship3 ���б�3,
DECODE(f_janghakgbn(janghakcd4),  '30', '����', '10', '����', '20', '�ܺ�', '') ���б���4, f_janghaknm(janghakcd4) ���и�4, scholarship4 ���б�4

FROM TDFEEGOJI ������, TDJANGHAKSUM ���б�,  tm�������н�û�л� ��������, TM���� ����

WHERE ������.schoolyear = :�г⵵
AND ������.semester = :�б�
AND ������.hakbun = ����.�й�
       AND ������.studentgbn <> '30304000'
       AND ����.�ֹε�Ϲ�ȣ = ��������.�ֹε�Ϲ�ȣ
       --AND �������� = '01'
AND ������.hakbun = ���б�.HAKBUN(+)
AND ������.SCHOOLYEAR = ���б�.SCHOOLYEAR(+)
AND ������.SEMESTER = ���б�.SEMESTER(+)
