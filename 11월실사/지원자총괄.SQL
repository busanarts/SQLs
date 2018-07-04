SELECT DECODE(SUBSTR(iw_chasu, 1,1), '9', '수시', '0', '정시') || SUBSTR(iw_chasu,2,1) || '차'  차수,
hg_name 학과명, decode(substr(iw_jhgubun,1,1), '5', '정원외', '정원내') 정원내외, jg_name || '-' || jg_fname 상세전형구분,
iw_kname 성명, decode(substr(iw_jcode2,1,1),'1', '남', '여') 성별, iw_ggname 출신학교, 일반실업구분, iw_ggjyear 졸업년도,
DECODE(iw_result, '1', '합격', '2', '예비합격')  합격여부, DECODE(iw_dungrok, '1', '등록', '4', '환불') 등록여부, SI_HAKBUN 학번,
dr_drniymd 납입일자, dr_drhbymd 환불일자
FROM ipsi.IPSI201, ipsi.IPSI104, ipsi.IPSI108, ipsi.IPSI203, ipsi.IPSI401, ipsi.고등학교코드
WHERE iw_year = '2007'
and iw_jwhgcode1 = hg_code and iw_jhgubun = jg_code
and iw_ggcode = neis학교코드
AND iw_year = dr_year(+) AND iw_shno = dr_shno(+)
AND IW_YEAR = SI_YEAR(+) AND IW_JSNO = SI_SHNO(+)
ORDER BY SUBSTR(iw_chasu,1,1) DESC, SUBSTR(iw_chasu, 2,1), hg_name, iw_kname