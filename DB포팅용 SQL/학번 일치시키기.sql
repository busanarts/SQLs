UPDATE TM���� AA SET �й� = (SELECT hj_hakbun FROM PSUTIS.AC12011, tm���� aa
WHERE HJ_jcode1 = SUBSTR(AA.�ֹε�Ϲ�ȣ,1,6) AND hj_jcode2 = SUBSTR(aa.�ֹε�Ϲ�ȣ,7,7)
)
WHERE �ֹε�Ϲ�ȣ IN (
SELECT �ֹε�Ϲ�ȣ
FROM TM����, PSUTIS.AC12011
WHERE �й� <> HJ_HAKBUN
AND �ֹε�Ϲ�ȣ = hj_jcode1 || hj_jcode2
AND �������� = '01'
AND hj_hakbun LIKE 'A14%'
);
