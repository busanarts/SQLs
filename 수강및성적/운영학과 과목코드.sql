SELECT hg_kname �а�, gm_code �����ڵ�, gm_kname ������
FROM AC1302, AC1121
WHERE hg_open = '1'
AND hg_code = SUBSTR(gm_code,1,2)
ORDER BY hg_kname, gm_code