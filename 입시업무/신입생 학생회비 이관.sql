INSERT into AC2721 (dn_year, dn_haknyun, dn_hakgi, dn_hakbun,
dn_1nbgum, dn_2nbgum, dn_3nbgum, dn_4nbgum, dn_5nbgum, dn_6nbgum, dn_7nbgum, dn_8nbgum, dn_totgum,
dn_nipgum, dn_modgum, dn_nidate)
SELECT dr_year, '1', '1', si_hakbun,
nb_1nbgum �л�ȸ��, nb_2nbgum ��ۺ�, nb_3nbgum �к���, nb_4nbgum ��Ƽ��, 0, nb_6nbgum ��âȸ��, 0, 0,
nb_1nbgum + nb_2nbgum + nb_3nbgum + nb_4nbgum + nb_6nbgum ���л�ȸ��, dr_hstotal �л�ȸ��ǳ��Աݾ�, nb_1nbgum + nb_2nbgum + nb_3nbgum + nb_4nbgum + nb_6nbgum - dr_hstotal �̳���, dr_hsniymd
FROM ipsi.ipsi401, ipsi.ipsi203, ac2702
WHERE si_year = &�Խó⵵
AND si_year = dr_year
AND si_shno = dr_shno
and si_year = nb_year and nb_hakgi = '1' and nb_haknyun = '1'
