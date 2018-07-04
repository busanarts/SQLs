UPDATE TDJANGHAK jj SET lvl = (SELECT DISTINCT lvl FROM TDFEEGOJI gg
WHERE gg.SCHOOLYEAR = jj.SCHOOLYEAR AND gg.SEMESTER = jj.SEMESTER
AND gg.hakbun = jj.hakbun)
WHERE (jj.hakbun, jj.SCHOOLYEAR, jj.SEMESTER) IN (
SELECT j.hakbun, j.SCHOOLYEAR, j.SEMESTER
--j.lvl 장학학년, g.lvl 고지서학년
FROM TDJANGHAK j, TDFEEGOJI g
WHERE j.schoolyear = g.SCHOOLYEAR
AND j.SEMESTER = g.SEMESTER
AND j.HAKBUN = g.HAKBUN
AND j.lvl <> g.lvl
);

UPDATE TDJANGHAKsum jj SET lvl = (SELECT DISTINCT lvl FROM TDFEEGOJI gg
WHERE gg.SCHOOLYEAR = jj.SCHOOLYEAR AND gg.SEMESTER = jj.SEMESTER
AND gg.hakbun = jj.hakbun)
WHERE (jj.hakbun, jj.SCHOOLYEAR, jj.SEMESTER) IN (
SELECT j.hakbun, j.SCHOOLYEAR, j.SEMESTER
FROM TDJANGHAKsum j, TDFEEGOJI g
WHERE j.schoolyear = g.SCHOOLYEAR
AND j.SEMESTER = g.SEMESTER
AND j.HAKBUN = g.HAKBUN
AND j.lvl <> g.lvl
);