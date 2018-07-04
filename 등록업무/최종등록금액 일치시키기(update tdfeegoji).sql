--UPDATE tdfeegoji SET rcvamt = f_feercvamt(hakbun, :학년도, :학기)
SELECT hakbun FROM TDFEEGOJI
WHERE
studentgbn <> '30304000'
AND schoolyear = :학년도
AND semester = :학기
AND LENGTH(hakbun) > 5
AND rcvamt <> NVL(f_feercvamt(hakbun, :학년도, :학기),0)