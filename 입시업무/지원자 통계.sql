SELECT hg_name �а���, SUBSTR(iw_jhgubun,1,1) ��������, COUNT(*) ������, sum(CASE WHEN iw_result = '1' THEN 1 end) �հ��ڼ�
FROM ipsi.IPSI201, ipsi.IPSI104
WHERE iw_year = '2012'
--AND iw_result = '1'
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
GROUP BY hg_name, SUBSTR(iw_jhgubun,1,1)
ORDER BY hg_name
