SELECT 학자금코드, DECODE(CHANGECD, '52', '15', '53', '14', '11') 학적코드,
주민등록번호, a.학번, 성 || 이름 성명,
학년, '' 졸업예정일자, 등록금 --+ NVL(payment,0) 등록금
FROM tm학적 a, tm학과 b,
--(SELECT hakbun, SUM(DECODE(state, '88', -fee, fee)) + SUM(DECODE(state, '88', -etcfee, etcfee)) 등록금 FROM TDFEERECEIVE
(SELECT hakbun, rcvamt 등록금 FROM TDFEEGOJI
WHERE schoolyear = :학년도 AND semester = :학기
AND studentgbn <> '30304000'
--GROUP BY hakbun ) d,
) d,
(SELECT * FROM TDSCHOOLCHG WHERE CHANGECD IN ('52', '53') AND SCHOOLYEAR = :학년도 AND SEMESTER = :학기) c
--where a.학번 LIKE 'A' || SUBSTR(:학년도,3,2) || '%'
WHERE  SUBSTR(a.학적상태,1,1) IN ('0', '1')
AND (a.학번 LIKE 'A' || SUBSTR(:학년도,3,2) || '%' OR (학번 IN
(SELECT hakbun FROM TDSCHOOLCHG WHERE CHANGECD IN ('52', '53') AND SCHOOLYEAR = :학년도 AND SEMESTER = :학기)))
AND a.학과코드 = b.학과코드
AND a.학번 = d.hakbun
AND a.학번 = c.HAKBUN(+)
