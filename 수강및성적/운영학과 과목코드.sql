SELECT hg_kname 학과, gm_code 교과코드, gm_kname 교과명
FROM AC1302, AC1121
WHERE hg_open = '1'
AND hg_code = SUBSTR(gm_code,1,2)
ORDER BY hg_kname, gm_code