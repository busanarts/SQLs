SELECT a.schoolyear �г⵵, a.SEMESTER �б�, a.hakbun �й�, a.SCHOLARSHIP ���������б�, ���д�����б�
FROM TDFEEGOJI a, (SELECT schoolyear, semester, hakbun, sum(scholarship) ���д�����б� from TDJANGHAK
WHERE gbn = '1' AND schoolyear = :�г⵵
GROUP BY schoolyear, semester, hakbun) b
WHERE a.schoolyear = :�г⵵
AND a.STUDENTGBN <> '30304000'
AND a.SCHOOLYEAR = b.SCHOOLYEAR
AND a.SEMESTER = b.SEMESTER
AND a.hakbun = b.HAKBUN
AND a.SCHOLARSHIP <> ���д�����б�
