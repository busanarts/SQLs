UPDATE CISS.TM���� AA SET �������� = (SELECT HJ_STATE FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.�й�)
--SELECT * FROM TM����
WHERE �й� IN (
SELECT �й�
FROM TM����, PSUTIS.AC12011
WHERE �й� = HJ_HAKBUN
AND �������� <> HJ_STATE
);

UPDATE TM���� AA SET �� = (SELECT SUBSTR(HJ_KNAME,1,1) FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.�й�),
�̸�= (SELECT SUBSTR(HJ_KNAME,2) FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.�й�)
--SELECT * FROM TM����
WHERE �й� IN (
SELECT �й�
FROM TM����, PSUTIS.AC12011
WHERE �й� = HJ_HAKBUN
AND �� || �̸� <> HJ_KNAME
);

UPDATE TM���� AA SET �а��ڵ� = (SELECT hg_mcode
FROM PSUTIS.AC12011,psutis.ac1121 WHERE HJ_HAKBUN = AA.�й� AND hj_hgcode = hg_code)
--SELECT * FROM TM����
WHERE �й� IN (
SELECT �й�
FROM TM����, PSUTIS.AC12011, psutis.ac1121
WHERE �й� = HJ_HAKBUN AND hj_hgcode = hg_code
AND �а��ڵ� <> hg_mcode
);

UPDATE TM���� AA SET �г� = (SELECT hj_haknyun FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.�й�)
--SELECT * FROM TM����
WHERE �й� IN (
SELECT �й�
FROM TM����, PSUTIS.AC12011
WHERE �й� = HJ_HAKBUN
AND �г� <> hj_haknyun);

/*UPDATE TM���� AA SET �����ּ� = (SELECT hj_craddr1 FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.�й�),
								     ���ּ� = (SELECT hj_craddr2 FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.�й�),
                     �����ȣ = (SELECT hj_crucode1 || hj_crucode2 FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.�й�)
--SELECT * FROM TM����
WHERE �й� IN (
SELECT �й�
FROM TM����, PSUTIS.AC12011
WHERE �й� = HJ_HAKBUN
AND ���ּ� <> hj_craddr2);

UPDATE TM���� AA SET �޴���ȭ = (SELECT SUBSTR(hj_hshptel,1,3) || '-' || SUBSTR(hj_hshptel,4,4) || '-' || SUBSTR(hj_hshptel,8,4) FROM psutis.AC12011 WHERE hj_hakbun = AA.�й�)
WHERE �й� IN (
SELECT �й�
FROM TM����, PSUTIS.AC12011
WHERE �й� = HJ_HAKBUN
AND TRIM(�޴���ȭ) <> TRIM(hj_hshptel));

--UPDATE TM���� AA SET ����ȭ = (SELECT SUBSTR(hj_hshptel,1,3) || '-' || SUBSTR(hj_hshptel,4,4) || '-' || SUBSTR(hj_hshptel,8,4) FROM psutis.AC12011 WHERE hj_hakbun = AA.�й�)
UPDATE TM���� AA SET ����ȭ = (SELECT TRIM(hj_hshptel) FROM psutis.AC12011 WHERE hj_hakbun = AA.�й�)
WHERE �й� IN (
SELECT �й�
FROM TM����, PSUTIS.AC12011
WHERE �й� = HJ_HAKBUN
AND ����ȭ <> hj_hsghtel);
*/

/*UPDATE TM���� aa SET �������� = (SELECT hj_jymd FROM psutis.AC12011 WHERE hj_hakbun = aa.�й� ),
								����������ȣ= (SELECT hj_jolupno FROM psutis.AC12011 WHERE hj_hakbun = aa.�й�),
                ������ȣ= (SELECT hj_hakwino FROM psutis.AC12011 WHERE hj_hakbun = aa.�й�)
WHERE �й� IN (
SELECT �й� FROM tm����, psutis.AC12011
WHERE �й� = hj_hakbun
AND �������� LIKE '8%'
AND �������� IS null);
*/