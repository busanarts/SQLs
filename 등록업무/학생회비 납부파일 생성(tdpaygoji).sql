--insert into tdpaygoji
select schoolyear, semester, studentgbn, hakbun, class, lvl, :�л�ȸ��, 0, 0, 0, 0,
decode(lvl, '1', 0, '2', :��âȸ��), 0, 0, 0, 0, '11', :userid, sysdate, '', ''
from tdfeegoji
where schoolyear = :�г⵵
and semester = :�б�
and hakbun not in (select hakbun from tdpaygoji
where schoolyear = :�г⵵
and semester = :�б�
)
