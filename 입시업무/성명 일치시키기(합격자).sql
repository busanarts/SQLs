UPDATE TM���� AA SET �� = (SELECT SUBSTR(iw_KNAME,1,1) FROM ipsi.ipsi201 WHERE iw_shno = AA.�й�),
�̸�= (SELECT SUBSTR(iw_KNAME,2) FROM ipsi.ipsi201 WHERE iw_shno = AA.�й�)
--SELECT * FROM TM����
WHERE �й� IN (
SELECT �й�
FROM TM����, ipsi.IPSI201
WHERE �й� = iw_shno
AND �� || �̸� <> iw_kname
AND iw_year = :�Խÿ���
);
