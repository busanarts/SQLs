--UPDATE TM�������бݼ����� aa SET �й� = (SELECT �й� FROM TM���� ���� WHERE aa.�ֹε�Ϲ�ȣ = ����.�ֹε�Ϲ�ȣ AND SUBSTR(����.��������,1,1) IN ('0', '1')) WHERE LENGTH(�й�) <> 8;
UPDATE TM�������бݼ����� SET ��ϱݾ� = (SELECT SUM(NVL(fee, 0)+NVL(etcfee, 0)) FROM TDFEERECEIVE WHERE schoolyear = '2015' AND hakbun = �й� AND state <> '88')
,ȯ�ұݾ� = (SELECT SUM(NVL(fee, 0)+NVL(etcfee, 0)) FROM TDFEERECEIVE WHERE schoolyear = '2015' AND hakbun = �й� and state = '88')
,��ϱ��� = (SELECT DECODE(state, '77', '�ϳ�', '11', '�̳�', '88', 'ȯ��', '55', '�°�', '33', '��������', '22', '�κг�') FROM TDFEEGOJI WHERE schoolyear = '2015' AND hakbun = �й� AND studentgbn <> '30304000')
,�����ݾ�= (SELECT (admissionfee+tuition-etcfee-scholarship) FROM TDFEEGOJI WHERE schoolyear = '2015' AND hakbun = �й�  AND studentgbn <> '30304000')
,����ݾ�= (SELECT scholarship FROM TDFEEGOJI WHERE schoolyear = '2015' AND hakbun = �й�  AND studentgbn <> '30304000')
,�������� = f_hjstate(�й�)

