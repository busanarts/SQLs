SELECT 학번, 성 || 이름 성명, 수험번호, 학과코드, F_DEPTNM(학과코드) 학과코드, A.CLASS 고지학과, B.CLASS 등록학과
FROM TDFEEGOJI a, TDFEERECEIVE b, tm학적
WHERE a.hakbun = b.hakbun
AND a.schoolyear = b.schoolyear
AND A.CLASS <> B.CLASS
AND a.hakbun = 학번