SELECT hj_hakbun, hj_kname ����, hj_jcode1 || '-' || hj_jcode2 �ֹι�ȣ, hj_craddr1 || ' ' || hj_craddr2 �ּ�,
	hj_hshptel ����ó, usr_lcdate(hj_hakbun) ��������, 'N' ���п���
FROM ac12011
WHERE
--hj_hakbun < 'A06' AND
hj_state IN ( '12', '13')