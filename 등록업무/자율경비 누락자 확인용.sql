SELECT hj_hakbun �й�, hj_kname ����, hj_haknyun �г�, USR_HJNAME(USR_LCSCODE(hj_hakbun)) ������������
FROM AC12011, AC2711
WHERE dd_year = &sYear AND dd_hakgi = &sHakgi
AND dd_hakbun = hj_hakbun
AND dd_hakbun NOT IN (SELECT dn_hakbun FROM AC2721 WHERE dn_year = dd_year AND dn_hakgi = dd_hakgi)
AND hj_state = '01'