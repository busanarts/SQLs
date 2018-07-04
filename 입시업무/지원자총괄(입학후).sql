SELECT DECODE(SUBSTR(iw_chasu, 1,1), '9', '����', '0', '����') || SUBSTR(iw_chasu,2,1) || '��'  ����,
iw_shno ������ȣ, iw_kname ����, iw_jcode1 || '-' || iw_jcode2 �ֹι�ȣ,
hg_name �а���, SI_HAKBUN �й�, decode(substr(iw_jhgubun,1,1), '5', '������', '������') ��������, jg_name || '-' || jg_fname ����������,
SUBSTR(iw_hdtel,1,3) || '-' || SUBSTR(iw_hdtel,4,4) || '-' || SUBSTR(iw_hdtel,8,4) �ڵ���,
iw_telno1 || '-' || iw_telno2 || '-' || iw_telno3 ��ȭ��ȣ,
iw_ggcode ���ڵ�,
iw_ggname ����б�, iw_ggjyear �����⵵,
DECODE(IW_RESULT, '1', '�հ�', '2', '�����հ�', '3', '���հ�', '4', '�հ�����', '5', '����հ�') �հݿ���,
DECODE(state, '77', '�ϳ�', '88', 'ȯ��', '22', '�κг�', '33', '��������', '11', '�̳�') ��Ͽ��� --, DECODE(iw_sgcheck, '1', '��') �л���Ȱ�뵿��
FROM ipsi.IPSI201, ipsi.IPSI104, ipsi.IPSI108, ciss.tdfeegoji, ipsi.IPSI401
WHERE iw_year = :�Խó⵵
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year and iw_jhgubun = jg_code
AND si_year = schoolyear(+) AND si_hakbun = hakbun(+)
AND studentgbn(+) <> '30304000'
AND IW_YEAR = SI_YEAR(+) AND IW_JSNO = SI_SHNO(+)
ORDER BY SUBSTR(iw_chasu,1,1) DESC, SUBSTR(iw_chasu, 2,1), hg_name, iw_kname