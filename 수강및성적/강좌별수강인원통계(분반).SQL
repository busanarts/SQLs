SELECT c.schoolyear 학년도, c.semester 학기, DECODE(hgkname,'복지예술치료상담과', '인문', '예술') 계열, hgkname 학과명, c.lvl 학년,
	c.gmcode 과목코드, g.gmkname 과목명, r.bangbn 분반, cnt 수강인원
  FROM psutis.TDCurriculum c, psutis.tmgwamok g,
       (SELECT schoolyear, semester, sghgcode, gmcode, bangbn, COUNT(*) cnt
         FROM psutis.TDResult
        WHERE schoolyear >= :학년도 --AND semester = :학기
        GROUP BY schoolyear, semester, sghgcode, gmcode, bangbn
       ) r,
       psutis.tmhakgwa h
 WHERE c.schoolyear >= :학년도 --and c.semester = :학기
       AND c.schoolyear = r.schoolyear(+) AND c.semester = r.semester(+)
       AND c.hgcode = r.sghgcode(+) AND c.gmcode = r.gmcode(+)
       AND c.hgcode = h.hgcode
       AND c.gmcode = g.GMCODE
ORDER BY c.schoolyear, c.semester, hgkname, c.lvl, g.gmkname, c.gmcode, r.bangbn