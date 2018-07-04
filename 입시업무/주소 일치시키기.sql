UPDATE TM학적 AA SET 지번주소 = (SELECT iw_addr1 FROM ipsi.ipsi201 WHERE iw_year = '2014' AND iw_shno = AA.학번),
상세주소= (SELECT iw_addr2 FROM ipsi.ipsi201 WHERE iw_year = '2014' AND iw_shno = AA.학번),
우편번호 = (SELECT iw_ucode1 || iw_ucode2 FROM ipsi.ipsi201 WHERE iw_year = '2014' AND iw_shno = AA.학번)
--SELECT * FROM TM학적
WHERE 학번 IN (
SELECT 학번
FROM TM학적, ipsi.IPSI201
WHERE iw_year = '2014'
AND 학번 = iw_shno
AND 지번주소 || 상세주소 <> iw_addr1 || iw_addr2
);
