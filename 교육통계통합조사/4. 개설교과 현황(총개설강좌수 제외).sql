SELECT DECODE(edumajorcode, '02', '�ι�', '07', '��ü��', '') �迭, hgkname �а���, ��������.lvl �г�, gmkname ������,
DECODE(SUBSTR(��������.studygbn,7,1), '1', '����', '2', '����', '����') �̼�����, ��������.gradejum ����, irtime �̷нü�, sstime �ǽ��ü�, irtime+sstime �ü�
--tm_pfcode �����ڵ�, is_kname ������, is_jikgub �����ڵ� --, psutis.ac2105 ����
FROM psutis.TDCURRICULUM ��������, psutis.tmHakgwa �а�, psutis.TMGWAMOK ����,
(SELECT DISTINCT tm_year, tm_hakgi, tm_hgcode, tm_gmcode FROM psutis.TMTIMESCHEDULE WHERE tm_year = :�г⵵) �ð�ǥ
WHERE
��������.SCHOOLYEAR = :�г⵵ AND ��������.SEMESTER = :�б�
--AND ����.LVL = ��������.LVL
AND ��������.SCHOOLYEAR = �ð�ǥ.tm_year
AND ��������.SEMESTER = �ð�ǥ.TM_HAKGI
AND ��������.HGCODE = �ð�ǥ.tm_hgcode
AND ��������.GMCODE = �ð�ǥ.TM_gmCODE
--AND ��������.BANGBN = �ð�ǥ.tm_ban

AND ��������.HGCODE = �а�.HGCODE
AND ��������.GMCODE = ����.GMCODE
--AND is_jikgub = jg_jgcode(+)