SELECT hakbun , rcvamt, prefee, etcfee, NVL(f_feercvamt(hakbun, :�г⵵,:�б�),0) FROM TDFEEGOJI
WHERE
studentgbn <> '30304000'
AND schoolyear = :�г⵵
AND semester = :�б�
AND LENGTH(hakbun) > 5
AND DECODE( semester, '1', rcvamt - NVL(prefee, 0) - NVL(etcfee, 0), rcvamt  - NVL(etcfee, 0)) <> NVL(f_feercvamt(hakbun, :�г⵵, :�б�),0)