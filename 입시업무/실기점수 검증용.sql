SELECT * FROM ipsi303
WHERE sg_year = :�Խÿ���
AND sg_chasu = :����
--AND (sg_jumsu1 + sg_jumsu2 + sg_jumsu3)<> sg_totjumsu
AND ROUND((sg_jumsu1 + sg_jumsu2 + sg_jumsu3) / 3, 2) <> sg_avgjumsu;
SELECT * FROM ipsi202, ipsi303
WHERE sg_year = :�Խÿ���
AND sg_chasu = :����
AND sg_year = sj_year
AND sg_shno = sj_jsno
AND sg_avgjumsu <> sj_sghjum