SELECT iw_ggcode 고교코드,iw_jcode1 || iw_jcode2 주민번호,   iw_jsno 수험번호, jg_name 전형구분,
decode(substr(iw_Chasu,1,1), '9', '수시', '정시') || substr(iw_chasu,2,1) || '차' 차수,
hg_name 지원학과명,iw_kname 성명
FROM ipsi201, ipsi104, ipsi108
where iw_year  = :입시연도 And iw_Chasu = :차수
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year(+) -- 지원학과
and iw_jhgubun = jg_code(+) -- 전형구분
And substr(iw_ggcode,2,9) not in ('120000000', '100000001') -- 검정고시자 제외
And iw_jhgubun not in ('51','52','54') -- 대졸/전문대졸 제외
and iw_ggjyear >=  :입시연도 - 5
and iw_sgcheck = '1'   -- 학생부활용 동의자만 선택
