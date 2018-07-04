INSERT INTO tm학적
(
SELECT iw_jsno, substr(iw_kname,1,1), SUBSTR(iw_kname,2), DECODE(iw_sexgubun, '1', '남', '2', '여'),
iw_jcode1 || iw_jcode2, hg_mcode 학과코드, '' 전공코드, DECODE(iw_chasu, '50', '2', '1') 학년, '00' 학적상태,
'', '', '', '', '', '', iw_jhgubun, iw_jsno, iw_ucode1 || iw_ucode2,
iw_addr1, iw_addr2,
rpad(iw_telno1, 4, ' ') || '-' || RPAD(TRIM(iw_telno2), 4, ' ') || '-' || RPAD(iw_telno3, 4, ' '), USR_TOTELNO(iw_hdtel), iw_email,
'sahn', SYSDATE, '', '00' 입력구분, '' 반, '' 부전공코드, iw_chasu 입시차수, '', '', '', ''
FROM ipsi.IPSI201, ipsi.ipsi104 aa, psutis.ac1121 bb
WHERE iw_year = :입시년도
AND iw_result IN('1', '5') AND iw_chasu = :차수
AND iw_shno NOT IN (SELECT 학번 FROM tm학적)
AND iw_jwhgcode1 = aa.hg_code AND hg_gycode = bb.hg_code(+)
AND iw_year = hg_year
)
