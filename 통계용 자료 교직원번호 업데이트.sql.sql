--SELECT DISTINCT 이름, 생년월일 FROM TMR_교원총괄
UPDATE TMR_교원총괄 SET 교직원번호 = (SELECT 교직원코드 FROM tm인사
WHERE
TMR_교원총괄.이름 = tm인사.성 || tm인사.이름
AND tmr_교원총괄.생년월일 = '19' || SUBSTR(tm인사.주민번호,1,6)
AND 현상태 = '1')


WHERE ( 이름, 생년월일) IN (
SELECT TRIM(성 || 이름), '19' || SUBSTR(주민번호, 1,6) FROM tm인사)