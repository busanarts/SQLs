SELECT a.hakbun �й�, b.receivedt ����, a.state �������ϻ���,  f_feestate(a.hakbun, :�г⵵, :�б�) �Լ�,
b.state �������ϻ���, b.receivegbn
FROM CISS.TDFEEGOJI a,
(SELECT * FROM CISS.TDFEERECEIVE
WHERE (hakbun, writedate) IN
(SELECT hakbun, max(writedate) FROM CISS.TDFEERECEIVE
WHERE schoolyear = :�г⵵
AND SEMESTER = :�б�
AND studentgbn <> '30304000'
--AND LENGTH(hakbun) = 5
GROUP BY hakbun)
) b
WHERE
a.hakbun = b.hakbun
AND A.SCHOOLYEAR = :�г⵵
AND a.SEMESTER = :�б�
AND a.STUDENTGBN <> '30304000'
AND a.state <> b.state
