SELECT hg_kname �а���, MAX(hj_hakbun) �����й� FROM psutis.AC12011, psutis.AC1121
WHERE SUBSTR(hj_hakbun, 4, 2) = hg_code
AND hj_hakbun LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%'
GROUP BY hg_kname
