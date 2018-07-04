SELECT 학번, 성||이름 성명, 학년 실제학년, lvl 등록금학년
FROM tm학적, TDFEEGOJI
WHERE schoolyear = :학년도 AND semester = :학기
AND hakbun = 학번 AND lvl <> 학년
