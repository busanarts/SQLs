INSERT INTO CISS.t�����������
SELECT  hc_hakbun, hc_scode, hc_siymd, SUBSTR(hc_siymd,1,4),
CASE WHEN substr(hc_siymd,5,2) >= '01' AND SUBSTR(hc_siymd, 5,2) <= '06' THEN '1'
ELSE '2'
END , '',
hc_year, hc_hakgi, hc_haknyun, '', '', '', '', '' FROM psutis.ac1202
WHERE --hc_siymd >= :����������
(hc_siymd, hc_hakbun) NOT IN (SELECT ��������, �й� FROM CISS.T�����������)
--GROUP BY hc_hakbun, hc_scode, hc_year, hc_hakgi, hc_haknyun
--HAVING COUNT(*) > 1
