SELECT DECODE(SUBSTR(iw_chasu,1,1), '9', 'A', '0', 'G', '*') �����ñⱸ��,
	iw_kname �̸�, iw_jcode1 || iw_jcode2 �ֹε�Ϲ�ȣ, iw_ggcode ��Ű���б��ڵ�,
    iw_ggjyear �����⵵, 'A000003810' ��������ڵ�, iw_shno �����ȣ,
    DECODE(SUBSTR(iw_shno, 1,1), '1', '1', '2', '3', '3', '4') ������ұ���, iw_ipymd || '0000' ��������,
    DECODE(nvl(��������, '0'), '0', '0', DECODE(NVL(ȯ������, '1'), '1', '1', '0')) ��ġ�ݳ��ο���
    FROM ipsi.IPSI201, CISS.TDFEEGOJI
    WHERE iw_year = :�Խÿ���
    --AND iw_chasu = '92'
    AND iw_year = schoolyear AND iw_shno = hakbun