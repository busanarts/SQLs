SELECT �а���, �г�,
       MAX(DECODE(����, '1', DECODE(��������, '����', �ο�))) ���γ�_����,
       MAX(DECODE(����, '2', DECODE(��������, '����', �ο�))) ���ο�_����,
	     MAX(DECODE(����, '1', DECODE(��������, '����', �ο�))) ���γ�_����,
       MAX(DECODE(����, '2', DECODE(��������, '����', �ο�))) ���ο�_����
FROM
(SELECT �а���, hj_haknyun �г�, hj_sexgbn ����,
DECODE(SUBSTR(hj_state,1,1), '0', '����', '����') ��������, COUNT(*) �ο�
FROM AC12011_2012_10_01, AC1121, tbl�а�
WHERE SUBSTR(hj_state,1,1) IN ('0', '1') AND hj_jhgbn = '54'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
GROUP BY �а���, hj_haknyun, hj_sexgbn, DECODE(SUBSTR(hj_state,1,1), '0', '����', '����'))
GROUP BY �а���, �г�
ORDER BY �а���, �г�