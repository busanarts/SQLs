SELECT iw_year �Խÿ���, decode(SUBSTR(iw_chasu,1,1), '0', '����', '9', '����', '����') �����ñ�,
hg_name �а���, �б���, �õ�����û, SUBSTR(�ּ�,1, INSTR(�ּ�,' ')-1) ������,
COUNT(*) ������,
sum(CASE WHEN iw_result = '1' THEN 1
WHEN iw_result = '5' THEN  1 end) �հ��ڼ�
FROM ipsi.IPSI201, ipsi.IPSI104, tbl����б�
WHERE iw_year >= :�Խÿ���
AND iw_ggcode = �б��ڵ�(+)
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
GROUP BY iw_year, hg_name, SUBSTR(iw_chasu,1,1), �б���, �õ�����û, �ּ�
ORDER BY hg_name;
