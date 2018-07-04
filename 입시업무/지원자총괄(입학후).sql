SELECT DECODE(SUBSTR(iw_chasu, 1,1), '9', '수시', '0', '정시') || SUBSTR(iw_chasu,2,1) || '차'  차수,
iw_shno 접수번호, iw_kname 성명, iw_jcode1 || '-' || iw_jcode2 주민번호,
hg_name 학과명, SI_HAKBUN 학번, decode(substr(iw_jhgubun,1,1), '5', '정원외', '정원내') 정원내외, jg_name || '-' || jg_fname 상세전형구분,
SUBSTR(iw_hdtel,1,3) || '-' || SUBSTR(iw_hdtel,4,4) || '-' || SUBSTR(iw_hdtel,8,4) 핸드폰,
iw_telno1 || '-' || iw_telno2 || '-' || iw_telno3 전화번호,
iw_ggcode 고교코드,
iw_ggname 출신학교, iw_ggjyear 졸업년도,
DECODE(IW_RESULT, '1', '합격', '2', '예비합격', '3', '불합격', '4', '합격포기', '5', '충원합격') 합격여부,
DECODE(state, '77', '완납', '88', '환불', '22', '부분납', '33', '납부유예', '11', '미납') 등록여부 --, DECODE(iw_sgcheck, '1', '예') 학생부활용동의
FROM ipsi.IPSI201, ipsi.IPSI104, ipsi.IPSI108, ciss.tdfeegoji, ipsi.IPSI401
WHERE iw_year = :입시년도
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year and iw_jhgubun = jg_code
AND si_year = schoolyear(+) AND si_hakbun = hakbun(+)
AND studentgbn(+) <> '30304000'
AND IW_YEAR = SI_YEAR(+) AND IW_JSNO = SI_SHNO(+)
ORDER BY SUBSTR(iw_chasu,1,1) DESC, SUBSTR(iw_chasu, 2,1), hg_name, iw_kname