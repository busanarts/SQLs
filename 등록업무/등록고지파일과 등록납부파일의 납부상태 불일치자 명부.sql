SELECT a.hakbun 학번, b.receivedt 일자, a.state 고지파일상태,  f_feestate(a.hakbun, :학년도, :학기) 함수,
b.state 납부파일상태, b.receivegbn
FROM CISS.TDFEEGOJI a,
(SELECT * FROM CISS.TDFEERECEIVE
WHERE (hakbun, writedate) IN
(SELECT hakbun, max(writedate) FROM CISS.TDFEERECEIVE
WHERE schoolyear = :학년도
AND SEMESTER = :학기
AND studentgbn <> '30304000'
--AND LENGTH(hakbun) = 5
GROUP BY hakbun)
) b
WHERE
a.hakbun = b.hakbun
AND A.SCHOOLYEAR = :학년도
AND a.SEMESTER = :학기
AND a.STUDENTGBN <> '30304000'
AND a.state <> b.state
