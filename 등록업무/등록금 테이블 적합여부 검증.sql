--UPDATE AC2711 SET dd_modgum = dd_totgum - dd_tgmgum - dd_nipgum
SELECT hg_kname �а�, dd_haknyun �г�, dd_hakbun �й�, hj_kname ����,
dd_totgum ��ϱݰ�, dd_tgmgum ����ݾװ�, dd_totgum - dd_tgmgum �ǵ�ϱ�,
dd_nipgum ���ΰ�, dd_modgum �̳���,
NVL(a.JD_IHAKG, 0) + NVL(a.JD_SURYO, 0) + NVL(a.JD_GISBI, 0) + NVL(a.JD_ETCGM, 0) �Ϲ����б�,
NVL(b.JD_ETCGM, 0) ������������1,  NVL(c.JD_ETCGM, 0) ������������2
,dd_totgum - dd_tgmgum - (dd_nipgum + dd_modgum) "��ϱݰ���",
dd_totgum - (dd_ihakg + dd_suryo + dd_gisbi) "��ϱݰ���2",
dd_tgmgum - (NVL(a.JD_IHAKG, 0) + NVL(a.JD_SURYO, 0) + NVL(a.JD_GISBI, 0) + NVL(a.JD_ETCGM, 0) +
NVL(b.JD_ETCGM, 0) + NVL(c.JD_ETCGM, 0)) ���бݰ���
FROM AC2711, AC12011, AC1121, AC1711 a, AC1712 b, AC1713 c
WHERE dd_year = &sYear AND dd_hakgi = &sHakgi
AND dd_hakbun = hj_hakbun AND hj_hgcode = hg_code
AND dd_hakbun = a.jd_hakbun(+) AND dd_year = a.jd_year(+) AND dd_hakgi = a.JD_HAKGI(+)
AND dd_hakbun = b.jd_hakbun(+) AND dd_year = b.jd_year(+) AND dd_hakgi = b.JD_HAKGI(+)
AND dd_hakbun = c.jd_hakbun(+) AND dd_year = c.jd_year(+) AND dd_hakgi = c.JD_HAKGI(+)
--AND (dd_totgum - dd_tgmgum) <>  (dd_nipgum + dd_modgum)
ORDER BY hg_kname, dd_haknyun, dd_hakbun