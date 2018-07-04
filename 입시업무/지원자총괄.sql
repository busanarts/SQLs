SELECT DECODE(SUBSTR(iw_chasu, 1,1), '9', '����', '0', '����') || SUBSTR(iw_chasu,2,1) || '��'  ����,
iw_shno ������ȣ, hg_name �а���, decode(substr(iw_jhgubun,1,1), '5', '������', '������') ��������, jg_name || '-' || jg_fname ����������,
iw_kname ����, iw_jcode1 || '-' || iw_jcode2 �ֹι�ȣ,
SUBSTR(iw_hdtel,1,3) || '-' || SUBSTR(iw_hdtel,4,4) || '-' || SUBSTR(iw_hdtel,8,4) �ڵ���,
iw_telno1 || '-' || iw_telno2 || '-' || iw_telno3 ��ȭ��ȣ,
iw_ggcode ���ڵ�, iw_ggname ����б�, iw_ggjyear �����⵵,
DECODE(iw_result, '1', '�հ�', '2', '�����հ�')  �հݿ���, DECODE(iw_dungrok, '1', '���', '4', 'ȯ��') ��Ͽ���, SI_HAKBUN �й�,
dr_drniymd ��������, dr_drhbymd ȯ������
FROM ipsi.IPSI201, ipsi.IPSI104, ipsi.IPSI108, ipsi.IPSI203, ipsi.IPSI401
WHERE iw_year = '2012'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year and iw_jhgubun = jg_code
AND iw_year = dr_year(+) AND iw_shno = dr_shno(+)
AND IW_YEAR = SI_YEAR(+) AND IW_JSNO = SI_SHNO(+)
ORDER BY SUBSTR(iw_chasu,1,1) DESC, SUBSTR(iw_chasu, 2,1), hg_name, iw_kname