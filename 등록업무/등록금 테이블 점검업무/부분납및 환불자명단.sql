SELECT * FROM TDFEERECEIVE aa
WHERE (aa.hakbun, aa.SCHOOLYEAR, aa.SEMESTER) IN
(SELECT a.hakbun, a.SCHOOLYEAR, a.SEMESTER FROM TDFEERECEIVE a,
(SELECT hakbun, COUNT(*)
FROM TDFEERECEIVE
WHERE schoolyear = :�г⵵
AND semester = :�б�
GROUP BY hakbun
HAVING count(*) >1) b
WHERE a.hakbun = b.hakbun
AND a.SCHOOLYEAR = :�г⵵
AND a.SEMESTER = :�б�)