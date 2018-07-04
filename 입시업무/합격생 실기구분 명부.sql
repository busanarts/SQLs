SELECT DECODE(SUBSTR(IW_CHASU,1,1), '9', '수시', '정시') || SUBSTR(IW_CHASU,2,1) || '차' 차수,
iw_shno 수험번호, iw_kname 성명, DECODE(iw_dungrok, '1', '등록') 등록여부, sc_name 실기명
FROM ipsi.IPSI201, ipsi.ipsi109
WHERE iw_year = '2015' --AND iw_chasu = '02'
AND iw_jwhgcode1 = '01'
AND iw_result IN ('1', '5')
AND iw_sgcode = sc_code

