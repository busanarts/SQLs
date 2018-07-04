UPDATE TM학적 AA SET 학번 = (SELECT hj_hakbun FROM PSUTIS.AC12011, tm학적 aa
WHERE HJ_jcode1 = SUBSTR(AA.주민등록번호,1,6) AND hj_jcode2 = SUBSTR(aa.주민등록번호,7,7)
)
WHERE 주민등록번호 IN (
SELECT 주민등록번호
FROM TM학적, PSUTIS.AC12011
WHERE 학번 <> HJ_HAKBUN
AND 주민등록번호 = hj_jcode1 || hj_jcode2
AND 학적상태 = '01'
AND hj_hakbun LIKE 'A14%'
);
