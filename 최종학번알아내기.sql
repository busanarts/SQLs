SELECT hg_kname 학과명, MAX(hj_hakbun) 최종학번 FROM psutis.AC12011, psutis.AC1121
WHERE SUBSTR(hj_hakbun, 4, 2) = hg_code
AND hj_hakbun LIKE 'A' || SUBSTR(:학년도,3,2) || '%'
GROUP BY hg_kname
