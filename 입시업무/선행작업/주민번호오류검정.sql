--�ֹι�ȣ�� �� 13�ڸ��ε�, ���� 12�ڸ��� �����
--ù ���ں��� ���� 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5�� ���Ѵ�.
--�� ������ ��� ���Ѵ���, 11�� ������ �� �������� �ٽ� 11���� �� ����
--������ �ڸ���(13��°)�� ��ġ�ϸ� �ֹε�Ϲ�ȣ�� �����̶� ����.
--������ ������ ���� ����� 10�̸� 0�� ���ϰ� 11�̸� 1�� ���Ѵ�.

SELECT iw_chasu ����, iw_jsno ������ȣ, iw_kname ����, iw_jcode1 || '-' || iw_jcode2 �ֹι�ȣ,
SUBSTR(iw_jcode2, 7,1) - mod(11 - MOD(SUBSTR(iw_jcode1,1,1) * 2 +
SUBSTR(iw_jcode1,2,1) * 3 +
SUBSTR(iw_jcode1,3,1) * 4 +
SUBSTR(iw_jcode1,4,1) * 5 +
SUBSTR(iw_jcode1,5,1) * 6 +
SUBSTR(iw_jcode1,6,1) * 7 +
SUBSTR(iw_jcode2,1,1) * 8 +
SUBSTR(iw_jcode2,2,1) * 9 +
SUBSTR(iw_jcode2,3,1) * 2 +
SUBSTR(iw_jcode2,4,1) * 3 +
SUBSTR(iw_jcode2,5,1) * 4 +
SUBSTR(iw_jcode2,6,1) * 5, 11) + DECODE(SUBSTR(iw_jcode2,1,1), '5', 2, '6', 2, 0),10) ������,
iw_ggjyear �������⵵, hg_name �����а�, iw_jhgubun ��������, iw_sgcode �Ǳ��ڵ�
FROM IPSI.IPSI201, ipsi.ipsi104
WHERE iw_year = :�Խÿ���
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
AND SUBSTR(iw_jcode2, 7,1) - mod(11 - MOD(SUBSTR(iw_jcode1,1,1) * 2 +
SUBSTR(iw_jcode1,2,1) * 3 +
SUBSTR(iw_jcode1,3,1) * 4 +
SUBSTR(iw_jcode1,4,1) * 5 +
SUBSTR(iw_jcode1,5,1) * 6 +
SUBSTR(iw_jcode1,6,1) * 7 +
SUBSTR(iw_jcode2,1,1) * 8 +
SUBSTR(iw_jcode2,2,1) * 9 +
SUBSTR(iw_jcode2,3,1) * 2 +
SUBSTR(iw_jcode2,4,1) * 3 +
SUBSTR(iw_jcode2,5,1) * 4 +
SUBSTR(iw_jcode2,6,1) * 5, 11) + DECODE(SUBSTR(iw_jcode2,1,1), '5', 2, '6', 2, 0),10) <> 0
