SELECT tm_haknyun �г�, hg_kname �а���, COUNT(*) �����ð���
FROM AC1304, AC1121
WHERE tm_year = '2009' AND tm_hakgi = '2'
AND tm_hgcode = hg_code
GROUP BY cube(tm_haknyun, hg_kname)