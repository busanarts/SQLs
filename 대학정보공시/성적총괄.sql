SELECT DISTINCT a.schoolyear ���س⵵, a.semester �б�, lvl �г�, hakbun �й�, hgkname �а�, a.gmcode �����ڵ�, gmkname �����,
gradelvl ���, DECODE(SUBSTR(studygbn,7,1), '1', '����', '2', '����', '3', '����', '4', '�ڼ�') �̼�����, gradejum ����
FROM psutis.tdresult a, psutis.TMGWAMOK b, psutis.TMHAKGWA c
WHERE a.schoolyear = :�г⵵
AND a.gmcode = b.gmcode
AND a.HGCODE = c.HGCODE
--AND SUBSTR(sj_isugbm,1,1) = '2'
--AND injung = 'Y'
AND gmkname = '�����а���'
AND a.semester = '1'
--AND sj_year = gg_year
--AND sj_hakgi = gg_hakgi
--AND sj_gggmcode = gg_gmcode
