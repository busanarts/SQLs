SELECT DECODE(SUBSTR(IW_CHASU,1,1), '9', '수시', '정시') || SUBSTR(IW_CHASU,2,1) || '차' 차수,
       IW_SHNO 수험번호, IW_KNAME 성명, IW_JCODE1 || '-' || IW_JCODE2 주민번호,
       IW_GGCODE 고교코드, IW_GGNAME 출신학교명, IW_GGJYEAR 졸업년도,
       HG_NAME 지원학과, JG_NAME 전형구분, JG_FNAME 전형구분상세,
       DECODE(IW_RESULT, '1', '합격', '2', '예비합격', '3', '불합격', '4', '합격포기', '5', '충원합격') 합격여부,
       DECODE(IW_DUNGROK, '1', '등록', '4', '환불') 등록여부,
       DECODE(IW_MJCHECK, '1', '적합', '0', '처리안됨', '2', '결시', '3', '부적격') 면접체크, IW_BIGO 비고,
       IW_RANK1 전형별순위, DECODE(SIGN(IW_RANK2), 1, IW_RANK2) 예비합격순위,
       TO_CHAR(SJ_NSHJUM, '9990.99') 내신환산점수, TO_CHAR(SJ_SGHJUM, '9990.99') 실기환산점수, TO_CHAR(SJ_TOTJUM, '9990.99') 입시총점,
       SG_JUMSU1 실기점수1, SG_JUMSU2 실기점수2, SG_JUMSU3 실기점수3, SG_JUMSU4 실기점수4, SG_JUMSU5 실기점수5, TO_CHAR(SG_AVGJUMSU, '9999.99') 실기점수평균,
       SJ_KORISU1 내신1_1학기, SJ_KORISU2 내신1_2학기, SJ_NATISU1 내신2_1학기, SJ_NATISU2 내신2_2학기, SJ_NSTOT 내신총점

--FROM IPSI.IPSI201, IPSI.IPSI108, IPSI.IPSI104, IPSI.IPSI202, IPSI303
--WHERE IW_YEAR = :입시연도 and iw_chasu = :차수 AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year AND IW_JHGUBUN = JG_CODE
--      AND IW_YEAR = SJ_YEAR(+) AND IW_CHASU = SJ_CHASU(+) AND IW_JSNO = SJ_JSNO(+)
--      AND IW_YEAR = SG_YEAR(+) AND IW_CHASU = SG_CHASU(+) AND IW_SHNO = SG_SHNO(+)
      --AND iw_jwhgcode1 = '04'

FROM IPSI.IPSI201 JW
	LEFT OUTER JOIN IPSI.IPSI202
      ON IW_YEAR = SJ_YEAR AND IW_CHASU = SJ_CHASU AND IW_JSNO = SJ_JSNO
  LEFT OUTER JOIN IPSI.IPSI303
  	ON IW_YEAR = SG_YEAR AND IW_CHASU = SG_CHASU AND IW_SHNO = SG_SHNO
      --AND iw_jwhgcode1 = '04'
  LEFT OUTER JOIN IPSI.IPSI104
  	ON IW_JWHGCODE1 = HG_CODE AND iw_year = hg_year
  LEFT OUTER JOIN IPSI.IPSI108
    ON IW_JHGUBUN = JG_CODE
WHERE IW_YEAR = :입시연도
and iw_chasu = :차수

ORDER BY DECODE(SUBSTR(IW_CHASU,1,1), '9', '수시', '정시'), SUBSTR(IW_CHASU,2,1), IW_JWHGCODE1, SUBSTR(IW_JHGUBUN,1,1), SJ_TOTJUM DESC