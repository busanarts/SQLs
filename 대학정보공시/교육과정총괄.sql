SELECT gg_haknyun �г�, decode(substr(gg_gmcode,3,1), '1', '����', decode(gg_hgcode, '42', '�ι���ȸ', '75', 'ü��', '����')) �迭,
COUNT(*) �������, SUM(gg_hjum) ������, sum(gg_irtime + gg_sstime) �ü�
FROM psutis.AC1303, psutis.AC1121
WHERE gg_year = :�г⵵ AND gg_hakgi = :�б�
AND gg_hgcode = hg_code
GROUP BY gg_haknyun, decode(substr(gg_gmcode,3,1), '1', '����', decode(gg_hgcode, '42', '�ι���ȸ', '75', 'ü��', '����'))
