SELECT a.hakbun, a.semester, a.선지급장학금계,

FROM TDFEEGOJI a, TDJANGHAKSUM b
WHERE a.schoolyear = :학년도
AND a.hakbun = b.hakbun
AND a.schoolyear = b.schoolyear
AND a.SEMESTER = b.SEMESTER
AND 선지급장학금계 <> (DECODE(b.gbn1, '1', b.SCHOLARSHIP1, 0) + DECODE(b.gbn2, '1', b.SCHOLARSHIP2, 0) +
DECODE(b.gbn3, '1', b.SCHOLARSHIP3, 0)  + DECODE(b.gbn4, '1', b.SCHOLARSHIP4, 0))