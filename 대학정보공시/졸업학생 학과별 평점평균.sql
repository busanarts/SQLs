SELECT �а���, ROUND(SUM(�������) / COUNT(�а���), 2) "�а��� �������"
FROM
(select �а���, �й�, ����, �������
from (select �а���, hj_hakbun �й�, hj_kname ����, round(sum(sj_pjum * sj_hjum) / sum(sj_hjum), 2) �������
from psutis.ac12011, psutis.ac1401, ac1121, tbl�а�
where hj_hakbun = sj_hakbun
and hj_hgcode = hg_code and hg_mcode = �а��ڵ�
and substr(hj_state,1,1) = '8'
and hj_jymd >= '201008'
and sj_dunggub not in ('F')
group by �а���, hj_hakbun, hj_kname)
)
GROUP BY �а���