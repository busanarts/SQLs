SELECT hg_kname �а���, hj_hakbun �й�, hj_kname ����, F_HJSTATE(hj_hakbun, '20120401') "2012�г⵵ 1�б� ����"
FROM AC12011, AC1121
WHERE hj_hgcode = hg_code
AND F_HJSTATE(hj_hakbun, '20111001') = '����'
--WHERE hj_hakbun = 'A1125045'