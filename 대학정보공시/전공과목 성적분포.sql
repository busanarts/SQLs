SELECT sj_year ���س⵵, �а���,
sj_hakgi �б�, DECODE(sj_dunggub, 'A+', 'A', 'A', 'B',
								  'B+', 'D', 'B', 'E',
                                  'C+', 'G', 'C', 'H',
                                  'D+', 'J', 'D', 'K',
                                  'F', 'M') �����ڵ�,
sj_dunggub ���� , COUNT(*) �ο���
--FROM psutis.AC1401, psutis.AC1303, psutis.AC1121, psutis.TBL�а�
FROM psutis.AC1401, psutis.AC1303, psutis.TBL�а�
WHERE sj_year = :�г⵵
AND SUBSTR(sj_isugbm,1,1) = '2'
AND sj_year = gg_year
AND sj_hakgi = gg_hakgi
AND sj_gggmcode = gg_gmcode
--AND sj_hgcode = hg_code and hg_mcode = �а��ڵ�
AND sj_hgcode = �а��ڵ�
GROUP BY sj_year, sj_hakgi, �а���, sj_dunggub
