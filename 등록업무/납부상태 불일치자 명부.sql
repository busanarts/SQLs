SELECT a.hakbun �й�, b.receivedt ����, a.state �������ϻ���,
b.state �������ϻ���, b.receivegbn
FROM TDFEEGOJI a,
(SELECT * FROM TDFEERECEIVE
WHERE (hakbun, writedate) IN
(SELECT hakbun, max(writedate) FROM TDFEERECEIVE
WHERE schoolyear = :�г⵵
--AND studentgbn <> '30304000'
AND LENGTH(hakbun) = 5
GROUP BY hakbun)
) b
WHERE
a.hakbun = b.hakbun
--AND a.STUDENTGBN <> '30304000'
AND a.state <> b.state
