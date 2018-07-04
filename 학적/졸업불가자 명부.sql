SELECT hj_hakbun, hj_kname, hg_kname
FROM AC1611, ac12011, AC1121
WHERE ju_jcheck = '1'
AND ju_hakbun = hj_hakbun AND hj_hgcode = hg_code