SELECT DECODE(edumajorcode, '02', '인문', '07', '예체능', '') 계열, hgkname 학과명, 교육과정.lvl 학년, gmkname 교과명,
DECODE(SUBSTR(교육과정.studygbn,7,1), '1', '교양', '2', '전공', '교양') 이수구분, 교육과정.gradejum 학점, irtime 이론시수, sstime 실습시수, irtime+sstime 시수
--tm_pfcode 교수코드, is_kname 교수명, is_jikgub 직급코드 --, psutis.ac2105 직급
FROM psutis.TDCURRICULUM 교육과정, psutis.tmHakgwa 학과, psutis.TMGWAMOK 과목,
(SELECT DISTINCT tm_year, tm_hakgi, tm_hgcode, tm_gmcode FROM psutis.TMTIMESCHEDULE WHERE tm_year = :학년도) 시간표
WHERE
교육과정.SCHOOLYEAR = :학년도 AND 교육과정.SEMESTER = :학기
--AND 성적.LVL = 교육과정.LVL
AND 교육과정.SCHOOLYEAR = 시간표.tm_year
AND 교육과정.SEMESTER = 시간표.TM_HAKGI
AND 교육과정.HGCODE = 시간표.tm_hgcode
AND 교육과정.GMCODE = 시간표.TM_gmCODE
--AND 교육과정.BANGBN = 시간표.tm_ban

AND 교육과정.HGCODE = 학과.HGCODE
AND 교육과정.GMCODE = 과목.GMCODE
--AND is_jikgub = jg_jgcode(+)