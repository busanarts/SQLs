SELECT iw_year �Խÿ���, iw_chasu ����, iw_kname ����, iw_shno �����ȣ, hg_name �����а�
FROM ipsi.ipsi201, ipsi.IPSI104
WHERE iw_year = :�Խÿ��� AND iw_chasu = :����
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
AND iw_jcode1 || iw_jcode2 IN
(SELECT iw_jcode1 || iw_jcode2 �ֹι�ȣ FROM
(SELECT iw_jcode1, iw_jcode2, COUNT(*) FROM ipsi.ipsi201
WHERE iw_year = :�Խÿ��� AND iw_chasu = :����
GROUP BY iw_jcode1, iw_jcode2
HAVING COUNT(*) > 1))