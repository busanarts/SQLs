SELECT dd_hakbun, dd_gmihakg ���бݰ���, dd_gmsuryo �����ᰨ��,
dd_gmihakg + dd_gmsuryo �Ѱ����, dd_nipgum ���Ա�, dd_modgum �̳���, dd_nidate ��������
FROM AC2711, AC1711
WHERE dd_year = '2011'
--AND dd_hakgi = '1'
AND dd_year = jd_year
AND dd_hakgi = jd_hakgi
AND dd_hakbun = jd_hakbun
AND dd_nidate IS NOT NULL
--AND dd_gmihakg + dd_gmsuryo <> dd_tgmgum