--UPDATE tdfeegoji SET rcvamt = f_feercvamt(hakbun, :�г⵵, :�б�)
SELECT hakbun FROM TDFEEGOJI
WHERE
studentgbn <> '30304000'
AND schoolyear = :�г⵵
AND semester = :�б�
AND LENGTH(hakbun) > 5
AND rcvamt <> NVL(f_feercvamt(hakbun, :�г⵵, :�б�),0)