SELECT hj_hakbun �й�, DEPTNAME(hj_hgcode) �а�,hj_kname ����,
hj_jcode1 || '-' || hj_jcode2 �ֹι�ȣ, hj_craddr1 || ' ' || hj_craddr2 �ּ�,
USR_TOTELNO(hj_hshptel) �ڵ���
FROM AC12011
WHERE hj_state = '01' AND hj_haknyun = '1'
AND hj_craddr1 NOT LIKE '�λ�%'
ORDER BY hj_hgcode, hj_kname