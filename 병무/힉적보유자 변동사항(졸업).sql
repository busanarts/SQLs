SELECT 학번, 성 || 이름 성명, 주민등록번호, 지번주소 || ' ' || 상세주소 주소, b.학과명, USR_LCDATE(학번) 최종학적변동일자, 명칭 변동사유, '' 비고
FROM tm학적 a, tm학과 b, tm학적코드
WHERE a.학과코드 = b.학과코드
AND 성별 = '남'
AND 학적상태 = '81'
AND USR_LCDATE(학번) > '2015'
AND 학적상태 = 학적코드