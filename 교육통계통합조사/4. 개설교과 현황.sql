SELECT DECODE(edumajorcode, '02', '�ι�', '07', '��ü��', '') �迭, hgkname �а���, ��������.lvl �г�, gmkname ������,
DECODE(SUBSTR(��������.studygbn,7,1), '1', '����', '2', '����', '����') �̼�����, ��������.gradejum ����, irtime �̷нü�, sstime �ǽ��ü�, irtime+sstime �ü�, tm_ban �й�,
tm_pfcode �����ڵ�, is_kname ������, is_jikgub �����ڵ�, DECODE(is_jikgub, '88', '�ð�����', '15', '���ӱ���', '21', '��챳��', '20', '������',
DECODE(SUBSTR(is_jikgub,1,1), '1', '���ӱ���', '��Ÿ')) ���޸�, hakbun �й�
FROM psutis.TDRESULT ����,
(SELECT * FROM psutis.ac22011, psutis.ac2105 WHERE is_jikgub = jg_jgcode) �λ�, psutis.TDCURRICULUM ��������, psutis.tmHakgwa �а�, psutis.TMGWAMOK ����,
(SELECT DISTINCT tm_year, tm_haknyun, tm_hakgi, tm_hgcode, tm_gmcode, tm_pfcode, tm_ban FROM psutis.TMTIMESCHEDULE WHERE tm_year = :�г⵵ AND tm_hakgi = :�б�) �ð�ǥ
WHERE
��������.SCHOOLYEAR = :�г⵵ AND ��������.SEMESTER = :�б�
AND ��������.SCHOOLYEAR = �ð�ǥ.tm_year
AND ��������.SEMESTER = �ð�ǥ.TM_HAKGI
AND ��������.lvl = �ð�ǥ.tm_haknyun
AND ��������.HGCODE = �ð�ǥ.tm_hgcode
AND ��������.GMCODE = �ð�ǥ.TM_gmCODE

AND ����.SCHOOLYEAR = �ð�ǥ.tm_year
AND ����.SEMESTER = �ð�ǥ.TM_HAKGI
AND ����.sgHGCODE = �ð�ǥ.tm_hgcode
AND ����.SGLVL = �ð�ǥ.tm_haknyun
AND ����.GMCODE = �ð�ǥ.TM_gmCODE
AND ����.BANGBN = �ð�ǥ.tm_ban

AND NVL(�ð�ǥ.tm_pfcode, '') = �λ�.is_id(+)
AND ��������.HGCODE = �а�.HGCODE
AND ��������.GMCODE = ����.GMCODE
