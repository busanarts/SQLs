SELECT �а���, hj_haknyun �г�, hj_hakbun �й�, hj_kname ����
FROM AC12011, AC1121, tbl�а�
WHERE hj_state = '01'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
AND hj_hakbun NOT IN (SELECT distinct sj_hakbun FROM AC1401 WHERE sj_year = '2011' AND sj_hakgi = '2')
ORDER BY �а���, �г�, ����
