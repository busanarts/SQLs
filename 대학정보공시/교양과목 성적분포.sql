SELECT sj_year ���س⵵, sj_hakgi �б�, DECODE(sj_dunggub, 'A+', 'A', 'A', 'B',
								  'B+', 'D', 'B', 'E',
                                  'C+', 'G', 'C', 'H',
                                  'D+', 'J', 'D', 'K',
                                  'F', 'M') �����ڵ�,
sj_dunggub ����,
DECODE(sj_dunggub, 'A+', '100~95', 'A', '94~90',
				   'B+', '89~85', 'B', '85~80',
                   'C+', '79~75', 'C', '74~70',
                   'D+', '69~65', 'D', '64~60',
                   'F', '59~0') ��������,
COUNT(*) �ο���
FROM psutis.AC1401, psutis.AC1303
WHERE sj_year = :�г⵵
AND SUBSTR(sj_isugbm,1,1) = '1'
AND sj_year = gg_year
AND sj_hakgi = gg_hakgi
AND sj_gggmcode = gg_gmcode
GROUP BY sj_year, sj_hakgi, sj_dunggub

