Select hg_name 지원학과, iw_shno 수험번호, iw_kname 성명, JG_NAME 전형구분, JG_FNAME 전형구분상세,
USR_TOTELNO(iw_hdtel) 핸드폰, iw_telno1 || '-' || iw_telno2 || '-' || iw_telno3 전화번호,
iw_ucode1 || '-' || iw_ucode2 우편번호, iw_addr1 || ' ' || iw_addr2 주소,
DECODE(SUBSTR(IW_CHASU,1,1), '9', '수시', '정시') || SUBSTR(IW_CHASU,2,1) || '차' 차수
From  IPSI201, IPSI104, IPSI108
Where iw_year      = :입시년도 and iw_chasu like :차수 || '%'
and iw_result = '1'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
AND iw_jhgubun = jg_code
order by iw_chasu, hg_name, iw_kname
