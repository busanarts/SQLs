--SELECT * FROM TMEGWAMOK
DELETE FROM TMEGWAMOK
WHERE ROWID IN (
SELECT RID FROM
--SELECT * FROM
(
--SELECT GMKNAME, GMENAME, COUNT(*) OVER(PARTITION BY GMKNAME, GMENAME) AS CNT, ROWID RID, MAX(ROWID) OVER(PARTITION BY GMKNAME, GMENAME) AS MX_RID
SELECT GMKNAME, COUNT(*) OVER(PARTITION BY GMKNAME) AS CNT, ROWID RID, MAX(ROWID) OVER(PARTITION BY GMKNAME) AS MX_RID
FROM TMEGWAMOK
) B
WHERE CNT > 1
AND RID < MX_RID
)