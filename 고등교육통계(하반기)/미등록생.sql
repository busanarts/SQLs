SELECT �а���, �г�, MAX(DECODE(����, '��', �̵��, 0)) ��, MAX(DECODE(����, '��', �̵��, 0)) ��
FROM (
SELECT �а���, hj_haknyun �г�, DECODE(hj_sexgbn, '1', '��', '2', '��', '') ����, COUNT(*) �̵��
FROM TDFEEGOJI, psutis.ac12011_2012_10_01, psutis.ac1121, psutis.tbl�а�
WHERE schoolyear = '2012'
AND semester = '2'
AND state = '11'
AND hakbun = hj_hakbun
AND SUBSTR(hj_state, 1, 1) IN ( '0', '1')
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
AND hj_jhgbn < '50'
GROUP BY �а���, hj_haknyun, DECODE(hj_sexgbn, '1', '��', '2', '��', '')
)
GROUP BY �а���, �г�
ORDER BY �а���, �г�