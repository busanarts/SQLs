SELECT 학과명,
       max(decode(성별, '남', 취득자수, 0)) "남",
       max(decode(성별, '여', 취득자수, 0)) "여"
  FROM
       (SELECT 학과명,
              decode(hj_sexgbn, '1', '남','2', '여') 성별,
              count(*) 취득자수
         FROM ac12011_20140401,
              ac1511,
              ac1121,
              tbl학과
        WHERE hj_hakbun = lr_hakbun
              AND lr_date >= :학년도 - 1 || '0301' AND lr_date <= :학년도  ||'0229'
              AND lr_result = 'Y'
              AND hj_hgcode = hg_code
              AND hg_mcode = 학과코드
        GROUP BY CUBE(학과명, hj_sexgbn)
       )
 GROUP BY 학과명
 ORDER BY 학과명