SELECT �а���, �г�, '' ����Ź��, '' ���ü��Ź��, '' ����а�,
      NVL(MAX(DECODE(��������, '54', DECODE(��������, '����', �ο�))), 0) �ܱ���_����,
	   	NVL(MAX(DECODE(��������, '54', DECODE(��������, '����', �ο�))), 0) �ܱ���_����,
      NVL(MAX(DECODE(��������, '53', DECODE(��������, '����', �ο�))), 0) �����_����,
      NVL(MAX(DECODE(��������, '53', DECODE(��������, '����', �ο�))), 0) �����_����,
      NVL(MAX(DECODE(��������, '52', DECODE(��������, '����', �ο�))), 0) ����_����,
      NVL(MAX(DECODE(��������, '52', DECODE(��������, '����', �ο�))), 0) ����_����,
      NVL(MAX(DECODE(��������, '51', DECODE(��������, '����', �ο�))), 0) ����_����,
      NVL(MAX(DECODE(��������, '51', DECODE(��������, '����', �ο�))), 0) ����_����,
      NVL(MAX(DECODE(��������, '55', DECODE(��������, '����', �ο�))), 0) +
      NVL(MAX(DECODE(��������, '56', DECODE(��������, '����', �ο�))), 0) ��Ÿ_����,
      NVL(MAX(DECODE(��������, '55', DECODE(��������, '����', �ο�))), 0) +
      NVL(MAX(DECODE(��������, '56', DECODE(��������, '����', �ο�))), 0) ��Ÿ_����
FROM
(SELECT hg_kname �а���, hj_haknyun �г�, hj_jhgbn ��������,
DECODE(SUBSTR(hj_state,1,1), '0', '����', '����') ��������, COUNT(*) �ο�
FROM AC12011_&���������, AC1121, TBL�а�
WHERE SUBSTR(hj_state,1,1) IN ('0', '1') AND hj_jhgbn >= '50'
AND HJ_HAKBUN NOT LIKE 'T%'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
GROUP BY hg_kname, hj_haknyun, hj_jhgbn, SUBSTR(hj_state,1,1))
GROUP BY �а���, �г�
ORDER BY �а���, �г�