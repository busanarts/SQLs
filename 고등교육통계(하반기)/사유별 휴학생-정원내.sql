SELECT �а���, �г�,
MAX(DECODE(������, '������', �ο�, 0)) ���Դ�,
MAX(DECODE(������, '���λ���', �ο�, 0)) ���λ���
FROM (
	SELECT �а���, HJ_HAKNYUN �г�, DECODE(hj_state, '12', '������', '���λ���') ������,
	COUNT(*) �ο�
	FROM AC12011_2012_10_01, AC1121, TBL�а�
	WHERE SUBSTR(HJ_STATE,1,1) = '1'
	--AND HJ_HAKNYUN = '2'
	AND HJ_HGCODE = HG_CODE
	AND HG_MCODE = �а��ڵ�
	AND HJ_JHGBN >= '50'
	GROUP BY CUBE(HJ_HAKNYUN, �а���,  DECODE(hj_state, '12', '������', '���λ���')))
GROUP BY �а���, �г�
ORDER BY �а���, �г�