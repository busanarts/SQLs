SELECT DECODE(SUBSTR(IW_CHASU,1,1), '9', '����', '����') || SUBSTR(IW_CHASU,2,1) || '��' ����,
iw_shno �����ȣ, iw_kname ����, DECODE(iw_dungrok, '1', '���') ��Ͽ���, sc_name �Ǳ��
FROM ipsi.IPSI201, ipsi.ipsi109
WHERE iw_year = '2015' --AND iw_chasu = '02'
AND iw_jwhgcode1 = '01'
AND iw_result IN ('1', '5')
AND iw_sgcode = sc_code

