SELECT schoolyear �г⵵, semester �б�, lvl �г�, hakbun �й�, �� || �̸� ����,
admissionfee ���б�, tuition ������, etcfee ��Ÿ���α�, scholarship ���б�, prefee ��ġ��,
admissionfee + tuition + etcfee - scholarship - prefee �����ݾ�, rcvamt ���δ����
FROM TDFEEGOJI, tm����
WHERE schoolyear = '2013'
AND state = '77'
AND admissionfee + tuition + etcfee - scholarship - prefee <>  rcvamt
AND hakbun = �й�
