SELECT �а���, �й�, aa.lvl �г�, �� || �̸� ����, admissionfee ���б�, tuition ������, aa.etcfee ��ġ��, scholarship ���б�,
aa.admissionfee + aa.tuition + aa.etcfee - scholarship �����ݾ�, rcvamt ���αݾ�, rcvdt ��������, bb.state ��������,
bb.RECEIVEDT ������, bb.fee �ǳ��αݾ�
FROM TDFEEGOJI aa, tm�а� c, TM���� a, TDFEERECEIVE bb
WHERE aa.schoolyear = '2012'
AND aa.semester = '1'
AND aa.hakbun = �й� AND a.�а��ڵ� = c.�а��ڵ�
AND aa.SCHOOLYEAR = bb.SCHOOLYEAR
AND aa.SEMESTER = bb.SEMESTER
AND aa.HAKBUN = bb.HAKBUN
