SELECT 학과명, 학번, 성 || 이름 성명, 학년, ADMISSIONFEE 입학금, TUITION 수업료,
		   '' 장학코드1,
       '' 장학금1,
       '' 장학코드2,
       '' 장학금2,
       '' 장학코드3,
       '' 장학금3,
       '' 장학코드4,
       '' 장학금4
  FROM TM학적 학적,
       TM학과 학과,
       Tmfeemast mst,
       TMFEEDTL dtl
 WHERE 학적상태 = '01'
       AND 학적.학과코드 = 학과.학과코드
       AND mst.SCHOOLYEAR = :학년도
       AND mst.SEMESTER = :학기
       AND 학적.학과코드 = DTL.CLASS
       AND 학적.학년 = DTL.LVL
       AND mst.SEQNO = DTL.SEQNO
ORDER BY 학적.학과코드,
       학번 --AND mst_TOTGUM - mst_TGMGUM > 0