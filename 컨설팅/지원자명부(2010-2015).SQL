SELECT DECODE(SUBSTR(IW_CHASU,1,1), '9', '수시', '정시') || SUBSTR(IW_CHASU,2,1) || '차' 차수, HG_NAME 지원학과,
JG_NAME 전형구분, JG_FNAME 전형구분상세,
IW_SHNO 수험번호, IW_KNAME 성명, IW_JCODE1 생년월일,
IW_GGNAME 출신학교명, IW_GGJYEAR 졸업년도,
       DECODE(IW_RESULT, '1', '합격', '2', '예비합격', '3', '불합격', '4', '합격포기', '5', '충원합격') 합격여부,
       DECODE(IW_DUNGROK, '1', '등록', '4', '환불') 등록여부
FROM ipsi.IPSI201, ipsi.IPSI104, ipsi.IPSI108
WHERE IW_YEAR >= '2010' AND IW_YEAR <= '2015'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year AND IW_JHGUBUN = JG_CODE
ORDER BY HG_NAME, IW_KNAME

