SELECT 학과명, 학번, 성 || 이름 성명, 집전화, 휴대전화, 지번주소 || ' ' || 상세주소 주소, 전자우편, iw_ggname 출신고교
FROM
TDFEEGOJI, tm학적 a, ipsi.IPSI201, tm학과 b
WHERE schoolyear = :학년도
AND semester = '1'
AND studentgbn = '30304000'
AND state = '77'
AND hakbun = 학번 AND 학번 = iw_shno
AND iw_year = schoolyear
AND a.학과코드 = b.학과코드