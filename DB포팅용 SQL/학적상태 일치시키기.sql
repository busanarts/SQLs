UPDATE CISS.TM학적 AA SET 학적상태 = (SELECT HJ_STATE FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.학번)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011
WHERE 학번 = HJ_HAKBUN
AND 학적상태 <> HJ_STATE
);

UPDATE TM학적 AA SET 성 = (SELECT SUBSTR(HJ_KNAME,1,1) FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.학번),
이름= (SELECT SUBSTR(HJ_KNAME,2) FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.학번)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011
WHERE 학번 = HJ_HAKBUN
AND 성 || 이름 <> HJ_KNAME
);

UPDATE TM학적 AA SET 학과코드 = (SELECT hg_mcode
FROM PSUTIS.AC12011,psutis.ac1121 WHERE HJ_HAKBUN = AA.학번 AND hj_hgcode = hg_code)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011, psutis.ac1121
WHERE 학번 = HJ_HAKBUN AND hj_hgcode = hg_code
AND 학과코드 <> hg_mcode
);

UPDATE TM학적 AA SET 학년 = (SELECT hj_haknyun FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.학번)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011
WHERE 학번 = HJ_HAKBUN
AND 학년 <> hj_haknyun);

/*UPDATE TM학적 AA SET 지번주소 = (SELECT hj_craddr1 FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.학번),
								     상세주소 = (SELECT hj_craddr2 FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.학번),
                     우편번호 = (SELECT hj_crucode1 || hj_crucode2 FROM PSUTIS.AC12011 WHERE HJ_HAKBUN = AA.학번)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011
WHERE 학번 = HJ_HAKBUN
AND 상세주소 <> hj_craddr2);

UPDATE TM학적 AA SET 휴대전화 = (SELECT SUBSTR(hj_hshptel,1,3) || '-' || SUBSTR(hj_hshptel,4,4) || '-' || SUBSTR(hj_hshptel,8,4) FROM psutis.AC12011 WHERE hj_hakbun = AA.학번)
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011
WHERE 학번 = HJ_HAKBUN
AND TRIM(휴대전화) <> TRIM(hj_hshptel));

--UPDATE TM학적 AA SET 집전화 = (SELECT SUBSTR(hj_hshptel,1,3) || '-' || SUBSTR(hj_hshptel,4,4) || '-' || SUBSTR(hj_hshptel,8,4) FROM psutis.AC12011 WHERE hj_hakbun = AA.학번)
UPDATE TM학적 AA SET 집전화 = (SELECT TRIM(hj_hshptel) FROM psutis.AC12011 WHERE hj_hakbun = AA.학번)
WHERE 학번 IN (
SELECT 학번
FROM TM학적, PSUTIS.AC12011
WHERE 학번 = HJ_HAKBUN
AND 집전화 <> hj_hsghtel);
*/

/*UPDATE TM학적 aa SET 졸업일자 = (SELECT hj_jymd FROM psutis.AC12011 WHERE hj_hakbun = aa.학번 ),
								졸업증서번호= (SELECT hj_jolupno FROM psutis.AC12011 WHERE hj_hakbun = aa.학번),
                학위번호= (SELECT hj_hakwino FROM psutis.AC12011 WHERE hj_hakbun = aa.학번)
WHERE 학번 IN (
SELECT 학번 FROM tm학적, psutis.AC12011
WHERE 학번 = hj_hakbun
AND 학적상태 LIKE '8%'
AND 졸업일자 IS null);
*/