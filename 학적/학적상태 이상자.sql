SELECT 학번, 성 || 이름 성명, 주민등록번호, 학년, 학적상태,
f_lcscode(학번) 최종학적변동코드, f_lcdate(학번) 최종학적변동일자
FROM tm학적
WHERE SUBSTR(학적상태,1,1) = '1'
AND SUBSTR(f_lcscode(학번),1,1) <> '1';
SELECT 학번, 성 || 이름 성명, 주민등록번호, 학년, 학적상태,
f_lcscode(학번) 최종학적변동코드, f_lcdate(학번) 최종학적변동일자
FROM tm학적
WHERE SUBSTR(학적상태,1,1) = '1'
AND SUBSTR(f_lcscode(학번),1,1) = '5';
SELECT 학번, 성 || 이름 성명, 주민등록번호, 학년, 학적상태,
f_lcscode(학번) 최종학적변동코드, f_lcdate(학번) 최종학적변동일자
FROM tm학적
WHERE SUBSTR(학적상태,1,1) = '0'
AND SUBSTR(f_lcscode(학번),1,1) IN ('1', '2');