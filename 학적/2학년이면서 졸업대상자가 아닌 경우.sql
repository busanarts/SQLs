SELECT �а���, sj_hakbun �й�, hj_kname ����, COUNT(DISTINCT sj_year || sj_hakgi) �����б�,
SUM(sj_hjum) ��û����, SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) �������,
DECODE(SIGN(SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) - 80), 1, '��������', 0, '��������') �������ɿ���
FROM AC1401, AC12011, AC1121, tbl�а�
WHERE sj_hakbun = hj_hakbun
AND hj_haknyun = '2'
AND hj_state = '01'
--AND sj_dunggub <> 'F'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
GROUP BY �а���, sj_hakbun, hj_kname
HAVING COUNT(DISTINCT sj_year || sj_hakgi) < 4