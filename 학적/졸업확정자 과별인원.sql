SELECT �а���, COUNT(*) �ο�
FROM AC12011, AC1611, AC1121, tbl�а�
WHERE hj_state = '01'
AND hj_hakbun = ju_hakbun
--AND sj_dunggub <> 'F'
AND ju_jcheck = '0'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
GROUP BY �а���
ORDER BY �а���
--HAVING COUNT(DISTINCT sj_year || sj_hakgi) >= 4