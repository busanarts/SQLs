SELECT a.hakbun, a.semester, a.���������бݰ�,

FROM TDFEEGOJI a, TDJANGHAKSUM b
WHERE a.schoolyear = :�г⵵
AND a.hakbun = b.hakbun
AND a.schoolyear = b.schoolyear
AND a.SEMESTER = b.SEMESTER
AND ���������бݰ� <> (DECODE(b.gbn1, '1', b.SCHOLARSHIP1, 0) + DECODE(b.gbn2, '1', b.SCHOLARSHIP2, 0) +
DECODE(b.gbn3, '1', b.SCHOLARSHIP3, 0)  + DECODE(b.gbn4, '1', b.SCHOLARSHIP4, 0))