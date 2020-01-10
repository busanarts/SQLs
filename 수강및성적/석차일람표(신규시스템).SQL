SELECT *
  FROM
       (SELECT '' 순위대상여부,
              K.*
         FROM
              (SELECT AA.*,
                     RANK() OVER(PARTITION BY HGKNAME, 학년 ORDER BY 평점평균 DESC, 백분율점수 DESC) 순위
                FROM
                     (SELECT HGKNAME,
                            LVL 학년,
                            학번,
                            성||이름 성명,
                            --HJ_JCODE1 || '-' || HJ_JCODE2 주민번호,
                            --HB_NAME 학적구분,
                            SUM (GRADEJUM) 신청학점,
                            SUM(DECODE(GRADELVL, 'F', 0, GRADEJUM)) 취득학점,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '21', GRADEJUM, 0))) 전필취득,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '22', GRADEJUM, 0))) 전선취득,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '11', GRADEJUM, 0))) 교필취득,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '12', GRADEJUM, 0))) 교선취득,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '41', GRADEJUM, 0))) 자선취득,
                            ROUND(SUM(DECODE(OLDCODE, '13', 0, GRADEJUM * AVEJUMSU)) / SUM(DECODE(OLDCODE, '13', 0, GRADEJUM)),2) 평점평균,
                            ROUND(SUM(DECODE(OLDCODE, '13', 0, GRADEJUM * TOTJUMSU)) / SUM(DECODE(OLDCODE, '13', 0, GRADEJUM)),2) 백분율점수
                       FROM psutis.TDRESULT R,
                            tm학적,
                            psutis.TMHAKGWA H, psutis.VIW이수구분

                      WHERE SCHOOLYEAR = :학년도
                            AND SEMESTER = :학기
                            AND INJUNG = 'Y'
                            AND HAKBUN = 학번
                            AND R.HGCODE = H.HGCODE
                            AND OLDCODE = SUBSTR(STUDYGBN,7,2)
                            AND SGHGCODE <> '99' --AND HJ_STATE = '01'
                      GROUP BY HGKNAME,
                            LVL,
                            학번,
                            성,이름,
                            주민등록번호
                     HAVING SUM(DECODE(GRADELVL, 'F', 0, GRADEJUM)) >= 10
                     ) AA
              ) K
           UNION
       SELECT '순위비대상' 순위대상여부,
              K.*
         FROM
              (SELECT AA.*,
                     0
                FROM
                     (SELECT HGKNAME,
                            LVL 학년,
                            학번,
                            성||이름  성명,
                            --HJ_JCODE1 || '-' || HJ_JCODE2 주민번호,
                            --HB_NAME 학적구분,
                            SUM (GRADEJUM) 신청학점,
                            SUM(DECODE(GRADELVL, 'F', 0, GRADEJUM)) 취득학점,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '21', GRADEJUM, 0))) 전필취득,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '22', GRADEJUM, 0))) 전선취득,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '11', GRADEJUM, 0))) 교필취득,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '12', GRADEJUM, 0))) 교선취득,
                            SUM(DECODE(GRADELVL, 'F', 0, DECODE(OLDCODE, '41', GRADEJUM, 0))) 자선취득,
                            ROUND(SUM(DECODE(OLDCODE, '13', 0, GRADEJUM * AVEJUMSU)) / SUM(DECODE(OLDCODE, '13', 0, GRADEJUM)), 2) 평점평균,
                            ROUND(SUM(DECODE(OLDCODE, '13', 0, GRADEJUM * TOTJUMSU)) / SUM(DECODE(OLDCODE, '13', 0, GRADEJUM)), 2) 백분율점수
                       FROM psutis.TDRESULT R,
                            tm학적,
                            psutis.TMHAKGWA H, psutis.VIW이수구분

                      WHERE SCHOOLYEAR = :학년도
                            AND SEMESTER = :학기
                            AND INJUNG = 'Y'
                            AND HAKBUN = 학번
                            AND R.HGCODE = H.HGCODE
                            AND OLDCODE = SUBSTR(STUDYGBN,7,2)
                            AND SGHGCODE <> '99' --AND HJ_STATE = '01'
                      GROUP BY HGKNAME,
                            LVL,
                            학번 ,
                            성||이름 ,
                            주민등록번호
                     HAVING SUM(DECODE(GRADELVL, 'F', 0, GRADEJUM)) < 10
                     ) AA
              ) K
       )
ORDER BY 순위대상여부 DESC,
       HGKNAME,
       학년,
       순위