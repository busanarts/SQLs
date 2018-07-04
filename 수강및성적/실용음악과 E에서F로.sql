--SELECT * from AC1304
UPDATE AC1304 SET tm_ban = :분반
WHERE tm_year = :학년도
AND tm_hakgi = :학기
AND tm_ban = 'E'
--AND tm_ban = 'F'
--AND tm_haknyun = '2'
AND tm_hgcode = '25'
