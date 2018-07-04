SELECT janghakcd 장학코드, janghaknm 장학명, DECODE(janghakgbn, '10', '교내', '20', '교외', '30', '국가') 장학구분,
DECODE(scholarship1, '1', '감면') 입학장학금, DECODE(scholarship2, '1', '감면') 수업장학금, scholarship3 기타장학금, bigo 비고
FROM TMSCHOLARSHIP
WHERE useyn= 'Y'
ORDER BY janghaknm