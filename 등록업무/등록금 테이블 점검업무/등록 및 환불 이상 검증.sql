SELECT a.schoolyear �г⵵, a.semester �б�, a.lvl �г�, a.hakbun �й�, a.admissionfee ���б�, a.tuition ������, a.scholarship ���б�, a.prefee ��ġ��,
DECODE(sign(admissionfee + tuition - scholarship - prefee), -1, 0, admissionfee + tuition - scholarship - prefee) �����ݾ�, rcvamt ���Աݰ�, fee ���Դ���
FROM TDFEEGOJI a,
(SELECT schoolyear, semester, lvl, hakbun, SUM(DECODE(state, '88', -fee, '55', 0, fee)) fee  FROM
TDFEERECEIVE WHERE
--state = '88'
studentgbn <> '30304000'
GROUP BY schoolyear, semester, lvl, hakbun) b
WHERE a.schoolyear = :�г⵵
AND a.studentgbn <> '30304000'
AND a.state = '77'
--AND prefee > 0
--AND (admissionfee+ tuition- scholarship) <> (prefee+rcvamt+NVL(fee,0))
--AND (prefee+rcvamt <> NVL(fee,0))
AND rcvamt <> fee
AND a.schoolyear = b.SCHOOLYEAR(+)
AND a.SEMESTER = b.SEMESTER(+)
AND a.HAKBUN = b.HAKBUN(+)
