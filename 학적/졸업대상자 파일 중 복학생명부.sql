SELECT hj_hakbun �й�, hj_kname ���� FROM AC1611, AC12011
WHERE ju_hakbun IN (SELECT hc_hakbun
FROM AC1202 WHERE hc_siymd > '201112' AND hc_scode IN ('51', '61'))
AND ju_hakbun = hj_hakbun