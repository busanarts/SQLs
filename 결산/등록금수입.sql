-- ��ϱݼ��� = �����ο� * (������ + ���б�)
-- �������� �̳��κ��� �̼�ó��?
SELECT �а�, �б�, �г�, COUNT(*) �ο�,
�δ����б�, SUM(���б�) ���бݰ�,
�δ������,  SUM(������) �������,
SUM(��ϱ�) ��ϱݰ�
FROM (
SELECT hg_kname �а�, dd_hakgi �б�,  dd_haknyun �г�,
--dg_ihakg-dd_gmihakg �δ����б�, dd_ihakg ���б�,
--dg_suryo-dd_gmsuryo �δ������,  dd_suryo ������, dd_totgum-dd_tgmgum �����ݾװ�
dg_ihakg �δ����б�, dd_ihakg ���б�,
dg_suryo �δ������,  dd_suryo ������, dd_totgum ��ϱ�
FROM AC2711, AC1121, AC12011,   (SELECT * FROM AC2701 WHERE dg_year = &�г⵵)
WHERE dd_year = &�г⵵
AND dd_hakbun = hj_hakbun AND hj_hgcode = hg_code
--AND dd_nidate IS NOT NULL --AND dd_bigo LIKE '%ȯ��%'
AND dd_year = dg_year AND dd_hakgi = dg_hakgi AND dd_haknyun = dg_haknyun AND hj_hgcode = dg_hgcode
)
GROUP BY �а�, �б�, �г�, �δ������, �δ����б�
ORDER BY �б�, �а�, �г�