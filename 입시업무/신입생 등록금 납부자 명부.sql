--INSERT INTO AC2711
SELECT dr_year, '1' �г�, '1' �б�, si_hakbun,
dr_iphak ���б�, dr_suryo ������, dr_gisbi �⼺ȸ��,
dr_jhiphak ���бݰ���, dr_jhsuryo �����ᰨ��, dr_jhgisbi �⼺ȸ�񰨸�,
dr_drtotal ��ϱݰ�, dr_jhtotal ����װ�, dr_nbtotal + dr_ycgum �ǳ��ξ�, 0 �̳��ݾ�,
dr_drniymd ��������, dr_bigo || DECODE(dr_drhbymd, NULL, '', '/ȯ��/') ���, 0 �г�1, 0 �г�2, 0 �г�3, '' �г�2����,'' �г�3����, dr_drniymd ���ʳ�����
FROM ipsi.ipsi203, ipsi.ipsi401
WHERE dr_year = &sYear
AND dr_year = si_year AND dr_shno = si_shno
