SELECT �б��ڵ�, �б���, �ֹι�ȣ, ����, �з��ڵ�, ���������а� ���а�, c.hg_kname ���������а���, �����ڵ�,
B.HJ_HAKBUN �й�, B.HJ_HAKNYUN �г�, SUBSTR(B.HJ_IYMD, 1,4 ) ���г⵵, '2011' �����⵵,
DECODE(SIGN(80 - (NVL(�������, 0) + NVL(��û����, 0))), 1, '�����Ұ�', '��������') �������ɿ���,
DECODE(SIGN(80 - (NVL(�������, 0) + NVL(��û����, 0))), 1, '', '02') ������,
B.HJ_EMAIL, B.HJ_HSHPTEL �޴���ȭ, �������, ��û����, hb_name ��������
FROM TBL���������������� a, psutis.ac12011 b, psutis.ac1121 c, PSUTIS.AC1104,
(select A.HJ_HAKBUN, �������, ��û����
from (select hj_hakbun, sum(sj_hjum) �������
from psutis.ac12011, psutis.ac1401
where hj_hakbun = sj_hakbun and SUBSTR(hj_state,1,1) IN ('0', '1') and sj_dunggub not in ('F', 'P')
--and  hj_hakbun in  (select distinct sj_hakbun from ac1401 where hj_hakbun = sj_hakbun and sj_haknyun = '2' and  sj_hakgi = '2')
group by hj_hakbun) A,
(select hj_hakbun, sum(sj_hjum) ��û����
from psutis.ac12011, psutis.ac1401
where hj_hakbun = sj_hakbun --and hj_state = '01'
AND SJ_YEAR = '2010' AND SJ_HAKNYUN = '2' AND SJ_HAKGI = '2'
group by hj_hakbun) B
WHERE A.HJ_HAKBUN = B.HJ_HAKBUN(+)) D
WHERE �ֹι�ȣ = hj_jcode1 || hj_jcode2
AND hj_hgcode = hg_code AND hj_state = hb_code
AND B.hj_hakbun = D.HJ_HAKBUN(+)
