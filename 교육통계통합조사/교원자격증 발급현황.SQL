SELECT '200801' 조사기간코드,
       '73148000' 학교코드,
       교육부학과코드,
       주야구분,
       '1' 본분교구분,
       'C' 학교구분,
       'C' 학교종류,
       '3' 설립구분,
       '21' 지역코드,
       교육부전공코드,
       학과명,
       '단과대구분없음' 단과대,
       max(decode(성별, '남', 취득자수, 0)) "남",
       max(decode(성별, '여', 취득자수, 0)) "여"
  FROM
       (SELECT 교육부학과코드,
              학과명,
              교육부전공코드,
              decode(주야구분, '주', '1', '야', '2') 주야구분,
              decode(hj_sexgbn, '1', '남','2', '여') 성별,
              count(*) 취득자수
         FROM ac12011,
              ac1511,
              ac1121,
              tbl학과
        WHERE hj_hakbun = lr_hakbun
              AND lr_date >= :발급일자
              AND lr_result = 'Y'
              AND hj_hgcode = hg_code
              AND hg_mcode = 학과코드
        GROUP BY 교육부학과코드,
              주야구분,
              교육부전공코드,
              학과명,
              hj_sexgbn
       )
 GROUP BY 교육부학과코드,
       주야구분,
       교육부전공코드,
       학과명