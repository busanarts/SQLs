INSERT INTO tm����
(
SELECT iw_jsno, substr(iw_kname,1,1), SUBSTR(iw_kname,2), DECODE(iw_sexgubun, '1', '��', '2', '��'),
iw_jcode1 || iw_jcode2, hg_mcode �а��ڵ�, '' �����ڵ�, DECODE(iw_chasu, '50', '2', '1') �г�, '00' ��������,
'', '', '', '', '', '', iw_jhgubun, iw_jsno, iw_ucode1 || iw_ucode2,
iw_addr1, iw_addr2,
rpad(iw_telno1, 4, ' ') || '-' || RPAD(TRIM(iw_telno2), 4, ' ') || '-' || RPAD(iw_telno3, 4, ' '), USR_TOTELNO(iw_hdtel), iw_email,
'sahn', SYSDATE, '', '00' �Է±���, '' ��, '' �������ڵ�, iw_chasu �Խ�����, '', '', '', ''
FROM ipsi.IPSI201, ipsi.ipsi104 aa, psutis.ac1121 bb
WHERE iw_year = :�Խó⵵
AND iw_result IN('1', '5') AND iw_chasu = :����
AND iw_shno NOT IN (SELECT �й� FROM tm����)
AND iw_jwhgcode1 = aa.hg_code AND hg_gycode = bb.hg_code(+)
AND iw_year = hg_year
)
