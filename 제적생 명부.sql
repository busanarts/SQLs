SELECT hj_hakbun 학번, hj_kname 성명, hj_jcode1 || SUBSTR(hj_jcode2, 1,1) || '******' 주민번호,
hg_kname 학과, hj_haknyun 학년, hb_name 학적변동, usr_TODATE(hc_siymd) 학적변동일
FROM psutis.ac12011, psutis.ac1202, psutis.ac1121, psutis.ac1104
WHERE hc_siymd > :기준일자
and hc_scode in ('21', '24')
AND hj_hakbun = hc_hakbun
AND hj_hgcode = hg_code
AND hc_scode = hb_code
ORDER BY hc_siymd