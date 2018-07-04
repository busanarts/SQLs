SELECT a.hakbun �й�, b.SEMESTER �б�,
f_janghaknm(b.JANGHAKCD1) ���и�1, b.SCHOLARSHIP1 ���б�1, gbn1 ���б���1,
f_janghaknm(b.JANGHAKCD2) ���и�2, b.SCHOLARSHIP2 ���б�2, gbn2 ���б���2,
f_janghaknm(b.JANGHAKCD3) ���и�3, b.SCHOLARSHIP3 ���б�3, gbn3 ���б���3,
f_feestatenm(c.state) ���α���,
c.ADMISSIONFEE ���б�, c.TUITION ������, c.SCHOLARSHIP �������б�,
f_feercvamt(c.hakbun, c.schoolyear, c.SEMESTER) ���������ݾ�,
f_feertnamt(c.hakbun, c.schoolyear, c.SEMESTER) ȯ�ұݾ�
FROM TDSCHOOLCHG a, TDJANGHAKsum b, TDFEEGOJI c
WHERE changedt >= '20130201' AND changedt <= '20140130'
AND SUBSTR(changecd,1,1) = '2'
AND a.SCHOOLYEAR = b.SCHOOLYEAR
AND a.HAKBUN = b.HAKBUN
AND b.SCHOOLYEAR = c.SCHOOLYEAR
AND b.SEMESTER = c.SEMESTER
AND b.HAKBUN = c.HAKBUN
AND c.STUDENTGBN <> '30304000'
AND b.SCHOOLYEAR = '2013'