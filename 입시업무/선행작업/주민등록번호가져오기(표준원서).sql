UPDATE ipsi201 SET iw_jcode1 = (

SELECT SUBSTR(�ֹε�Ϲ�ȣ,1,6)
FROM ipsi201_2
WHERE iw_year = ��������
AND iw_shno = �����ȣ
AND iw_chasu = �Խ����� ), iw_jcode2 =(SELECT SUBSTR(�ֹε�Ϲ�ȣ,7,13)
FROM ipsi201_2
WHERE iw_year = ��������
AND iw_shno = �����ȣ
AND iw_chasu = �Խ����� ) , iw_hdtel = (SELECT REPLACE(�޴���ȭ,'-','')
FROM ipsi201_2
WHERE iw_year = ��������
AND iw_shno = �����ȣ
AND iw_chasu = �Խ����� )

WHERE iw_year = :�Խÿ���
AND iw_chasu = :�Խ�����
AND iw_shno IN (SELECT �����ȣ
FROM ipsi201 a, ipsi201_2 b
WHERE a.iw_year = ��������
AND iw_shno = �����ȣ
AND iw_chasu = �Խ����� )


