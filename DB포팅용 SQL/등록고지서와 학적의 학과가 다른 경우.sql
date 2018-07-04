SELECT 학번, 성 || 이름 성명, 학년, F_CLASSNM(학과코드) 학적상학과,  F_CLASSNM(class) 등록상학적
FROM tm학적, TDFEEGOJI
WHERE 학번 = hakbun
AND schoolyear = '2014'
AND 학과코드 <> class