SELECT a.hakbun �й�, b.admissionfee �������б�, a.admissionfee �ο������б�,
b.tuition ���ؼ�����, a.tuition �ο��ȼ�����, USR_LCSCODE(a.hakbun) �������������ڵ�
FROM TDFEEGOJI a, TMFEEDTL b
WHERE schoolyear = :�г⵵ AND semester = :�б�
AND A.CLASS = B.CLASS AND a.lvl = b.lvl
AND (a.admissionfee <> b.admissionfee OR a.tuition <> b.tuition)