UPDATE TM학적 AA SET 학년 = (SELECT hj_haknyun FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.학번)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011
WHERE 학번 = HJ_HAKBUN
AND 학년 <> hj_haknyun)



