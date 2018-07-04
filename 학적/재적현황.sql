SELECT 학년, 학과명,
max(DECODE(성별, '남', 재적인원)) "재적인원(남)", max(DECODE(성별, '여', 재적인원)) "재적인원(여)",
max(DECODE(성별, '남', 재학인원)) "재학인원(남)", max(DECODE(성별, '여', 재학인원)) "재학인원(여)",
max(DECODE(성별, '남', 휴학인원)) "휴학인원(남)", max(DECODE(성별, '여', 휴학인원)) "휴학인원(여)"
FROM
(SELECT DISTINCT a.학년 학년, b.학과명 학과명, 성별,
count(학년) OVER (PARTITION BY a.학년, b.학과명, 성별) 재적인원,
SUM(DECODE(학적상태, '01', 1, 0)) OVER (PARTITION BY a.학년, b.학과명, 성별) 재학인원,
SUM(DECODE(학적상태, '01', 0, 1)) OVER (PARTITION BY a.학년, b.학과명, 성별) 휴학인원
FROM tm학적 a, tm학과 b
WHERE ((학적상태 = '01') OR (SUBSTR(학적상태,1,1) = '1'))
AND a.학과코드 = b.학과코드)
GROUP BY 학년, 학과명
ORDER BY 학년, 학과명