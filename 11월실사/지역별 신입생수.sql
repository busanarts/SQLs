SELECT  �õ�, COUNT(*) �����ο� FROM AC12011, ipsi.ipsi201,
(SELECT DISTINCT neis�б��ڵ�, �õ� FROM ipsi.����б��ڵ�)
--SELECT  hj_hakbun, hj_craddr1, iw_jhgubun, iw_ggcode, iw_ggname, �õ� FROM AC12011, ipsi.ipsi201, ipsi.����б��ڵ�
WHERE hj_hakbun LIKE 'A06%'
AND SUBSTR(hj_iymd,1,4) = iw_year
AND hj_shno = iw_shno
AND hj_jcode1 = iw_jcode1 AND hj_jcode2 = iw_jcode2
AND iw_ggcode = neis�б��ڵ�(+)
--AND �õ� IS null
GROUP BY cube(�õ�)