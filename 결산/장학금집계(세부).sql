SELECT DECODE(jm_gubun, '0', '교내', '교외') 구분, SUM(jd_ihakg) 입학장학금, SUM(jd_suryo) 수업장학금
FROM AC1711, AC2711, AC1701
WHERE jd_year = '2011'
AND jd_year = dd_year AND jd_hakgi = dd_hakgi AND jd_haknyun = dd_haknyun
AND jd_hakbun = dd_hakbun
AND jd_jmcode = jm_code
AND jd_year = dd_Year AND jd_hakgi = dd_hakgi AND jd_hakbun = dd_hakbun
AND dd_nidate IS NOT null
GROUP BY DECODE(jm_gubun, '0', '교내', '교외')
