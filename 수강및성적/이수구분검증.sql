SELECT �й�, f_hgnm(�а��ڵ�) �а�, �г�, ��������,
f_codenm(a.studygbn) �����̼�����,  f_codenm(b.studygbn) �����̼�����, a.gmcode �����ڵ�,
f_gwamoknm(a.gmcode) �����, f_hgnm(a.SGHGCODE) �����а�, a.SGLVL �����г�,
b.lvl �����г�
FROM ciss.tm����, tdresult a, TDCURRICULUM b
WHERE --�й� IN ('A1125051', 'A1225148', 'A1425139')
�й� = hakbun
AND a.schoolyear = :�г⵵ AND a.semester = :�б�
--AND SUBSTR(a.gmcode,3,2) <> SUBSTR(a.studygbn,7,2)
AND a.SCHOOLYEAR = b.SCHOOLYEAR
AND a.SEMESTER = b.SEMESTER
AND a.gmcode = b.GMCODE
AND a.SGLVL = b.LVL
AND a.STUDYGBN <> b.STUDYGBN
AND a.sghgcode = b.hgcode
AND �а��ڵ� = a.sghgcode

