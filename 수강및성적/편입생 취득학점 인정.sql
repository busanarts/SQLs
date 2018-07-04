INSERT INTO psutis.tdresult
(hakbun,schoolYEAR,lvl,semester,
sghgcode, GMCODE,BANgbn,studygbn,
gradejum,totjumsu,gradelvl,avejumsu,
hgcode, injung, sglvl)
VALUES
( :학번, :학년도, :학년, :학기,
:학과코드, '0000000', 'A', 'AC110513',
:인정학점, 0, 'P', '0',
:학과코드, 'Y', :학년);

INSERT INTO psutis.tdcourse
(hakbun,schoolYEAR,lvl,semester,
sghgcode, GMCODE,BANgbn,studygbn,
gradejum,
hgcode, sglvl)
VALUES
( :학번, :학년도, :학년, :학기,
:학과코드, '0000000', 'A', 'AC110513',
:인정학점,
:학과코드, :학년);
