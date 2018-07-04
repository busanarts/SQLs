SELECT 학번, f_hgnm(학과코드) 학과, 학년, 학적상태,
f_codenm(a.studygbn) 수강이수구분,  f_codenm(b.studygbn) 개설이수구분, a.gmcode 과목코드,
f_gwamoknm(a.gmcode) 과목명, f_hgnm(a.SGHGCODE) 수강학과, a.SGLVL 수강학년,
b.lvl 개설학년
FROM ciss.tm학적, tdresult a, TDCURRICULUM b
WHERE --학번 IN ('A1125051', 'A1225148', 'A1425139')
학번 = hakbun
AND a.schoolyear = :학년도 AND a.semester = :학기
--AND SUBSTR(a.gmcode,3,2) <> SUBSTR(a.studygbn,7,2)
AND a.SCHOOLYEAR = b.SCHOOLYEAR
AND a.SEMESTER = b.SEMESTER
AND a.gmcode = b.GMCODE
AND a.SGLVL = b.LVL
AND a.STUDYGBN <> b.STUDYGBN
AND a.sghgcode = b.hgcode
AND 학과코드 = a.sghgcode

