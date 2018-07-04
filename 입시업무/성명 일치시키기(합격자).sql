UPDATE TM학적 AA SET 성 = (SELECT SUBSTR(iw_KNAME,1,1) FROM ipsi.ipsi201 WHERE iw_shno = AA.학번),
이름= (SELECT SUBSTR(iw_KNAME,2) FROM ipsi.ipsi201 WHERE iw_shno = AA.학번)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, ipsi.IPSI201
WHERE 학번 = iw_shno
AND 성 || 이름 <> iw_kname
AND iw_year = :입시연도
);
