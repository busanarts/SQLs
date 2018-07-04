
INSERT INTO TDJANGHAK
SELECT schoolyear, semester, janghakcd, hakbun, 학과코드, lvl, '', 0 RANK, '', scholarship, bigo, 'Y', 'sahn', SYSDATE, 'sahn', SYSDATE, '1'
FROM TDJANGHAK_UPLOAD, TM학적
WHERE hakbun = 학번;

INSERT INTO TDJANGHAKSUM

SELECT schoolyear, semester, hakbun, CLASS, lvl, '' grade, '' rank, '' ceritificateno,
MAX(DECODE(c1, 1, janghakcd)), max(DECODE(c1, 1, scholarship)),
MAX(DECODE(c1, 2, janghakcd)), max(DECODE(c1, 2, scholarship)),
MAX(DECODE(c1, 3, janghakcd)), max(DECODE(c1, 3, scholarship)),
MAX(DECODE(c1, 4, janghakcd)), max(DECODE(c1, 4, scholarship)),
'sahn', SYSDATE, 'sahn', SYSDATE,
MAX(DECODE(c1, 1, gbn)),
max(DECODE(c1, 2, gbn)),
max(DECODE(c1, 3, gbn)),
max(DECODE(c1, 4, gbn))
FROM
(SELECT a.*, row_number() OVER(PARTITION BY schoolyear, semester, hakbun ORDER BY schoolyear, semester, hakbun) AS c1 FROM TDJANGHAK a
WHERE schoolyear = :학년도 AND semester = :학기
AND confirm = 'Y'
--AND HAKBUN = :학번
AND (schoolyear, semester, hakbun)
NOT IN (SELECT schoolyear, semester, hakbun FROM TDJANGHAKSUM)
ORDER BY schoolyear, semester, hakbun)
GROUP BY schoolyear, semester, hakbun, CLASS, lvl
--GROUP BY schoolyear, semester, hakbun
--HAVING COUNT(*) > 1
--) cc
-- A1225078 A1325133 A1242016 A1327015 --2013
--
--WHERE
--a.SCHOOLYEAR = cc.schoolyear
--AND a.SEMESTER = cc.semester
--AND a.HAKBUN = cc.hakbun