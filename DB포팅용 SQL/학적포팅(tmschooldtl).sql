INSERT INTO TMSCHOOLDTL
SELECT hj_hakbun, '', '' ���ڵ�, '' ���а�, '', '', '', hj_jolupno, hj_hakwino, '', hj_bname, hj_bgwancode, hj_bhghtel, hj_bhhptel, '' ����, '' �ּ�1, '' �ּ�2, '' ����, ''
FROM psutis.ac12011
WHERE hj_hakbun NOT IN (SELECT hakbun FROM TMschooldtl)

