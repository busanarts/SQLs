SELECT DISTINCT a.schoolyear 기준년도, a.semester 학기, lvl 학년, hakbun 학번, hgkname 학과, a.gmcode 과목코드, gmkname 과목명,
gradelvl 등급, DECODE(SUBSTR(studygbn,7,1), '1', '교양', '2', '전공', '3', '교직', '4', '자선') 이수구분, gradejum 학점
FROM psutis.tdresult a, psutis.TMGWAMOK b, psutis.TMHAKGWA c
WHERE a.schoolyear = :학년도
AND a.gmcode = b.gmcode
AND a.HGCODE = c.HGCODE
--AND SUBSTR(sj_isugbm,1,1) = '2'
--AND injung = 'Y'
AND gmkname = '교육학개론'
AND a.semester = '1'
--AND sj_year = gg_year
--AND sj_hakgi = gg_hakgi
--AND sj_gggmcode = gg_gmcode
