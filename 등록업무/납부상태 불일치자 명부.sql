SELECT a.hakbun 학번, b.receivedt 일자, a.state 고지파일상태,
b.state 납부파일상태, b.receivegbn
FROM TDFEEGOJI a,
(SELECT * FROM TDFEERECEIVE
WHERE (hakbun, writedate) IN
(SELECT hakbun, max(writedate) FROM TDFEERECEIVE
WHERE schoolyear = :학년도
--AND studentgbn <> '30304000'
AND LENGTH(hakbun) = 5
GROUP BY hakbun)
) b
WHERE
a.hakbun = b.hakbun
--AND a.STUDENTGBN <> '30304000'
AND a.state <> b.state
