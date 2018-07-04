SELECT dd_hakgi, COUNT(*) 총인원, SUM(dd_suryo) 등록금, SUM(dd_ihakg) 입학금, SUM(dd_nipgum) 선수금
FROM AC2711
WHERE dd_year = '2011'
AND dd_nidate IS NOT NULL
AND dd_nidate < '20110301'
GROUP BY CUBE(dd_hakgi)
ORDER BY dd_hakgi