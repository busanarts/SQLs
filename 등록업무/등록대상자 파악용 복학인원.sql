SELECT hj_haknyun 학년, hg_kname 학과, COUNT(*) 재학인원
FROM psutis.AC12011, psutis.AC1121
--WHERE hj_haknyun = '1'
WHERE  hj_state = '01'
AND hj_hakbun IN (SELECT hc_hakbun FROM psutis.AC1202 WHERE hc_siymd > '201301' AND SUBSTR(hc_scode,1,1) = '5')
AND hj_hgcode = hg_code
GROUP BY hj_haknyun, hg_kname
ORDER BY hj_haknyun, hg_kname