SELECT iw_ggcode ���ڵ�,iw_jcode1 || iw_jcode2 �ֹι�ȣ,   iw_jsno �����ȣ, jg_name ��������,
decode(substr(iw_Chasu,1,1), '9', '����', '����') || substr(iw_chasu,2,1) || '��' ����,
hg_name �����а���,iw_kname ����
FROM ipsi201, ipsi104, ipsi108
where iw_year  = :�Խÿ��� And iw_Chasu = :����
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year(+) -- �����а�
and iw_jhgubun = jg_code(+) -- ��������
And substr(iw_ggcode,2,9) not in ('120000000', '100000001') -- ��������� ����
And iw_jhgubun not in ('51','52','54') -- ����/�������� ����
and iw_ggjyear >=  :�Խÿ��� - 5
and iw_sgcheck = '1'   -- �л���Ȱ�� �����ڸ� ����
