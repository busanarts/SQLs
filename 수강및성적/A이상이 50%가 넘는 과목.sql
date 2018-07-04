SELECT gg_kname �����, sj_gggmcode �����ڵ�, hg_kname �����а�,
sum(DECODE(SIGN(sj_jumsu-90), 1, 1, 0)) A�̻�, COUNT(*) �����ο�
FROM PSUTIS.AC1401, PSUTIS.AC1303, PSUTIS.AC1121
WHERE sj_year = :�г⵵
AND sj_hakgi = :�б�
AND sj_year = gg_year AND sj_hakgi = gg_hakgi
AND sj_gggmcode = gg_gmcode AND sj_gghaknyun = gg_haknyun
AND gg_hgcode = hg_code
GROUP BY gg_kname, sj_gggmcode, hg_kname
HAVING sum(DECODE(SIGN(sj_jumsu-90), 1, 1, 0)) / COUNT(*) >= 0.5