select 학과명, 학번, 성별, usr_todate(SUBSTR(주민등록번호,1,6)) 생년월일, age(SUBSTR(주민등록번호,1,6), substr(:조사기준일,1,4) || '0301') 연령,
DECODE(학적상태, '01', '재학', '11', '일반휴학', '12', '군휴학', '13', '입대전환', '14', '질병휴학', '15', '휴학연기') 학적상태
from tm학적_&조사기준일 학적, tm학과 학과
where substr(학적상태,1,1) in ('0', '1') AND 학번 NOT LIKE 'T%'
and 학적.학과코드 = 학과.학과코드
UNION
select 학과명, 학번, 성별, usr_todate(SUBSTR(주민등록번호,1,6)) 생년월일, age(SUBSTR(주민등록번호,1,6), substr(:조사기준일,1,4) || '0301') 연령,
'졸업' 학적상태
from tm학적_&조사기준일 학적, tm학과 학과
where substr(학적상태,1,1) = '8' AND 학번 NOT LIKE 'T%'
AND 졸업일자 > substr(:조사기준일,1,4) - 1 || '08'
and 학적.학과코드 = 학과.학과코드
UNION
select 학과명, 학번, 성별, usr_todate(SUBSTR(주민등록번호,1,6)) 생년월일, age(SUBSTR(주민등록번호,1,6), substr(:조사기준일,1,4) || '0301') 연령,
'입학' 학적상태
from tm학적_&조사기준일 학적, tm학과 학과
WHERE SUBSTR(입학일자,1,4) = substr(:조사기준일,1,4)
and 학적.학과코드 = 학과.학과코드