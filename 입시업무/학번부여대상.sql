SELECT hg_name, iw_kname ����, iw_shno �����ȣ, si_hakbun �й�,
DECODE(SUBSTR(IW_CHASU,1,1), '9', '����', '����') || SUBSTR(IW_CHASU,2,1) || '��' ����,
DECODE(SUBSTR(iw_jhgubun,1,1), '2', '�Ϲ�����', '3', 'Ư������', '5', '������') ��������,
DECODE(iw_result, '1', '�հ�', '5', '����հ�', '4', '�հ�����', '0', '���հ�', '2', '�����հ�', '3', '��������') �հݱ���,
DECODE(state, '77', '�ϳ�', '22', '�κг�', '33', '��������', '55', '�°�', '88',
DECODE(rcvamt, 0, 'ȯ��', '�ϳ�'), '11', '', state) ���α���, sc_name �Ǳ�����, si_ban ��
FROM ipsi.IPSI201, ciss.TDFEEGOJI g, ipsi.ipsi104, ipsi.ipsi401, ipsi.ipsi109
WHERE iw_year = :�Խÿ���
--AND iw_result IN( '1', '5')
AND g.schoolyear(+) = iw_year
AND g.hakbun(+) = iw_shno
AND g.studentgbn(+) <> '30304000'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
AND iw_year = si_year(+)
--AND iw_chasu = si_chasu(+)
AND iw_shno = si_shno(+)
AND iw_sgcode = sc_code(+)
--AND iw_jwhgcode1 = '01'
ORDER BY hg_name, DECODE(SUBSTR(iw_jhgubun,1,1), '2', '�Ϲ�����', '3', 'Ư������', '5', '������')

