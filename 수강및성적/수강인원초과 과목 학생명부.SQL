SELECT 학년도, 학기, 학과명, bb.학년, 과목코드, 과목명, 분반, cc.학번, cc.성 || cc.이름 성명, aa.WRITEDATE FROM tdresult aa,
(SELECT c.schoolyear 학년도, c.semester 학기, hgkname 학과명, c.lvl 학년,
	c.gmcode 과목코드, g.gmkname 과목명, r.bangbn 분반, cnt 수강인원
  FROM psutis.TDCurriculum c, psutis.tmgwamok g,
       (SELECT schoolyear, semester, sghgcode, gmcode, bangbn, COUNT(*) cnt
         FROM psutis.TDcourse
        WHERE schoolyear = :학년도 AND semester = :학기
        GROUP BY schoolyear, semester, sghgcode, gmcode, bangbn
       ) r,
       psutis.tmhakgwa h
 WHERE c.schoolyear = :학년도 and c.semester = :학기
       AND c.schoolyear = r.schoolyear(+) AND c.semester = r.semester(+)
       AND c.hgcode = r.sghgcode(+) AND c.gmcode = r.gmcode(+)
       AND c.hgcode = h.hgcode
       AND c.gmcode = g.GMCODE
 	   AND cnt > 40
ORDER BY c.schoolyear, c.semester, hgkname, c.lvl, g.gmkname, c.gmcode, r.bangbn) bb,
tm학적 cc
WHERE aa.schoolyear = bb.학년도 AND aa.SEMESTER = bb.학기
--AND aa.sglvl = bb.학년
AND aa.GMCODE = bb.과목코드
AND aa.BANGBN = bb.분반
AND aa.HAKBUN = cc.학번