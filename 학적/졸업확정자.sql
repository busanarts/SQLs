SELECT �а���, sj_hakbun �й�, hj_kname ����, hj_craddr1 || ' ' || hj_craddr2 �ּ�, hj_hshptel �޴���ȭ,
COUNT(DISTINCT sj_year || sj_hakgi) �����б�,
SUM(sj_hjum) ��û����, SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) �������,
DECODE(SIGN(SUM(DECODE(sj_dunggub, 'F', 0, sj_hjum)) - 80), 1, '��������', 0, '��������') �������ɿ���,
ju_jno ������ȣ, ju_hno ������ȣ
FROM AC1401, AC12011, AC1611, AC1121, tbl�а�
WHERE sj_hakbun = hj_hakbun
--AND hj_haknyun = '2'
AND hj_state = '01'
AND hj_hakbun = ju_hakbun
--AND sj_dunggub <> 'F'
AND ju_jcheck = '0'
AND hj_hgcode = hg_code AND hg_mcode = �а��ڵ�
GROUP BY �а���, sj_hakbun, hj_kname, hj_craddr1, hj_craddr2, hj_hshptel, ju_jno, ju_hno
--HAVING COUNT(DISTINCT sj_year || sj_hakgi) >= 4