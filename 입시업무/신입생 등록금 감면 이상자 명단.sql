SELECT iw_shno �����ȣ, iw_kname ����,
dr_suryo ������, dr_drtotal ��ϱ��Ѱ�, dr_jhiphak ���бݰ���, dr_jhsuryo �����ᰨ��,
dr_jhtotal �����Ѿ�, dr_drtotal - dr_jhtotal ����
FROM ipsi.IPSI203, ipsi.ipsi201
WHERE dr_year = '2011'
AND (dr_jhiphak + dr_jhsuryo <> dr_jhtotal)
AND dr_year = iw_year AND dr_shno = iw_shno
