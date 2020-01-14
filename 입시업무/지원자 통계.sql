SELECT iw_year 입시연도, decode(SUBSTR(iw_chasu,1,1), '0', '정시', '9', '수시', '편입') 모집시기,
hg_name 학과명, 학교명, 시도교육청, SUBSTR(주소,1, INSTR(주소,' ')-1) 소재지,
COUNT(*) 지원자,
sum(CASE WHEN iw_result = '1' THEN 1
WHEN iw_result = '5' THEN  1 end) 합격자수
FROM ipsi.IPSI201, ipsi.IPSI104, tbl고등학교
WHERE iw_year >= :입시연도
AND iw_ggcode = 학교코드(+)
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
GROUP BY iw_year, hg_name, SUBSTR(iw_chasu,1,1), 학교명, 시도교육청, 주소
ORDER BY hg_name;
