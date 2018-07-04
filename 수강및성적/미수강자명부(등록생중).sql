SELECT hj_hakbun 학번, hj_kname 성명, statename(hj_state) 학적상태, USR_TODATE(USR_LCDATE(hj_hakbun)) 최종학적변동일
FROM AC2711, AC12011
WHERE dd_year = &학년도 AND dd_hakgi = &학기
AND dd_nidate IS NOT NULL
AND dd_hakbun = hj_hakbun
AND dd_hakbun NOT IN (SELECT DISTINCT sj_hakbun FROM AC1401
WHERE sj_year = dd_year AND sj_hakgi = dd_hakgi)
