UPDATE TM���� AA SET �����ּ� = (SELECT iw_addr1 FROM ipsi.ipsi201 WHERE iw_year = '2014' AND iw_shno = AA.�й�),
���ּ�= (SELECT iw_addr2 FROM ipsi.ipsi201 WHERE iw_year = '2014' AND iw_shno = AA.�й�),
�����ȣ = (SELECT iw_ucode1 || iw_ucode2 FROM ipsi.ipsi201 WHERE iw_year = '2014' AND iw_shno = AA.�й�)
--SELECT * FROM TM����
WHERE �й� IN (
SELECT �й�
FROM TM����, ipsi.IPSI201
WHERE iw_year = '2014'
AND �й� = iw_shno
AND �����ּ� || ���ּ� <> iw_addr1 || iw_addr2
);
