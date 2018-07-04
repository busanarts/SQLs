--INSERT INTO CISS.t학적변동기록
INSERT INTO TDSCHOOLCHG
SELECT  hc_hakbun, hc_siymd, SUBSTR(hc_siymd,1,4),
CASE WHEN substr(hc_siymd,5,2) >= '01' AND SUBSTR(hc_siymd, 5,2) <= '06' THEN '1'
ELSE '2'
END, hc_haknyun, '', HC_SCODE, HC_YEAR, HC_HAKGI, HC_HAKNYUN, HC_OHGCODE, HC_CHGCODE,
'', 'N', 'sahn', '', '', '' FROM psutis.ac1202
WHERE hc_siymd >= :학적변동일
AND (hc_siymd, hc_hakbun, HC_SCODE) NOT IN (SELECT CHANGEDT, HAKBUN, CHANGECD FROM CISS.TDSCHOOLCHG)
--GROUP BY hc_hakbun, hc_scode, hc_year, hc_hakgi, hc_haknyun
--HAVING COUNT(*) > 1
