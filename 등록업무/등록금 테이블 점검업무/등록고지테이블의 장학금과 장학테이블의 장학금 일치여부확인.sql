SELECT a.hakbun, a.scholarship1, a.scholarship2, a.scholarship3, a.scholarship4, b.scholarship,
(NVL(scholarship1, 0) + NVL(scholarship2,0) + NVL(scholarship3,0) + NVL(scholarship4,0)) - NVL(scholarship,0) ย๗พื
FROM TDJANGHAKSUM a, TDFEEGOJI b
WHERE a.hakbun = b.hakbun
AND (NVL(scholarship1, 0) + NVL(scholarship2,0) + NVL(scholarship3,0) + NVL(scholarship4,0)) <> NVL(scholarship,0)