SELECT dd_hakgi �б�, �а���, dd_haknyun �г�, dd_hakbun �й�, hj_kname ����, dd_totgum ��ϱ�, dd_tgmgum ����ݾ�,
DECODE(SIGN(dd_tgmgum), 1, NVL(jm_name, dd_bigo)) ��������, (dd_nipgum + dd_modgum) ���Ա�, DECODE(SIGN(dd_totgum - 2000000), -1, dd_totgum) ������,
DECODE(SIGN(dd_totgum - dd_tgmgum - dd_nipgum), 1, '�ݾ׺���ġ') ���2
FROM AC2711, ac12011, AC1121, tbl�а�,
(SELECT * FROM AC1711, AC1701 WHERE jd_year = '2008' AND jd_jmcode = jm_code)
WHERE dd_year = '2008'
AND dd_year = jd_year(+) AND dd_hakgi = jd_hakgi(+)
AND dd_hakbun = jd_hakbun(+)
AND dd_nidate IS NOT null
AND dd_hakbun = hj_hakbun
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
--AND dd_totgum < 2000000
ORDER BY dd_hakgi, �а���, dd_haknyun, dd_hakbun