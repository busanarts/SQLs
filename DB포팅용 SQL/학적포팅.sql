INSERT INTO tm학적
SELECT hj_hakbun, SUBSTR(hj_kname, 1,1), SUBSTR(hj_kname, 2), DECODE(hj_sexgbn, '1', '남', '2', '여'),
hj_jcode1 || hj_jcode2, 학과코드, '', hj_haknyun, hj_state, hj_lcymd, hj_lcscode, hj_iymd, hj_jymd, '', '',
hj_jhgbn, hj_shno, hj_crucode1 || hj_crucode2, hj_craddr1, hj_craddr2, hj_hsghtel, hj_hshptel, hj_email,
'sahn', SYSDATE, '', '00' 입력구분, hj_ban, '' 부전공코드, '' 입시차수, hj_jolupno, hj_hakwino, ''
FROM psutis.ac12011, psutis.ac1121, psutis.tbl학과
WHERE hj_hakbun NOT IN (SELECT 학번 FROM TM학적)
AND hj_hgcode = hg_code AND hg_mcode = 학과코드
AND HJ_HAKBUN NOT IN (SELECT 학번 FROM TM학적)
