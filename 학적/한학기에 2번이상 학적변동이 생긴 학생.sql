SELECT a.hakbun �й�, a.changedt ������, f_hakjuknm(changecd) ������ FROM tdschoolchg a,
(SELECT hakbun, changedt, COUNT(*) FROM TDSCHOOLCHG
WHERE a.changedt >= :����������  AND a.changedt = :����������
--AND SUBSTR(changecd,1,1) <> '1'
GROUP BY hakbun, changedt
HAVING COUNT(*) > 1) b
WHERE a.hakbun = b.hakbun
AND a.changedt >= :����������  AND a.changedt = :����������
ORDER BY a.hakbun, a.changedt