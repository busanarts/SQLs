SELECT ���ڱ������а��ڵ� �а��ڵ�,  DECODE(hc_scode, '52', '15', '53', '14', '19') �����ڵ�,
HJ_JCODE1 || HJ_JCODE2 �ֹε�Ϲ�ȣ, HJ_HAKBUN �й�, HJ_KNAME �л���,
USR_JANGHAK(b.jd_JMcode) ���л�ǰ�ڵ�1, b.jd_etcgm �������б�1,
USR_JANGHAK(c.JD_JMcode) ���л�ǰ�ڵ�2, c.jd_etcgm �������б�2,
'' ���л�ǰ�ڵ�3, '' �������б�3,
DECODE(USR_JHGUBUN(A.JD_JMCODE), '0', a.JD_IHAKG + a.jd_suryo + a.jd_etcgm + a.JD_GISBI, 0) �������б�,
DECODE(USR_JHGUBUN(A.JD_JMCODE), '1', a.JD_IHAKG + a.jd_suryo + a.jd_etcgm + a.JD_GISBI, 0) �������б�,
DD_IHAKG ���б�, DD_GISBI �⼺ȸ��, DD_SURYO ������
FROM PSUTIS.AC12011, PSUTIS.AC1121, PSUTIS.TBL�а�, PSUTIS.AC2711, PSUTIS.AC1711 a, PSUTIS.AC1712 b, PSUTIS.AC1713 c,
(
	SELECT * FROM PSUTIS.AC1202
    	WHERE HC_SCODE IN ('51', '52', '53') AND HC_SIYMD > DECODE(&�б�, '1', &�г⵵ - 1 || '12', '2', &�г⵵ || '07')
) bokhak -- �����ڷ� ��������
WHERE SUBSTR(HJ_STATE,1,1) in ('0', '1')
AND HJ_HAKBUN = HC_HAKBUN(+)
AND HJ_HGCODE = HG_CODE AND HG_MCODE = �а��ڵ�
AND DD_YEAR = &�г⵵ AND DD_HAKGI = &�б� AND HJ_HAKBUN = DD_HAKBUN
AND dd_year = a.jd_year(+) AND dd_hakgi = a.jd_hakgi(+) AND dd_hakbun = a.jd_hakbun(+)
AND dd_year = b.jd_year(+) AND dd_hakgi = b.jd_hakgi(+) AND dd_hakbun = b.jd_hakbun(+)
AND dd_year = c.jd_year(+) AND dd_hakgi = c.jd_hakgi(+) AND dd_hakbun = c.jd_hakbun(+)
--AND dd_totgum - dd_tgmgum > 0
