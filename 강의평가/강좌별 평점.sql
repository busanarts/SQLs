SELECT substr(seqno,1,12), SUM(level1 * 5 + level2 * 4 + level3 * 3 + level4 * 2 + level5) / COUNT(SUBSTR(seqno, 1, 12)) ∆Ú¡°
FROM TDEVALUATEDTL
GROUP BY SUBSTR(seqno, 1, 12)