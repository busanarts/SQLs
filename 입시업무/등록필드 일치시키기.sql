--UPDATE IPSI201 SET iw_dungrok = '0'
--WHERE iw_year = :�Խÿ���;

UPDATE ipsi.IPSI201 SET iw_dungrok = '1'
WHERE iw_year = :�Խÿ���
AND (iw_year, iw_shno) IN ( SELECT schoolyear, hakbun FROM ciss.TDFEEGOJI
WHERE schoolyear = :�Խÿ���
--AND studentgbn <> '30304000'
AND state IN ('77', '22', '33'));   -- 77 = �ϳ�, 22 = ����

UPDATE ipsi.IPSI201 SET iw_dungrok = '4'
WHERE iw_year = :�Խÿ���
AND (iw_year, iw_shno) IN ( SELECT schoolyear, hakbun FROM ciss.TDFEEGOJI
WHERE schoolyear = :�Խÿ���
--AND studentgbn <> '30304000'
AND state IN ('88'));   -- 77 = �ϳ�, 22 = ����

