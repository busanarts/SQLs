SELECT a.hakbun 학번, a.changedt 변동일, f_hakjuknm(changecd) 변동명 FROM tdschoolchg a,
(SELECT hakbun, changedt, COUNT(*) FROM TDSCHOOLCHG
WHERE a.changedt >= :변동시작일  AND a.changedt = :변동종료일
--AND SUBSTR(changecd,1,1) <> '1'
GROUP BY hakbun, changedt
HAVING COUNT(*) > 1) b
WHERE a.hakbun = b.hakbun
AND a.changedt >= :변동시작일  AND a.changedt = :변동종료일
ORDER BY a.hakbun, a.changedt