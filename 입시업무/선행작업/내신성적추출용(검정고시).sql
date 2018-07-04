SELECT iw_ggcode 시도코드, iw_ggjyear 합격년도, SUBSTR(iw_ipsino, 11,1) 합격회차, iw_jcode1 || iw_jcode2 주민번호, iw_shno 수험번호, jg_name 전형구분,
decode(substr(iw_Chasu,1,1), '9', '수시', '정시') || substr(iw_chasu,2,1) || '차' 차수, hg_name 학과명
FROM ipsi201, ipsi104, ipsi108
where iw_year  = :입시연도 AND iw_chasu = :차수
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
and iw_jhgubun = jg_code
And substr(iw_ggcode,2,9) in ('120000000', '100000001')
-- And iw_jhgubun not in ('51','52','54')
and iw_ggjyear >= :입시연도 -  5
and iw_sgcheck = '1'   -- 학생부활용 동의자만 선택