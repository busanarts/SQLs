SELECT 학번, 성 || 이름 성명, 최종학적변동코드, 입학일자, 졸업일자  FROM tm학적
WHERE SUBSTR(학적상태,1,1)  = '8'
AND 학번 LIKE 'A%'
AND substr(졸업일자,1,4) - ('20' ||  SUBSTR(학번,2,2)) < 3
AND 학번 IN (SELECT hakbun FROM TDSCHOOLCHG
WHERE changecd NOT IN ( '00', '81', '82', '83', '31', '61', '53'));


SELECT HAKBUN,  성 || 이름 성명,  MAX(SCHOOLYEAR) 최종수강년도, MAX(졸업일자) 졸업일자
  FROM PSUTIS.TDRESULT A,
       TM학적 B
  WHERE SCHOOLYEAR = (SELECT MAX(B.SCHOOLYEAR)FROM PSUTIS.TDRESULT B WHERE B.HAKBUN =A.HAKBUN)
    AND A.HAKBUN = B.학번
   AND A.SCHOOLYEAR >= SUBSTR(졸업일자, 1,4)
   AND SUBSTR(졸업일자, 5,2) <> '08'
  GROUP BY HAKBUN, 성, 이름, SCHOOLYEAR, 졸업일자
  ORDER BY HAKBUN;





