SELECT 학과명, DECODE(SUBSTR(iw_jhgubun,1,1), '5', '정원외', '정원내') 전형구분,
COUNT(*) 등록인원
FROM ipsi.IPSI201, TDFEEGOJI, tm학과
WHERE iw_year = :입시연도
AND iw_result = '1'
AND iw_year = schoolyear
AND iw_shno = hakbun
AND state  NOT IN( '11', '88')
AND studentgbn <> '30304000'
AND CLASS = 학과코드
GROUP BY CUBE(학과명, DECODE(SUBSTR(iw_jhgubun,1,1), '5', '정원외', '정원내'))
ORDER BY 학과명