SELECT �а���, sj_hakbun �й�, hj_kname ����, hj_jcode1 || hj_jcode2 �ֹι�ȣ, COUNT(DISTINCT sj_year || sj_hakgi) �����б�,
��û����, SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) �������,
DECODE(SIGN(SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) - 80), 1, '��������', 0, '��������') �������ɿ���
FROM psutis.AC1401, psutis.AC12011 aa, psutis.AC1121, psutis.tbl�а�,
(select hj_hakbun, sum(sj_hjum) ��û����
from psutis.ac12011, psutis.ac1401
where hj_hakbun = sj_hakbun and hj_haknyun = '2' and hj_state = '01'
AND SJ_YEAR = :�г⵵ AND SJ_HAKNYUN = '2' AND SJ_HAKGI = :�б�
group by hj_hakbun, hj_kname) cc
WHERE sj_hakbun = aa.hj_hakbun
AND hj_haknyun = '2'
AND hj_state = '01'
--AND sj_dunggub <> 'F'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
AND aa.hj_hakbun = cc.hj_hakbun
GROUP BY �а���, sj_hakbun, hj_kname, hj_jcode1 || hj_jcode2, ��û����
HAVING COUNT(DISTINCT sj_year || sj_hakgi) >= 4
