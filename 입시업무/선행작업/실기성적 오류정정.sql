UPDATE ipsi303 SET sg_avgjumsu = sg_totjumsu / 3, sg_pungjumsu = sg_avgjumsu
--SELECT * FROM ipsi303, ipsi201
WHERE sg_year = :�Խÿ���
AND sg_chasu = :����
AND sg_shno IN (SELECT iw_shno FROM IPSI201
WHERE iw_year = :�Խÿ���
AND iw_chasu = :����
AND iw_jwhgcode1 = '03') -- �ǿ빫���
--AND sg_avgjumsu <> sg_pungjumsu
--AND sg_year = iw_year
--AND sg_chasu = iw_chasu
--AND sg_shno = iw_shno
--AND iw_jwhgcode1 = '03'