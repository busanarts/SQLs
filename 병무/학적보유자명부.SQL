SELECT 성 || 이름 성명, 주민등록번호, armycode 학과, '2' 학년제, ' ' 학기제, 학년, SUBSTR(입학일자,1,4) 입학년도,
TO_CHAR(DECODE(학년, '1', TO_NUMBER(SUBSTR(입학일자,1,4)) + 2,
TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE, 'YYYYMMDD'),1,4)) + 1 ), '9999') 졸업년도,
' ' 편입여부, '1' 주야구분, '    ' 재외국민여부, 전자우편, 휴대전화
--FROM tm학적 a, tm학과 b
FROM tm학적 a, psutis.TMHAKGWA b
WHERE 성별 = '남'
--AND SUBSTR(학적상태,1,1) IN ('0')
AND 학적상태 = '01'
AND a.학과코드 = b.hgcode

