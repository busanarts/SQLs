SELECT DECODE(edumajorcode, '02', '�ι�', '07', '��ü��', '') �迭, hgkname �а���, gmkname ������,
DECODE(SUBSTR(��������.studygbn,7,1), '1', '����', '2', '����', '����') �̼�����, irtime �̷нü�, sstime �ǽ��ü�, tm_ban �й�,
tm_pfcode �����ڵ�, is_kname ������, is_jikgub �����ڵ�, jg_name ����, hakbun �й�, psutis.ac2105 ����
FROM psutis.tdresult ����, psutis.ac22011 �λ�, psutis.TDCURRICULUM ��������, psutis.tmHakgwa �а�, psutis.TMGWAMOK ����,
(SELECT DISTINCT tm_year, tm_hakgi, tm_hgcode, tm_gmcode, tm_pfcode, tm_ban FROM psutis.TMTIMESCHEDULE WHERE tm_year = :�г⵵) �ð�ǥ
WHERE ����.SCHOOLYEAR = :�г⵵
AND ����.SCHOOLYEAR = ��������.SCHOOLYEAR
AND ����.SEMESTER = ��������.SEMESTER
AND ����.SGHGCODE = ��������.HGCODE
AND ����.GMCODE = ��������.GMCODE

--AND ����.LVL = ��������.LVL
AND ����.SCHOOLYEAR = �ð�ǥ.tm_year
AND ����.SEMESTER = �ð�ǥ.TM_HAKGI
AND ����.HGCODE = �ð�ǥ.tm_hgcode
AND ����.GMCODE = �ð�ǥ.TM_gmCODE
AND ����.BANGBN = �ð�ǥ.tm_ban

AND �ð�ǥ.tm_pfcode = �λ�.is_id(+)
AND ��������.HGCODE = �а�.HGCODE
AND ��������.GMCODE = ����.GMCODE
AND is_jikgub = jg_jgcode