UPDATE TM���� AA SET �а��ڵ� = (SELECT hg_mcode
FROM PSUTIS.AC12011,psutis.ac1121 WHERE HJ_HAKBUN = AA.�й� AND hj_hgcode = hg_code)
--SELECT * FROM TM����
WHERE �й� IN (
SELECT �й�
FROM TM����, PSUTIS.AC12011, psutis.ac1121
WHERE �й� = HJ_HAKBUN AND hj_hgcode = hg_code
AND �а��ڵ� <> hg_mcode
);