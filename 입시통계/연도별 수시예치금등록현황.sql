SELECT DISTINCT iw_year �Խÿ���, iw_chasu ����, hg_name �����а�, iw_shno �����ȣ, HAKBUN, F_FINDEXAMNO(HAKBUN),
DECODE(iw_result, '1', '�����հ�', '2', '�����հ�', '3', '��������', '5', '�߰��հ�', '4', '���հ�', iw_result) �հݿ���,
DECODE(state, '77', '���', '88', 'ȯ��', '') ��Ͽ���
FROM (SELECT * FROM tdfeegoji WHERE STUDENTGBN = '30304000'
UNION SELECT * FROM tdfeegoji_��ġ��), ipsi.ipsi201, ipsi.ipsi104
WHERE schoolyear >= '2015'
--AND LENGTH(hakbun) = 5
--AND state = 77
--AND studentgbn = 30304000
AND schoolyear = iw_Year
AND F_FINDEXAMNO(hakbun) = iw_shno
AND iw_year = hg_year
AND iw_jwhgcode1 = hg_code
-- �հݿ���(1=�հ�,2=�����հ�,3=��������,5=�߰��հ�,4=�������)