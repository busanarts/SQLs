SELECT b.�й�, �г⵵, �б�, ���Ա��հ�,  (a.ADMISSIONFEE + a.TUITION + a.ETCFEE - a.SCHOLARSHIP) �����ݾ�
FROM TDFEEGOJI a, tm���� c,
(SELECT schoolyear �г⵵, semester �б�, hakbun �й�,
SUM(DECODE(state, '77', fee, -fee)) ���Ա��հ�
FROM TDFEERECEIVE
--UPDATE TDFEERECEIVE SET fee = 0
--WHERE --schoolyear = '2012'
--fee IS null
--AND
GROUP BY schoolyear, semester, hakbun
) b
WHERE a.SCHOOLYEAR < '2013'
AND a.schoolyear = �г⵵
AND a.SEMESTER = �б�
AND a.hakbun = b.�й�
AND (a.ADMISSIONFEE + a.TUITION + a.ETCFEE - a.SCHOLARSHIP) <> b.���Ա��հ�
AND a.HAKBUN = c.�й�
AND SUBSTR(��������,1,1) IN ( '0', '1')
ORDER BY �й�, �г⵵, �б�