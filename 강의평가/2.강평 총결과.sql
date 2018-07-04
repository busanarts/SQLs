SELECT * FROM
(SELECT * FROM tbl강의평가
WHERE 학년도 = :학년도 AND 학기 = :학기
UNION
SELECT 학년도, 학기, '' 학과명, 교수명, '' 과목명, '' 설문내용,
--'' 아주그렇다, '' 그렇다, '' 보통이다, '' 아니다, '' 전혀아니다,
SUM(아주그렇다) 아주그렇다, SUM(그렇다) 그렇다, SUM(보통이다) 보통이다, SUM(아니다) 아니다, SUM(전혀아니다) 전혀아니다,
ROUND(AVG(평점평균), 2) 평점평균,  SUM (응답자수) 응답자수,  ROUND(AVG(평점평균), 2) 환산평점
FROM tbl강의평가
WHERE 학년도 = :학년도 AND 학기 = :학기
GROUP BY 학년도, 학기, 교수명)
ORDER BY 교수명, 과목명, 설문내용