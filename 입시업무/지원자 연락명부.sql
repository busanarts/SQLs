SELECT iw_shno 수험번호, iw_kname 성명, iw_jcode1 || '-' || iw_jcode2 주민번호, hg_name 지원학과,
DECODE(iw_result, '1', '합격(' || iw_rank1 || ')', '2', '예비합격(' || iw_rank2 || ')', '불합격') 합격여부,
iw_ucode1 ||'-' || iw_ucode2 우편번호, iw_addr1 주소1, iw_addr2 주소2,
SUBSTR(iw_hdtel,1,3) || '-' || SUBSTR(iw_hdtel,4,4) || '-' || SUBSTR(iw_hdtel,8,4) 핸드폰, iw_chasu 차수
FROM IPSI201, IPSI104
WHERE iw_year = '2010' AND iw_chasu = '92'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
ORDER BY iw_chasu, hg_name, iw_result, iw_rank1, iw_rank2, iw_kname