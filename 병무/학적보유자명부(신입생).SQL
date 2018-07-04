SELECT 성 || 이름 성명, 주민등록번호, '83320000' 학교, 학번,
armycode 학과, '2' 학년제, '4' 학기제, 학년, SUBSTR(입학일자,1,4) 입학년도,
SUBSTR(입학일자,1,4)+2 졸업년도, ' ' 편입여부, '1' 주야구분, ' ' 재외국민여부,
전자우편, 휴대전화
FROM tm학적 a, psutis.TMHAKGWA b
WHERE 성별 = '남'
--AND SUBSTR(학적상태,1,1) IN ('0')
AND 학적상태 = '01'
AND a.학과코드 = b.hgcode(+)
--AND f_getAGE(substr(주민등록번호,1,6),:기준일자) >= 17 AND f_getAGE(substr(주민등록번호,1,6),:기준일자) <= 28
AND SUBSTR(입학일자, 1,4) = :학년도
UNION
SELECT 성 || 이름 성명, 주민등록번호, '83320000' 학교, 학번,
armycode 학과, '2' 학년제, '4' 학기제, 학년, SUBSTR(입학일자,1,4) 입학년도,
SUBSTR(입학일자,1,4)+2 졸업년도, DECODE(changecd, '52', ' ', '53', '1', ' ') 편입여부, '1' 주야구분, ' ' 재외국민여부,
전자우편, 휴대전화
FROM tm학적 a, psutis.TMHAKGWA b, (SELECT * FROM tdschoolchg WHERE changedt > :학년도 AND changecd IN ('52', '53')) c
WHERE 성별 = '남'
--AND SUBSTR(학적상태,1,1) IN ('0')
AND 학적상태 = '01'
AND a.학과코드 = b.hgcode(+)
--AND f_getAGE(SUBSTR(주민등록번호,1,6),:기준일자 ) >= 18 AND f_getAGE(substr(주민등록번호,1,6),:기준일자) <= 28
AND changedt > TO_CHAR(:학년도)
AND 학번 = hakbun
