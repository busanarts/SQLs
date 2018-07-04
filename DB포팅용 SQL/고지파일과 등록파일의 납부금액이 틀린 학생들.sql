SELECT b.학번, 학년도, 학기, 납입금합계,  (a.ADMISSIONFEE + a.TUITION + a.ETCFEE - a.SCHOLARSHIP) 고지금액
FROM TDFEEGOJI a, tm학적 c,
(SELECT schoolyear 학년도, semester 학기, hakbun 학번,
SUM(DECODE(state, '77', fee, -fee)) 납입금합계
FROM TDFEERECEIVE
--UPDATE TDFEERECEIVE SET fee = 0
--WHERE --schoolyear = '2012'
--fee IS null
--AND
GROUP BY schoolyear, semester, hakbun
) b
WHERE a.SCHOOLYEAR < '2013'
AND a.schoolyear = 학년도
AND a.SEMESTER = 학기
AND a.hakbun = b.학번
AND (a.ADMISSIONFEE + a.TUITION + a.ETCFEE - a.SCHOLARSHIP) <> b.납입금합계
AND a.HAKBUN = c.학번
AND SUBSTR(학적상태,1,1) IN ( '0', '1')
ORDER BY 학번, 학년도, 학기