SELECT ���ڱ��ڵ�, DECODE(CHANGECD, '52', '15', '53', '14', '11') �����ڵ�,
�ֹε�Ϲ�ȣ, a.�й�, �� || �̸� ����,
�г�, '' ������������, ��ϱ� --+ NVL(payment,0) ��ϱ�
FROM tm���� a, tm�а� b,
--(SELECT hakbun, SUM(DECODE(state, '88', -fee, fee)) + SUM(DECODE(state, '88', -etcfee, etcfee)) ��ϱ� FROM TDFEERECEIVE
(SELECT hakbun, rcvamt ��ϱ� FROM TDFEEGOJI
WHERE schoolyear = :�г⵵ AND semester = :�б�
AND studentgbn <> '30304000'
--GROUP BY hakbun ) d,
) d,
(SELECT * FROM TDSCHOOLCHG WHERE CHANGECD IN ('52', '53') AND SCHOOLYEAR = :�г⵵ AND SEMESTER = :�б�) c
--where a.�й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%'
WHERE  SUBSTR(a.��������,1,1) IN ('0', '1')
AND (a.�й� LIKE 'A' || SUBSTR(:�г⵵,3,2) || '%' OR (�й� IN
(SELECT hakbun FROM TDSCHOOLCHG WHERE CHANGECD IN ('52', '53') AND SCHOOLYEAR = :�г⵵ AND SEMESTER = :�б�)))
AND a.�а��ڵ� = b.�а��ڵ�
AND a.�й� = d.hakbun
AND a.�й� = c.HAKBUN(+)
