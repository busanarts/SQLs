SELECT 학과명, 학번, 성명,
       MAX(DECODE(학년 || 학기, '11', 취득학점, 0)) "1-1학기 취득학점",
       MAX(TO_CHAR(DECODE(학년 || 학기, '11', 평점평균, 0), '0.99')) "1-1학기 평점평균",
       MAX(DECODE(학년 || 학기, '12', 취득학점, 0)) "1-2학기 취득학점",
       MAX(TO_CHAR(DECODE(학년 || 학기, '12', 평점평균, 0), '0.99')) "1-2학기 평점평균",
       MAX(DECODE(학년 || 학기, '21', 취득학점, 0)) "2-1학기 취득학점",
       MAX(TO_CHAR(DECODE(학년 || 학기, '21', 평점평균, 0), '0.99')) "2-1학기 평점평균",
       MAX(DECODE(학년 || 학기, '22', 취득학점, 0)) "2-2학기 취득학점",
       MAX(TO_CHAR(DECODE(학년 || 학기, '22', 평점평균, 0), '0.99')) "2-2학기 평점평균",
       SUM(취득학점) 총취득학점,
       TO_CHAR(SUM(총평점) / SUM(취득학점), '0.99') 총평점평균
  FROM
       (SELECT 학과명, HAKBUN 학번, 성 || 이름 성명, lvl 학년, semester 학기,
              SUM(SJ_HJUM) 취득학점, SUM(SJ_PJUM * SJ_HJUM) 총평점,
              ROUND(SUM(SJ_PJUM * SJ_HJUM) / SUM(SJ_HJUM), 2) 평점평균
         FROM PSUTIS.AC12011, PSUTIS.tdresult, psutis.AC1121, psutis.TBL학과
        WHERE HGCODE = HG_CODE
              AND HG_MCODE = 학과코드 --AND  HAKBUN IN  (SELECT DISTINCT hakbun FROM tdresult WHERE HAKBUN = hakbun AND lvl = '2' AND  semester = '2')
              AND HAKBUN IN
              (SELECT DISTINCT hakbun
                FROM psutis.tdresult
               WHERE HAKBUN = hakbun
                     AND schoolyear = DECODE(:졸업구분, '전기', :학년도, '후기', :학년도 + 1)
                     AND semester = DECODE(:졸업구분, '전기', '2', '후기', '1')
              )
              AND HAKBUN = hakbun
              AND HAKNYUN = '2'
              AND STATE = '01'
              AND  HAKBUN IN  (SELECT DISTINCT hakbun FROM PSUTIS.tdresult WHERE HAKBUN = hakbun AND lvl = '2' AND  semester = '2')
              --AND SJ_DUNGGUB NOT IN ('F') --AND HAKBUN IN (SELECT HC_HAKBUN FROM psutis.AC1202 WHERE HC_SCODE = '61') -- 유급자
        GROUP BY 학과명, HAKBUN, 성명, lvl, semester
       )
 GROUP BY 학과명, 학번, 성명
ORDER BY 학과명, 총평점평균 desc