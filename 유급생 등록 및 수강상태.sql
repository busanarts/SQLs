select �а���, hj_haknyun �г�, hj_hakbun �й�, hj_kname ����,
hb_name ��������, hc_siymd ��������, cnt ���������, RCVDT ��������, RCVAMT ���Ա�, RTNDT ȯ������, '' ���
from psutis.ac12011, psutis.ac1121, psutis.tbl�а�, psutis.AC1202, psutis.AC1104,
(SELECT sj_hakbun, COUNT(*) cnt FROM psutis.AC1401 WHERE sj_year = :�г⵵ AND sj_hakgi = :�б� GROUP BY sj_hakbun),
(SELECT * FROM ciss.tdfeegoji WHERE schoolyear = :�г⵵ AND semester = :�б�)
where hj_hakbun = hc_hakbun
and hj_hgcode = hg_code and hg_mcode = �а��ڵ�
AND hj_state = hb_code
and hc_year = :�г⵵ and hc_hakgi = :�б�
and hc_scode  = '61'
AND hj_hakbun = sj_hakbun(+)
AND hj_hakbun = hakbun(+)
ORDER BY �а���