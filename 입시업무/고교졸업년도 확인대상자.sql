SELECT iw_chasu ����, iw_jsno ������ȣ, iw_kname ����, iw_jcode1 || '-' || iw_jcode2 �ֹι�ȣ,
iw_jwhgcode1 �����а�, hg_name �а���, iw_jhgubun �����ڵ�, jg_fname ��������,
iw_ggcode ���ڵ�, iw_ggname ����, iw_ggjyear �������⵵, iw_ggjyear - ('19' || SUBSTR(iw_jcode1,1,2)) ������ÿ���
FROM IPSI201, IPSI104, IPSI108
WHERE iw_year = :�г⵵
and iw_chasu = :����
AND iw_jhgubun NOT IN ('51', '52', '54') -- ����, ��������, ��ܱ���, �ܱ��� ����
AND SUBSTR(iw_ggcode,2,9) <> '120000000' -- ������� ����
AND (iw_ggjyear < :�г⵵ - 5 OR iw_ggjyear > :�г⵵ OR iw_ggjyear IS NULL OR LENGTH(RTRIM(iw_ggjyear)) <> 4)
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year AND iw_jhgubun = jg_code