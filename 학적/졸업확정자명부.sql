SELECT hg_kname �а���, ju_hakbun �й�, hj_kname ����,
hj_jcode1 || '-' || hj_jcode2 �ֹι�ȣ,ju_jno ����������ȣ, ju_hno ������ȣ,
hj_iymd ��������
FROM AC1611, AC12011, ac1121
WHERE ju_jcheck = '0'
AND ju_hakbun = hj_hakbun
AND hj_hgcode = hg_code
ORDER BY hg_kname, ju_jno
