UPDATE ipsi201 SET iw_jcode1 = (

SELECT SUBSTR(주민등록번호,1,6)
FROM ipsi201_2
WHERE iw_year = 지원연도
AND iw_shno = 수험번호
AND iw_chasu = 입시차수 ), iw_jcode2 =(SELECT SUBSTR(주민등록번호,7,13)
FROM ipsi201_2
WHERE iw_year = 지원연도
AND iw_shno = 수험번호
AND iw_chasu = 입시차수 ) , iw_hdtel = (SELECT REPLACE(휴대전화,'-','')
FROM ipsi201_2
WHERE iw_year = 지원연도
AND iw_shno = 수험번호
AND iw_chasu = 입시차수 )

WHERE iw_year = :입시연도
AND iw_chasu = :입시차수
AND iw_shno IN (SELECT 수험번호
FROM ipsi201 a, ipsi201_2 b
WHERE a.iw_year = 지원연도
AND iw_shno = 수험번호
AND iw_chasu = 입시차수 )


