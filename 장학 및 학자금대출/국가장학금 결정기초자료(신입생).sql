SELECT ���ڱ������а��ڵ�, '11' �����ڵ�, IW_JCODE1 || IW_JCODE2 �ֹι�ȣ, DR_SHNO �й�, IW_KNAME �л�����, '1' �г�,
DECODE(JM_GUBUN, '2', JM_DCODE, '00') �����ڵ�1,
DECODE(JM_GUBUN, '2', dr_jhtotal, 0) �������б�1,
'' �����ڵ�2, 0 �������б�2, '' �����ڵ�3, 0 �������б�3,
--DECODE(JM_GUBUN, '0', DR_JHTOTAL + NVL(DR_YCGUM, 0), 0) �������б�, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) �������б�,
DECODE(JM_GUBUN, '0', DR_JHTOTAL, 0) �������б�, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) �������б�,
DR_SURYO ������, DR_GISBI �⼺ȸ��, DR_IPHAK ���б�,
JH_NAME ���и�, DR_DRTOTAL ��ϱݾ�
FROM IPSI.IPSI203, IPSI.IPSI204, IPSI.IPSI201, IPSI.IPSI104 A, IPSI.IPSI401, psutis.AC1121 AA, psutis.TBL�а�, PSUTIS.AC1701
WHERE DR_YEAR = &sYear
AND DR_YEAR = IW_YEAR AND DR_SHNO = IW_SHNO
AND iw_year = si_year AND iw_shno = si_shno
AND IW_JWHGCODE1 = A.HG_CODE AND HG_GYCODE = AA.HG_CODE AND AA.HG_MCODE = �а��ڵ�(+)
AND DR_YEAR = JH_YEAR(+) AND DR_SHNO = JH_SHNO(+)
AND JH_CODE = JM_CODE
union
SELECT ���ڱ������а��ڵ�, '11' �����ڵ�, IW_JCODE1 || IW_JCODE2 �ֹι�ȣ, DR_SHNO �й�, IW_KNAME �л�����, '1' �г�,
'' �����ڵ�1, 0 �������б�1, '' �����ڵ�2, 0 �������б�2, '' �����ڵ�3, 0 �������б�3, 0 �������б�, 0 �������б�,
DR_SURYO, DR_GISBI, DR_IPHAK,
'', DR_DRTOTAL
FROM IPSI.IPSI203, IPSI.IPSI201, IPSI.IPSI104 A, IPSI.IPSI401, psutis.AC1121 AA, psutis.TBL�а�
WHERE DR_YEAR = &sYear
AND DR_YEAR = IW_YEAR AND DR_SHNO = IW_SHNO
AND iw_year = si_year AND iw_shno = si_shno
AND IW_JWHGCODE1 = A.HG_CODE AND HG_GYCODE = AA.HG_CODE AND AA.HG_MCODE = �а��ڵ�(+)
and iw_shno not in (select jh_shno from ipsi.ipsi204 where jh_year = &sYear)
