SELECT iw_shno �����ȣ, iw_kname ����, iw_jcode1 || '-' || iw_jcode2 �ֹι�ȣ, hg_name �����а�,
DECODE(iw_result, '1', '�հ�(' || iw_rank1 || ')', '2', '�����հ�(' || iw_rank2 || ')', '���հ�') �հݿ���,
iw_ucode1 ||'-' || iw_ucode2 �����ȣ, iw_addr1 �ּ�1, iw_addr2 �ּ�2,
SUBSTR(iw_hdtel,1,3) || '-' || SUBSTR(iw_hdtel,4,4) || '-' || SUBSTR(iw_hdtel,8,4) �ڵ���, iw_chasu ����
FROM IPSI201, IPSI104
WHERE iw_year = '2010' AND iw_chasu = '92'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
ORDER BY iw_chasu, hg_name, iw_result, iw_rank1, iw_rank2, iw_kname