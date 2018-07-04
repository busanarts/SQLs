INSERT INTO TMSCHOOLDTL
SELECT hj_hakbun, '', '' 고교코드, '' 고교학과, '', '', '', hj_jolupno, hj_hakwino, '', hj_bname, hj_bgwancode, hj_bhghtel, hj_bhhptel, '' 우편, '' 주소1, '' 주소2, '' 사진, ''
FROM psutis.ac12011
WHERE hj_hakbun NOT IN (SELECT hakbun FROM TMschooldtl)

