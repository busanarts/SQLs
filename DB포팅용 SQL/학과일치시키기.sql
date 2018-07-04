UPDATE TM학적 AA SET 학과코드 = (SELECT hg_mcode
FROM PSUTIS.AC12011,psutis.ac1121 WHERE HJ_HAKBUN = AA.학번 AND hj_hgcode = hg_code)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011, psutis.ac1121
WHERE 학번 = HJ_HAKBUN AND hj_hgcode = hg_code
AND 학과코드 <> hg_mcode
);