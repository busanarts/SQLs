SELECT iw_ggcode �õ��ڵ�, iw_ggjyear �հݳ⵵, SUBSTR(iw_ipsino, 11,1) �հ�ȸ��, iw_jcode1 || iw_jcode2 �ֹι�ȣ, iw_shno �����ȣ, jg_name ��������,
decode(substr(iw_Chasu,1,1), '9', '����', '����') || substr(iw_chasu,2,1) || '��' ����, hg_name �а���
FROM ipsi201, ipsi104, ipsi108
where iw_year  = :�Խÿ��� AND iw_chasu = :����
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
and iw_jhgubun = jg_code
And substr(iw_ggcode,2,9) in ('120000000', '100000001')
-- And iw_jhgubun not in ('51','52','54')
and iw_ggjyear >= :�Խÿ��� -  5
and iw_sgcheck = '1'   -- �л���Ȱ�� �����ڸ� ����