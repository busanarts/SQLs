SELECT hakbun 학번, 성 || 이름 성명, 학과명, lvl 학년, fee 수납환불금액, etcfee 예치금, DECODE(STATE, '77', '완납', '55', '승계', '88', '환불') 납부여부
FROM TDFEERECEIVE, TM학적 a, tm학과 b
WHERE SCHOOLYEAR = '2013' AND SEMESTER = '2'
AND CLASS = b.학과코드 AND  hakbun= 학번
--AND STATE <> '88'
UNION
SELECT hakbun 학번, 성 || 이름 성명, 학과명, lvl 학년, fee 수납환불금액, etcfee 예치금, DECODE(STATE, '77', '완납', '55', '승계', '88', '환불') 납부여부
FROM TDFEERECEIVE_전년도합격자, TM학적 a, tm학과 b
WHERE SCHOOLYEAR = '2013' AND SEMESTER = '2'
AND CLASS = b.학과코드 AND  hakbun= 학번
--AND STATE <> '88'