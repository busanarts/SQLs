SELECT hg_name 학과, iw_shno 수험번호, iw_kname 성명, socialnumber 주민번호,
max(DECODE(cno, 1, subjectname)) 과목11, MAX(DECODE(cno,1, unit)) 이수단위11, max(DECODE(cno, 1, rankinggrade)) 등급11,
max(DECODE(cno, 2, subjectname)) 과목12, MAX(DECODE(cno,2, unit)) 이수단위12, max(DECODE(cno, 2, rankinggrade)) 등급12,
max(DECODE(cno, 3, subjectname)) 과목21, MAX(DECODE(cno,3, unit)) 이수단위21, max(DECODE(cno, 3, rankinggrade)) 등급21,
max(DECODE(cno, 4, subjectname)) 과목22, MAX(DECODE(cno,4, unit)) 이수단위22, max(DECODE(cno, 4, rankinggrade)) 등급22
from
(SELECT row_number() over (partition BY SocialNumber ORDER BY term, rankingGrade) cno, socialnumber, subjectname, unit, rankinggrade
FROM selectedscore
ORDER BY socialnumber, term
), ipsi201, ipsi104
WHERE iw_year = :입시연도 AND iw_chasu = :차수
AND iw_jcode1 || iw_jcode2 = socialnumber
AND IW_JWHGCODE1 = HG_CODE and iw_year = hg_year
--WHERE socialnumber = '9503072820821'
GROUP BY hg_name, iw_shno, iw_kname, socialnumber
order BY hg_name, iw_shno, iw_kname


