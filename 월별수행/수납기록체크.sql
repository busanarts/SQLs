SELECT * FROM TDFEEGOJI
WHERE STATE IN( '88', '77', '22', '55')
AND schoolyear = :�г⵵
AND (hakbun, schoolyear, semester) NOT IN (SELECT hakbun, schoolyear, semester FROM TDFEERECEIVE)
--AND hakbun = 'A1545011'