SELECT �й�, �� || �̸� ����, f_statenm(��������) ��������, �г�, f_deptnm(�а��ڵ�) �а���,
schoolyear �����г⵵, semester �����б�, f_deptnm(CLASS) �����а�, lvl �����г�,
f_feestatenm(state) ���α���, fee �ݾ�, etcfee ��ġ��, DECODE(receivegbn, '1000', '����', '2000', '�ڼ���', '') ���ι��, bank, bigo ���
FROM TDFEERECEIVE, tm����
WHERE SUBSTR(��������,1,1) IN ('0', '1')
AND hakbun = �й�
