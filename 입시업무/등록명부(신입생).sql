SELECT �а���, iw_kname ����, iw_shno �����ȣ, DECODE(iw_result, '1', '�հ�', '2', '�����հ�', '5', '����հ�', '4', '�������', '') �հݿ���,
DECODE(SUBSTR(iw_jhgubun,1,1), '2', '�Ϲ�����', '3', 'Ư������', '5', '������') ��������,
DECODE(state, '77', '�ϳ�', '88', 'ȯ��', '11', '', state) ���α���
FROM ipsi.IPSI201, CISS.TDFEEGOJI g, CISS.tm�а� a,CISS.TM����
WHERE g.schoolyear = :�Խÿ���
AND iw_result IN ('1', '4', '5')
AND g.schoolyear = iw_year
AND g.hakbun = �й� AND �����ȣ = iw_shno AND �ֹε�Ϲ�ȣ = iw_jcode1 || iw_jcode2
--AND state <> '11'
AND g.studentgbn = '30304000'  -- ����
--AND g.studentgbn <> '30304000'  -- ����
AND CLASS = a.�а��ڵ�
ORDER BY �а���, DECODE(SUBSTR(iw_jhgubun,1,1), '2', '�Ϲ�����', '3', 'Ư������', '5', '������')
