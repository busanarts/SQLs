SELECT �а���, �г�,
       MAX(DECODE(��������, '54', DECODE(��������, '����', �ο�))) ����_����,
	     MAX(DECODE(��������, '54', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '53', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '53', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '51', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '51', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '52', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '52', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '55', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '55', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '56', DECODE(��������, '����', �ο�))) ����_����,
       MAX(DECODE(��������, '56', DECODE(��������, '����', �ο�))) ����_����
FROM
(SELECT �а���, hj_haknyun �г�, hj_jhgbn ��������, jg_fname,
DECODE(SUBSTR(hj_state,1,1), '0', '����', '����') ��������, COUNT(*) �ο�
FROM AC12011_2012_10_01, AC1121, tbl�а�, ipsi.ipsi108
WHERE SUBSTR(hj_state,1,1) IN ('0', '1') AND hj_jhgbn >= '50'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
AND hj_jhgbn = jg_code
GROUP BY �а���, hj_haknyun, hj_jhgbn, jg_fname, DECODE(SUBSTR(hj_state,1,1), '0', '����', '����'))
GROUP BY �а���, �г�
ORDER BY �а���, �г�