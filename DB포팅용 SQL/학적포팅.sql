INSERT INTO tm����
SELECT hj_hakbun, SUBSTR(hj_kname, 1,1), SUBSTR(hj_kname, 2), DECODE(hj_sexgbn, '1', '��', '2', '��'),
hj_jcode1 || hj_jcode2, �а��ڵ�, '', hj_haknyun, hj_state, hj_lcymd, hj_lcscode, hj_iymd, hj_jymd, '', '',
hj_jhgbn, hj_shno, hj_crucode1 || hj_crucode2, hj_craddr1, hj_craddr2, hj_hsghtel, hj_hshptel, hj_email,
'sahn', SYSDATE, '', '00' �Է±���, hj_ban, '' �������ڵ�, '' �Խ�����, hj_jolupno, hj_hakwino, ''
FROM psutis.ac12011, psutis.ac1121, psutis.tbl�а�
WHERE hj_hakbun NOT IN (SELECT �й� FROM TM����)
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
AND HJ_HAKBUN NOT IN (SELECT �й� FROM TM����)
