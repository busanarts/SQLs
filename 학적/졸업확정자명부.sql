SELECT hg_kname 학과명, ju_hakbun 학번, hj_kname 성명,
hj_jcode1 || '-' || hj_jcode2 주민번호,ju_jno 졸업증서번호, ju_hno 학위번호,
hj_iymd 입학일자
FROM AC1611, AC12011, ac1121
WHERE ju_jcheck = '0'
AND ju_hakbun = hj_hakbun
AND hj_hgcode = hg_code
ORDER BY hg_kname, ju_jno
