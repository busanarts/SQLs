INSERT into AC2711 (dd_year, dd_haknyun, dd_hakgi, dd_hakbun, dd_ihakg,
dd_suryo, dd_gisbi, dd_gmihakg, dd_gmsuryo, dd_gmgisbi,
dd_totgum, dd_tgmgum, dd_nipgum, dd_modgum, dd_nidate,
dd_bigo, dd_nipgum1, dd_nipgum2, dd_nipgum3, dd_nidate2, dd_nidate3, dd_nidate1)
SELECT si_year �г⵵, '1' �г�, '1' �б�, TRIM(si_hakbun) �й�, dr_iphak ���б�,
dr_suryo ������, dr_gisbi �⼺ȸ��, dr_jhiphak �������б�, dr_jhsuryo ���м�����, dr_jhgisbi �⼺ȸ�����,
--dr_drtotal �ѱݾ�, dr_jhtotal + decode(sign(dr_drtotal - dr_jhtotal), 0, 0, dr_ycgum) �����Ѿ�, dr_nbtotal �����Ѿ�,
dr_iphak + dr_suryo �ѱݾ�, dr_jhtotal �����Ѿ�, dr_nbtotal +(dr_ycgum - dr_wbycgum) �����Ѿ�,
dr_drtotal - dr_jhtotal - dr_nbtotal - (dr_ycgum) �̳���, dr_drniymd ��������,
--substr(TRIM(dr_bank) || '/' || TRIM(dr_jhname),1,20) ���, dr_nbtotal ���ʳ��Ա�, 0, 0, '',
TRIM(dr_jhname) ���, dr_nbtotal ���ʳ��Ա�, 0, 0, '',
'', dr_drniymd
FROM ipsi.ipsi401, ipsi.ipsi203, ac12011
WHERE si_year = &�Խó⵵
AND si_year = dr_year
AND si_shno = dr_shno
AND si_hakbun = hj_hakbun
--order by dr_drniymd
order by si_hakbun
--AND dr_drhbymd  IS NOT null