SELECT �а��ڵ�, �ֹι�ȣ, �й� �����й�, hj_hakbun �й�, ����,
CASE hj_state
	WHEN '24' THEN '66'
  WHEN '21' THEN '67'
  WHEN '22' THEN '67'
  WHEN '23' THEN '67'
  WHEN '81' THEN '69'
  WHEN '82' THEN '69'
  WHEN '83' THEN '69'
END ���������ڵ�,
SUBSTR(hj_iymd,1,6) ���г��,
DECODE(SUBSTR(hj_state,1,1), '8', SUBSTR(hj_jymd,1,6), SUBSTR(hj_lcymd,1,6)) �����������,
DECODE(SUBSTR(hj_state,1,1), '8', hj_jymd, hj_lcymd) ����������
FROM ac12011, tbl���ڱݴ�����
--WHERE hj_hakbun(+) = �й�
WHERE hj_jcode1(+) || hj_jcode2(+) = �ֹι�ȣ

