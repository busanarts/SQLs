--insert into tdpaygoji
select schoolyear, semester, studentgbn, hakbun, class, lvl, :학생회비, 0, 0, 0, 0,
decode(lvl, '1', 0, '2', :동창회비), 0, 0, 0, 0, '11', :userid, sysdate, '', ''
from tdfeegoji
where schoolyear = :학년도
and semester = :학기
and hakbun not in (select hakbun from tdpaygoji
where schoolyear = :학년도
and semester = :학기
)
