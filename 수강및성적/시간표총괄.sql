SELECT tm_haknyun 학년, hg_kname 학과명, COUNT(*) 수업시간수
FROM AC1304, AC1121
WHERE tm_year = '2009' AND tm_hakgi = '2'
AND tm_hgcode = hg_code
GROUP BY cube(tm_haknyun, hg_kname)