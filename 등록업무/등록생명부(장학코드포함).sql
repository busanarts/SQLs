SELECT �а���, hj_haknyun �г�, hj_hakbun �й�, hj_kname ����, USR_HJNAME(hj_state) ��������,
dd_totgum ���ݾ�, DD_TOTGUM - DD_TGMGUM ���ݾ�, dd_tgmgum ����ݾ�, dd_nipgum ���Աݰ�, dd_modgum �̳���,
dd_nidate ��������, jm_code �����ڵ�, jm_name ���и�
FROM AC2711, AC12011, AC1121, tbl�а�,
(SELECT * FROM AC1711, AC1701
WHERE jd_year = &sYear AND jd_hakgi = &sHakgi AND jd_jmcode = jm_code)
WHERE dd_year = &sYear AND dd_hakgi = &sHakgi
AND dd_year = jd_year(+) AND dd_hakgi = jd_hakgi(+)
AND dd_hakbun = jd_hakbun(+)
--AND dd_totgum - dd_tgmgum > 0
--AND dd_nidate IS NULL
--AND dd_nipgum > 0
--AND dd_hakbun LIKE 'A12%'
AND dd_hakbun = hj_hakbun AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�

ORDER BY hj_haknyun, �а���, hj_hakbun