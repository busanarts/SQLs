SELECT ���ڱ������а��ڵ� �а��ڵ�, '11' �����ڵ�, IW_JCODE1 || IW_JCODE2 �ֹι�ȣ, DR_SHNO �й�, IW_KNAME �л���, '1' �г�,
DECODE(NVL(DR_DRNIYMD, '0'), '0', '1', '2') ��ϱݳ��δ�󱸺�,
DECODE(NVL(DR_DRNIYMD,'0'), '0', &�Խó⵵ || '0330', DR_DRNIYMD) �������帶������,
'2' �������±���1, '032' �������������ڵ�1, '036010337518' �������¹�ȣ1, '�λ꿹������ �ȿ�ö' �������¿�����1,
'' �������±���2, '' �������������ڵ�2, '' �������¹�ȣ2, '' �������¿�����2,
DECODE(JM_GUBUN, '2', JM_DCODE, '00') �����ڵ�1,
DECODE(JM_GUBUN, '2', dr_jhtotal, 0) �������б�1,
'' �����ڵ�2, 0 �������б�2, '' �����ڵ�3, 0 �������б�3,
--DECODE(JM_GUBUN, '0', DR_JHTOTAL + NVL(DR_YCGUM, 0), 0) �������б�, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) �������б�,
DECODE(JM_GUBUN, '0', DR_JHTOTAL, 0) �������б�, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) �������б�,
DR_IPHAK ���б�, DR_SURYO ������, DR_GISBI �⼺ȸ��
--JH_NAME ���и�, DR_DRTOTAL ��ϱݾ�
FROM IPSI.IPSI203, IPSI.IPSI204, IPSI.IPSI201, IPSI.IPSI104 A, psutis.AC1121 AA, psutis.TBL�а�, PSUTIS.AC1701
where iw_year = &�Խó⵵
AND iw_result = '1'
AND (iw_chasu = &���� OR (iw_chasu <= &���� AND iw_rank2 > 0))
AND iw_jwhgcode1 = a.hg_code
and hg_gycode = aa.hg_code and hg_mcode  = �а��ڵ�
AND iw_year = dr_year AND iw_shno = dr_shno
AND DR_YEAR = JH_YEAR(+) AND DR_SHNO = JH_SHNO(+)
AND JH_CODE = JM_CODE(+)


--SELECT DR_SHNO �й�, IW_JCODE1 || IW_JCODE2 �ֹι�ȣ, IW_KNAME �л�����, ���ڱ������а��ڵ�, '1' �Ҽӱ�,
--'11' ��������, '1' �г��ڵ�, DECODE(NVL(DR_DRNIYMD, '0'), '0', '1', '2') ��ϱݳ��ο���,
--DECODE(NVL(DR_DRNIYMD,'0'), '0', '20110330', DR_DRNIYMD) ��ϱݸ�����,  --'20090930' ��ϱݸ�����,
--'0' �������±���, '032' �������������ڵ�, '036010337518' �������¹�ȣ, '�λ꿹������ �ȿ�ö' �������¿�����,
--DECODE(JM_GUBUN, '2', JM_DCODE, '00') �����ڵ�,
--DECODE(JM_GUBUN, '2', dr_jhtotal, 0) �������б�1,
--'' �����ڵ�2, 0 �������б�2, '' �����ڵ�3, 0 �������б�3,
--DECODE(JM_GUBUN, '0', DR_JHTOTAL + NVL(DR_YCGUM, 0), 0) �������б�, DECODE(JM_GUBUN, '1', DR_JHTOTAL, 0) �������б�,
--DR_SURYO ������, DR_GISBI �⼺ȸ��, DR_IPHAK ���б�,
--JH_NAME ���и�, DR_DRTOTAL ��ϱݾ�
--FROM IPSI.IPSI203, IPSI.IPSI204, IPSI.IPSI201, IPSI.IPSI104 A, psutis.AC1121 AA, psutis.TBL�а�, PSUTIS.AC1701
--WHERE DR_YEAR = '2011' and dr_chasu = '02'
--AND DR_YEAR = IW_YEAR
--AND DR_SHNO = IW_SHNO
--AND IW_JWHGCODE1 = A.HG_CODE AND HG_GYCODE = AA.HG_CODE AND AA.HG_MCODE = �а��ڵ�(+)
--AND DR_YEAR = JH_YEAR AND DR_SHNO = JH_SHNO
--AND JH_CODE = JM_CODE
--union
--SELECT DR_SHNO �й�, IW_JCODE1 || IW_JCODE2 �ֹι�ȣ, IW_KNAME �л�����, ���ڱ������а��ڵ�, '1' �Ҽӱ�,
--'11' ��������, '1' �г��ڵ�, DECODE(NVL(DR_DRNIYMD, '0'), '0', '1', '2') ��ϱݳ��ο���,
--DECODE(NVL(DR_DRNIYMD,'0'), '0', '20110330', DR_DRNIYMD) ��ϱݸ�����,  --'20090930' ��ϱݸ�����,
--'0' �������±���, '032' �������������ڵ�, '036010337518' �������¹�ȣ, '�λ꿹������ �ȿ�ö' �������¿�����,
--'', 0, '', 0, '', 0, NVL(DR_YCGUM, 0), 0,
--DR_SURYO, DR_GISBI, DR_IPHAK,
--'', DR_DRTOTAL
--FROM IPSI.IPSI203, IPSI.IPSI201, IPSI.IPSI104 A, psutis.AC1121 AA, psutis.TBL�а�
--WHERE DR_YEAR = '2011'  and dr_chasu = '02'
--AND DR_YEAR = IW_YEAR
--AND DR_SHNO = IW_SHNO
--AND IW_JWHGCODE1 = A.HG_CODE AND HG_GYCODE = AA.HG_CODE AND AA.HG_MCODE = �а��ڵ�(+)
--and iw_shno not in (select jh_shno from ipsi.ipsi204 where jh_year = '2011')
