SELECT hakbun, 성 || 이름 성명, lvl 학년, semester 학기, COUNT(*) 등록횟수
FROM TDFEEGOJI, TM학적
WHERE hakbun = 학번
AND SUBSTR(학적상태,1,1)  IN ('0')
AND admissionfee + tuition > 1000000
AND
GROUP BY hakbun, 성, 이름, lvl, semester
HAVING COUNT(*) > 1
