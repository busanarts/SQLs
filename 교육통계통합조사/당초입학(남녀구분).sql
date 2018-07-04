select 학년, 학과명, 학번, 성 || 이름 성명, f정원내외(학번) 정원내외, 성별
	from tm학적_20150401 학적, tm학과 학과
	where 학적상태 = '01'
	and 학번 not in (select distinct hakbun from TDSCHOOLCHG where hakbun = 학적.학번)
  AND 학적.학과코드= 학과.학과코드
