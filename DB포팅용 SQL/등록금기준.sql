SELECT dg_hakgi �б�, hg_kname �а�, dg_haknyun �г�, dg_ihakg ���б�, dg_suryo ������, dg_gisbi ��Ÿ
FROM AC2701, AC1121
WHERE
dg_year = '2012' AND dg_hakgi = '2'
AND dg_hgcode = hg_code
ORDER BY hg_kname, dg_haknyun