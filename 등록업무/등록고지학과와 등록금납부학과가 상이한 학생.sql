SELECT �й�, �� || �̸� ����, �����ȣ, �а��ڵ�, F_DEPTNM(�а��ڵ�) �а��ڵ�, A.CLASS �����а�, B.CLASS ����а�
FROM TDFEEGOJI a, TDFEERECEIVE b, tm����
WHERE a.hakbun = b.hakbun
AND a.schoolyear = b.schoolyear
AND A.CLASS <> B.CLASS
AND a.hakbun = �й�