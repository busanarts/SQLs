--SELECT '73429000' 학교코드, HJ_KNAME 성명, HJ_JCODE1 || HJ_JCODE2 주민등록번호,
SELECT ROWNUM 연번, 성 || 이름 성명, 주민등록번호,
졸업일자 최종학적변동일
FROM tm학적
WHERE 학적상태 = DECODE(:졸업구분, '전기', '81', '후기', '83') AND SUBSTR(주민등록번호,7,1) IN ('1', '3')
AND SUBSTR(졸업일자,1,4) = :연도