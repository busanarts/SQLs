SELECT hj_hakbun �й�, hj_kname ����, hj_state, DECODE(iw_dungrok, '0', '�̵��', '4', 'ȯ��') ��Ͽ���,
dd_nipgum ���Ա�, dd_nidate ��������, dd_hbdate ȯ������, dr_drniymd �Խõ�ϱݳ�����
FROM AC12011, ipsi.ipsi201, ipsi.ipsi401, AC2711, ipsi.ipsi203
WHERE hj_hakbun LIKE 'A11%'
AND hj_hakbun = si_hakbun
AND si_year = iw_year AND si_shno = iw_shno
AND iw_dungrok <> '1'
AND hj_hakbun = dd_hakbun
AND iw_year = dr_year AND iw_shno = dr_shno

