INSERT into AC2721 (dn_year, dn_haknyun, dn_hakgi, dn_hakbun,
dn_1nbgum, dn_2nbgum, dn_3nbgum, dn_4nbgum, dn_5nbgum, dn_6nbgum, dn_7nbgum, dn_8nbgum, dn_totgum,
dn_nipgum, dn_modgum, dn_nidate)
SELECT dr_year, '1', '1', si_hakbun,
nb_1nbgum 학생회비, nb_2nbgum 방송비, nb_3nbgum 학보비, nb_4nbgum 오티비, 0, nb_6nbgum 동창회비, 0, 0,
nb_1nbgum + nb_2nbgum + nb_3nbgum + nb_4nbgum + nb_6nbgum 총학생회비, dr_hstotal 학생회비실납입금액, nb_1nbgum + nb_2nbgum + nb_3nbgum + nb_4nbgum + nb_6nbgum - dr_hstotal 미납금, dr_hsniymd
FROM ipsi.ipsi401, ipsi.ipsi203, ac2702
WHERE si_year = &입시년도
AND si_year = dr_year
AND si_shno = dr_shno
and si_year = nb_year and nb_hakgi = '1' and nb_haknyun = '1'
