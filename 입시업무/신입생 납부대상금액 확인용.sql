SELECT dr_hgname �а�, SUM(dr_iphak) ���б�, SUM(dr_suryo) ������, SUM(dr_drtotal) ��ϱݰ�,
SUM(dr_jhiphak) ���бݸ���, SUM(dr_jhsuryo) ���������, SUM(dr_jhtotal) ���бݰ�,
SUM(dr_hakbi) �л�ȸ��, SUM(dr_bangsong) ��ۺ�, SUM(dr_hakbobi) �к���, SUM(dr_jolup) OT��
FROM IPSI203
WHERE dr_year = '2012'
group by dr_hgname