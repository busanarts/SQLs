SELECT aa.hc_hakbun, siymd, hc_scode FROM (
SELECT hc_hakbun, MAX(hc_siymd) siymd
FROM AC1202 WHERE  hc_siymd >= &NowYear - 7 || '1201' AND hc_siymd < &NowYear || '0401'
GROUP BY hc_hakbun) aa, AC1202 bb
WHERE aa.hc_hakbun = bb.hc_hakbun
AND aa.siymd = bb.hc_siymd
AND SUBSTR(hc_scode,1,1) IN ('1')